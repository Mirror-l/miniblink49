/* fp_sqr_comba_3.i
 *
 * Copyright (C) 2006-2017 wolfSSL Inc.
 *
 * This file is part of wolfSSL.
 *
 * wolfSSL is free software; you can redistribute it and/or modify
 * it under the terms of the GNU General Public License as published by
 * the Free Software Foundation; either version 2 of the License, or
 * (at your option) any later version.
 *
 * wolfSSL is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
 * GNU General Public License for more details.
 *
 * You should have received a copy of the GNU General Public License
 * along with this program; if not, write to the Free Software
 * Foundation, Inc., 51 Franklin Street, Fifth Floor, Boston, MA 02110-1335, USA
 */



#ifdef TFM_SQR3
void fp_sqr_comba3(fp_int *A, fp_int *B)
{
   fp_digit *a, b[6], c0, c1, c2;
#ifdef TFM_ISO
   fp_word tt;
#endif

   a = A->dp;
   COMBA_START; 

   /* clear carries */
   CLEAR_CARRY;

   /* output 0 */
   SQRADD(a[0],a[0]);
   COMBA_STORE(b[0]);

   /* output 1 */
   CARRY_FORWARD;
   SQRADD2(a[0], a[1]); 
   COMBA_STORE(b[1]);

   /* output 2 */
   CARRY_FORWARD;
   SQRADD2(a[0], a[2]); SQRADD(a[1], a[1]); 
   COMBA_STORE(b[2]);

   /* output 3 */
   CARRY_FORWARD;
   SQRADD2(a[1], a[2]); 
   COMBA_STORE(b[3]);

   /* output 4 */
   CARRY_FORWARD;
   SQRADD(a[2], a[2]); 
   COMBA_STORE(b[4]);
   COMBA_STORE2(b[5]);
   COMBA_FINI;

   B->used = 6;
   B->sign = FP_ZPOS;
   XMEMCPY(B->dp, b, 6 * sizeof(fp_digit));
   fp_clamp(B);
}
#endif


