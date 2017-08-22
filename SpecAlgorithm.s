.text
.global main

main:sub sp,sp,#36
	 str lr,[sp,#0]@store lr
	 str r4,[sp,#4]@store 
	 str r5,[sp,#8]@store 
	 str r6,[sp,#12]@store 
	 str r7,[sp,#16]@store 
	 str r8,[sp,#20]@store 
	 str r9,[sp,#24]@store 
	 str r10,[sp,#28]@store 
	 str r11,[sp,#32]@store 
	
	
	
	@@get key k0
	 sub sp,sp,#8  @get space
	 
	 @This will print "Enter the Key:"
	 ldr r0,=formatp0
	 bl printf
	 
	 @"%llx"
	 ldr r0,=formats    @scan %llx
	 mov r1,sp
	 bl scanf

	
	ldr r6,[sp,#0] @k1a
	ldr r7,[sp,#4] @k1b
	
	add sp,sp,#8 @release
	
	
	@@get key k1
	 sub sp,sp,#8  @get space
	 
	 @"%llx"
	 ldr r0,=formats    @scan %llx
	 mov r1,sp
	 bl scanf

	ldr r8,[sp,#0]	@k1a
	ldr r9,[sp,#4]	@k2b
	
	add sp,sp,#8 @reLease stack
	
	
	
	
	
	@@get plain test pt1
	 sub sp,sp,#8  @get space
	 
	 @This will print "Enter the plain text:"
	 ldr r0,=formatp2
	 bl printf
	
	 
	 @"%llx"
	 ldr r0,=formats    @scan %llx
	 mov r1,sp
	 bl scanf

	ldr r10,[sp,#0] @pt1a
	ldr r11,[sp,#4] @pt1b
	
	add sp,sp,#8
	
	
	
	
	@@getting plaint text pt2
	 sub sp,sp,#32  @get space
	 
	 
	 @"%llx"
	 ldr r0,=formats    @scan %llx
	 mov r1,sp
	 bl scanf
	ldr r4,[sp,#0] @pt2a
	ldr r5,[sp,#4] @pt2b
	
	
	@store two key block and two plaintexts in one stack
	str r6,[sp,#0] @k0A
	str r7,[sp,#4] @k0B
	str r8,[sp,#8] @k1A
	str r9,[sp,#12] @k1B
	str r10,[sp,#16] @pt0a
	str r11,[sp,#20] @pt0b
	str r4,[sp,#24]  @pt1a
	str r5,[sp,#28]  @pt1b
	
	
	@x = ROR(x, 8)
	ldr r1,[sp,#24] @store values to the r1,r2
	ldr r2,[sp,#28]
	mov r0,sp
	bl ror8	@functio call
	str r1,[sp,#24]
	str r2,[sp,#28]


	@ x = x + y
	ldr r1,[sp,#20]
	ldr r2,[sp,#28]
	mov r0,sp
	bl additionc
	str r1,[sp,#28]
	
	
	ldr r1,[sp,#24]
	ldr r2,[sp,#16]
	mov r0,sp
	bl additions
	str r1,[sp,#24]


	@ x =x^ k
	ldr r1,[sp,#24]
	ldr r2,[sp,#0]
	mov r0,sp
	bl xor
	str r1,[sp,#24]
	
	ldr r1,[sp,#28]
	ldr r2,[sp,#4]
	mov r0,sp
	bl xor
	str r1,[sp,#28]
	
	
	@ y = ROL(y, 3)
	ldr r1,[sp,#16]
	ldr r2,[sp,#20]
	mov r0,sp
	bl rol3
	str r1,[sp,#16]
	str r2,[sp,#20]
	
	@ y = x^y
	ldr r1,[sp,#16]
	ldr r2,[sp,#24]
	mov r0,sp
	bl xor
	str r1,[sp,#16]
	
	
	ldr r1,[sp,#20]
	ldr r2,[sp,#28]
	mov r0,sp
	bl xor
	str r1,[sp,#20]
	
	@@@@@@@@@@@@@@@@@@@@@@@@
	
	
	@for loop
	mov r11,#0
loop:cmp r11,#31
	beq exit
	
	
	@R(a, b, i);
	@ROR>>8
	ldr r1,[sp,#8]
	ldr r2,[sp,#12]
	mov r0,sp
	bl ror8
	str r1,[sp,#8]
	str r2,[sp,#12]
	
	@X= X + Y
	ldr r1,[sp,#12]
	ldr r2,[sp,#4]
	mov r0,sp
	bl additionc
	str r1,[sp,#12]
	
	ldr r1,[sp,#8]
	ldr r2,[sp,#0]
	mov r0,sp
	bl additions
	str r1,[sp,#8]
	
	@ X= X XOR K
	ldr r1,[sp,#8]
	mov r2,#0
	mov r0,sp
	bl xor
	str r1,[sp,#8]
	
	
	ldr r1,[sp,#12]
	mov r2,r11
	mov r0,sp
	bl xor
	str r1,[sp,#12]
	
	
	@ROL<<3
	ldr r1,[sp,#0]
	ldr r2,[sp,#4]
	mov r0,sp
	bl rol3
	str r1,[sp,#0]
	str r2,[sp,#4]
	
	
	@Y = Y XOR X
	ldr r1,[sp,#0]
	ldr r2,[sp,#8]
	mov r0,sp
	bl xor
	str r1,[sp,#0]
	
	
	ldr r1,[sp,#4]
	ldr r2,[sp,#12]
	mov r0,sp
	bl xor
	str r1,[sp,#4]
	
	@@@@@@@@
	
	@R(x, y, b);
	
	ldr r1,[sp,#24]
	ldr r2,[sp,#28]
	mov r0,sp
	bl ror8
	
	
	str r1,[sp,#24]
	str r2,[sp,#28]


	ldr r1,[sp,#20]
	ldr r2,[sp,#28]
	mov r0,sp
	bl additionc
	str r1,[sp,#28]
	
	
	ldr r1,[sp,#24]
	ldr r2,[sp,#16]
	mov r0,sp
	bl additions
	str r1,[sp,#24]


	ldr r1,[sp,#24]
	ldr r2,[sp,#0]
	mov r0,sp
	bl xor
	str r1,[sp,#24]
	
	
	ldr r1,[sp,#28]
	ldr r2,[sp,#4]
	mov r0,sp
	bl xor
	str r1,[sp,#28]
	
	
	ldr r1,[sp,#16]
	ldr r2,[sp,#20]
	mov r0,sp
	bl rol3
	str r1,[sp,#16]
	str r2,[sp,#20]
	
	
	ldr r1,[sp,#16]
	ldr r2,[sp,#24]
	mov r0,sp
	bl xor
	str r1,[sp,#16]
	
	
	ldr r1,[sp,#20]
	ldr r2,[sp,#28]
	mov r0,sp
	bl xor
	str r1,[sp,#20]
	
	add r11,r11,#1
	b loop
	





exit:@print the ciper
	ldr r0,=formatp3
	bl printf
	
	
	ldr r1,[sp,#16]
	ldr r2,[sp,#20]
	ldr r0,=formatpt
	bl printf
	


    ldr r1,[sp,#24]
    ldr r2,[sp,#28]
	ldr r0,=formatp1
	bl printf
	


	
	add sp,sp,#32
@mainend	
	ldr	lr, [sp,#0] @ldr lr
	ldr r4,[sp,#4]
	ldr r5,[sp,#8]
	ldr r6,[sp,#12]
	ldr r7,[sp,#16]
	ldr r8,[sp,#20]
	ldr r9,[sp,#24]
	ldr r10,[sp,#28]
	ldr r11,[sp,#32]
	add	sp, sp, #36 @release stack
	mov	pc, lr
	



ror8: sub sp,sp,#12
	 str lr,[sp,#0]
	 str r4,[sp,#4]
	 str r5,[sp,#8]
	 
	 
	 mov r3,r1
	 mov r4,r2
	 
	  
	 lsr r1,r1,#8
	 lsl r2,r2,#24
	 add r5,r1,r2
	 
	  
	 lsr r3,r3,#8
	 lsl r4,r4,#24
	 add r4,r4,r3
	 
	 
	 
	
	 
	 mov r1,r4 
	 mov r2,r5 
	  
	 @add sp,sp,#8
	  
	 ldr lr,[sp,#0]
	 ldr r4,[sp,#4]
	 ldr r5,[sp,#8]
	 add sp,sp,#12
	 mov pc,lr



rol3: sub sp,sp,#12
	 str lr,[sp,#0]
	 str r4,[sp,#4]
	 str r5,[sp,#8]
	 
	 
	 mov r3,r1
	 mov r4,r2
	 
	 
	 lsl r2,r2,#3
	 lsr r1,r1,#29
	 add r5,r1,r2
	 
	 lsl r3,r3,#3
	 lsr r4,r4,#29
	 add r4,r4,r3
	 
	 
	 
	
	 
	 mov r1,r4 
	 mov r2,r5 
	  
	 @add sp,sp,#8
	  
	 ldr lr,[sp,#0]
	 ldr r4,[sp,#4]
	 ldr r5,[sp,#8]
	 add sp,sp,#12
	 mov pc,lr



additionc: sub sp,sp,#4
		  str lr,[sp,#0]
		  	 	 
		  adc r1,r1,r2
	 	 	    
		  ldr lr,[sp,#0]
		  add sp,sp,#4
          mov pc,lr
          
          

          
          
additions: sub sp,sp,#4
		  str lr,[sp,#0]
		  	 	 
		  adds r1,r1,r2
	 	 	    
		  ldr lr,[sp,#0]
		  add sp,sp,#4
          mov pc,lr

xor:sub sp,sp,#4
	str lr,[sp,#0]
	
	eor r1,r1,r2
	
	ldr lr,[sp,#0]
	add sp,sp,#4
	mov pc,lr
	
	



.data
	
formats: .asciz  "%llx"
formatpt: .asciz "%llx "
formatpt2: .asciz "%llx"
formatp1: .asciz "%llx\n"	
formatp0: .asciz "Enter the Key:\n"	
formatp2: .asciz "Enter the plain text:\n"	
formatp3: .asciz "Cipher text is:\n"	





