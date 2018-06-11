#include "gfmul.h"
#include <stdio.h>
//extern void gfmul(__m128i a,__m128i b,__m128i* c); //must be implemented elsewhere
//extern void reduce (__m128i H1,__m128i H2,__m128i H3,__m128i H4,__m128i H5, __m128i H6, __m128i H7, __m128i H8,
//	__m128i X1,__m128i X2,__m128i X3, __m128i X4, __m128i X5, __m128i X6, __m128i X7, __m128i X8, __m128i *res); 
void AES_GCM_encrypt(const unsigned char *in, unsigned char *out, const unsigned char* addt,
const unsigned char* ivec,
unsigned char *tag,
int nbytes,
int abytes,
int ibytes,
const unsigned char* key,
 int nr)
{
	int i, j ,k;
 	__m128i hlp1, hlp2, hlp3, hlp4;
 	__m128i tmp1, tmp2, tmp3, tmp4, tmp5, tmp6, tmp7, tmp8;
 	__m128i H, H1, H2, H3, H4, H5, H6, H7, H8 , Y, T;
 	__m128i *KEY = (__m128i*)key;
 	__m128i ctr1, ctr2, ctr3, ctr4, ctr5, ctr6, ctr7, ctr8;
 	__m128i last_block = _mm_setzero_si128();
 	__m128i ONE = _mm_set_epi32(0, 1, 0, 0);
 	__m128i EIGHT = _mm_set_epi32(0, 8, 0, 0);
 	__m128i BSWAP_EPI64 = _mm_set_epi8(8,9,10,11,12,13,14,15,0,1,2,3,4,5,6,7);
 	__m128i BSWAP_MASK = _mm_set_epi8(0,1,2,3,4,5,6,7,8,9,10,11,12,13,14,15);
 	__m128i X = _mm_setzero_si128();
	__m128i H1_X1_lo, H1_X1_hi,
                H2_X2_lo, H2_X2_hi,
                H3_X3_lo, H3_X3_hi,
                H4_X4_lo, H4_X4_hi,
                H5_X5_lo, H5_X5_hi,
                H6_X6_lo, H6_X6_hi,
                H7_X7_lo, H7_X7_hi,
                H8_X8_lo, H8_X8_hi,
                lo, hi;
 	if(ibytes == 96/8){
 		Y = _mm_loadu_si128((__m128i*)ivec);
 		Y = _mm_insert_epi32(Y, 0x1000000, 3);
 		/*(Compute E[ZERO, KS] and E[Y0, KS] together*/
 		tmp1 = _mm_xor_si128(X, KEY[0]);
 		tmp2 = _mm_xor_si128(Y, KEY[0]);
 		for(j=1; j < nr-1; j+=2) {
 			tmp1 = _mm_aesenc_si128(tmp1, KEY[j]);
 			tmp2 = _mm_aesenc_si128(tmp2, KEY[j]);
 			tmp1 = _mm_aesenc_si128(tmp1, KEY[j+1]);
 			tmp2 = _mm_aesenc_si128(tmp2, KEY[j+1]);
 		};
 		tmp1 = _mm_aesenc_si128(tmp1, KEY[nr-1]);
 		tmp2 = _mm_aesenc_si128(tmp2, KEY[nr-1]);
 		H = _mm_aesenclast_si128(tmp1, KEY[nr]);
 		T = _mm_aesenclast_si128(tmp2, KEY[nr]);
 		H = _mm_shuffle_epi8(H, BSWAP_MASK);
 	}
 	else
	{
 		tmp1 = _mm_xor_si128(X, KEY[0]);
 		for(j=1; j <nr; j++)
 		tmp1 = _mm_aesenc_si128(tmp1, KEY[j]);
 		H = _mm_aesenclast_si128(tmp1, KEY[nr]);
 		H = _mm_shuffle_epi8(H, BSWAP_MASK);
 		Y = _mm_xor_si128(Y, Y);
		for(i=0; i < ibytes/16; i++){
 			tmp1 = _mm_loadu_si128(&((__m128i*)ivec)[i]);
 			tmp1 = _mm_shuffle_epi8(tmp1, BSWAP_MASK);
 			Y = _mm_xor_si128(Y, tmp1);
 			gfmul(Y, H, &Y);
 		}
 		if(ibytes%16){
 			for(j=0; j < ibytes%16; j++)
 				((unsigned char*)&last_block)[j] = ivec[i*16+j];
 			tmp1 = last_block;
 			tmp1 = _mm_shuffle_epi8(tmp1, BSWAP_MASK);
 			Y = _mm_xor_si128(Y, tmp1);
 			gfmul(Y, H, &Y);
 		}
 		tmp1 = _mm_insert_epi64(tmp1, ibytes*8, 0);
 		tmp1 = _mm_insert_epi64(tmp1, 0, 1);
 		Y = _mm_xor_si128(Y, tmp1);
 		gfmul(Y, H, &Y);
 		Y = _mm_shuffle_epi8(Y, BSWAP_MASK);
 		/*Compute E(K, Y0)*/
 		tmp1 = _mm_xor_si128(Y, KEY[0]);
 		for(j=1; j < nr; j++)
 			tmp1 = _mm_aesenc_si128(tmp1, KEY[j]);
 		T = _mm_aesenclast_si128(tmp1, KEY[nr]);
 	}
 	gfmul(H,H,&H2);
 	gfmul(H,H2,&H3);
 	gfmul(H,H3,&H4);
 	gfmul(H,H4,&H5);
 	gfmul(H,H5,&H6);
 	gfmul(H,H6,&H7);
 	gfmul(H,H7,&H8);
 	for(i=0; i<abytes/16/8; i++){
		tmp1 = _mm_loadu_si128(&((__m128i*)addt)[i*8]);
 		tmp2 = _mm_loadu_si128(&((__m128i*)addt)[i*8+1]);
 		tmp3 = _mm_loadu_si128(&((__m128i*)addt)[i*8+2]);
 		tmp4 = _mm_loadu_si128(&((__m128i*)addt)[i*8+3]);
 		tmp5 = _mm_loadu_si128(&((__m128i*)addt)[i*8+4]);
 		tmp6 = _mm_loadu_si128(&((__m128i*)addt)[i*8+5]);
 		tmp7 = _mm_loadu_si128(&((__m128i*)addt)[i*8+6]);
 		tmp8 = _mm_loadu_si128(&((__m128i*)addt)[i*8+7]);

 		tmp1 = _mm_shuffle_epi8(tmp1, BSWAP_MASK);
 		tmp2 = _mm_shuffle_epi8(tmp2, BSWAP_MASK);
 		tmp3 = _mm_shuffle_epi8(tmp3, BSWAP_MASK);
 		tmp4 = _mm_shuffle_epi8(tmp4, BSWAP_MASK);
 		tmp5 = _mm_shuffle_epi8(tmp5, BSWAP_MASK);
 		tmp6 = _mm_shuffle_epi8(tmp6, BSWAP_MASK);
 		tmp7 = _mm_shuffle_epi8(tmp7, BSWAP_MASK);
 		tmp8 = _mm_shuffle_epi8(tmp8, BSWAP_MASK);
 		tmp1 = _mm_xor_si128(X, tmp1);
 		reduce(H, H2, H3, H4, H5, H6, H7, H8, tmp8, tmp7, tmp6, tmp5, tmp4, tmp3, tmp2, tmp1, &X);
 	}
 	for(i=i*8; i<abytes/16; i++){
 		tmp1 = _mm_loadu_si128(&((__m128i*)addt)[i]);
 		tmp1 = _mm_shuffle_epi8(tmp1, BSWAP_MASK);
 		X = _mm_xor_si128(X,tmp1);
 		gfmul(X, H, &X);
 	}
 	if(abytes%16){
 		last_block = _mm_setzero_si128();
 		for(j=0; j<abytes%16; j++)
 			((unsigned char*)&last_block)[j] = addt[i*16+j];
 		tmp1 = last_block;
 		tmp1 = _mm_shuffle_epi8(tmp1, BSWAP_MASK);
 		X =_mm_xor_si128(X,tmp1);
		gfmul(X,H,&X);
	}
 	ctr1 = _mm_shuffle_epi8(Y, BSWAP_EPI64);
 	ctr1 = _mm_add_epi32(ctr1, ONE);
 	ctr2 = _mm_add_epi32(ctr1, ONE);
 	ctr3 = _mm_add_epi32(ctr2, ONE);
 	ctr4 = _mm_add_epi32(ctr3, ONE);
 	ctr5 = _mm_add_epi32(ctr4, ONE);
 	ctr6 = _mm_add_epi32(ctr5, ONE);
 	ctr7 = _mm_add_epi32(ctr6, ONE);
 	ctr8 = _mm_add_epi32(ctr7, ONE);
 	for(i=0; i<nbytes/16/8; i++){
 		tmp1 = _mm_shuffle_epi8(ctr1, BSWAP_EPI64);
 		tmp2 = _mm_shuffle_epi8(ctr2, BSWAP_EPI64);
 		tmp3 = _mm_shuffle_epi8(ctr3, BSWAP_EPI64);
 		tmp4 = _mm_shuffle_epi8(ctr4, BSWAP_EPI64);
 		tmp5 = _mm_shuffle_epi8(ctr5, BSWAP_EPI64);
 		tmp6 = _mm_shuffle_epi8(ctr6, BSWAP_EPI64);
 		tmp7 = _mm_shuffle_epi8(ctr7, BSWAP_EPI64);
 		tmp8 = _mm_shuffle_epi8(ctr8, BSWAP_EPI64);
 		ctr1 = _mm_add_epi32(ctr1, EIGHT);
 		ctr2 = _mm_add_epi32(ctr2, EIGHT);
 		ctr3 = _mm_add_epi32(ctr3, EIGHT);
 		ctr4 = _mm_add_epi32(ctr4, EIGHT);
 		ctr5 = _mm_add_epi32(ctr5, EIGHT);
 		ctr6 = _mm_add_epi32(ctr6, EIGHT);
 		ctr7 = _mm_add_epi32(ctr7, EIGHT);
 		ctr8 = _mm_add_epi32(ctr8, EIGHT);
 		tmp1 =_mm_xor_si128(tmp1, KEY[0]);
 		tmp2 =_mm_xor_si128(tmp2, KEY[0]);
 		tmp3 =_mm_xor_si128(tmp3, KEY[0]);
 		tmp4 =_mm_xor_si128(tmp4, KEY[0]);
 		tmp5 =_mm_xor_si128(tmp5, KEY[0]);
 		tmp6 =_mm_xor_si128(tmp6, KEY[0]);
 		tmp7 =_mm_xor_si128(tmp7, KEY[0]);
 		tmp8 =_mm_xor_si128(tmp8, KEY[0]);
 		for(j=1; j<nr-1; j+=2){
 			tmp1 = _mm_aesenc_si128(tmp1, KEY[j]);
 			tmp2 = _mm_aesenc_si128(tmp2, KEY[j]);
 			tmp3 = _mm_aesenc_si128(tmp3, KEY[j]);
 			tmp4 = _mm_aesenc_si128(tmp4, KEY[j]);
 			tmp5 = _mm_aesenc_si128(tmp5, KEY[j]);
 			tmp6 = _mm_aesenc_si128(tmp6, KEY[j]);
 			tmp7 = _mm_aesenc_si128(tmp7, KEY[j]);
 			tmp8 = _mm_aesenc_si128(tmp8, KEY[j]);
 			tmp1 = _mm_aesenc_si128(tmp1, KEY[j+1]);
 			tmp2 = _mm_aesenc_si128(tmp2, KEY[j+1]);
 			tmp3 = _mm_aesenc_si128(tmp3, KEY[j+1]);
 			tmp4 = _mm_aesenc_si128(tmp4, KEY[j+1]);
 			tmp5 = _mm_aesenc_si128(tmp5, KEY[j+1]);
 			tmp6 = _mm_aesenc_si128(tmp6, KEY[j+1]);
 			tmp7 = _mm_aesenc_si128(tmp7, KEY[j+1]);
 			tmp8 = _mm_aesenc_si128(tmp8, KEY[j+1]);
 		}
 		tmp1 = _mm_aesenc_si128(tmp1, KEY[nr-1]);
 		tmp2 = _mm_aesenc_si128(tmp2, KEY[nr-1]);
 		tmp3 = _mm_aesenc_si128(tmp3, KEY[nr-1]);
 		tmp4 = _mm_aesenc_si128(tmp4, KEY[nr-1]);
 		tmp5 = _mm_aesenc_si128(tmp5, KEY[nr-1]);
 		tmp6 = _mm_aesenc_si128(tmp6, KEY[nr-1]);
 		tmp7 = _mm_aesenc_si128(tmp7, KEY[nr-1]);
 		tmp8 = _mm_aesenc_si128(tmp8, KEY[nr-1]);
 		tmp1 =_mm_aesenclast_si128(tmp1, KEY[nr]);
 		tmp2 =_mm_aesenclast_si128(tmp2, KEY[nr]);
 		tmp3 =_mm_aesenclast_si128(tmp3, KEY[nr]);
 		tmp4 =_mm_aesenclast_si128(tmp4, KEY[nr]);
 		tmp5 =_mm_aesenclast_si128(tmp5, KEY[nr]);
 		tmp6 =_mm_aesenclast_si128(tmp6, KEY[nr]);
 		tmp7 =_mm_aesenclast_si128(tmp7, KEY[nr]);
 		tmp8 =_mm_aesenclast_si128(tmp8, KEY[nr]);
 		tmp1 = _mm_xor_si128(tmp1, _mm_loadu_si128(&((__m128i*)in)[i*8+0]));
 		tmp2 = _mm_xor_si128(tmp2, _mm_loadu_si128(&((__m128i*)in)[i*8+1]));
 		tmp3 = _mm_xor_si128(tmp3, _mm_loadu_si128(&((__m128i*)in)[i*8+2]));
 		tmp4 = _mm_xor_si128(tmp4, _mm_loadu_si128(&((__m128i*)in)[i*8+3]));
 		tmp5 = _mm_xor_si128(tmp5, _mm_loadu_si128(&((__m128i*)in)[i*8+4]));
 		tmp6 = _mm_xor_si128(tmp6, _mm_loadu_si128(&((__m128i*)in)[i*8+5]));
 		tmp7 = _mm_xor_si128(tmp7, _mm_loadu_si128(&((__m128i*)in)[i*8+6]));
 		tmp8 = _mm_xor_si128(tmp8, _mm_loadu_si128(&((__m128i*)in)[i*8+7]));
 		_mm_storeu_si128(&((__m128i*)out)[i*8+0], tmp1);
 		_mm_storeu_si128(&((__m128i*)out)[i*8+1], tmp2);
 		_mm_storeu_si128(&((__m128i*)out)[i*8+2], tmp3);
 		_mm_storeu_si128(&((__m128i*)out)[i*8+3], tmp4);
 		_mm_storeu_si128(&((__m128i*)out)[i*8+4], tmp5);
 		_mm_storeu_si128(&((__m128i*)out)[i*8+5], tmp6);
 		_mm_storeu_si128(&((__m128i*)out)[i*8+6], tmp7);
 		_mm_storeu_si128(&((__m128i*)out)[i*8+7], tmp8);
 		tmp1 = _mm_shuffle_epi8(tmp1, BSWAP_MASK);
 		tmp2 = _mm_shuffle_epi8(tmp2, BSWAP_MASK);
 		tmp3 = _mm_shuffle_epi8(tmp3, BSWAP_MASK);
 		tmp4 = _mm_shuffle_epi8(tmp4, BSWAP_MASK);
 		tmp5 = _mm_shuffle_epi8(tmp5, BSWAP_MASK);
 		tmp6 = _mm_shuffle_epi8(tmp6, BSWAP_MASK);
 		tmp7 = _mm_shuffle_epi8(tmp7, BSWAP_MASK);
 		tmp8 = _mm_shuffle_epi8(tmp8, BSWAP_MASK);
 		tmp1 = _mm_xor_si128(X, tmp1);
		reduce(H, H2, H3, H4, H5, H6, H7, H8, tmp8, tmp7, tmp6, tmp5, tmp4, tmp3, tmp2, tmp1, &X);
 	}
 	for(k=i*8; k<nbytes/16; k++){
 		tmp1 = _mm_shuffle_epi8(ctr1, BSWAP_EPI64);
 		ctr1 = _mm_add_epi32(ctr1, ONE);
 		tmp1 = _mm_xor_si128(tmp1, KEY[0]);
 		for(j=1; j<nr-1; j+=2){
 			tmp1 = _mm_aesenc_si128(tmp1, KEY[j]);
 			tmp1 = _mm_aesenc_si128(tmp1, KEY[j+1]);
 		}
 		tmp1 = _mm_aesenc_si128(tmp1, KEY[nr-1]);
 		tmp1 = _mm_aesenclast_si128(tmp1, KEY[nr]);
 		tmp1 = _mm_xor_si128(tmp1, _mm_loadu_si128(&((__m128i*)in)[k]));
 		_mm_storeu_si128(&((__m128i*)out)[k], tmp1);
 		tmp1 = _mm_shuffle_epi8(tmp1, BSWAP_MASK);
 		X = _mm_xor_si128(X, tmp1);
 		gfmul(X,H,&X);
 	}
	//If remains one incomplete block
 	if(nbytes%16){
 		tmp1 = _mm_shuffle_epi8(ctr1, BSWAP_EPI64);
 		tmp1 = _mm_xor_si128(tmp1, KEY[0]);
 		for(j=1; j<nr-1; j+=2){
 			tmp1 = _mm_aesenc_si128(tmp1, KEY[j]);
 			tmp1 = _mm_aesenc_si128(tmp1, KEY[j+1]);
 		}
 		tmp1 = _mm_aesenc_si128(tmp1, KEY[nr-1]);
 		tmp1 = _mm_aesenclast_si128(tmp1, KEY[nr]);
 		tmp1 = _mm_xor_si128(tmp1, _mm_loadu_si128(&((__m128i*)in)[k]));
 		last_block = tmp1;
 		for(j=0; j<nbytes%16; j++)
 			out[k*16+j] = ((unsigned char*)&last_block)[j];
 		for(j; j<16; j++)
 			((unsigned char*)&last_block)[j] = 0;
 		tmp1 = last_block;
 		tmp1 = _mm_shuffle_epi8(tmp1, BSWAP_MASK);
 		X = _mm_xor_si128(X, tmp1);
 		gfmul(X, H, &X);
 	}
 	tmp1 = _mm_insert_epi64(tmp1, nbytes*8, 0);
 	tmp1 = _mm_insert_epi64(tmp1, abytes*8, 1);
 	X = _mm_xor_si128(X, tmp1);
 	gfmul(X,H,&X);
 	X = _mm_shuffle_epi8(X, BSWAP_MASK);
 	T = _mm_xor_si128(X, T);
 	_mm_storeu_si128((__m128i*)tag, T);
}
