	.section	__TEXT,__text,regular,pure_instructions
	.build_version macos, 10, 14	sdk_version 10, 14
	.globl	_main                   ## -- Begin function main
	.p2align	4, 0x90
_main:                                  ## @main
	.cfi_startproc
## %bb.0:
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset %rbp, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register %rbp
	pushq	%rbx
	pushq	%rax
	.cfi_offset %rbx, -24
	xorl	%ebx, %ebx
	.p2align	4, 0x90
LBB0_1:                                 ## =>This Inner Loop Header: Depth=1
	movl	%ebx, %edi
	callq	_readData
	incl	%ebx
	cmpl	$100, %ebx
	jne	LBB0_1
## %bb.2:
	## InlineAsm Start
	rdtsc
	## InlineAsm End
	movl	%edx, %ecx
	movl	%eax, %eax
	shlq	$32, %rcx
	orq	%rax, %rcx
	## InlineAsm Start
	rdtsc
	## InlineAsm End
                                        ## kill: def $edx killed $edx def $rdx
	shlq	$32, %rdx
	movl	%eax, %esi
	orq	%rdx, %rsi
	subq	%rcx, %rsi
	leaq	L_.str(%rip), %rdi
	xorl	%eax, %eax
	callq	_printf
	xorl	%eax, %eax
	addq	$8, %rsp
	popq	%rbx
	popq	%rbp
	retq
	.cfi_endproc
                                        ## -- End function
	.globl	_readData               ## -- Begin function readData
	.p2align	4, 0x90
_readData:                              ## @readData
	.cfi_startproc
## %bb.0:
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset %rbp, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register %rbp
	pushq	%r15
	pushq	%r14
	pushq	%r12
	pushq	%rbx
	subq	$80, %rsp
	.cfi_offset %rbx, -48
	.cfi_offset %r12, -40
	.cfi_offset %r14, -32
	.cfi_offset %r15, -24
	movl	%edi, %r14d
	movq	___stack_chk_guard@GOTPCREL(%rip), %rax
	movq	(%rax), %rax
	movq	%rax, -40(%rbp)
	leal	1(%r14), %r8d
	leaq	L_.str.1(%rip), %rcx
	leaq	-96(%rbp), %rbx
	movl	$0, %esi
	movl	$50, %edx
	xorl	%eax, %eax
	movq	%rbx, %rdi
	callq	___sprintf_chk
	leaq	L_.str.2(%rip), %rsi
	movq	%rbx, %rdi
	callq	_fopen
	testq	%rax, %rax
	je	LBB1_6
## %bb.1:
	movq	%rax, %r12
	leaq	L_.str.3(%rip), %rsi
	leaq	-104(%rbp), %rdx
	xorl	%eax, %eax
	movq	%r12, %rdi
	callq	_fscanf
	cmpl	$-1, %eax
	je	LBB1_4
## %bb.2:
	movslq	%r14d, %rax
	imulq	$8000, %rax, %rbx       ## imm = 0x1F40
	addq	_array@GOTPCREL(%rip), %rbx
	leaq	L_.str.3(%rip), %r14
	leaq	-104(%rbp), %r15
	.p2align	4, 0x90
LBB1_3:                                 ## =>This Inner Loop Header: Depth=1
	movq	-104(%rbp), %rax
	movq	%rax, (%rbx)
	xorl	%eax, %eax
	movq	%r12, %rdi
	movq	%r14, %rsi
	movq	%r15, %rdx
	callq	_fscanf
	addq	$8, %rbx
	cmpl	$-1, %eax
	jne	LBB1_3
LBB1_4:
	movq	%r12, %rdi
	callq	_fclose
	movq	___stack_chk_guard@GOTPCREL(%rip), %rax
	movq	(%rax), %rax
	cmpq	-40(%rbp), %rax
	jne	LBB1_7
## %bb.5:
	addq	$80, %rsp
	popq	%rbx
	popq	%r12
	popq	%r14
	popq	%r15
	popq	%rbp
	retq
LBB1_7:
	callq	___stack_chk_fail
LBB1_6:
	leaq	L_.str.4(%rip), %rdi
	leaq	-96(%rbp), %rsi
	xorl	%eax, %eax
	callq	_printf
	movl	$1, %edi
	callq	_exit
	.cfi_endproc
                                        ## -- End function
	.section	__TEXT,__literal8,8byte_literals
	.p2align	3               ## -- Begin function sigclip
LCPI2_0:
	.quad	4576918229304087675     ## double 0.01
LCPI2_2:
	.quad	4636666922610458624     ## double 99
LCPI2_3:
	.quad	4613937818241073152     ## double 3
	.section	__TEXT,__literal16,16byte_literals
	.p2align	4
LCPI2_1:
	.quad	9223372036854775807     ## double NaN
	.quad	9223372036854775807     ## double NaN
	.section	__TEXT,__text,regular,pure_instructions
	.globl	_sigclip
	.p2align	4, 0x90
_sigclip:                               ## @sigclip
	.cfi_startproc
## %bb.0:
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset %rbp, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register %rbp
	movslq	%edi, %rax
	leaq	(,%rax,8), %rcx
	addq	_array@GOTPCREL(%rip), %rcx
	xorpd	%xmm0, %xmm0
	movl	$32000, %edx            ## imm = 0x7D00
	movsd	LCPI2_0(%rip), %xmm1    ## xmm1 = mem[0],zero
	.p2align	4, 0x90
LBB2_1:                                 ## =>This Inner Loop Header: Depth=1
	movsd	-32000(%rcx,%rdx), %xmm2 ## xmm2 = mem[0],zero
	mulsd	%xmm1, %xmm2
	addsd	%xmm0, %xmm2
	movsd	-24000(%rcx,%rdx), %xmm0 ## xmm0 = mem[0],zero
	mulsd	%xmm1, %xmm0
	addsd	%xmm2, %xmm0
	movsd	-16000(%rcx,%rdx), %xmm2 ## xmm2 = mem[0],zero
	mulsd	%xmm1, %xmm2
	addsd	%xmm0, %xmm2
	movsd	-8000(%rcx,%rdx), %xmm3 ## xmm3 = mem[0],zero
	mulsd	%xmm1, %xmm3
	addsd	%xmm2, %xmm3
	movsd	(%rcx,%rdx), %xmm0      ## xmm0 = mem[0],zero
	mulsd	%xmm1, %xmm0
	addsd	%xmm3, %xmm0
	addq	$40000, %rdx            ## imm = 0x9C40
	cmpq	$832000, %rdx           ## imm = 0xCB200
	jne	LBB2_1
## %bb.2:
	xorpd	%xmm1, %xmm1
	movl	$10, %edx
	xorl	%esi, %esi
	movapd	LCPI2_1(%rip), %xmm2    ## xmm2 = [nan,nan]
	xorpd	%xmm3, %xmm3
	.p2align	4, 0x90
LBB2_3:                                 ## =>This Inner Loop Header: Depth=1
	movsd	(%rcx), %xmm4           ## xmm4 = mem[0],zero
	subsd	%xmm0, %xmm4
	movapd	%xmm4, %xmm5
	mulsd	%xmm4, %xmm5
	andpd	%xmm2, %xmm4
	ucomisd	%xmm1, %xmm4
	addsd	%xmm3, %xmm5
	movl	%edx, %edi
	cmoval	%esi, %edi
	maxsd	%xmm1, %xmm4
	movl	%esi, %edx
	orl	$1, %edx
	movsd	8000(%rcx), %xmm1       ## xmm1 = mem[0],zero
	subsd	%xmm0, %xmm1
	movapd	%xmm1, %xmm3
	mulsd	%xmm1, %xmm3
	andpd	%xmm2, %xmm1
	ucomisd	%xmm4, %xmm1
	addsd	%xmm5, %xmm3
	cmovbel	%edi, %edx
	maxsd	%xmm4, %xmm1
	addq	$2, %rsi
	addq	$16000, %rcx            ## imm = 0x3E80
	cmpq	$100, %rsi
	jne	LBB2_3
## %bb.4:
	divsd	LCPI2_2(%rip), %xmm3
	xorps	%xmm1, %xmm1
	sqrtsd	%xmm3, %xmm1
	mulsd	LCPI2_3(%rip), %xmm1
	movapd	%xmm0, %xmm3
	movslq	%edx, %rcx
	imulq	$8000, %rcx, %rcx       ## imm = 0x1F40
	addq	_array@GOTPCREL(%rip), %rcx
	addsd	%xmm1, %xmm3
	movsd	(%rcx,%rax,8), %xmm2    ## xmm2 = mem[0],zero
	ucomisd	%xmm3, %xmm2
	ja	LBB2_6
## %bb.5:
	movapd	%xmm0, %xmm3
	subsd	%xmm1, %xmm3
	ucomisd	%xmm2, %xmm3
	jbe	LBB2_12
LBB2_6:
	movl	%edx, %r8d
	movq	_array@GOTPCREL(%rip), %rdx
	leaq	8000(%rdx,%rax,8), %rax
	imulq	$8000, %r8, %rdx        ## imm = 0x1F40
	xorpd	%xmm0, %xmm0
	xorl	%esi, %esi
	movsd	LCPI2_2(%rip), %xmm1    ## xmm1 = mem[0],zero
	xorl	%ecx, %ecx
	.p2align	4, 0x90
LBB2_7:                                 ## =>This Inner Loop Header: Depth=1
	cmpq	%rsi, %rdx
	jne	LBB2_8
## %bb.9:                               ##   in Loop: Header=BB2_7 Depth=1
	movq	%rcx, %rdi
	orq	$1, %rdi
	cmpq	%r8, %rdi
	jne	LBB2_10
LBB2_11:                                ##   in Loop: Header=BB2_7 Depth=1
	addq	$2, %rcx
	addq	$16000, %rsi            ## imm = 0x3E80
	cmpq	$100, %rcx
	jne	LBB2_7
	jmp	LBB2_12
	.p2align	4, 0x90
LBB2_8:                                 ##   in Loop: Header=BB2_7 Depth=1
	movsd	-8000(%rax,%rsi), %xmm2 ## xmm2 = mem[0],zero
	divsd	%xmm1, %xmm2
	addsd	%xmm2, %xmm0
	movq	%rcx, %rdi
	orq	$1, %rdi
	cmpq	%r8, %rdi
	je	LBB2_11
LBB2_10:                                ##   in Loop: Header=BB2_7 Depth=1
	movsd	(%rax,%rsi), %xmm2      ## xmm2 = mem[0],zero
	divsd	%xmm1, %xmm2
	addsd	%xmm2, %xmm0
	addq	$2, %rcx
	addq	$16000, %rsi            ## imm = 0x3E80
	cmpq	$100, %rcx
	jne	LBB2_7
LBB2_12:
	popq	%rbp
	retq
	.cfi_endproc
                                        ## -- End function
	.section	__TEXT,__cstring,cstring_literals
L_.str:                                 ## @.str
	.asciz	"Clock cycles: %ld\n"

L_.str.1:                               ## @.str.1
	.asciz	"data/data%d.txt"

L_.str.2:                               ## @.str.2
	.asciz	"r"

L_.str.3:                               ## @.str.3
	.asciz	"%lf"

	.comm	_array,800000,4         ## @array
L_.str.4:                               ## @.str.4
	.asciz	"Failed to open file: %s"


.subsections_via_symbols
