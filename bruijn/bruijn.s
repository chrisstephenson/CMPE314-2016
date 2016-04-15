	.file	"bruijn.c"
	.text
	.globl	fib
	.type	fib, @function
fib:
.LFB2:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	subq	$16, %rsp
	movl	%edi, -4(%rbp)
	movl	%esi, -8(%rbp)
	movl	%edx, -12(%rbp)
	cmpl	$1, -4(%rbp)
	jg	.L2
	movl	-8(%rbp), %eax
	jmp	.L3
.L2:
	movl	-8(%rbp), %edx
	movl	-12(%rbp), %eax
	addl	%eax, %edx
	movl	-4(%rbp), %eax
	leal	-1(%rax), %ecx
	movl	-12(%rbp), %eax
	movl	%eax, %esi
	movl	%ecx, %edi
	call	fib
.L3:
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE2:
	.size	fib, .-fib
	.section	.rodata
	.align 8
.LC0:
	.string	"\nUsage is bruijn <number>\n To calculate nth fibonacci number"
.LC1:
	.string	"\n%dth Fibonacci number is %d\n"
	.text
	.globl	main
	.type	main, @function
main:
.LFB3:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	subq	$32, %rsp
	movl	%edi, -20(%rbp)
	movq	%rsi, -32(%rbp)
	movl	$0, -4(%rbp)
	cmpl	$2, -20(%rbp)
	je	.L5
	movl	$.LC0, %edi
	call	puts
	jmp	.L6
.L5:
	movq	-32(%rbp), %rax
	addq	$8, %rax
	movq	(%rax), %rax
	movq	%rax, %rdi
	call	atoi
	movl	%eax, -4(%rbp)
	movl	-4(%rbp), %eax
	movl	$1, %edx
	movl	$1, %esi
	movl	%eax, %edi
	call	fib
	movl	%eax, %edx
	movl	-4(%rbp), %eax
	movl	%eax, %esi
	movl	$.LC1, %edi
	movl	$0, %eax
	call	printf
.L6:
	movl	$1, %eax
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE3:
	.size	main, .-main
	.ident	"GCC: (Ubuntu 5.2.1-22ubuntu2) 5.2.1 20151010"
	.section	.note.GNU-stack,"",@progbits
