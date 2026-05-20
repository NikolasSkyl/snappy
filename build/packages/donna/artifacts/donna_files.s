.data
.balign 8
_donna_nil:
	.quad 0
/* end data */

.text
.balign 4
.globl _donna_files_read
_donna_files_read:
	hint	#34
	stp	x29, x30, [sp, -16]!
	mov	x29, sp
	bl	_donna_ffi_file_read
	ldp	x29, x30, [sp], 16
	ret
/* end function donna_files_read */

.text
.balign 4
.globl _donna_files_write
_donna_files_write:
	hint	#34
	stp	x29, x30, [sp, -16]!
	mov	x29, sp
	bl	_donna_ffi_file_write
	ldp	x29, x30, [sp], 16
	ret
/* end function donna_files_write */

.text
.balign 4
.globl _donna_files_append
_donna_files_append:
	hint	#34
	stp	x29, x30, [sp, -16]!
	mov	x29, sp
	bl	_donna_ffi_file_append
	ldp	x29, x30, [sp], 16
	ret
/* end function donna_files_append */

.text
.balign 4
.globl _donna_files_exists
_donna_files_exists:
	hint	#34
	stp	x29, x30, [sp, -16]!
	mov	x29, sp
	bl	_donna_ffi_file_exists
	cmp	x0, #1
	cset	x0, eq
	ldp	x29, x30, [sp], 16
	ret
/* end function donna_files_exists */

.text
.balign 4
.globl _donna_files_is_file
_donna_files_is_file:
	hint	#34
	stp	x29, x30, [sp, -16]!
	mov	x29, sp
	bl	_donna_ffi_file_is_file
	cmp	x0, #1
	cset	x0, eq
	ldp	x29, x30, [sp], 16
	ret
/* end function donna_files_is_file */

.text
.balign 4
.globl _donna_files_is_dir
_donna_files_is_dir:
	hint	#34
	stp	x29, x30, [sp, -16]!
	mov	x29, sp
	bl	_donna_ffi_file_is_dir
	cmp	x0, #1
	cset	x0, eq
	ldp	x29, x30, [sp], 16
	ret
/* end function donna_files_is_dir */

.text
.balign 4
.globl _donna_files_mkdir
_donna_files_mkdir:
	hint	#34
	stp	x29, x30, [sp, -16]!
	mov	x29, sp
	bl	_donna_ffi_file_mkdir
	ldp	x29, x30, [sp], 16
	ret
/* end function donna_files_mkdir */

.text
.balign 4
.globl _donna_files_mkdir_all
_donna_files_mkdir_all:
	hint	#34
	stp	x29, x30, [sp, -16]!
	mov	x29, sp
	bl	_donna_ffi_file_mkdir_all
	ldp	x29, x30, [sp], 16
	ret
/* end function donna_files_mkdir_all */

.text
.balign 4
.globl _donna_files_delete
_donna_files_delete:
	hint	#34
	stp	x29, x30, [sp, -16]!
	mov	x29, sp
	bl	_donna_ffi_file_delete
	ldp	x29, x30, [sp], 16
	ret
/* end function donna_files_delete */

.text
.balign 4
.globl _donna_files_remove_dir
_donna_files_remove_dir:
	hint	#34
	stp	x29, x30, [sp, -16]!
	mov	x29, sp
	bl	_donna_ffi_file_delete
	ldp	x29, x30, [sp], 16
	ret
/* end function donna_files_remove_dir */

.text
.balign 4
.globl _donna_files_remove_all
_donna_files_remove_all:
	hint	#34
	stp	x29, x30, [sp, -16]!
	mov	x29, sp
	bl	_donna_ffi_file_remove_all
	ldp	x29, x30, [sp], 16
	ret
/* end function donna_files_remove_all */

.text
.balign 4
.globl _donna_files_copy
_donna_files_copy:
	hint	#34
	stp	x29, x30, [sp, -16]!
	mov	x29, sp
	bl	_donna_ffi_file_copy
	ldp	x29, x30, [sp], 16
	ret
/* end function donna_files_copy */

.text
.balign 4
.globl _donna_files_rename
_donna_files_rename:
	hint	#34
	stp	x29, x30, [sp, -16]!
	mov	x29, sp
	bl	_donna_ffi_file_rename
	ldp	x29, x30, [sp], 16
	ret
/* end function donna_files_rename */

.text
.balign 4
.globl _donna_files_list_dir
_donna_files_list_dir:
	hint	#34
	stp	x29, x30, [sp, -32]!
	mov	x29, sp
	str	x19, [x29, 24]
	bl	_donna_ffi_file_list_dir
	mov	x19, x0
	bl	_strlen
	mov	x1, x0
	mov	x0, x19
	cmp	x1, #0
	cset	x1, eq
	cmp	x1, #1
	beq	L28
	adrp	x3, _donna_nil@page
	add	x3, x3, _donna_nil@pageoff
	mov	x2, #0
	mov	x1, #0
	bl	_donna_files_split_lines
	b	L29
L28:
	adrp	x0, _donna_nil@page
	add	x0, x0, _donna_nil@pageoff
L29:
	ldr	x19, [x29, 24]
	ldp	x29, x30, [sp], 32
	ret
/* end function donna_files_list_dir */

.text
.balign 4
.globl _donna_files_read_lines
_donna_files_read_lines:
	hint	#34
	stp	x29, x30, [sp, -32]!
	mov	x29, sp
	str	x19, [x29, 24]
	bl	_donna_files_read
	mov	x19, x0
	bl	_strlen
	mov	x1, x0
	mov	x0, x19
	cmp	x1, #0
	cset	x1, eq
	cmp	x1, #1
	beq	L32
	adrp	x3, _donna_nil@page
	add	x3, x3, _donna_nil@pageoff
	mov	x2, #0
	mov	x1, #0
	bl	_donna_files_split_lines
	b	L33
L32:
	adrp	x0, _donna_nil@page
	add	x0, x0, _donna_nil@pageoff
L33:
	ldr	x19, [x29, 24]
	ldp	x29, x30, [sp], 32
	ret
/* end function donna_files_read_lines */

.text
.balign 4
_donna_files_split_lines:
	hint	#34
	stp	x29, x30, [sp, -64]!
	mov	x29, sp
	str	x19, [x29, 56]
	str	x20, [x29, 48]
	str	x21, [x29, 40]
	str	x22, [x29, 32]
	str	x23, [x29, 24]
	mov	x21, x3
	mov	x22, x2
	mov	x19, x1
	mov	x20, x0
	bl	_strlen
	mov	x2, x22
	mov	x1, x0
	mov	x0, x20
	cmp	x2, x1
	cset	x3, eq
	sub	x1, x2, x19
	mov	x22, x2
	add	x2, x0, x19
	cmp	x3, #1
	beq	L39
	add	x3, x0, x22
	ldrb	w3, [x3]
	cmp	x3, #10
	cset	x3, eq
	mov	x4, #16
	mov	x20, x19
	sub	sp, sp, x4
	mov	x19, sp
	mov	x4, #1
	add	x23, x22, x4
	cmp	x3, #1
	beq	L37
	mov	x3, x21
	mov	x2, x23
	mov	x1, x20
	mov	x21, x0
	bl	_donna_files_split_lines
	str	x0, [x19]
	b	L44
L37:
	mov	x20, x21
	mov	x21, x0
	mov	x0, x2
	bl	_strndup
	mov	x17, x0
	mov	x0, x21
	mov	x21, x17
	mov	x22, x0
	mov	x0, #24
	bl	_malloc
	mov	x1, x23
	mov	x3, x0
	mov	x0, x22
	mov	x2, #1
	str	x2, [x3]
	mov	x2, #8
	add	x2, x3, x2
	str	x21, [x2]
	mov	x2, #16
	add	x2, x3, x2
	str	x20, [x2]
	mov	x2, x1
	bl	_donna_files_split_lines
	str	x0, [x19]
	b	L44
L39:
	mov	x0, x2
	mov	x20, x21
	mov	x2, x22
	cmp	x19, x2
	cset	x2, eq
	mov	x3, #16
	sub	sp, sp, x3
	mov	x19, sp
	cmp	x2, #1
	beq	L42
	bl	_strndup
	mov	x21, x0
	mov	x0, x20
	mov	x20, x0
	mov	x0, #24
	bl	_malloc
	mov	x1, #1
	str	x1, [x0]
	mov	x1, #8
	add	x1, x0, x1
	str	x21, [x1]
	mov	x1, #16
	add	x1, x0, x1
	str	x20, [x1]
	bl	_donna_files_reverse
	str	x0, [x19]
	b	L44
L42:
	mov	x0, x20
	bl	_donna_files_reverse
	str	x0, [x19]
L44:
	ldr	x19, [x29, 56]
	ldr	x20, [x29, 48]
	ldr	x21, [x29, 40]
	ldr	x22, [x29, 32]
	ldr	x23, [x29, 24]
	mov sp, x29
	ldp	x29, x30, [sp], 64
	ret
/* end function donna_files_split_lines */

.text
.balign 4
_donna_files_reverse:
	hint	#34
	stp	x29, x30, [sp, -16]!
	mov	x29, sp
	adrp	x1, _donna_nil@page
	add	x1, x1, _donna_nil@pageoff
	bl	_donna_files_reverse_acc
	ldp	x29, x30, [sp], 16
	ret
/* end function donna_files_reverse */

.text
.balign 4
_donna_files_reverse_acc:
	hint	#34
	stp	x29, x30, [sp, -48]!
	mov	x29, sp
	str	x19, [x29, 40]
	str	x20, [x29, 32]
	str	x21, [x29, 24]
	mov	x19, x1
	ldr	x1, [x0]
	cmp	x1, #0
	beq	L49
	mov	x1, #8
	add	x1, x0, x1
	ldr	x20, [x1]
	mov	x1, #16
	add	x0, x0, x1
	ldr	x0, [x0]
	mov	x21, x0
	mov	x0, #24
	bl	_malloc
	mov	x1, x0
	mov	x0, x21
	mov	x2, #1
	str	x2, [x1]
	mov	x2, #8
	add	x2, x1, x2
	str	x20, [x2]
	mov	x2, #16
	add	x2, x1, x2
	str	x19, [x2]
	bl	_donna_files_reverse_acc
	b	L50
L49:
	mov	x0, x19
L50:
	ldr	x19, [x29, 40]
	ldr	x20, [x29, 32]
	ldr	x21, [x29, 24]
	ldp	x29, x30, [sp], 48
	ret
/* end function donna_files_reverse_acc */

