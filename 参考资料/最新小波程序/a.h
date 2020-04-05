#include "stdio.h"
#include "stdlib.h"
#include "math.h"
#include "string.h"
#include "ctype.h"
#include <stdarg.h>

typedef struct {
	/* pointers to coupled filters */
	/* analysis */
	double*		p_h;	/* h low pass analysis filter */
	double*		p_g;	/* g high pass analysis filter */
	/* synthesis */
	double*		p_H;	/* h~ low pass synthesis filter */
	double*		p_G;	/* g~ high pass synthesis filter */
	/* filters length */
	union
	{
		int		hlen;	/* length of h filter */
		int		Glen;	/* length of g~ filter */
	};
	union
	{
		int		Hlen;	/* length of h~ filter */
		int		glen;	/* length of g filter */
	};
	/* filters offsides */
	int			os_h;	/* offside of filter h */
	int			os_g;	/* offside of filter g */
} WAVELET_COEFF;
static void get_coupled_coeffs(double* pin, double* pout, int ilen)
{
	int i;
	int isign;
	isign = -1;
	/* get the coupled coeffs */
	for(i = 0; i < ilen; i++)
	{
		*(pout + i) = *(pin + ilen - i - 1) * isign;
		isign = isign * -1;
	}
}

/*
  initialize the wavelet coefficients
  if pH is 0, the wavelet is orthogonal
  if the function succeeds, return 1. otherwise return 0.
*/
static void wavelet_coeffs_init(
					WAVELET_COEFF* pwvlt, /* pointer to wavelet strut */
					double* ph,	/* h coeffs */
					int ilen_h,	/* h coeff length */
					double* pH,	/* h~ coeffs */
					int ilen_H,	/* h~ coeff length */
					int os_h, /* h offside */
					int os_g  /* g offside */
					)
{
	/* orthogonal */
/* allocate coupled coefficients buffer */
		pwvlt->p_g = (double*)malloc(sizeof(double) * ilen_h);
		
		/* For orthogonal wavelets, using the relation: */
		/* g[n] = (-1)^n * h[1-n] */
		get_coupled_coeffs(ph, pwvlt->p_g, ilen_h);
		/* set wavelet coeffs */
		pwvlt->p_h = ph;
		pwvlt->p_H = ph;
		pwvlt->p_G = pwvlt->p_g;
		/* wavelet length */
		pwvlt->hlen = ilen_h;
		pwvlt->glen = ilen_h;
		/* set wavelet offsides */
		pwvlt->os_h = os_h;
		pwvlt->os_g = os_g;
	
}
static void wavelet_clear(WAVELET_COEFF* pwvlt)
{
	if(pwvlt->p_g)
		free(pwvlt->p_g);
}
static void dwt_1d_analysis(
				WAVELET_COEFF* pwvlt, /* pointer to wavelet strut */
				double* pin, /* input sequence */
				int ilen,	/* input sequence length */
				double* pout /* result sequence */
				)
{
	int i, j, k, n;
	double* ph, *pg; /* pointers to wavelet coeffs */
	double* p1, *p2; /* temporary pointers */

	/* the transform equation is: */
	/* smooth part: a(j+1)[p] = sum(n=1..N1){a(j)[2p-n]*h[-n]} */
	/* detail part: d(j+1)[p] = sum(n=1..N2){a(j)[2p-n]*g[-n]} */
	/* where N1 is the length of h, N2 is the length of g */
	/* a(j) is the input sequence */
	n = ilen / 2;
	/* point to the end of wavelet coeffs */
	ph = pwvlt->p_h + pwvlt->hlen - 1;
	pg = pwvlt->p_g + pwvlt->glen - 1;
	/* orthogonal */
		/* handle the left offside */
		for(i = 0; i < pwvlt->hlen / 2; i++)
		{
			/* smooth component */
			k = i - pwvlt->os_h;
			k = k < 0 ? k + n : k;
			p1 = pout + k;
			*p1 = 0.0;
			/* detail component */
			k = i - pwvlt->os_g;
			k = k < 0 ? k + n : k;
			p2 = pout + n + k;
			*p2 = 0.0;
			/* convolution */
			for(j = 0; j < pwvlt->hlen; j++)
			{
				k = 2*i - j;
				k = k >= 0 ? k : k + ilen;
				*p1 = *p1 + *(pin + k) * *(ph - j);
				*p2 = *p2 + *(pin + k) * *(pg - j);
			}
		}
		/* iterating */
		for(; i < n; i++)
		{
			/* smooth component */
			p1 = pout + i - pwvlt->os_h;
			*p1 = 0.0;
			/* detail component */
			p2 = pout + n + i - pwvlt->os_g;
			*p2 = 0.0;
			for(j = 0; j < pwvlt->hlen; j++)
			{
				*p1 = *p1 + *(pin + 2*i - j) * *(ph - j);
				*p2 = *p2 + *(pin + 2*i - j) * *(pg - j);
			}
		}
}

static void dwt_1d_synthesis(
				WAVELET_COEFF* pwvlt, /* pointer to wavelet strut */
				double* psmt, /* detail component */
				double* pdtl, /* smooth component */
				int ilen,		/* component length */
				double* pout	/* result output */
				)
{
	int i, j, m, n, k;
	int p, q; /* smooth and detail part offsides */

	/* orthogonal */
	
		/* for orthogonal wavelet, the revert equation is: */
		/* a(j)[2k] = */
		/* sum(l=1..N/2){h~[2l]a(j+1)[k-l]+g~[2l]d(j+1)[k-l]} */
		/* a(j)[2k+1] = */
		/* sum(l=1..N/2){h~[2l+1]a(j+1)[k-l]+g~[2l+1]d(j+1)[k-l]} */
		/* where N is the length of wavelet coeffs, */
		/* a(j+1) is the smooth component, d(j+1) is the detail */
		k = pwvlt->os_h > pwvlt->os_g ?
			pwvlt->os_h : pwvlt->os_g;
		/* deal with the offsides */
		for(i = 0; i < pwvlt->Hlen / 2 + k; i++)
		{
			n = 2*i - pwvlt->Hlen + 1;
			n = n >= 0 ? n : n + 2 * ilen;
			m = n + 1;
			m = m == ilen * 2 ? 0 : m;
			*(pout + n) = 0.0;
			*(pout + m) = 0.0;
			for(j = 0; j < pwvlt->Hlen / 2; j++)
			{
				p = i - j - pwvlt->os_h; /* smooth */
				p = p >= 0 ? p : p + ilen;
				q = i - j - pwvlt->os_g; /* detail */
				q = q >= 0 ? q : q + ilen;
				*(pout + n) = *(pout + n) + *(pwvlt->p_H + 2*j) *
							(*(psmt + p)) + *(pwvlt->p_G + 2*j) *
							(*(pdtl + q));
				*(pout + m) = *(pout + m) + 
							*(pwvlt->p_H + 2*j + 1) * (*(psmt + p)) +
							*(pwvlt->p_G + 2*j + 1) * (*(pdtl + q));
			}
		}
		/* iterating */
		for(; i < ilen; i++)
		{
			n = 2*i - pwvlt->Hlen + 1;
			*(pout + n) = 0.0;
			*(pout + n + 1) = 0.0;
			for(j = 0; j < pwvlt->Hlen / 2; j++)
			{
				p = i - j - pwvlt->os_h; /* smooth */
				q = i - j - pwvlt->os_g; /* detail */
				/* even */
				*(pout + n) = *(pout + n) + *(pwvlt->p_H + 2*j) *
							(*(psmt + p)) + *(pwvlt->p_G + 2*j) *
							(*(pdtl + q));
				/* odd */
				*(pout + n + 1) = *(pout + n + 1) + 
							*(pwvlt->p_H + 2*j + 1) * (*(psmt + p)) +
							*(pwvlt->p_G + 2*j + 1) * (*(pdtl + q));
			}
		}

}
static void dwt_1d_analysis_nstep(
				WAVELET_COEFF* pwvlt, /* pointer to wavelet strut */
				double* pin, /* input data sequence */
				int ilen, /* input data length */
				double* pout, /* output buffer */
				int nstep /* iterating times */
				)
{
	int i, k;
	double* ptmp[2];	/* temporary pointer */
	/* make sure nstep larger than 0 */
	if(nstep < 1)
		return;
	/* first take one step dwt */
	ptmp[0] = pout;
	dwt_1d_analysis(pwvlt, pin, ilen, ptmp[0]);
	/* if nstep equal to 1, return */
	if(1 == nstep)
		return;
	/* check the data length */
	k = ilen;
	for(i = 0; k > 4; i++)
		k >>= 1;
	nstep = i > nstep ? nstep : i;
	/* allocate temporary buffer */
	ilen /= 2;
	ptmp[1] = (double*)malloc(ilen*sizeof(double));
	/* iterating */
	for(i = 1; i < nstep; i++)
	{
		k = (i + 1) % 2;
		dwt_1d_analysis(pwvlt, ptmp[k], ilen, ptmp[i % 2]);
		ilen /= 2;
		if(!k)
			memcpy(ptmp[0] + ilen, ptmp[1] + ilen, sizeof(double)*ilen);
	}
	/* if last result not in output buffer, copy it */
	if(!k)
	{
		memcpy(ptmp[0], ptmp[1], sizeof(double)*ilen);
	}
	free(ptmp[1]);
}

/*
  n-step 1d dwt revert transform
  NOTE: assume detail and smooth parts in each level are the equal length
*/
static void dwt_1d_synthesis_nstep(
				WAVELET_COEFF* pwvlt, /* pointer to wavelet strut */
				double* pin, /* input data sequence */
				int ilen, /* input sequence length */
				double* pout, /* output buffer */
				int nstep /* iterating times */
				)
{
	int i, k;
	double* ptmp[2];
	double* pdtl;	/* pointer to detail part */

	/* make sure nstep larger then 0 */
	if(nstep < 1)
		return;
	if(1 == nstep)
	{
		ilen /= 2;
		dwt_1d_synthesis(pwvlt, pin, pin + ilen, ilen, pout);
		return;
	}
	/* check the data length */
	k = ilen;
	for(i = 0; k > 4; i++)
		k >>= 1;
	nstep = i > nstep ? nstep : i;
	/* allocate temporary buffer */
	ptmp[0] = (double*)malloc(sizeof(double)*ilen);
	ptmp[1] = pout;
	/* the initial size */
	ilen >>= nstep;
	/* first take one step synthesis */
	pdtl = pin + ilen;
	dwt_1d_synthesis(pwvlt, pin, pdtl, ilen, ptmp[0]);
	/* iterating */
	for(i = 1; i < nstep; i++)
	{
		ilen <<= 1;
		pdtl = pin + ilen;
		dwt_1d_synthesis(pwvlt, ptmp[(i+1) % 2], pdtl, ilen, ptmp[i % 2]);
	}
	if(i % 2)
	{
		ilen <<= 1;
		memcpy(pout, ptmp[0], ilen*sizeof(double));
	}
	free(ptmp[0]);	/* free the buffer */
}


static double Daub_8_Coeffs [] =
{
	 0.2303778133088964,
	 0.7148465705529154,
	 0.6308807679398587,
	-0.0279837694168599,
	-0.1870348117190931,
	 0.0308413818355607,
	 0.0328830116668852,
	-0.0105974017850690
};

void Vector2File(char *FileName, char *Msg,  int	Row, char *Format1, double *Data1, ...){
//Array2File(FileName,"祝你好运：）\n",5,"\td=%10f",d,"\td==%10f\n",d,"");
//读取文件名FileName；
//读取格式串Format；
//初始化当前格式Format；
char	Format[100],preFormat[100];
char	*Format_;
//初始化目标串Str[10*1024],StrTemp[200],j;
char	Str[1000*1024];
int		j;

//初始化变量数vNum=0;
int		vNum=0;
FILE	*fp;
double	*pData[6];
int		k;
va_list vl;	

Format[0]='\0';
strcpy(preFormat,"%3d");
j =sprintf( Str,Msg);  

va_start(vl, Row);
Format_= va_arg(vl, char*);
while(Format_!=""){
	strcat(Format,Format_);
	pData[vNum++]=va_arg(vl, double*);
	Format_= va_arg(vl, char*);
}

strcat(preFormat,Format);
switch(vNum){
	case 1: 
			for(k=0; k<Row; k++){
				j+=sprintf( Str+j,preFormat ,k+1,pData[0][k] ); 
			}
			break;
	case 2: 
			for(k=0; k<Row; k++){
				j+=sprintf( Str+j, preFormat,k+1,pData[0][k],pData[1][k] );
			}
			break;
	case 3: 
			for(k=0; k<Row; k++){
				j+=sprintf( Str+j, preFormat,k+1,pData[0][k],pData[1][k],pData[2][k] ); 
			}
			break;
	case 4: 
			for(k=0; k<Row; k++){
				j+=sprintf( Str+j, preFormat,k+1,pData[0][k],pData[1][k],pData[2][k],pData[3][k] ); 
			}
			break;
	case 5: 
			for(k=0; k<Row; k++){
				j+=sprintf( Str+j, preFormat,k+1,pData[0][k],pData[1][k],pData[2][k],pData[3][k],pData[4][k] ); 
			}
			break;
	case 6: 
			for(k=0; k<Row; k++){
				j+=sprintf( Str+j, preFormat,k+1,pData[0][k],pData[1][k],pData[2][k],pData[3][k],pData[4][k],pData[5][k] ); 
			}
			break;
	default:
			break;
}

fp=fopen(FileName,"a");
fputs(Str,fp);
fclose(fp);

va_end(vl);			//va_end把vl指针清为NULL   
return;
}
void vectordetract(double *a,double *b,int len_a,double *result){
	int i;
	for(i=0; i<len_a; i++){
		result[i]=a[i]-b[i];
	}
	return;	
}
