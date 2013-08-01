/************************************************************************
   Test case code start
 ************************************************************************/

.text
.global main_th_56
.global main_th_57
.global main_th_58
.global main_th_59
.global main_th_60
.global main_th_61
.global main_th_62
.global main_th_63

!
! Thread 0 Start
!
main_th_56:
	TEST
	setx	t56_data_area, %g1, %l7
	setx	t56_blk_area,%g1,%g5;
	setx    0x5555555555555555, %g3, %g4

	!# Enable PMU to count instructions...
	setx	t56_t62_perf,%g3,%g6;
	ldx	[%g6],%g6;
	wr	%g0, %g0, %pic
	wr	%g6, %g0, %pcr
	
	!# Make sure FP trap enables are off...

	stx	%g0, [%l7]
	ldx	[%l7], %fsr
	
	stx	%g4, [%l7]
	ldd	[%l7], %f6
	fxtod   %f6, %f0
	fxtod   %f6, %f2


	!# Execute Main Diag ..
	setx loop_cnt_4, %g2,%g1	!msa
	set 0x0,  %g2
	addcc %g0, 0x0, %g3
	setx	0xffffffffffffffff, %g2, %l2
t56_start:
        xor	%l1, %l2, %l1
	!#add	%l0, 0x1efe, %l0
	add	%l0, -0xefe, %l0
	fmuld %f0, %f2, %f4
	ldd	[%l7], %f6                
 
	!stb	%g0,[%g5] 

        xor	%l1, %l2, %l1
	add	%l0, -0xefe, %l0
	fmuld %f0, %f2, %f4
	ldd	[%l7], %f6                

	bpos %xcc,t56_start
        subcc %g1,1,%g1  

	setx	t56_perf_cnt,%g1,%g2
        rd	%pic,%g1;
	stx	%g1,[%g2];
	EXIT_GOOD

!
! Thread 1 Start
!
main_th_57:
	TEST
	setx	t57_data_area, %g1, %l7
	setx	t57_blk_area,%g1,%g5;

	!# Initialize registers ..
	!# Enable PMU to count instructions...
	setx	t56_t62_perf,%g3,%g6;
	ldx	[%g6],%g6;
	!#setx	0x17f85fe7, %g3, %g6
	wr	%g0, %g0, %pic
	wr	%g6, %g0, %pcr
	
	!# Make sure FP trap enables are off...
	stx	%g0, [%l7]
	ldx	[%l7], %fsr
	
	setx    0xf0f0f0abcdef9fff, %g3, %g4
	stx	%g4, [%l7]
	ldd	[%l7], %f6
	fxtod   %f6, %f0
	fxtod   %f6, %f2

	!# Execute Main Diag ..
	setx loop_cnt_3, %g2, %g1
	set 0x0,  %g2
	addcc %g0, 0x0, %g3
	setx	0xffffffffffffffff, %g2, %l2
        ba,a t57_start
.align 32
t57_start:                         

	!addcc %g1,-0xfff,%g1

	ldd	[%l7], %f6                
	fmuld %f0, %f2, %f4
	add	%l0, -0xefe, %l0
        xor	%l1, %l2, %l1

	!stxa	%l2,[%g5] 0xe2
	stb	%l2,[%g5]

	ldd	[%l7], %f6                
	fmuld %f0, %f2, %f4
	add	%l0, -0xefe, %l0
        xor	%l1, %l2, %l1

	bpos %xcc,t57_start
	!addcc %g1,-0xfff,%g1
	subcc %g1,1,%g1
	
	setx	t57_perf_cnt,%g1,%g2
        rd	%pic,%g1;
	stx	%g1,[%g2];
	EXIT_GOOD

!
! Thread 2 T2_Start
!
main_th_58:
	TEST
	setx	t58_data_area, %g1, %l7
	setx	t58_blk_area,%g1,%g5;
	
	!# Initialize registers ..
	!# Enable PMU to count instructions...
	setx	t56_t62_perf,%g3,%g6;
	ldx	[%g6],%g6;
	!#setx	0x17f85fe7, %g3, %g6
	wr	%g0, %g0, %pic
	wr	%g6, %g0, %pcr
	
	!# Make sure FP trap enables are off...
	stx	%g0, [%l7]
	ldx	[%l7], %fsr
	
	setx    0xefefefdcdcababab, %g3, %g4
	stx	%g4, [%l7]
	ldd	[%l7], %f6
	fxtod   %f6, %f0
	fxtod   %f6, %f2


	!# Execute Main Diag ..
	setx loop_cnt_3, %g2, %g1
	set 0x0,  %g2
	addcc %g0, 0x0, %g3
        ba,a t58_start
.align 32
t58_start:
	ldx	[%l7], %l5                
  	fmuld %f0, %f2, %f4
  	fmuld %f0, %f2, %f4
  	fmuld %f0, %f2, %f4
	add	%l0, -0xefe, %l0
        xor	%l1, %l2, %l1
	stb 	%g0,[%g5] 

	ldd	[%l7], %f6                
	fmuld %f0, %f2, %f4
	add	%l0, -0xefe, %l0
        xor	%l1, %l2, %l1

	bpos %xcc, t58_start
	!addcc %g1,-0xfff,%g1
	subcc	%g1,1,%g1
	setx	t58_perf_cnt,%g1,%g2
        rd	%pic,%g1;
	stx	%g1,[%g2];
	EXIT_GOOD

!
! Thread 3 T2_Start
!
main_th_59:
	TEST
	setx	t59_data_area, %g1, %l7
	setx	t59_blk_area,%g1,%g5;
	
	!# Initialize registers ..
	!# Enable PMU to count instructions...
	setx	t56_t62_perf,%g3,%g6;
	ldx	[%g6],%g6;
	!#setx	0x17f85fe7, %g3, %g6
	wr	%g0, %g0, %pic
	wr	%g6, %g0, %pcr
	
	!# Make sure FP trap enables are off...
	stx	%g0, [%l7]
	ldx	[%l7], %fsr
	
	setx    0xf9f8f7f6f5f4f3f2, %g3, %g4
	stx	%g4, [%l7]
	ldd	[%l7], %f6
	fxtod   %f6, %f0
	fxtod   %f6, %f2


	!# Execute Main Diag ..
	setx loop_cnt_2, %g2, %g1
	set 0x0,  %g2
	addcc %g0, 0x0, %g3
	ba,a t59_start
.align 32
t59_start:
        xor	%l1, %l2, %l1
	add	%l0, -0xefe, %l0
	ldx	[%l7], %l5                
!#	fmuld %f0, %f2, %f4

	!stb	%g0,[%g5] 
        xor	%l1, %l2, %l1
	add	%l0, -0xefe, %l0
	ldd	[%l7], %f6                
!#	fmuld %f0, %f2, %f4

	bpos %xcc,t59_start
	!addcc %g1,-0xfff,%g1
	subcc	%g1,1,%g1
	setx	t59_perf_cnt,%g1,%g2
        rd	%pic,%g1;
	stx	%g1,[%g2];
	EXIT_GOOD

!
! Thread 4 T3_Start
!
main_th_60:
	TEST
	setx	t60_data_area, %g1, %l7
	setx	t60_blk_area,%g1,%g5;
	
	!# Initialize registers ..
	!# Enable PMU to count instructions...
	setx	t56_t62_perf,%g3,%g6;
	ldx	[%g6],%g6;
	!#setx	0x17f85fe7, %g3, %g6
	wr	%g0, %g0, %pic
	wr	%g6, %g0, %pcr
	

	!# Make sure trap enables are off...
	!# Global registers
	setx    0xaaaaaaaaaaaaaaaa, %g3, %g4
	stx	%g0, [%l7]
	ldx	[%l7], %fsr
	
	stx	%g4, [%l7]
	ldd	[%l7], %f6
	fxtod   %f6, %f0
	fxtod   %f6, %f2


	!# Execute Main Diag ..
	setx loop_cnt, %g2, %g1
	set 0x0,  %g2
	addcc %g0, 0x0, %g3
t60_start:
	ldx	[%l7], %l5                
	fmuld %f0, %f2, %f4
!#	add	%l0, -0xemv, %l0
        xor	%l1, %l2, %l1

	!stb 	%g4,[%g5] 
	ldd	[%l7], %f6                
	fmuld %f0, %f2, %f4
	add	%l0, -0xefe, %l0
        xor	%l1, %l2, %l1
	ldx	[%l7], %l5
	
        bpos %xcc,t60_start
        !addcc %g1,-0xfff,%g1
	subcc	%g1,1,%g1

	setx	t60_perf_cnt,%g1,%g2
        rd	%pic,%g1;
	stx	%g1,[%g2];
	EXIT_GOOD

!
! Thread 5 Start
!
main_th_61:
	TEST
	setx	t61_data_area, %g1, %l7
	setx	t61_blk_area,%g1,%g5;
	
	!# Initialize registers ..
	!# Enable PMU to count instructions...
	setx	t56_t62_perf,%g3,%g6;
	ldx	[%g6],%g6;
	!#setx	0x17f85fe7, %g3, %g6
	wr	%g0, %g0, %pic
	wr	%g6, %g0, %pcr
	

	!# Make sure trap enables are off...
	!# Global registers
	setx    0xaaaaaaaaaaaaaaaa, %g3, %g4
	stx	%g0, [%l7]
	ldx	[%l7], %fsr
	
	stx	%g4, [%l7]
	ldd	[%l7], %f6
	fxtod   %f6, %f0
	fxtod   %f6, %f2


	!# Execute Main Diag ..
	setx loop_cnt, %g2, %g1
	set 0x0,  %g2
	addcc %g0, 0x0, %g3
        ba,a t61_start
.align 32
t61_start:                                          
	ldx	[%l7], %l5                
	ldx	[%l7], %l5                
	ldx	[%l7], %l5                
	ldx	[%l7], %l5                
	fmuld %f0, %f2, %f4
	add	%l0, -0xefe, %l0
        xor	%l1, %l2, %l1

	!stb	%g4,[%g5]
	ldd	[%l7], %f6                
	fmuld %f0, %f2, %f4
	add	%l0, -0xefe, %l0
        xor	%l1, %l2, %l1

	bpos	%xcc,t61_start
	!addcc	%g1,-0xfff,%g1
	subcc	%g1,1,%g1
	setx	t61_perf_cnt,%g1,%g2
        rd	%pic,%g1;
	stx	%g1,[%g2];
	EXIT_GOOD

!
! Thread 6 Start
!
main_th_62:
	TEST
	setx	t62_data_area, %g1, %l7
	setx	t62_blk_area,%g1,%g5;

	!# Initialize registers ..
	!# Enable PMU to count instructions...
	setx	t56_t62_perf,%g3,%g6;
	ldx	[%g6],%g6;
	!#setx	0x17f85fe7, %g3, %g6
	wr	%g0, %g0, %pic
	wr	%g6, %g0, %pcr
	
	!# Make sure trap enables are off...
	!# Global registers
	setx    0xfedcba9876543210, %g3, %g4
	stx	%g0, [%l7]
	ldx	[%l7], %fsr
	
	stx	%g4, [%l7]
	ldd	[%l7], %f6
	fxtod   %f6, %f0
	fxtod   %f6, %f2


	!# Execute Main Diag ..
	setx loop_cnt_2, %g2, %g1
	set 0x0,  %g2
	addcc %g0, 0x0, %g3
	ba,a t62_start
.align 32
t62_start:
	ldx	[%l7], %l5                
	ldx	[%l7], %l5                
!#	fmuld %f0, %f2, %f4
!#	add	%l0, 0x1efe, %l0
!#      xor	%l1, %l2, %l1

	!stb	%g4,[%g5] 
	ldd	[%l7], %f6                
  	fmuld %f0, %f2, %f4
	ldx	[%l7], %l5                
!#	add	%l0, 0x1efe, %l0
!#        xor	%l1, %l2, %l1

	bpos %xcc,t62_start
	!addcc %g1,-0xfff,%g1
	subcc	%g1,1,%g1
	setx	t62_perf_cnt,%g1,%g2
        rd	%pic,%g1;
	stx	%g1,[%g2];
	EXIT_GOOD

!
! Thread 7 Start
!
!
main_th_63:
	TEST

        setx    0x712345000, %g7, %l0  ! bits [16:8] selects index in 4 bank mode
        setx    0x723456040, %g7, %l1
        setx    0x734567080, %g7, %l2
        setx    0x7456780c0, %g7, %l3
        setx    0x756789100, %g7, %l4
        setx    0x76789a140, %g7, %l5
        setx    0x7789ab180, %g7, %l6
        setx    0x789abc1c0, %g7, %l7

        setx    NUM_LOOP_TH7, %i0, %o1
loop_th63:
        !Bank0
        ld     [%l0], %i1      !ld miss
        ld      [%l0+0x8], %i2      !ld hit
        st     %g0, [%l0+0x200]        !st miss
        st      %g0, [%l0+0x208]        !st hit

        !Bank1
        ld     [%l1], %i1      !ld miss
        ld      [%l1+0x8], %i2      !ld hit
        st     %g0, [%l1+0x200]        !st miss
        st      %g0, [%l1+0x208]        !st hit

        !Bank2
        ld     [%l2], %i1      !ld miss
        ld      [%l2+0x8], %i2      !ld hit
        st     %g0, [%l2+0x200]        !st miss
        st      %g0, [%l2+0x208]        !st hit

        !Bank3
        ld     [%l3], %i1      !ld miss
        ld      [%l3+0x8], %i2      !ld hit
        st     %g0, [%l3+0x200]        !st miss
        st      %g0, [%l3+0x208]        !st hit

        !Bank4
        ld     [%l4], %i1      !ld miss
        ld      [%l4+0x8], %i2      !ld hit
        st     %g0, [%l4+0x200]        !st miss
        st      %g0, [%l4+0x208]        !st hit

        !Bank5
        ld     [%l5], %i1      !ld miss
        ld      [%l5+0x8], %i2      !ld hit
        st     %g0, [%l5+0x200]        !st miss
        st      %g0, [%l5+0x208]        !st hit

        !Bank6
        ld     	[%l6], %i1      !ld miss
        ld      [%l6+0x8], %i2      !ld hit
        st     	%g0, [%l6+0x200]        !st miss
        st      %g0, [%l6+0x208]        !st hit

        !Bank7
        ld     	[%l7], %i1      !ld miss
        ld      [%l7+0x8], %i2      !ld hit
        st     	%g0, [%l7+0x200]        !st miss
        st      %g0, [%l7+0x208]        !st hit


        add     %l0, 0x400, %l0
        add     %l1, 0x400, %l1
        add     %l2, 0x400, %l2
        add     %l3, 0x400, %l3
        add     %l4, 0x400, %l4
        add     %l5, 0x400, %l5
        add     %l6, 0x400, %l6
        add     %l7, 0x400, %l7


        dec     %o1
        cmp     %o1, 0
        bne     %xcc, loop_th63
        nop

	EXIT_GOOD
!=================================================================================================
fail_t63_1:
        set 0x1,%g2;
	ba fail_t63;
        nop;
fail_t63_2:
        set 0x2,%g2;
	ba fail_t63;
        nop;
fail_t63_3:
        set 0x3,%g2;
	ba fail_t63;
        nop;
fail_t63_4:
        set 0x4,%g2;
	ba fail_t63;
        nop;
fail_t63_5:
        set 0x5,%g2;
	ba fail_t63;
        nop;
fail_t63_6:
        set 0x6,%g2;
	ba fail_t63;
        nop;
fail_t63_7:
        set 0x7,%g2;
	ba fail_t63;
        nop;
fail_t63_8:
        set 0x8,%g2;
	ba fail_t63;
        nop;
fail_t63_9:
        set 0x9,%g2;
	ba fail_t63;
        nop;
fail_t63_10:
        set 0xa,%g2;
	ba fail_t63;
        nop;
fail_t63_11:
        set 0xb,%g2;
	ba fail_t63;
        nop;
fail_t63_12:
        set 0xc,%g2;
	ba fail_t63;
        nop;
fail_t63_13:
        set 0xd,%g2;
	ba fail_t63;
        nop;
fail_t63_14:
        set 0xe,%g2;
	ba fail_t63;
        nop;
fail_t63_15:
        set 0xf,%g2;
	ba fail_t63;
        nop;
fail_t63_16:
        set 0x10,%g2;
	ba fail_t63;
        nop;
fail_t63:
	setx t63_fail,%g3,%g1
	stx %g2,[%g1]
	EXIT_BAD
	
/************************************************************************
   Test case data start
 ************************************************************************/
.data

t56_data_area:
.skip	16384
			
t57_data_area:
.skip	16384
.skip	16	
	
t58_data_area:
.skip	16384
.skip	16
	
t59_data_area:
.skip	16384
.skip	16	
	
t60_data_area:
.skip	16384
.skip 16	
	
t61_data_area:
.skip	16384
.skip	16	
	
t62_data_area:
.skip	16384
.skip	16	

t63_data_area:
.align 16	
!# A operand, 32 doublewords
!# %l7 points to here:		
.xword 0xb61e0f74d889169f	!# a[0] for 3
.xword 0xeb7dad6d2db34663	!# a[1] for 3
.xword 0x000000069fad6615	!# a[2] for 3
.xword 0x0	!# a[3] for 3
.xword 0x0	!# a[4] for 3                              
.xword 0x0	!# a[5] for 3
.xword 0x0	!# a[6] for 3
.xword 0x0	!# a[7] for 3

.xword 0x85587F96342B939A	
.xword 0x00DD7AAD15E30EB1	
.xword 0xFFFFEEEE00006000	
.xword 0xFFFFEEEE00007000	
.xword 0x222D15F21092A854	
.xword 0xFFFFEEEE00009000	
.xword 0xFD2CB924281A7FB1	
.xword 0xFFFFEEEE0000B000	

.xword 0x12D7C16982229DCF	
.xword 0xA75C18D599E04451
.xword 0xA3BE82C81B280E9D
.xword 0x8964B57FD2745FFB
.xword 0x4103465563EB1347
.xword 0xB4181F76C7A2CE01	
.xword 0xFFFFFFFF10005000	
.xword 0x4AC14D5A55D9D2BD	

!#.xword 0x9711E4D4E862AFA7
.xword 0x2313258847A86E70	
.xword 0x47A084C3801DE4F9
.xword 0x6B655B6A27D64052	
.xword 0x48CBC2665D6D8BB8	
.xword 0xD60A8BF421AA5DC8
.xword 0xF4529D511F583B2D	
.xword 0xFFFFFFFF1000D000	
.xword 0x27A0C706E2B783D4	

!# m[0] starts here
.xword 0x00004FFF0000FFFF	!# 
.xword 0x0FFF8000FFFF0001	!# 
.xword 0xF000FFFF0000FF00	!# 
.xword 0x0000FFFF0000FF00	!# 
.xword 0x1A890F27A74D6D4F	!# 
.xword 0xB34C93D130DF03BC	!# 
.xword 0xFD33BC46D2B25B52	!# 
.xword 0x0FFFFFFF00006000	!# 
	
.xword 0x9000111122223333	
.xword 0x4444555566667777	
.xword 0xFFFFEEEE00006000	
.xword 0xFFFFEEEE00007000	
.xword 0x222D15F21092A854	
.xword 0xFFFFEEEE00009000	
.xword 0xFD2CB924281A7FB1	
.xword 0xFFFFEEEE0000B000	
	
.xword 0x0000111122223333	
.xword 0x0000111122223333		
.xword 0x0000111122223333		
.xword 0x0000111122223333		
.xword 0x0000111122223333		
.xword 0x0000111122223333		
.xword 0x0000111122223333		
.xword 0x0000111122223333
	
.xword 0x0000111122223333	
.xword 0x0000111122223333		
.xword 0xA000111122223333	
.xword 0x0000111122223333	
.xword 0x0000111122223333		
.xword 0x0000111122223333		
.xword 0x0000111122223333		
.xword 0xFFFFFFFF22223333	

!# N operand, 32 doublewords
.xword	 0x00000000000000c9	!# 3. n[0]
.xword   0x0000000000000000	!# 3. n[1]
.xword   0x0000000800000000     !# 3. n[2] 
.xword   0x0	!# 3. n[3]
.xword   0x0	!# 3. n[4]
.xword   0x0	!# 3. n[5]
.xword   0x0	!# 3. n[6]
.xword   0x0	!# 3. n[7]
	
.xword   0xFFFFFFFF00007000	
.xword   0xFFFFFFFF00008000	
.xword   0xFFFFFFFF00009000	
.xword   0xFFFFFFFF0000A000	
.xword   0xFFFFFFFF0000B000	
.xword   0xFFFFFFFF0000C000	
.xword   0xFAEDBEEF0000D000	
.xword   0xFFFFFFFF0000E000	

.xword   0xFFFFFFFF0000F000	
.xword   0xFFFFFFFF10000000
.xword   0xFFFFFFFF10001000
.xword   0xFFFFFFFF10002000
.xword   0xFFFFFFFF10003000
.xword   0xFFFFFFFF10004000	
.xword   0xFFFFFFFF10005000	
.xword   0xFFFFFFFF10006000	

.xword   0xFFFFFFFF10007000	
.xword   0xFFFFFFFF10008000
.xword   0xFFFFFFFF10009000	
.xword   0xFFFFFFFF1000A000	
.xword   0xFFFFFFFF1000B000
.xword   0xEFFFFFFF1000C000	
.xword   0xFFFFFFFF1000D000	
.xword   0xFFFFFFFF1000E000	

!# E starts here
.xword	 0xAAAAAAAAAAAAAAAA	!# 3. e[0]
.xword   0xAAAAAAAAAAAAAAAA	!# 3. e[1]
.xword   0x0000000AAAAAAAAA     !# 3. e[2] 
.xword   0x0	!# 3. e[3]
.xword   0x0	!# 3. e[4]
.xword   0x0	!# 3. e[5]
.xword   0x0	!# 3. e[6]
.xword   0x0	!# 3. e[7]
			
.xword 0x0000111122223333
.xword 0x0000111122223333		
.xword 0x0000111122223333		
.xword 0x0000111122223333		
.xword 0x0000111122223333		
.xword 0x0000111122223333		
.xword 0x0000111122223333		
.xword 0x0000111122223333
			
.xword 0x0000111122223333
.xword 0x0000111122223333		
.xword 0x0000111122223333		
.xword 0x0000111122223333		
.xword 0x0000111122223333		
.xword 0x0000111122223333		
.xword 0x0000111122223333		
.xword 0x0000111122223333
			
.xword 0x0000111122223333
.xword 0x0000111122223333		
.xword 0x0000111122223333		
.xword 0x0000111122223333		
.xword 0x0000111122223333		
.xword 0x0000111122223333		
.xword 0x0000111122223333		
.xword 0x0000111122223333		

!# Initial X value
.xword 0xb61e0f74d889169f	!# a[0] for 3
.xword 0xeb7dad6d2db34663	!# a[1] for 3
.xword 0x000000069fad6615	!# a[2] for 3
!#.xword 0x0000001920000000	!# x[0] for 3
!#.xword 0x0000000000000000	!# x[1] for 3
!#.xword 0x0000000000000000	!# x[2] for 3
.xword 0x0	!# x[3] for 3
.xword 0x0	!# x[4] for 3                              
.xword 0x0	!# x[5] for 3
.xword 0x0	!# x[6] for 3
.xword 0x0	!# x[7] for 3
	
t63_expected_x:	
!# Expected X result starts here
.xword 0x9890891c6f7c2d0b	!# 3. X[0]
.xword 0x8d0356cf2e263a36	!# 3. X[1]
.xword 0x000000074dc55ef7	!# 3. X[2]

t63_div_area:
.xword 0x0011223344556677	!# junk area for divide wait loop operand storage
.skip 16
	
!================================================================================================
!=================================================================================================
.align 65536
!# Subtest 1 start
!# input data
cleartext_t63:	
.xword 0x0011223344556677
.xword 0x8899aabbccddeeff
.skip 16384
	
!# AES initial state (also where final state will be written)
.align 16
aes_state_t63:		
.xword 0x0001020304050607
.xword 0x08090a0b0c0d0e0f
.xword 0x1011121314151617
.xword 0x18191a1b1c1d1e1f			

!# expected ciphertext
ciphertext_t63:	
.xword 0x8ea2b7ca516745bf
.xword 0xeafc49904b496089
.skip 16384

!# temporary area for storing expected result
result_t63:	
.xword 0xDEADBEEFDEADBEEF	
.xword 0xDEADBEEFDEADBEEF
.skip 16384

!################################################
!# CWQ data area, set aside 512 CW's worth
!# 512*8*8 = 32KB
.align 32*1024
CWQ_BASE_t63:		
.xword 0xAAAAAAAAAAAAAAA
.xword 0xAAAAAAAAAAAAAAA
.xword 0xAAAAAAAAAAAAAAA
.xword 0xAAAAAAAAAAAAAAA
.xword 0xAAAAAAAAAAAAAAA
.xword 0xAAAAAAAAAAAAAAA
.xword 0xAAAAAAAAAAAAAAA
.xword 0xAAAAAAAAAAAAAAA
.align 32*1024
CWQ_LAST_t63:	
.skip 16

!=================================================================================================1
.global t63_fail
t63_fail:
.xword 0x0000000000000000
!==================================================================================================
.global t56_t62_perf
.global t63_perf
.global t56_perf_cnt
.global t57_perf_cnt
.global t58_perf_cnt
.global t59_perf_cnt
.global t60_perf_cnt
.global t61_perf_cnt
.global t62_perf_cnt
.global t63_perf_cnt
t56_t62_perf:
.xword 0x0000000017f85fe7
t63_perf:
.xword 0x0000000057f99fe7
t56_perf_cnt:
.xword 0x0000000000000000
t57_perf_cnt:
.xword 0x0000000000000000
t58_perf_cnt:
.xword 0x0000000000000000
t59_perf_cnt:
.xword 0x0000000000000000
t60_perf_cnt:
.xword 0x0000000000000000
t61_perf_cnt:
.xword 0x0000000000000000
t62_perf_cnt:
.xword 0x0000000000000000
t63_perf_cnt:
.xword 0x0000000000000000
.skip 16
!==================================================================================================
.align 256 * 1024
t56_blk_area:
.xword 0x00ffffffffffffff
.xword 0xffffffffffffffff
.xword 0xffffffffffffffff
.xword 0xffffffffffffffff
.xword 0xffffffffffffffff
.xword 0xffffffffffffffff
.xword 0xffffffffffffffff
.xword 0xffffffffffffffff
.xword 0xffffffffffffffff
.xword 0xffffffffffffffff
.xword 0xffffffffffffffff
.xword 0xffffffffffffffff
.xword 0xffffffffffffffff
.xword 0xffffffffffffffff
.xword 0xffffffffffffffff
.xword 0xffffffffffffffff
.skip 64
.align 256 * 1024
t57_blk_area:
.xword 0x0100000000000000
.xword 0x0000000000000000
.xword 0x0000000000000000
.xword 0x0000000000000000
.xword 0x0000000000000000
.xword 0x0000000000000000
.xword 0x0000000000000000
.xword 0x0000000000000000
.xword 0x0000000000000000
.xword 0x0000000000000000
.xword 0x0000000000000000
.xword 0x0000000000000000
.xword 0x0000000000000000
.xword 0x0000000000000000
.xword 0x0000000000000000
.xword 0x0000000000000000
.skip 64
.align 256 * 1024
t58_blk_area:
.xword 0x02ffffffffffffff
.xword 0xffffffffffffffff
.xword 0xffffffffffffffff
.xword 0xffffffffffffffff
.xword 0xffffffffffffffff
.xword 0xffffffffffffffff
.xword 0xffffffffffffffff
.xword 0xffffffffffffffff
.xword 0xffffffffffffffff
.xword 0xffffffffffffffff
.xword 0xffffffffffffffff
.xword 0xffffffffffffffff
.xword 0xffffffffffffffff
.xword 0xffffffffffffffff
.xword 0xffffffffffffffff
.xword 0xffffffffffffffff
.skip 64
.align 256 * 1024
t59_blk_area:
.xword 0x0300000000000000
.xword 0x0000000000000000
.xword 0x0000000000000000
.xword 0x0000000000000000
.xword 0x0000000000000000
.xword 0x0000000000000000
.xword 0x0000000000000000
.xword 0x0000000000000000
.xword 0x0000000000000000
.xword 0x0000000000000000
.xword 0x0000000000000000
.xword 0x0000000000000000
.xword 0x0000000000000000
.xword 0x0000000000000000
.xword 0x0000000000000000
.xword 0x0000000000000000
.skip 64
.align 256 * 1024
t60_blk_area:
.xword 0x04ffffffffffffff
.xword 0xffffffffffffffff
.xword 0xffffffffffffffff
.xword 0xffffffffffffffff
.xword 0xffffffffffffffff
.xword 0xffffffffffffffff
.xword 0xffffffffffffffff
.xword 0xffffffffffffffff
.xword 0xffffffffffffffff
.xword 0xffffffffffffffff
.xword 0xffffffffffffffff
.xword 0xffffffffffffffff
.xword 0xffffffffffffffff
.xword 0xffffffffffffffff
.xword 0xffffffffffffffff
.xword 0xffffffffffffffff
.skip 64
.align 256 * 1024
t61_blk_area:
.xword 0x0500000000000000
.xword 0x0000000000000000
.xword 0x0000000000000000
.xword 0x0000000000000000
.xword 0x0000000000000000
.xword 0x0000000000000000
.xword 0x0000000000000000
.xword 0x0000000000000000
.xword 0x0000000000000000
.xword 0x0000000000000000
.xword 0x0000000000000000
.xword 0x0000000000000000
.xword 0x0000000000000000
.xword 0x0000000000000000
.xword 0x0000000000000000
.xword 0x0000000000000000
.skip 64
.align 256 * 1024
t62_blk_area:
.xword 0x06ffffffffffffff
.xword 0xffffffffffffffff
.xword 0xffffffffffffffff
.xword 0xffffffffffffffff
.xword 0xffffffffffffffff
.xword 0xffffffffffffffff
.xword 0xffffffffffffffff
.xword 0xffffffffffffffff
.xword 0xffffffffffffffff
.xword 0xffffffffffffffff
.xword 0xffffffffffffffff
.xword 0xffffffffffffffff
.xword 0xffffffffffffffff
.xword 0xffffffffffffffff
.xword 0xffffffffffffffff
.xword 0xffffffffffffffff
.skip 64
.align 256 * 1024
t63_blk_area:
.xword 0x0700000000000000
.xword 0x0000000000000000
.xword 0x0000000000000000
.xword 0x0000000000000000
.xword 0x0000000000000000
.xword 0x0000000000000000
.xword 0x0000000000000000
.xword 0x0000000000000000
.xword 0x0000000000000000
.xword 0x0000000000000000
.xword 0x0000000000000000
.xword 0x0000000000000000
.xword 0x0000000000000000
.xword 0x0000000000000000
.xword 0x0000000000000000
.xword 0x0000000000000000
.skip 64
