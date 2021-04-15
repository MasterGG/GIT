#include <wmmintrin.h>
#include <emmintrin.h>
#include <smmintrin.h>
inline void gfmul (__m128i a, __m128i b, __m128i *res){
 __m128i tmp0, tmp1, tmp2, tmp3, tmp4, tmp5, tmp6, tmp7, tmp8, tmp9;
 tmp3 = _mm_clmulepi64_si128(a, b, 0x00);
 tmp4 = _mm_clmulepi64_si128(a, b, 0x10);
 tmp5 = _mm_clmulepi64_si128(a, b, 0x01);
 tmp6 = _mm_clmulepi64_si128(a, b, 0x11);
 tmp4 = _mm_xor_si128(tmp4, tmp5);
 tmp5 = _mm_slli_si128(tmp4, 8);
 tmp4 = _mm_srli_si128(tmp4, 8);
 tmp3 = _mm_xor_si128(tmp3, tmp5);
 tmp6 = _mm_xor_si128(tmp6, tmp4);
 tmp7 = _mm_srli_epi32(tmp3, 31);
 tmp8 = _mm_srli_epi32(tmp6, 31);
 tmp3 = _mm_slli_epi32(tmp3, 1);
 tmp6 = _mm_slli_epi32(tmp6, 1);
 tmp9 = _mm_srli_si128(tmp7, 12);
 tmp8 = _mm_slli_si128(tmp8, 4);
 tmp7 = _mm_slli_si128(tmp7, 4);
 tmp3 = _mm_or_si128(tmp3, tmp7);
 tmp6 = _mm_or_si128(tmp6, tmp8);
 tmp6 = _mm_or_si128(tmp6, tmp9);
 tmp7 = _mm_slli_epi32(tmp3, 31);
 tmp8 = _mm_slli_epi32(tmp3, 30);
 tmp9 = _mm_slli_epi32(tmp3, 25);
 tmp7 = _mm_xor_si128(tmp7, tmp8);
 tmp7 = _mm_xor_si128(tmp7, tmp9);
 tmp8 = _mm_srli_si128(tmp7, 4);
 tmp7 = _mm_slli_si128(tmp7, 12);
 tmp3 = _mm_xor_si128(tmp3, tmp7);
 tmp2 = _mm_srli_epi32(tmp3, 1);
 tmp4 = _mm_srli_epi32(tmp3, 2);
 tmp5 = _mm_srli_epi32(tmp3, 7);
 tmp2 = _mm_xor_si128(tmp2, tmp4);
 tmp2 = _mm_xor_si128(tmp2, tmp5);
 tmp2 = _mm_xor_si128(tmp2, tmp8);
 tmp3 = _mm_xor_si128(tmp3, tmp2);
 tmp6 = _mm_xor_si128(tmp6, tmp3);
 *res = tmp6;
} 

inline void reduce (__m128i H1, __m128i H2, __m128i H3, __m128i H4, __m128i H5, __m128i H6, __m128i H7, __m128i H8,
 __m128i X1, __m128i X2, __m128i X3, __m128i X4, __m128i X5, __m128i X6, __m128i X7, __m128i X8,  __m128i *res)
{
 	/*algorithm by Krzysztof Jankowski, Pierre Laurent - Intel*/
 	__m128i H1_X1_lo, H1_X1_hi,
 			H2_X2_lo, H2_X2_hi,
 			H3_X3_lo, H3_X3_hi,
 			H4_X4_lo, H4_X4_hi,
 			H5_X5_lo, H5_X5_hi,
 			H6_X6_lo, H6_X6_hi,
 			H7_X7_lo, H7_X7_hi,
 			H8_X8_lo, H8_X8_hi,
 			lo, hi;
 	__m128i tmp0, tmp1, tmp2, tmp3, tmp10, tmp11, tmp14, tmp15;
 	__m128i tmp4, tmp5, tmp6, tmp7, tmp12, tmp13, tmp16, tmp17;
 	__m128i tmp8, tmp9;
 	H1_X1_lo = _mm_clmulepi64_si128(H1, X1, 0x00);
 	H2_X2_lo = _mm_clmulepi64_si128(H2, X2, 0x00);
 	H3_X3_lo = _mm_clmulepi64_si128(H3, X3, 0x00);
 	H4_X4_lo = _mm_clmulepi64_si128(H4, X4, 0x00);
 	H5_X5_lo = _mm_clmulepi64_si128(H5, X5, 0x00);
 	H6_X6_lo = _mm_clmulepi64_si128(H6, X6, 0x00);
 	H7_X7_lo = _mm_clmulepi64_si128(H7, X7, 0x00);
 	H8_X8_lo = _mm_clmulepi64_si128(H8, X8, 0x00);
 	lo = _mm_xor_si128(H1_X1_lo, H2_X2_lo);
 	lo = _mm_xor_si128(lo, H3_X3_lo);
 	lo = _mm_xor_si128(lo, H4_X4_lo);
 	lo = _mm_xor_si128(lo, H5_X5_lo);
 	lo = _mm_xor_si128(lo, H6_X6_lo);
 	lo = _mm_xor_si128(lo, H7_X7_lo);
 	lo = _mm_xor_si128(lo, H8_X8_lo);
 	H1_X1_hi = _mm_clmulepi64_si128(H1, X1, 0x11);
 	H2_X2_hi = _mm_clmulepi64_si128(H2, X2, 0x11);
 	H3_X3_hi = _mm_clmulepi64_si128(H3, X3, 0x11);
 	H4_X4_hi = _mm_clmulepi64_si128(H4, X4, 0x11);
 	H5_X5_hi = _mm_clmulepi64_si128(H5, X5, 0x11);
 	H6_X6_hi = _mm_clmulepi64_si128(H6, X6, 0x11);
 	H7_X7_hi = _mm_clmulepi64_si128(H7, X7, 0x11);
 	H8_X8_hi = _mm_clmulepi64_si128(H8, X8, 0x11);
 	hi = _mm_xor_si128(H1_X1_hi, H2_X2_hi);
 	hi = _mm_xor_si128(hi, H3_X3_hi);
 	hi = _mm_xor_si128(hi, H4_X4_hi);
 	hi = _mm_xor_si128(hi, H5_X5_hi);
 	hi = _mm_xor_si128(hi, H6_X6_hi);
 	hi = _mm_xor_si128(hi, H7_X7_hi);
 	hi = _mm_xor_si128(hi, H8_X8_hi);
 	tmp0 = _mm_shuffle_epi32(H1, 78);
 	tmp4 = _mm_shuffle_epi32(X1, 78);
 	tmp0 = _mm_xor_si128(tmp0, H1);
 	tmp4 = _mm_xor_si128(tmp4, X1);
 	tmp1 = _mm_shuffle_epi32(H2, 78);
 	tmp5 = _mm_shuffle_epi32(X2, 78);
 	tmp1 = _mm_xor_si128(tmp1, H2);
 	tmp5 = _mm_xor_si128(tmp5, X2);
 	tmp2 = _mm_shuffle_epi32(H3, 78);
 	tmp6 = _mm_shuffle_epi32(X3, 78);
 	tmp2 = _mm_xor_si128(tmp2, H3);
 	tmp6 = _mm_xor_si128(tmp6, X3);
 	tmp3 = _mm_shuffle_epi32(H4, 78);
 	tmp7 = _mm_shuffle_epi32(X4, 78);
 	tmp3 = _mm_xor_si128(tmp3, H4);
 	tmp7 = _mm_xor_si128(tmp7, X4);
 	tmp10 = _mm_shuffle_epi32(H5, 78);
 	tmp12 = _mm_shuffle_epi32(X5, 78);
 	tmp10 = _mm_xor_si128(tmp10, H5);
 	tmp12 = _mm_xor_si128(tmp12, X5);
 	tmp11 = _mm_shuffle_epi32(H6, 78);
 	tmp13 = _mm_shuffle_epi32(X6, 78);
 	tmp11 = _mm_xor_si128(tmp11, H6);
 	tmp13 = _mm_xor_si128(tmp13, X6);

 	tmp14 = _mm_shuffle_epi32(H7, 78);
 	tmp16 = _mm_shuffle_epi32(X7, 78);
 	tmp14 = _mm_xor_si128(tmp14, H7);
 	tmp16 = _mm_xor_si128(tmp16, X7);

 	tmp15 = _mm_shuffle_epi32(H8, 78);
 	tmp17 = _mm_shuffle_epi32(X8, 78);
 	tmp15 = _mm_xor_si128(tmp15, H8);
 	tmp17 = _mm_xor_si128(tmp17, X8);

 	tmp0 = _mm_clmulepi64_si128(tmp0, tmp4, 0x00);
 	tmp1 = _mm_clmulepi64_si128(tmp1, tmp5, 0x00);
 	tmp2 = _mm_clmulepi64_si128(tmp2, tmp6, 0x00);
 	tmp3 = _mm_clmulepi64_si128(tmp3, tmp7, 0x00);
 	tmp10 = _mm_clmulepi64_si128(tmp10, tmp12, 0x00);
 	tmp11 = _mm_clmulepi64_si128(tmp11, tmp13, 0x00);
 	tmp14 = _mm_clmulepi64_si128(tmp14, tmp16, 0x00);
 	tmp15 = _mm_clmulepi64_si128(tmp15, tmp17, 0x00);
 	
	tmp0 = _mm_xor_si128(tmp0, lo);
 	tmp0 = _mm_xor_si128(tmp0, hi);
 	tmp0 = _mm_xor_si128(tmp1, tmp0);
 	tmp0 = _mm_xor_si128(tmp2, tmp0);
 	tmp0 = _mm_xor_si128(tmp3, tmp0);
 	tmp0 = _mm_xor_si128(tmp10, tmp0);
 	tmp0 = _mm_xor_si128(tmp11, tmp0);
 	tmp0 = _mm_xor_si128(tmp14, tmp0);
 	tmp0 = _mm_xor_si128(tmp15, tmp0);
 	tmp4 = _mm_slli_si128(tmp0, 8);
 	tmp0 = _mm_srli_si128(tmp0, 8);
 	lo = _mm_xor_si128(tmp4, lo);
 	hi = _mm_xor_si128(tmp0, hi);
 	tmp3 = lo;
 	tmp6 = hi;
 	tmp7 = _mm_srli_epi32(tmp3, 31);
 	tmp8 = _mm_srli_epi32(tmp6, 31);
 	tmp3 = _mm_slli_epi32(tmp3, 1);
 	tmp6 = _mm_slli_epi32(tmp6, 1);
 	tmp9 = _mm_srli_si128(tmp7, 12);
 	tmp8 = _mm_slli_si128(tmp8, 4);
 	tmp7 = _mm_slli_si128(tmp7, 4);
 	tmp3 = _mm_or_si128(tmp3, tmp7);
 	tmp6 = _mm_or_si128(tmp6, tmp8);
 	tmp6 = _mm_or_si128(tmp6, tmp9);
 	tmp7 = _mm_slli_epi32(tmp3, 31);
 	tmp8 = _mm_slli_epi32(tmp3, 30);
 	tmp9 = _mm_slli_epi32(tmp3, 25);
 	tmp7 = _mm_xor_si128(tmp7, tmp8);
 	tmp7 = _mm_xor_si128(tmp7, tmp9);
 	tmp8 = _mm_srli_si128(tmp7, 4);
 	tmp7 = _mm_slli_si128(tmp7, 12);
 	tmp3 = _mm_xor_si128(tmp3, tmp7);
 	tmp2 = _mm_srli_epi32(tmp3, 1);
 	tmp4 = _mm_srli_epi32(tmp3, 2);
 	tmp5 = _mm_srli_epi32(tmp3, 7);
 	tmp2 = _mm_xor_si128(tmp2, tmp4);
 	tmp2 = _mm_xor_si128(tmp2, tmp5);
 	tmp2 = _mm_xor_si128(tmp2, tmp8);
 	tmp3 = _mm_xor_si128(tmp3, tmp2);
 	tmp6 = _mm_xor_si128(tmp6, tmp3);
 	*res = tmp6;
}
