.data
.balign 8
_str9:
	.ascii " 2>&1"
	.byte 0
/* end data */

.data
.balign 8
_str12:
	.ascii "cd "
	.byte 0
/* end data */

.data
.balign 8
_str14:
	.ascii " && "
	.byte 0
/* end data */

.data
.balign 8
_str25:
	.ascii " "
	.byte 0
/* end data */

.data
.balign 8
_str36:
	.ascii ""
	.byte 0
/* end data */

.data
.balign 8
_str61:
	.ascii " "
	.byte 0
/* end data */

.text
.balign 4
.globl _donna_shell_getenv
_donna_shell_getenv:
	hint	#34
	stp	x29, x30, [sp, -16]!
	mov	x29, sp
	bl	_donna_rt_getenv
	ldp	x29, x30, [sp], 16
	ret
/* end function donna_shell_getenv */

.text
.balign 4
.globl _donna_shell_flush
_donna_shell_flush:
	hint	#34
	stp	x29, x30, [sp, -16]!
	mov	x29, sp
	bl	_donna_rt_flush
	ldp	x29, x30, [sp], 16
	ret
/* end function donna_shell_flush */

.text
.balign 4
.globl _donna_shell_run
_donna_shell_run:
	hint	#34
	stp	x29, x30, [sp, -16]!
	mov	x29, sp
	bl	_donna_ffi_shell_exec
	ldp	x29, x30, [sp], 16
	ret
/* end function donna_shell_run */

.text
.balign 4
.globl _donna_shell_capture
_donna_shell_capture:
	hint	#34
	stp	x29, x30, [sp, -16]!
	mov	x29, sp
	bl	_donna_ffi_shell_capture
	ldp	x29, x30, [sp], 16
	ret
/* end function donna_shell_capture */

.text
.balign 4
.globl _donna_shell_exec
_donna_shell_exec:
	hint	#34
	stp	x29, x30, [sp, -16]!
	mov	x29, sp
	bl	_donna_shell_build_cmd
	bl	_donna_ffi_shell_exec
	ldp	x29, x30, [sp], 16
	ret
/* end function donna_shell_exec */

.text
.balign 4
.globl _donna_shell_output
_donna_shell_output:
	hint	#34
	stp	x29, x30, [sp, -16]!
	mov	x29, sp
	bl	_donna_shell_build_cmd
	bl	_donna_ffi_shell_capture
	ldp	x29, x30, [sp], 16
	ret
/* end function donna_shell_output */

.text
.balign 4
.globl _donna_shell_output_with_err
_donna_shell_output_with_err:
	hint	#34
	stp	x29, x30, [sp, -16]!
	mov	x29, sp
	bl	_donna_shell_build_cmd
	adrp	x1, _str9@page
	add	x1, x1, _str9@pageoff
	bl	___rt_str_concat
	bl	_donna_ffi_shell_capture
	ldp	x29, x30, [sp], 16
	ret
/* end function donna_shell_output_with_err */

.text
.balign 4
.globl _donna_shell_exec_in
_donna_shell_exec_in:
	hint	#34
	stp	x29, x30, [sp, -32]!
	mov	x29, sp
	str	x19, [x29, 24]
	str	x20, [x29, 16]
	mov	x20, x1
	mov	x1, x2
	mov	x19, x0
	adrp	x0, _str12@page
	add	x0, x0, _str12@pageoff
	bl	___rt_str_concat
	mov	x1, x20
	mov	x20, x1
	adrp	x1, _str14@page
	add	x1, x1, _str14@pageoff
	bl	___rt_str_concat
	mov	x1, x20
	mov	x17, x0
	mov	x0, x19
	mov	x19, x17
	bl	_donna_shell_build_cmd
	mov	x1, x0
	mov	x0, x19
	bl	___rt_str_concat
	bl	_donna_ffi_shell_exec
	ldr	x19, [x29, 24]
	ldr	x20, [x29, 16]
	ldp	x29, x30, [sp], 32
	ret
/* end function donna_shell_exec_in */

.text
.balign 4
_donna_shell_build_cmd:
	hint	#34
	stp	x29, x30, [sp, -32]!
	mov	x29, sp
	str	x19, [x29, 24]
	mov	x19, x1
	ldr	x1, [x19]
	cmp	x1, #0
	beq	L18
	adrp	x1, _str25@page
	add	x1, x1, _str25@pageoff
	bl	___rt_str_concat
	mov	x17, x0
	mov	x0, x19
	mov	x19, x17
	bl	_donna_shell_join_args
	mov	x1, x0
	mov	x0, x19
	bl	___rt_str_concat
L18:
	ldr	x19, [x29, 24]
	ldp	x29, x30, [sp], 32
	ret
/* end function donna_shell_build_cmd */

.text
.balign 4
_donna_shell_join_args:
	hint	#34
	stp	x29, x30, [sp, -32]!
	mov	x29, sp
	str	x19, [x29, 24]
	ldr	x1, [x0]
	cmp	x1, #0
	beq	L27
	mov	x2, #16
	sub	sp, sp, x2
	mov	x2, sp
	cmp	x1, #1
	beq	L23
	mov	x1, #0
	str	x1, [x2]
	mov	x1, #0
	b	L24
L23:
	mov	x1, #16
	add	x1, x0, x1
	ldr	x1, [x1]
	ldr	x1, [x1]
	cmp	x1, #0
	cset	x1, eq
	mov	x3, #1
	and	x1, x1, x3
	str	x1, [x2]
L24:
	cmp	w1, #0
	bne	L26
	mov	x1, x0
	mov	x0, #8
	add	x0, x1, x0
	ldr	x0, [x0]
	mov	x2, #16
	add	x1, x1, x2
	ldr	x19, [x1]
	adrp	x1, _str61@page
	add	x1, x1, _str61@pageoff
	bl	___rt_str_concat
	mov	x17, x0
	mov	x0, x19
	mov	x19, x17
	bl	_donna_shell_join_args
	mov	x1, x0
	mov	x0, x19
	bl	___rt_str_concat
	b	L28
L26:
	mov	x1, #8
	add	x0, x0, x1
	ldr	x0, [x0]
	b	L28
L27:
	adrp	x0, _str36@page
	add	x0, x0, _str36@pageoff
L28:
	ldr	x19, [x29, 24]
	mov sp, x29
	ldp	x29, x30, [sp], 32
	ret
/* end function donna_shell_join_args */

.text
.balign 4
___rt_str_concat:
	hint	#34
	stp	x29, x30, [sp, -48]!
	mov	x29, sp
	str	x19, [x29, 40]
	str	x20, [x29, 32]
	str	x21, [x29, 24]
	mov	x20, x1
	mov	x21, x0
	mov	x0, x21
	bl	_strlen
	mov	x19, x0
	mov	x0, x20
	bl	_strlen
	mov	x1, x21
	add	x0, x19, x0
	mov	x19, x1
	mov	x1, #1
	add	x0, x0, x1
	bl	_malloc
	mov	x1, x19
	mov	x19, x0
	bl	_strcpy
	mov	x1, x20
	mov	x0, x19
	mov	x19, x0
	bl	_strcat
	mov	x0, x19
	ldr	x19, [x29, 40]
	ldr	x20, [x29, 32]
	ldr	x21, [x29, 24]
	ldp	x29, x30, [sp], 48
	ret
/* end function __rt_str_concat */

