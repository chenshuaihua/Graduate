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