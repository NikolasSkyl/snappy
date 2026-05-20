.data
.balign 8
_str0:
	.byte 10
	.byte 0
/* end data */

.data
.balign 8
_str2:
	.byte 10
	.byte 0
/* end data */

.text
.balign 4
.globl _donna_io_print
_donna_io_print:
	hint	#34
	stp	x29, x30, [sp, -16]!
	mov	x29, sp
	bl	_donna_ffi_io_print
	mov	w0, #0
	ldp	x29, x30, [sp], 16
	ret
/* end function donna_io_print */

.text
.balign 4
.globl _donna_io_println
_donna_io_println:
	hint	#34
	stp	x29, x30, [sp, -16]!
	mov	x29, sp
	adrp	x1, _str0@page
	add	x1, x1, _str0@pageoff
	bl	___rt_str_concat
	bl	_donna_ffi_io_print
	mov	w0, #0
	ldp	x29, x30, [sp], 16
	ret
/* end function donna_io_println */

.text
.balign 4
.globl _donna_io_eprint
_donna_io_eprint:
	hint	#34
	stp	x29, x30, [sp, -16]!
	mov	x29, sp
	bl	_donna_ffi_io_eprint
	mov	w0, #0
	ldp	x29, x30, [sp], 16
	ret
/* end function donna_io_eprint */

.text
.balign 4
.globl _donna_io_eprintln
_donna_io_eprintln:
	hint	#34
	stp	x29, x30, [sp, -16]!
	mov	x29, sp
	adrp	x1, _str2@page
	add	x1, x1, _str2@pageoff
	bl	___rt_str_concat
	bl	_donna_ffi_io_eprint
	mov	w0, #0
	ldp	x29, x30, [sp], 16
	ret
/* end function donna_io_eprintln */

.text
.balign 4
.globl _donna_io_flush_stdout
_donna_io_flush_stdout:
	hint	#34
	stp	x29, x30, [sp, -16]!
	mov	x29, sp
	bl	_donna_rt_flush
	mov	w0, #0
	ldp	x29, x30, [sp], 16
	ret
/* end function donna_io_flush_stdout */

.text
.balign 4
.globl _donna_io_flush_stderr
_donna_io_flush_stderr:
	hint	#34
	stp	x29, x30, [sp, -16]!
	mov	x29, sp
	bl	_donna_ffi_io_flush_stderr
	mov	w0, #0
	ldp	x29, x30, [sp], 16
	ret
/* end function donna_io_flush_stderr */

.text
.balign 4
.globl _donna_io_read_line
_donna_io_read_line:
	hint	#34
	stp	x29, x30, [sp, -16]!
	mov	x29, sp
	bl	_donna_ffi_io_read_line
	ldp	x29, x30, [sp], 16
	ret
/* end function donna_io_read_line */

.text
.balign 4
.globl _donna_io_read_all_stdin
_donna_io_read_all_stdin:
	hint	#34
	stp	x29, x30, [sp, -16]!
	mov	x29, sp
	bl	_donna_ffi_io_read_all_stdin
	ldp	x29, x30, [sp], 16
	ret
/* end function donna_io_read_all_stdin */

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

