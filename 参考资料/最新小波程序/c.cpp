#define N0 1024*2
#include "stdio.h"
#include "stdlib.h"
#include "math.h"
#include "string.h"
#include "a.h"

void main()
{

int	   LEN_F=8,LEN_S;
int m_step=3;

double *orign_y,*decom_y,*recon_y,*diff_y;
//float fk0[N0];

WAVELET_COEFF	m_wvltcoeff;
FILE	*fp;
int		i;
char	*FileName="compare.txt";
float	file_y[N0];
//输入信号fk0,长度为N
fp=fopen("wdata.dat","rt");
fscanf(fp,"%d",&LEN_S);

orign_y = (double *) calloc( LEN_S,sizeof(double));
decom_y	= (double *) calloc( LEN_S,sizeof(double));
recon_y = (double *) calloc( LEN_S,sizeof(double));
diff_y = (double *) calloc( LEN_S,sizeof(double));
for(i=0;i<LEN_S;i++){
	fscanf(fp,"%f",&file_y[i]);
	orign_y[i]=file_y[i];
}
fclose(fp);

fp=fopen("负荷.txt","w");
  for(i=0;i<LEN_S;i++)
    fprintf(fp,"%f\n",orign_y[i]);
  fclose(fp);

 //wavelet_clear(&m_wvltcoeff);
wavelet_coeffs_init(&m_wvltcoeff,Daub_8_Coeffs, 8,0, 0,3, 1);
dwt_1d_analysis_nstep(&m_wvltcoeff, orign_y, LEN_S, decom_y,m_step);

fp=fopen("三层低频系数.txt","w");
  for(i=0;i<LEN_S/8;i++)
    fprintf(fp,"%10f\n",decom_y[i]);
  fclose(fp);
fp=fopen("三层高频系数.txt","w");
  for(;i<LEN_S/4;i++)
    fprintf(fp,"%10f\n",decom_y[i]);
  fclose(fp);
fp=fopen("二层高频系数.txt","w");
  for(;i<LEN_S/2;i++)
    fprintf(fp,"%10f\n",decom_y[i]);
  fclose(fp);
fp=fopen("一层高频系数.txt","w");
  for(;i<LEN_S;i++)
    fprintf(fp,"%10f\n",decom_y[i]);
  fclose(fp);
//重构
  dwt_1d_synthesis_nstep(&m_wvltcoeff,
								decom_y,
								LEN_S,
								recon_y,
								m_step);

fp=fopen("重构.txt","w");
  for(i=0;i<LEN_S;i++)
    fprintf(fp,"%10f\n",recon_y[i]);
  fclose(fp);
//输出比较
vectordetract(recon_y,orign_y,LEN_S,diff_y);
  Vector2File(FileName,"\n\n原信号,重构信号,误差\n",LEN_S,"\torign_y=%10f",orign_y,"\t\trecon_y=%10f",recon_y,"\t\tdiff_y=%e\n",diff_y,"");

  free(orign_y);		free(decom_y);	free(recon_y);free(diff_y);
}