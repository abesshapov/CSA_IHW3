	.file	"task3.c"
	.intel_syntax noprefix
	.text
	.globl	factorial
	.type	factorial, @function
factorial:
	push	rbp
	mov	rbp, rsp
	sub	rsp, 16
	mov	DWORD PTR -4[rbp], edi
	cmp	DWORD PTR -4[rbp], 0
	jne	.L2
	mov	eax, 1
	jmp	.L3
.L2:
	mov	eax, DWORD PTR -4[rbp]
	sub	eax, 1
	mov	edi, eax
	call	factorial
	imul	eax, DWORD PTR -4[rbp]
.L3:
	leave
	ret
	.size	factorial, .-factorial
	.globl	find_sh
	.type	find_sh, @function
find_sh:
	push	rbp
	mov	rbp, rsp
	push	rbx
	sub	rsp, 56
	movsd	QWORD PTR -56[rbp], xmm0
	pxor	xmm0, xmm0
	movsd	QWORD PTR -32[rbp], xmm0
	pxor	xmm0, xmm0
	movsd	QWORD PTR -24[rbp], xmm0
	mov	DWORD PTR -36[rbp], 0
.L8:
	mov	eax, DWORD PTR -36[rbp]
	add	eax, eax
	add	eax, 1
	pxor	xmm0, xmm0
	cvtsi2sd	xmm0, eax
	mov	rax, QWORD PTR -56[rbp]
	movapd	xmm1, xmm0
	movq	xmm0, rax
	call	pow@PLT
	movq	rbx, xmm0
	mov	eax, DWORD PTR -36[rbp]
	add	eax, eax
	add	eax, 1
	mov	edi, eax
	call	factorial
	pxor	xmm1, xmm1
	cvtsi2sd	xmm1, eax
	movq	xmm0, rbx
	divsd	xmm0, xmm1
	movsd	xmm1, QWORD PTR -32[rbp]
	addsd	xmm0, xmm1
	movsd	QWORD PTR -32[rbp], xmm0
	movsd	xmm0, QWORD PTR -32[rbp]
	subsd	xmm0, QWORD PTR -24[rbp]
	movq	xmm1, QWORD PTR .LC1[rip]
	andpd	xmm1, xmm0
	movsd	xmm0, QWORD PTR .LC2[rip]
	mulsd	xmm1, xmm0
	movsd	xmm0, QWORD PTR -32[rbp]
	movq	xmm2, QWORD PTR .LC1[rip]
	andpd	xmm0, xmm2
	comisd	xmm0, xmm1
	jb	.L10
	movsd	xmm0, QWORD PTR -32[rbp]
	jmp	.L11
.L10:
	mov	eax, DWORD PTR -36[rbp]
	add	eax, eax
	add	eax, 1
	pxor	xmm0, xmm0
	cvtsi2sd	xmm0, eax
	mov	rax, QWORD PTR -56[rbp]
	movapd	xmm1, xmm0
	movq	xmm0, rax
	call	pow@PLT
	movq	rbx, xmm0
	mov	eax, DWORD PTR -36[rbp]
	add	eax, eax
	add	eax, 1
	mov	edi, eax
	call	factorial
	pxor	xmm1, xmm1
	cvtsi2sd	xmm1, eax
	movq	xmm0, rbx
	divsd	xmm0, xmm1
	movsd	xmm1, QWORD PTR -24[rbp]
	addsd	xmm0, xmm1
	movsd	QWORD PTR -24[rbp], xmm0
	add	DWORD PTR -36[rbp], 1
	jmp	.L8
.L11:
	movq	rax, xmm0
	movq	xmm0, rax
	mov	rbx, QWORD PTR -8[rbp]
	leave
	ret
	.size	find_sh, .-find_sh
	.globl	find_ch
	.type	find_ch, @function
find_ch:
	push	rbp
	mov	rbp, rsp
	push	rbx
	sub	rsp, 56
	movsd	QWORD PTR -56[rbp], xmm0
	pxor	xmm0, xmm0
	movsd	QWORD PTR -32[rbp], xmm0
	pxor	xmm0, xmm0
	movsd	QWORD PTR -24[rbp], xmm0
	mov	DWORD PTR -36[rbp], 0
.L16:
	mov	eax, DWORD PTR -36[rbp]
	add	eax, eax
	pxor	xmm0, xmm0
	cvtsi2sd	xmm0, eax
	mov	rax, QWORD PTR -56[rbp]
	movapd	xmm1, xmm0
	movq	xmm0, rax
	call	pow@PLT
	movq	rbx, xmm0
	mov	eax, DWORD PTR -36[rbp]
	add	eax, eax
	mov	edi, eax
	call	factorial
	pxor	xmm1, xmm1
	cvtsi2sd	xmm1, eax
	movq	xmm0, rbx
	divsd	xmm0, xmm1
	movsd	xmm1, QWORD PTR -32[rbp]
	addsd	xmm0, xmm1
	movsd	QWORD PTR -32[rbp], xmm0
	movsd	xmm0, QWORD PTR -32[rbp]
	subsd	xmm0, QWORD PTR -24[rbp]
	movq	xmm1, QWORD PTR .LC1[rip]
	andpd	xmm1, xmm0
	movsd	xmm0, QWORD PTR .LC2[rip]
	mulsd	xmm1, xmm0
	movsd	xmm0, QWORD PTR -32[rbp]
	movq	xmm2, QWORD PTR .LC1[rip]
	andpd	xmm0, xmm2
	comisd	xmm0, xmm1
	jb	.L18
	movsd	xmm0, QWORD PTR -32[rbp]
	jmp	.L19
.L18:
	mov	eax, DWORD PTR -36[rbp]
	add	eax, eax
	pxor	xmm0, xmm0
	cvtsi2sd	xmm0, eax
	mov	rax, QWORD PTR -56[rbp]
	movapd	xmm1, xmm0
	movq	xmm0, rax
	call	pow@PLT
	movq	rbx, xmm0
	mov	eax, DWORD PTR -36[rbp]
	add	eax, eax
	mov	edi, eax
	call	factorial
	pxor	xmm1, xmm1
	cvtsi2sd	xmm1, eax
	movq	xmm0, rbx
	divsd	xmm0, xmm1
	movsd	xmm1, QWORD PTR -24[rbp]
	addsd	xmm0, xmm1
	movsd	QWORD PTR -24[rbp], xmm0
	add	DWORD PTR -36[rbp], 1
	jmp	.L16
.L19:
	movq	rax, xmm0
	movq	xmm0, rax
	mov	rbx, QWORD PTR -8[rbp]
	leave
	ret
	.size	find_ch, .-find_ch
	.section	.rodata
	.align 8
.LC3:
	.string	"Enter a number 'x' satisfying the inequality: 0 < |x| < Pi: "
.LC4:
	.string	"%lf"
.LC6:
	.string	"Incorrect data"
.LC7:
	.string	"cth(x) = %lf\n"
	.text
	.globl	main
	.type	main, @function
main:
	push	rbp
	mov	rbp, rsp
	push	rbx
	sub	rsp, 24
	mov	rax, QWORD PTR fs:40
	mov	QWORD PTR -24[rbp], rax
	xor	eax, eax
	lea	rax, .LC3[rip]
	mov	rdi, rax
	mov	eax, 0
	call	printf@PLT
	lea	rax, -32[rbp]
	mov	rsi, rax
	lea	rax, .LC4[rip]
	mov	rdi, rax
	mov	eax, 0
	call	__isoc99_scanf@PLT
	movsd	xmm0, QWORD PTR -32[rbp]
	pxor	xmm1, xmm1
	ucomisd	xmm0, xmm1
	jp	.L28
	pxor	xmm1, xmm1
	ucomisd	xmm0, xmm1
	je	.L21
.L28:
	movsd	xmm0, QWORD PTR -32[rbp]
	movq	xmm1, QWORD PTR .LC1[rip]
	andpd	xmm0, xmm1
	comisd	xmm0, QWORD PTR .LC5[rip]
	jb	.L29
.L21:
	lea	rax, .LC6[rip]
	mov	rdi, rax
	mov	eax, 0
	call	printf@PLT
	jmp	.L25
.L29:
	mov	rax, QWORD PTR -32[rbp]
	movq	xmm0, rax
	call	find_ch
	movq	rbx, xmm0
	mov	rax, QWORD PTR -32[rbp]
	movq	xmm0, rax
	call	find_sh
	movq	xmm2, rbx
	divsd	xmm2, xmm0
	movq	rax, xmm2
	movq	xmm0, rax
	lea	rax, .LC7[rip]
	mov	rdi, rax
	mov	eax, 1
	call	printf@PLT
.L25:
	mov	eax, 0
	mov	rdx, QWORD PTR -24[rbp]
	sub	rdx, QWORD PTR fs:40
	je	.L27
	call	__stack_chk_fail@PLT
.L27:
	mov	rbx, QWORD PTR -8[rbp]
	leave
	ret
	.size	main, .-main
	.section	.rodata
	.align 16
.LC1:
	.long	-1
	.long	2147483647
	.long	0
	.long	0
	.align 8
.LC2:
	.long	0
	.long	1083129856
	.align 8
.LC5:
	.long	1413754136
	.long	1074340347
	.ident	"GCC: (Ubuntu 11.3.0-1ubuntu1~22.04) 11.3.0"
	.section	.note.GNU-stack,"",@progbits
