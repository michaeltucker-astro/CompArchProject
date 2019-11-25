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
	subq	$16096, %rsp            ## imm = 0x3EE0
	movq	___stack_chk_guard@GOTPCREL(%rip), %rax
	movq	(%rax), %rax
	movq	%rax, -8(%rbp)
	movl	$0, -16020(%rbp)
	movl	$1000, -16024(%rbp)     ## imm = 0x3E8
	movl	$0, -16036(%rbp)
	movl	$0, -16036(%rbp)
LBB0_1:                                 ## =>This Inner Loop Header: Depth=1
	cmpl	$100, -16036(%rbp)
	jge	LBB0_4
## %bb.2:                               ##   in Loop: Header=BB0_1 Depth=1
	movl	-16036(%rbp), %edi
	callq	_readData
## %bb.3:                               ##   in Loop: Header=BB0_1 Depth=1
	movl	-16036(%rbp), %eax
	addl	$1, %eax
	movl	%eax, -16036(%rbp)
	jmp	LBB0_1
LBB0_4:
	callq	_getticks
	movq	%rax, -16048(%rbp)
	movl	$0, -16036(%rbp)
LBB0_5:                                 ## =>This Inner Loop Header: Depth=1
	cmpl	$1000, -16036(%rbp)     ## imm = 0x3E8
	jge	LBB0_8
## %bb.6:                               ##   in Loop: Header=BB0_5 Depth=1
	movl	-16036(%rbp), %edi
	callq	_sigclip
	movsd	%xmm0, -16080(%rbp)
## %bb.7:                               ##   in Loop: Header=BB0_5 Depth=1
	movl	-16036(%rbp), %eax
	addl	$1, %eax
	movl	%eax, -16036(%rbp)
	jmp	LBB0_5
LBB0_8:
	callq	_getticks
	movq	%rax, -16056(%rbp)
	movq	-16056(%rbp), %rax
	subq	-16048(%rbp), %rax
	movq	%rax, -16064(%rbp)
	movq	-16064(%rbp), %rsi
	leaq	L_.str(%rip), %rdi
	movb	$0, %al
	callq	_printf
	movq	___stack_chk_guard@GOTPCREL(%rip), %rsi
	movq	(%rsi), %rsi
	movq	-8(%rbp), %rdi
	cmpq	%rdi, %rsi
	movl	%eax, -16084(%rbp)      ## 4-byte Spill
	jne	LBB0_10
## %bb.9:
	xorl	%eax, %eax
	addq	$16096, %rsp            ## imm = 0x3EE0
	popq	%rbp
	retq
LBB0_10:
	callq	___stack_chk_fail
	ud2
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
	subq	$112, %rsp
	xorl	%esi, %esi
	movl	$50, %eax
	movl	%eax, %edx
	leaq	-64(%rbp), %rcx
	movq	___stack_chk_guard@GOTPCREL(%rip), %r8
	movq	(%r8), %r8
	movq	%r8, -8(%rbp)
	movl	%edi, -68(%rbp)
	movl	$0, -92(%rbp)
	movl	-68(%rbp), %eax
	addl	$1, %eax
	movq	%rcx, %rdi
	leaq	L_.str.1(%rip), %rcx
	movl	%eax, %r8d
	movb	$0, %al
	callq	___sprintf_chk
	leaq	-64(%rbp), %rdi
	leaq	L_.str.2(%rip), %rsi
	movl	%eax, -96(%rbp)         ## 4-byte Spill
	callq	_fopen
	movq	%rax, -88(%rbp)
	cmpq	$0, %rax
	je	LBB1_5
## %bb.1:
	jmp	LBB1_2
LBB1_2:                                 ## =>This Inner Loop Header: Depth=1
	movq	-88(%rbp), %rdi
	leaq	L_.str.3(%rip), %rsi
	leaq	-80(%rbp), %rdx
	movb	$0, %al
	callq	_fscanf
	cmpl	$-1, %eax
	je	LBB1_4
## %bb.3:                               ##   in Loop: Header=BB1_2 Depth=1
	movq	_array@GOTPCREL(%rip), %rax
	movsd	-80(%rbp), %xmm0        ## xmm0 = mem[0],zero
	movslq	-68(%rbp), %rcx
	imulq	$8000, %rcx, %rcx       ## imm = 0x1F40
	addq	%rcx, %rax
	movslq	-92(%rbp), %rcx
	movsd	%xmm0, (%rax,%rcx,8)
	movl	-92(%rbp), %edx
	addl	$1, %edx
	movl	%edx, -92(%rbp)
	jmp	LBB1_2
LBB1_4:
	jmp	LBB1_6
LBB1_5:
	leaq	L_.str.4(%rip), %rdi
	xorl	%eax, %eax
	movb	%al, %cl
	leaq	-64(%rbp), %rsi
	movb	%cl, %al
	callq	_printf
	movl	$1, %edi
	movl	%eax, -100(%rbp)        ## 4-byte Spill
	callq	_exit
LBB1_6:
	movq	-88(%rbp), %rdi
	callq	_fclose
	movq	___stack_chk_guard@GOTPCREL(%rip), %rdi
	movq	(%rdi), %rdi
	movq	-8(%rbp), %rcx
	cmpq	%rcx, %rdi
	movl	%eax, -104(%rbp)        ## 4-byte Spill
	jne	LBB1_8
## %bb.7:
	addq	$112, %rsp
	popq	%rbp
	retq
LBB1_8:
	callq	___stack_chk_fail
	ud2
	.cfi_endproc
                                        ## -- End function
	.p2align	4, 0x90         ## -- Begin function getticks
_getticks:                              ## @getticks
	.cfi_startproc
## %bb.0:
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset %rbp, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register %rbp
	## InlineAsm Start
	rdtsc
	## InlineAsm End
	movl	%eax, -4(%rbp)
	movl	%edx, -8(%rbp)
	movl	-8(%rbp), %eax
	movl	%eax, %ecx
	shlq	$32, %rcx
	movl	-4(%rbp), %eax
	movl	%eax, %esi
	orq	%rsi, %rcx
	movq	%rcx, %rax
	popq	%rbp
	retq
	.cfi_endproc
                                        ## -- End function
	.section	__TEXT,__literal8,8byte_literals
	.p2align	3               ## -- Begin function sigclip
LCPI3_0:
	.quad	4613937818241073152     ## double 3
LCPI3_1:
	.quad	4636666922610458624     ## double 99
LCPI3_3:
	.quad	4576918229304087675     ## double 0.01
	.section	__TEXT,__literal16,16byte_literals
	.p2align	4
LCPI3_2:
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
	subq	$896, %rsp              ## imm = 0x380
	movq	___stack_chk_guard@GOTPCREL(%rip), %rax
	movq	(%rax), %rax
	movq	%rax, -8(%rbp)
	movl	%edi, -828(%rbp)
	xorps	%xmm0, %xmm0
	movsd	%xmm0, -856(%rbp)
	movsd	%xmm0, -864(%rbp)
	movsd	%xmm0, -872(%rbp)
	movl	$0, -876(%rbp)
	movl	$10, -880(%rbp)
	movl	$0, -876(%rbp)
LBB3_1:                                 ## =>This Inner Loop Header: Depth=1
	cmpl	$100, -876(%rbp)
	jge	LBB3_4
## %bb.2:                               ##   in Loop: Header=BB3_1 Depth=1
	movsd	LCPI3_3(%rip), %xmm0    ## xmm0 = mem[0],zero
	movq	_array@GOTPCREL(%rip), %rax
	movslq	-876(%rbp), %rcx
	imulq	$8000, %rcx, %rcx       ## imm = 0x1F40
	addq	%rcx, %rax
	movslq	-828(%rbp), %rcx
	mulsd	(%rax,%rcx,8), %xmm0
	addsd	-856(%rbp), %xmm0
	movsd	%xmm0, -856(%rbp)
## %bb.3:                               ##   in Loop: Header=BB3_1 Depth=1
	movl	-876(%rbp), %eax
	addl	$1, %eax
	movl	%eax, -876(%rbp)
	jmp	LBB3_1
LBB3_4:
	movl	$0, -876(%rbp)
LBB3_5:                                 ## =>This Inner Loop Header: Depth=1
	cmpl	$100, -876(%rbp)
	jge	LBB3_10
## %bb.6:                               ##   in Loop: Header=BB3_5 Depth=1
	movq	_array@GOTPCREL(%rip), %rax
	movslq	-876(%rbp), %rcx
	imulq	$8000, %rcx, %rcx       ## imm = 0x1F40
	addq	%rcx, %rax
	movslq	-828(%rbp), %rcx
	movsd	(%rax,%rcx,8), %xmm0    ## xmm0 = mem[0],zero
	subsd	-856(%rbp), %xmm0
	movslq	-876(%rbp), %rax
	movsd	%xmm0, -816(%rbp,%rax,8)
	movslq	-876(%rbp), %rax
	movsd	-816(%rbp,%rax,8), %xmm0 ## xmm0 = mem[0],zero
	movslq	-876(%rbp), %rax
	mulsd	-816(%rbp,%rax,8), %xmm0
	addsd	-864(%rbp), %xmm0
	movsd	%xmm0, -864(%rbp)
	movslq	-876(%rbp), %rax
	movsd	-816(%rbp,%rax,8), %xmm0 ## xmm0 = mem[0],zero
	movaps	LCPI3_2(%rip), %xmm1    ## xmm1 = [nan,nan]
	pand	%xmm1, %xmm0
	ucomisd	-872(%rbp), %xmm0
	jbe	LBB3_8
## %bb.7:                               ##   in Loop: Header=BB3_5 Depth=1
	movslq	-876(%rbp), %rax
	movsd	-816(%rbp,%rax,8), %xmm0 ## xmm0 = mem[0],zero
	movaps	LCPI3_2(%rip), %xmm1    ## xmm1 = [nan,nan]
	pand	%xmm1, %xmm0
	movsd	%xmm0, -872(%rbp)
	movl	-876(%rbp), %ecx
	movl	%ecx, -880(%rbp)
LBB3_8:                                 ##   in Loop: Header=BB3_5 Depth=1
	jmp	LBB3_9
LBB3_9:                                 ##   in Loop: Header=BB3_5 Depth=1
	movl	-876(%rbp), %eax
	addl	$1, %eax
	movl	%eax, -876(%rbp)
	jmp	LBB3_5
LBB3_10:
	movq	_array@GOTPCREL(%rip), %rax
	movsd	LCPI3_0(%rip), %xmm0    ## xmm0 = mem[0],zero
	movsd	LCPI3_1(%rip), %xmm1    ## xmm1 = mem[0],zero
	movsd	-864(%rbp), %xmm2       ## xmm2 = mem[0],zero
	divsd	%xmm1, %xmm2
	sqrtsd	%xmm2, %xmm1
	movsd	%xmm1, -864(%rbp)
	movsd	-856(%rbp), %xmm1       ## xmm1 = mem[0],zero
	movaps	%xmm0, %xmm2
	mulsd	-864(%rbp), %xmm2
	addsd	%xmm2, %xmm1
	movsd	%xmm1, -840(%rbp)
	movsd	-856(%rbp), %xmm1       ## xmm1 = mem[0],zero
	mulsd	-864(%rbp), %xmm0
	subsd	%xmm0, %xmm1
	movsd	%xmm1, -848(%rbp)
	movslq	-880(%rbp), %rcx
	imulq	$8000, %rcx, %rcx       ## imm = 0x1F40
	addq	%rcx, %rax
	movslq	-828(%rbp), %rcx
	movsd	(%rax,%rcx,8), %xmm0    ## xmm0 = mem[0],zero
	ucomisd	-840(%rbp), %xmm0
	ja	LBB3_12
## %bb.11:
	movq	_array@GOTPCREL(%rip), %rax
	movslq	-880(%rbp), %rcx
	imulq	$8000, %rcx, %rcx       ## imm = 0x1F40
	addq	%rcx, %rax
	movslq	-828(%rbp), %rcx
	movsd	(%rax,%rcx,8), %xmm0    ## xmm0 = mem[0],zero
	movsd	-848(%rbp), %xmm1       ## xmm1 = mem[0],zero
	ucomisd	%xmm0, %xmm1
	jbe	LBB3_19
LBB3_12:
	xorps	%xmm0, %xmm0
	movsd	%xmm0, -856(%rbp)
	movl	$0, -876(%rbp)
LBB3_13:                                ## =>This Inner Loop Header: Depth=1
	cmpl	$100, -876(%rbp)
	jge	LBB3_18
## %bb.14:                              ##   in Loop: Header=BB3_13 Depth=1
	movl	-876(%rbp), %eax
	cmpl	-880(%rbp), %eax
	je	LBB3_16
## %bb.15:                              ##   in Loop: Header=BB3_13 Depth=1
	movsd	LCPI3_1(%rip), %xmm0    ## xmm0 = mem[0],zero
	movq	_array@GOTPCREL(%rip), %rax
	movslq	-876(%rbp), %rcx
	imulq	$8000, %rcx, %rcx       ## imm = 0x1F40
	addq	%rcx, %rax
	movslq	-828(%rbp), %rcx
	movsd	(%rax,%rcx,8), %xmm1    ## xmm1 = mem[0],zero
	divsd	%xmm0, %xmm1
	addsd	-856(%rbp), %xmm1
	movsd	%xmm1, -856(%rbp)
LBB3_16:                                ##   in Loop: Header=BB3_13 Depth=1
	jmp	LBB3_17
LBB3_17:                                ##   in Loop: Header=BB3_13 Depth=1
	movl	-876(%rbp), %eax
	addl	$1, %eax
	movl	%eax, -876(%rbp)
	jmp	LBB3_13
LBB3_18:
	movsd	-856(%rbp), %xmm0       ## xmm0 = mem[0],zero
	movsd	%xmm0, -824(%rbp)
	jmp	LBB3_20
LBB3_19:
	movsd	-856(%rbp), %xmm0       ## xmm0 = mem[0],zero
	movsd	%xmm0, -824(%rbp)
LBB3_20:
	movsd	-824(%rbp), %xmm0       ## xmm0 = mem[0],zero
	movq	___stack_chk_guard@GOTPCREL(%rip), %rax
	movq	(%rax), %rax
	movq	-8(%rbp), %rcx
	cmpq	%rcx, %rax
	movsd	%xmm0, -888(%rbp)       ## 8-byte Spill
	jne	LBB3_22
## %bb.21:
	movsd	-888(%rbp), %xmm0       ## 8-byte Reload
                                        ## xmm0 = mem[0],zero
	addq	$896, %rsp              ## imm = 0x380
	popq	%rbp
	retq
LBB3_22:
	callq	___stack_chk_fail
	ud2
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
