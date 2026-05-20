.data
.balign 8
_str34:
	.ascii ""
	.byte 0
/* end data */

.data
.balign 8
_str70:
	.ascii ""
	.byte 0
/* end data */

.data
.balign 8
_str106:
	.ascii "."
	.byte 0
/* end data */

.data
.balign 8
_str127:
	.ascii ""
	.byte 0
/* end data */

.data
.balign 8
_str156:
	.ascii "."
	.byte 0
/* end data */

.data
.balign 8
_str172:
	.ascii ""
	.byte 0
/* end data */

.data
.balign 8
_str173:
	.ascii "."
	.byte 0
/* end data */

.data
.balign 8
_str180:
	.ascii "."
	.byte 0
/* end data */

.data
.balign 8
_donna_nil:
	.quad 0
/* end data */

.data
.balign 8
_str271:
	.ascii "."
	.byte 0
/* end data */

.data
.balign 8
_str293:
	.ascii "."
	.byte 0
/* end data */

.data
.balign 8
_str301:
	.ascii ".."
	.byte 0
/* end data */

.data
.balign 8
_str314:
	.ascii ".."
	.byte 0
/* end data */

.data
.balign 8
_str329:
	.ascii ".."
	.byte 0
/* end data */

.data
.balign 8
_str340:
	.ascii ".."
	.byte 0
/* end data */

.data
.balign 8
_str365:
	.ascii ""
	.byte 0
/* end data */

.data
.balign 8
_str380:
	.ascii ""
	.byte 0
/* end data */

.data
.balign 8
_str410:
	.ascii ""
	.byte 0
/* end data */

.data
.balign 8
_str422:
	.ascii ""
	.byte 0
/* end data */

.text
.balign 4
.globl _donna_path_separator
_donna_path_separator:
	hint	#34
	stp	x29, x30, [sp, -16]!
	mov	x29, sp
	bl	_donna_ffi_path_separator
	ldp	x29, x30, [sp], 16
	ret
/* end function donna_path_separator */

.text
.balign 4
.globl _donna_path_join
_donna_path_join:
	hint	#34
	stp	x29, x30, [sp, -48]!
	mov	x29, sp
	str	x19, [x29, 40]
	str	x20, [x29, 32]
	str	x21, [x29, 24]
	str	x22, [x29, 16]
	mov	x22, x0
	mov	x0, x1
	mov	x19, x0
	mov	x0, x22
	bl	_donna_string_is_empty
	mov	x1, x0
	mov	x0, x19
	cmp	x1, #1
	beq	L11
	mov	x19, x0
	bl	_donna_string_is_empty
	mov	x1, x0
	mov	x0, x19
	mov	x2, #16
	sub	sp, sp, x2
	mov	x19, sp
	cmp	x1, #1
	beq	L9
	mov	x21, x0
	mov	x0, x22
	bl	_donna_path_ends_with_separator
	mov	x1, #16
	sub	sp, sp, x1
	mov	x20, sp
	cmp	x0, #1
	beq	L6
	bl	_donna_path_separator
	mov	x1, x0
	mov	x0, x22
	bl	___rt_str_concat
	mov	x17, x0
	mov	x0, x21
	mov	x21, x17
	bl	_donna_path_trim_leading_separators
	mov	x1, x0
	mov	x0, x21
	bl	___rt_str_concat
	str	x0, [x20]
	b	L8
L6:
	mov	x0, x21
	mov	x21, x22
	bl	_donna_path_trim_leading_separators
	mov	x1, x0
	mov	x0, x21
	bl	___rt_str_concat
	str	x0, [x20]
L8:
	str	x0, [x19]
	b	L11
L9:
	mov	x0, x22
	str	x0, [x19]
L11:
	ldr	x19, [x29, 40]
	ldr	x20, [x29, 32]
	ldr	x21, [x29, 24]
	ldr	x22, [x29, 16]
	mov sp, x29
	ldp	x29, x30, [sp], 48
	ret
/* end function donna_path_join */

.text
.balign 4
.globl _donna_path_join_all
_donna_path_join_all:
	hint	#34
	stp	x29, x30, [sp, -32]!
	mov	x29, sp
	str	x19, [x29, 24]
	ldr	x1, [x0]
	cmp	x1, #0
	beq	L20
	mov	x2, #16
	sub	sp, sp, x2
	mov	x2, sp
	cmp	x1, #1
	beq	L16
	mov	x1, #0
	str	x1, [x2]
	mov	x1, #0
	b	L17
L16:
	mov	x1, #16
	add	x1, x0, x1
	ldr	x1, [x1]
	ldr	x1, [x1]
	cmp	x1, #0
	cset	x1, eq
	mov	x3, #1
	and	x1, x1, x3
	str	x1, [x2]
L17:
	cmp	w1, #0
	bne	L19
	mov	x1, #8
	add	x1, x0, x1
	ldr	x19, [x1]
	mov	x1, #16
	add	x0, x0, x1
	ldr	x0, [x0]
	bl	_donna_path_join_all
	mov	x1, x0
	mov	x0, x19
	bl	_donna_path_join
	b	L21
L19:
	mov	x1, #8
	add	x0, x0, x1
	ldr	x0, [x0]
	b	L21
L20:
	adrp	x0, _str34@page
	add	x0, x0, _str34@pageoff
L21:
	ldr	x19, [x29, 24]
	mov sp, x29
	ldp	x29, x30, [sp], 32
	ret
/* end function donna_path_join_all */

.text
.balign 4
.globl _donna_path_basename
_donna_path_basename:
	hint	#34
	stp	x29, x30, [sp, -16]!
	mov	x29, sp
	bl	_donna_path_trim_trailing_separators
	bl	_donna_path_trim_trailing_then_basename
	ldp	x29, x30, [sp], 16
	ret
/* end function donna_path_basename */

.text
.balign 4
_donna_path_trim_trailing_then_basename:
	hint	#34
	stp	x29, x30, [sp, -32]!
	mov	x29, sp
	str	x19, [x29, 24]
	mov	x19, x0
	bl	_donna_string_is_empty
	mov	x1, x0
	mov	x0, x19
	cmp	x1, #1
	beq	L26
	mov	x2, #0
	mov	x1, #0
	bl	_donna_path_last_segment
	b	L27
L26:
	adrp	x0, _str70@page
	add	x0, x0, _str70@pageoff
L27:
	ldr	x19, [x29, 24]
	ldp	x29, x30, [sp], 32
	ret
/* end function donna_path_trim_trailing_then_basename */

.text
.balign 4
_donna_path_last_segment:
	hint	#34
	stp	x29, x30, [sp, -48]!
	mov	x29, sp
	str	x19, [x29, 40]
	str	x20, [x29, 32]
	str	x21, [x29, 24]
	mov	x20, x2
	mov	x21, x1
	mov	x19, x0
	bl	_donna_string_length
	mov	x1, x21
	mov	x2, x0
	mov	x0, x19
	cmp	x20, x2
	cset	x3, eq
	cmp	x3, #1
	beq	L33
	mov	x21, x1
	mov	x1, x20
	mov	x19, x0
	bl	_donna_path_is_separator_at
	mov	x1, x21
	mov	x2, x0
	mov	x0, x19
	mov	x3, #16
	sub	sp, sp, x3
	mov	x19, sp
	mov	x3, #1
	add	x3, x20, x3
	cmp	x2, #1
	beq	L31
	mov	x2, x3
	bl	_donna_path_last_segment
	str	x0, [x19]
	b	L34
L31:
	mov	x1, x3
	mov	x2, x1
	bl	_donna_path_last_segment
	str	x0, [x19]
	b	L34
L33:
	sub	x2, x2, x1
	bl	_donna_string_slice
L34:
	ldr	x19, [x29, 40]
	ldr	x20, [x29, 32]
	ldr	x21, [x29, 24]
	mov sp, x29
	ldp	x29, x30, [sp], 48
	ret
/* end function donna_path_last_segment */

.text
.balign 4
.globl _donna_path_dirname
_donna_path_dirname:
	hint	#34
	stp	x29, x30, [sp, -32]!
	mov	x29, sp
	str	x19, [x29, 24]
	bl	_donna_path_trim_trailing_separators
	mov	x19, x0
	bl	_donna_string_length
	mov	x1, x0
	mov	x0, x19
	mov	x2, #1
	sub	x1, x1, x2
	mov	x19, x0
	bl	_donna_path_find_last_separator
	mov	x2, x0
	mov	x0, x19
	cmn	x2, #1
	cset	x1, eq
	cmp	x1, #1
	beq	L39
	cmp	x2, #0
	cset	x1, eq
	mov	x3, #16
	sub	sp, sp, x3
	mov	x19, sp
	cmp	x1, #1
	beq	L38
	mov	x1, #0
	bl	_donna_string_slice
	str	x0, [x19]
	b	L40
L38:
	mov	x2, #1
	mov	x1, #0
	bl	_donna_string_slice
	str	x0, [x19]
	b	L40
L39:
	adrp	x0, _str106@page
	add	x0, x0, _str106@pageoff
L40:
	ldr	x19, [x29, 24]
	mov sp, x29
	ldp	x29, x30, [sp], 32
	ret
/* end function donna_path_dirname */

.text
.balign 4
.globl _donna_path_extension
_donna_path_extension:
	hint	#34
	stp	x29, x30, [sp, -32]!
	mov	x29, sp
	str	x19, [x29, 24]
	str	x20, [x29, 16]
	bl	_donna_path_basename
	mov	x19, x0
	bl	_donna_string_length
	mov	x1, x0
	mov	x0, x19
	mov	x2, #1
	sub	x1, x1, x2
	mov	x19, x0
	bl	_donna_path_find_last_dot
	mov	x1, x0
	mov	x0, x19
	cmp	x1, #0
	mov	x20, x1
	cset	x1, le
	cmp	x1, #1
	beq	L43
	mov	x19, x0
	bl	_donna_string_length
	mov	x1, x20
	mov	x2, x0
	mov	x0, x19
	sub	x2, x2, x1
	bl	_donna_string_slice
	b	L44
L43:
	adrp	x0, _str127@page
	add	x0, x0, _str127@pageoff
L44:
	ldr	x19, [x29, 24]
	ldr	x20, [x29, 16]
	ldp	x29, x30, [sp], 32
	ret
/* end function donna_path_extension */

.text
.balign 4
.globl _donna_path_stem
_donna_path_stem:
	hint	#34
	stp	x29, x30, [sp, -32]!
	mov	x29, sp
	str	x19, [x29, 24]
	bl	_donna_path_basename
	mov	x19, x0
	bl	_donna_string_length
	mov	x1, x0
	mov	x0, x19
	mov	x2, #1
	sub	x1, x1, x2
	mov	x19, x0
	bl	_donna_path_find_last_dot
	mov	x2, x0
	mov	x0, x19
	cmp	x2, #0
	cset	x1, le
	cmp	x1, #1
	beq	L47
	mov	x1, #0
	bl	_donna_string_slice
L47:
	ldr	x19, [x29, 24]
	ldp	x29, x30, [sp], 32
	ret
/* end function donna_path_stem */

.text
.balign 4
.globl _donna_path_drop_extension
_donna_path_drop_extension:
	hint	#34
	stp	x29, x30, [sp, -48]!
	mov	x29, sp
	str	x19, [x29, 40]
	str	x20, [x29, 32]
	str	x21, [x29, 24]
	mov	x19, x0
	bl	_donna_path_basename
	mov	x20, x0
	mov	x0, x19
	mov	x19, x0
	bl	_donna_path_dirname
	mov	x17, x0
	mov	x0, x19
	mov	x19, x17
	mov	x21, x0
	mov	x0, x20
	bl	_donna_string_length
	mov	x1, x0
	mov	x0, x21
	mov	x2, #1
	sub	x1, x1, x2
	mov	x21, x0
	mov	x0, x20
	bl	_donna_path_find_last_dot
	mov	x2, x0
	mov	x0, x21
	cmp	x2, #0
	cset	x1, le
	cmp	x1, #1
	beq	L54
	mov	x0, x20
	mov	x1, #0
	bl	_donna_string_slice
	mov	x20, x0
	mov	x0, x19
	adrp	x1, _str156@page
	add	x1, x1, _str156@pageoff
	mov	x19, x0
	bl	_donna_string_equal
	mov	x1, x0
	mov	x0, x19
	mov	x2, #16
	sub	sp, sp, x2
	mov	x19, sp
	cmp	x1, #1
	beq	L52
	mov	x1, x20
	bl	_donna_path_join
	str	x0, [x19]
	b	L54
L52:
	mov	x0, x20
	str	x0, [x19]
L54:
	ldr	x19, [x29, 40]
	ldr	x20, [x29, 32]
	ldr	x21, [x29, 24]
	mov sp, x29
	ldp	x29, x30, [sp], 48
	ret
/* end function donna_path_drop_extension */

.text
.balign 4
.globl _donna_path_with_extension
_donna_path_with_extension:
	hint	#34
	stp	x29, x30, [sp, -32]!
	mov	x29, sp
	str	x19, [x29, 24]
	str	x20, [x29, 16]
	mov	x20, x1
	mov	x19, x0
	mov	x0, x20
	bl	_donna_string_is_empty
	mov	x1, x20
	mov	x2, x0
	mov	x0, x19
	cmp	x2, #1
	beq	L59
	mov	x20, x1
	adrp	x1, _str173@page
	add	x1, x1, _str173@pageoff
	mov	x19, x0
	mov	x0, x20
	bl	_donna_string_starts_with
	mov	x1, x20
	mov	x2, x0
	mov	x0, x19
	mov	x3, #16
	sub	sp, sp, x3
	mov	x19, sp
	cmp	x2, #1
	beq	L58
	mov	x20, x0
	adrp	x0, _str180@page
	add	x0, x0, _str180@pageoff
	bl	___rt_str_concat
	mov	x1, x0
	mov	x0, x20
	str	x1, [x19]
	b	L60
L58:
	str	x1, [x19]
	b	L60
L59:
	adrp	x1, _str172@page
	add	x1, x1, _str172@pageoff
L60:
	mov	x19, x1
	bl	_donna_path_drop_extension
	mov	x1, x19
	bl	___rt_str_concat
	ldr	x19, [x29, 24]
	ldr	x20, [x29, 16]
	mov sp, x29
	ldp	x29, x30, [sp], 32
	ret
/* end function donna_path_with_extension */

.text
.balign 4
.globl _donna_path_is_absolute
_donna_path_is_absolute:
	hint	#34
	stp	x29, x30, [sp, -32]!
	mov	x29, sp
	str	x19, [x29, 24]
	mov	x19, x0
	bl	_donna_string_length
	mov	x1, x0
	mov	x0, x19
	cmp	x1, #0
	cset	x1, eq
	cmp	x1, #1
	beq	L67
	mov	x1, #0
	mov	x19, x0
	bl	_donna_path_is_separator_at
	mov	x1, x0
	mov	x0, x19
	mov	x2, #16
	sub	sp, sp, x2
	mov	x19, sp
	cmp	x1, #1
	beq	L65
	bl	_donna_path_has_windows_drive_prefix
	str	x0, [x19]
	b	L68
L65:
	mov	x0, #1
	str	x0, [x19]
	mov	x0, #1
	b	L68
L67:
	mov	x0, #0
L68:
	ldr	x19, [x29, 24]
	mov sp, x29
	ldp	x29, x30, [sp], 32
	ret
/* end function donna_path_is_absolute */

.text
.balign 4
.globl _donna_path_is_relative
_donna_path_is_relative:
	hint	#34
	stp	x29, x30, [sp, -16]!
	mov	x29, sp
	bl	_donna_path_is_absolute
	mov	x1, #1
	eor	x0, x0, x1
	ldp	x29, x30, [sp], 16
	ret
/* end function donna_path_is_relative */

.text
.balign 4
.globl _donna_path_split
_donna_path_split:
	hint	#34
	stp	x29, x30, [sp, -16]!
	mov	x29, sp
	adrp	x3, _donna_nil@page
	add	x3, x3, _donna_nil@pageoff
	mov	x2, #0
	mov	x1, #0
	bl	_donna_path_split_loop
	ldp	x29, x30, [sp], 16
	ret
/* end function donna_path_split */

.text
.balign 4
_donna_path_split_loop:
	hint	#34
	stp	x29, x30, [sp, -64]!
	mov	x29, sp
	str	x19, [x29, 56]
	str	x20, [x29, 48]
	str	x21, [x29, 40]
	str	x22, [x29, 32]
	str	x23, [x29, 24]
	str	x24, [x29, 16]
	mov	x21, x3
	mov	x22, x2
	mov	x20, x1
	mov	x19, x0
	bl	_donna_string_length
	mov	x1, x20
	mov	x2, x0
	mov	x0, x19
	cmp	x22, x2
	cset	x2, ge
	cmp	x1, x22
	mov	x23, x22
	cset	x22, eq
	cmp	x22, #1
	sub	x24, x23, x1
	cmp	x2, #1
	beq	L81
	mov	x20, x1
	mov	x1, x23
	mov	x19, x0
	bl	_donna_path_is_separator_at
	mov	x2, x24
	mov	x1, x20
	mov	x3, x0
	mov	x0, x19
	mov	x4, #16
	sub	sp, sp, x4
	mov	x19, sp
	mov	x4, #1
	add	x24, x23, x4
	cmp	x3, #1
	beq	L76
	mov	x3, x21
	mov	x2, x24
	bl	_donna_path_split_loop
	str	x0, [x19]
	b	L86
L76:
	mov	x3, #16
	sub	sp, sp, x3
	mov	x20, sp
	cmp	x1, x23
	cmp	x22, #1
	beq	L78
	mov	x22, x0
	bl	_donna_string_slice
	mov	x17, x0
	mov	x0, x22
	mov	x22, x17
	mov	x23, x0
	mov	x0, #24
	bl	_malloc
	mov	x1, x24
	mov	x3, x0
	mov	x0, x23
	mov	x2, #1
	str	x2, [x3]
	mov	x2, #8
	add	x2, x3, x2
	str	x22, [x2]
	mov	x2, #16
	add	x2, x3, x2
	str	x21, [x2]
	mov	x2, x1
	bl	_donna_path_split_loop
	str	x0, [x20]
	b	L80
L78:
	mov	x1, x24
	mov	x3, x21
	mov	x2, x1
	bl	_donna_path_split_loop
	str	x0, [x20]
L80:
	str	x0, [x19]
	b	L86
L81:
	mov	x2, x24
	mov	x20, x21
	mov	x21, x22
	mov	x22, x23
	mov	x3, #16
	sub	sp, sp, x3
	mov	x19, sp
	cmp	x1, x22
	cmp	x21, #1
	beq	L84
	bl	_donna_string_slice
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
	bl	_donna_list_reverse
	str	x0, [x19]
	b	L86
L84:
	mov	x0, x20
	bl	_donna_list_reverse
	str	x0, [x19]
L86:
	ldr	x19, [x29, 56]
	ldr	x20, [x29, 48]
	ldr	x21, [x29, 40]
	ldr	x22, [x29, 32]
	ldr	x23, [x29, 24]
	ldr	x24, [x29, 16]
	mov sp, x29
	ldp	x29, x30, [sp], 64
	ret
/* end function donna_path_split_loop */

.text
.balign 4
.globl _donna_path_normalize
_donna_path_normalize:
	hint	#34
	stp	x29, x30, [sp, -32]!
	mov	x29, sp
	str	x19, [x29, 24]
	str	x20, [x29, 16]
	mov	x19, x0
	bl	_donna_path_absolute_prefix
	mov	x17, x0
	mov	x0, x19
	mov	x19, x17
	mov	x1, x19
	bl	_donna_path_path_without_prefix
	bl	_donna_path_split
	adrp	x1, _donna_nil@page
	add	x1, x1, _donna_nil@pageoff
	bl	_donna_path_normalize_parts
	bl	_donna_path_join_all
	mov	x20, x0
	mov	x0, x19
	mov	x19, x0
	bl	_donna_string_is_empty
	mov	x1, x0
	mov	x0, x19
	cmp	x1, #1
	beq	L91
	mov	x19, x0
	mov	x0, x20
	bl	_donna_string_is_empty
	mov	x1, x0
	mov	x0, x19
	mov	x2, #16
	sub	sp, sp, x2
	mov	x19, sp
	cmp	x1, #1
	beq	L90
	mov	x1, x20
	bl	_donna_path_join
	str	x0, [x19]
	b	L96
L90:
	str	x0, [x19]
	b	L96
L91:
	mov	x0, x20
	mov	x19, x0
	bl	_donna_string_is_empty
	mov	x2, x0
	mov	x0, x19
	mov	x1, #16
	sub	sp, sp, x1
	mov	x1, sp
	cmp	x2, #1
	beq	L94
	str	x0, [x1]
	b	L96
L94:
	adrp	x0, _str271@page
	add	x0, x0, _str271@pageoff
	str	x0, [x1]
	adrp	x0, _str271@page
	add	x0, x0, _str271@pageoff
L96:
	ldr	x19, [x29, 24]
	ldr	x20, [x29, 16]
	mov sp, x29
	ldp	x29, x30, [sp], 32
	ret
/* end function donna_path_normalize */

.text
.balign 4
_donna_path_normalize_parts:
	hint	#34
	stp	x29, x30, [sp, -64]!
	mov	x29, sp
	str	x19, [x29, 56]
	str	x20, [x29, 48]
	str	x21, [x29, 40]
	str	x22, [x29, 32]
	str	x23, [x29, 24]
	str	x24, [x29, 16]
	mov	x22, x1
	ldr	x1, [x0]
	cmp	x1, #0
	beq	L114
	mov	x1, #8
	add	x1, x0, x1
	ldr	x21, [x1]
	mov	x1, #16
	add	x0, x0, x1
	ldr	x0, [x0]
	adrp	x1, _str293@page
	add	x1, x1, _str293@pageoff
	mov	x19, x0
	mov	x0, x21
	bl	_donna_string_equal
	mov	x1, x0
	mov	x0, x19
	mov	x2, #16
	sub	sp, sp, x2
	mov	x19, sp
	cmp	x1, #1
	beq	L112
	adrp	x1, _str301@page
	add	x1, x1, _str301@pageoff
	mov	x20, x0
	mov	x0, x21
	bl	_donna_string_equal
	mov	x1, x0
	mov	x0, x20
	mov	x2, #16
	sub	sp, sp, x2
	mov	x20, sp
	cmp	x1, #1
	beq	L101
	mov	x23, x0
	mov	x0, #24
	bl	_malloc
	mov	x1, x0
	mov	x0, x23
	mov	x2, #1
	str	x2, [x1]
	mov	x2, #8
	add	x2, x1, x2
	str	x21, [x2]
	mov	x2, #16
	add	x2, x1, x2
	str	x22, [x2]
	bl	_donna_path_normalize_parts
	str	x0, [x20]
	b	L111
L101:
	mov	x1, #16
	sub	sp, sp, x1
	mov	x21, sp
	ldr	x1, [x22]
	cmp	x1, #0
	beq	L109
	mov	x2, #16
	sub	sp, sp, x2
	mov	x23, sp
	cmp	x1, #1
	beq	L105
	mov	x1, #0
	str	x1, [x23]
	mov	x1, #0
	b	L106
L105:
	mov	x24, x0
	mov	x0, #8
	add	x0, x22, x0
	ldr	x0, [x0]
	adrp	x1, _str329@page
	add	x1, x1, _str329@pageoff
	bl	_strcmp
	mov	x1, x0
	mov	x0, x24
	cmp	x1, #0
	cset	x1, eq
	mov	x2, #1
	and	x1, x1, x2
	str	x1, [x23]
L106:
	cmp	w1, #0
	bne	L108
	mov	x1, #16
	add	x1, x22, x1
	ldr	x1, [x1]
	bl	_donna_path_normalize_parts
	str	x0, [x21]
	b	L110
L108:
	mov	x23, x0
	mov	x0, #24
	bl	_malloc
	mov	x1, x0
	mov	x0, x23
	mov	x2, #1
	str	x2, [x1]
	mov	x2, #8
	add	x3, x1, x2
	adrp	x2, _str340@page
	add	x2, x2, _str340@pageoff
	str	x2, [x3]
	mov	x2, #16
	add	x2, x1, x2
	str	x22, [x2]
	bl	_donna_path_normalize_parts
	str	x0, [x21]
	b	L110
L109:
	mov	x22, x0
	mov	x0, #24
	bl	_malloc
	mov	x1, x0
	mov	x0, x22
	mov	x2, #1
	str	x2, [x1]
	mov	x2, #8
	add	x3, x1, x2
	adrp	x2, _str314@page
	add	x2, x2, _str314@pageoff
	str	x2, [x3]
	mov	x2, #16
	add	x3, x1, x2
	adrp	x2, _donna_nil@page
	add	x2, x2, _donna_nil@pageoff
	str	x2, [x3]
	bl	_donna_path_normalize_parts
	str	x0, [x21]
L110:
	str	x0, [x20]
L111:
	str	x0, [x19]
	b	L116
L112:
	mov	x20, x22
	mov	x1, x20
	bl	_donna_path_normalize_parts
	str	x0, [x19]
	b	L116
L114:
	mov	x0, x22
	bl	_donna_list_reverse
L116:
	ldr	x19, [x29, 56]
	ldr	x20, [x29, 48]
	ldr	x21, [x29, 40]
	ldr	x22, [x29, 32]
	ldr	x23, [x29, 24]
	ldr	x24, [x29, 16]
	mov sp, x29
	ldp	x29, x30, [sp], 64
	ret
/* end function donna_path_normalize_parts */

.text
.balign 4
_donna_path_absolute_prefix:
	hint	#34
	stp	x29, x30, [sp, -32]!
	mov	x29, sp
	str	x19, [x29, 24]
	str	x20, [x29, 16]
	mov	x19, x0
	bl	_donna_string_length
	mov	x1, x0
	mov	x0, x19
	cmp	x1, #0
	cset	x1, eq
	cmp	x1, #1
	beq	L125
	mov	x1, #0
	mov	x19, x0
	bl	_donna_path_is_separator_at
	mov	x1, x0
	mov	x0, x19
	mov	x2, #16
	sub	sp, sp, x2
	mov	x19, sp
	cmp	x1, #1
	beq	L124
	mov	x20, x0
	bl	_donna_path_has_windows_drive_prefix
	mov	x1, x0
	mov	x0, x20
	mov	x2, #16
	sub	sp, sp, x2
	mov	x20, sp
	cmp	x1, #1
	beq	L122
	adrp	x0, _str380@page
	add	x0, x0, _str380@pageoff
	str	x0, [x20]
	adrp	x0, _str380@page
	add	x0, x0, _str380@pageoff
	b	L123
L122:
	mov	x2, #2
	mov	x1, #0
	bl	_donna_string_slice
	str	x0, [x20]
L123:
	str	x0, [x19]
	b	L126
L124:
	bl	_donna_path_separator
	str	x0, [x19]
	b	L126
L125:
	adrp	x0, _str365@page
	add	x0, x0, _str365@pageoff
L126:
	ldr	x19, [x29, 24]
	ldr	x20, [x29, 16]
	mov sp, x29
	ldp	x29, x30, [sp], 32
	ret
/* end function donna_path_absolute_prefix */

.text
.balign 4
_donna_path_path_without_prefix:
	hint	#34
	stp	x29, x30, [sp, -48]!
	mov	x29, sp
	str	x19, [x29, 40]
	str	x20, [x29, 32]
	str	x21, [x29, 24]
	mov	x19, x0
	mov	x0, x1
	mov	x20, x0
	bl	_donna_string_is_empty
	cmp	x0, #1
	beq	L135
	bl	_donna_path_separator
	mov	x1, x0
	mov	x0, x20
	bl	_donna_string_equal
	mov	x1, x0
	mov	x0, x19
	mov	x2, #16
	sub	sp, sp, x2
	mov	x19, sp
	cmp	x1, #1
	beq	L134
	mov	x20, x0
	bl	_donna_string_length
	mov	x1, x0
	mov	x0, x20
	cmp	x1, #2
	cset	x1, gt
	mov	x2, #16
	sub	sp, sp, x2
	mov	x20, sp
	cmp	x1, #1
	beq	L132
	adrp	x0, _str410@page
	add	x0, x0, _str410@pageoff
	str	x0, [x20]
	adrp	x0, _str410@page
	add	x0, x0, _str410@pageoff
	b	L133
L132:
	mov	x21, x0
	bl	_donna_string_length
	mov	x1, x0
	mov	x0, x21
	mov	x2, #2
	sub	x2, x1, x2
	mov	x1, #2
	bl	_donna_string_slice
	str	x0, [x20]
L133:
	str	x0, [x19]
	b	L136
L134:
	mov	x20, x0
	bl	_donna_string_length
	mov	x1, x0
	mov	x0, x20
	mov	x2, #1
	sub	x2, x1, x2
	mov	x1, #1
	bl	_donna_string_slice
	str	x0, [x19]
	b	L136
L135:
	mov	x0, x19
L136:
	ldr	x19, [x29, 40]
	ldr	x20, [x29, 32]
	ldr	x21, [x29, 24]
	mov sp, x29
	ldp	x29, x30, [sp], 48
	ret
/* end function donna_path_path_without_prefix */

.text
.balign 4
_donna_path_trim_leading_separators:
	hint	#34
	stp	x29, x30, [sp, -16]!
	mov	x29, sp
	mov	x1, #0
	bl	_donna_path_trim_leading_loop
	ldp	x29, x30, [sp], 16
	ret
/* end function donna_path_trim_leading_separators */

.text
.balign 4
_donna_path_trim_leading_loop:
	hint	#34
	stp	x29, x30, [sp, -48]!
	mov	x29, sp
	str	x19, [x29, 40]
	str	x20, [x29, 32]
	str	x21, [x29, 24]
	mov	x20, x1
	mov	x19, x0
	bl	_donna_string_length
	mov	x1, x20
	mov	x2, x0
	mov	x0, x19
	cmp	x1, x2
	cset	x2, ge
	cmp	x2, #1
	beq	L144
	mov	x21, x1
	mov	x19, x0
	bl	_donna_path_is_separator_at
	mov	x1, x0
	mov	x0, x19
	mov	x2, #16
	sub	sp, sp, x2
	mov	x19, sp
	cmp	x1, #1
	beq	L142
	mov	x20, x0
	bl	_donna_string_length
	mov	x1, x21
	mov	x2, x0
	mov	x0, x20
	sub	x2, x2, x1
	bl	_donna_string_slice
	str	x0, [x19]
	b	L145
L142:
	mov	x1, x21
	mov	x2, #1
	add	x1, x1, x2
	bl	_donna_path_trim_leading_loop
	str	x0, [x19]
	b	L145
L144:
	adrp	x0, _str422@page
	add	x0, x0, _str422@pageoff
L145:
	ldr	x19, [x29, 40]
	ldr	x20, [x29, 32]
	ldr	x21, [x29, 24]
	mov sp, x29
	ldp	x29, x30, [sp], 48
	ret
/* end function donna_path_trim_leading_loop */

.text
.balign 4
_donna_path_trim_trailing_separators:
	hint	#34
	stp	x29, x30, [sp, -32]!
	mov	x29, sp
	str	x19, [x29, 24]
	mov	x19, x0
	bl	_donna_string_length
	mov	x1, x0
	mov	x0, x19
	mov	x2, #1
	sub	x1, x1, x2
	bl	_donna_path_trim_trailing_loop
	ldr	x19, [x29, 24]
	ldp	x29, x30, [sp], 32
	ret
/* end function donna_path_trim_trailing_separators */

.text
.balign 4
_donna_path_trim_trailing_loop:
	hint	#34
	stp	x29, x30, [sp, -32]!
	mov	x29, sp
	str	x19, [x29, 24]
	str	x20, [x29, 16]
	cmp	x1, #0
	cset	x2, le
	cmp	x2, #1
	beq	L152
	mov	x20, x1
	mov	x19, x0
	bl	_donna_path_is_separator_at
	mov	x1, x20
	mov	x2, x0
	mov	x0, x19
	mov	x3, #16
	sub	sp, sp, x3
	mov	x19, sp
	cmp	x2, #1
	beq	L151
	mov	x2, #1
	add	x2, x1, x2
	mov	x1, #0
	bl	_donna_string_slice
	str	x0, [x19]
	b	L152
L151:
	mov	x2, #1
	sub	x1, x1, x2
	bl	_donna_path_trim_trailing_loop
	str	x0, [x19]
L152:
	ldr	x19, [x29, 24]
	ldr	x20, [x29, 16]
	mov sp, x29
	ldp	x29, x30, [sp], 32
	ret
/* end function donna_path_trim_trailing_loop */

.text
.balign 4
_donna_path_ends_with_separator:
	hint	#34
	stp	x29, x30, [sp, -32]!
	mov	x29, sp
	str	x19, [x29, 24]
	mov	x19, x0
	bl	_donna_string_length
	mov	x1, x0
	mov	x0, x19
	cmp	x1, #0
	cset	x1, eq
	cmp	x1, #1
	beq	L155
	mov	x19, x0
	bl	_donna_string_length
	mov	x1, x0
	mov	x0, x19
	mov	x2, #1
	sub	x1, x1, x2
	bl	_donna_path_is_separator_at
	b	L156
L155:
	mov	x0, #0
L156:
	ldr	x19, [x29, 24]
	ldp	x29, x30, [sp], 32
	ret
/* end function donna_path_ends_with_separator */

.text
.balign 4
_donna_path_is_separator_at:
	hint	#34
	stp	x29, x30, [sp, -16]!
	mov	x29, sp
	bl	_donna_string_char_at
	cmp	x0, #47
	cset	x1, eq
	cmp	x1, #1
	beq	L159
	cmp	x0, #92
	cset	x0, eq
	b	L160
L159:
	mov	x0, #1
L160:
	ldp	x29, x30, [sp], 16
	ret
/* end function donna_path_is_separator_at */

.text
.balign 4
_donna_path_find_last_separator:
	hint	#34
	stp	x29, x30, [sp, -32]!
	mov	x29, sp
	str	x19, [x29, 24]
	str	x20, [x29, 16]
	mov	x20, x1
	cmp	x20, #0
	cset	x1, lt
	cmp	x1, #1
	beq	L166
	mov	x1, x20
	mov	x19, x0
	bl	_donna_path_is_separator_at
	mov	x1, x0
	mov	x0, x19
	mov	x2, #16
	sub	sp, sp, x2
	mov	x19, sp
	cmp	x1, #1
	beq	L164
	mov	x1, #1
	sub	x1, x20, x1
	bl	_donna_path_find_last_separator
	str	x0, [x19]
	b	L167
L164:
	mov	x0, x20
	str	x0, [x19]
	b	L167
L166:
	mov	x0, #-1
L167:
	ldr	x19, [x29, 24]
	ldr	x20, [x29, 16]
	mov sp, x29
	ldp	x29, x30, [sp], 32
	ret
/* end function donna_path_find_last_separator */

.text
.balign 4
_donna_path_find_last_dot:
	hint	#34
	stp	x29, x30, [sp, -32]!
	mov	x29, sp
	str	x19, [x29, 24]
	str	x20, [x29, 16]
	mov	x20, x1
	cmp	x20, #0
	cset	x1, lt
	cmp	x1, #1
	beq	L173
	mov	x1, x20
	mov	x19, x0
	bl	_donna_string_char_at
	mov	x1, x0
	mov	x0, x19
	cmp	x1, #46
	cset	x1, eq
	mov	x2, #16
	sub	sp, sp, x2
	mov	x19, sp
	cmp	x1, #1
	beq	L171
	mov	x1, #1
	sub	x1, x20, x1
	bl	_donna_path_find_last_dot
	str	x0, [x19]
	b	L174
L171:
	mov	x0, x20
	str	x0, [x19]
	b	L174
L173:
	mov	x0, #-1
L174:
	ldr	x19, [x29, 24]
	ldr	x20, [x29, 16]
	mov sp, x29
	ldp	x29, x30, [sp], 32
	ret
/* end function donna_path_find_last_dot */

.text
.balign 4
_donna_path_has_windows_drive_prefix:
	hint	#34
	stp	x29, x30, [sp, -32]!
	mov	x29, sp
	str	x19, [x29, 24]
	str	x20, [x29, 16]
	mov	x19, x0
	bl	_donna_string_length
	mov	x1, x0
	mov	x0, x19
	cmp	x1, #3
	cset	x1, lt
	cmp	x1, #1
	beq	L184
	mov	x1, #0
	mov	x19, x0
	bl	_donna_string_char_at
	mov	x20, x0
	mov	x0, x19
	mov	x1, #1
	mov	x19, x0
	bl	_donna_string_char_at
	mov	x1, x0
	mov	x0, x19
	cmp	x1, #58
	cset	x1, eq
	mov	x2, #16
	sub	sp, sp, x2
	mov	x19, sp
	cmp	x1, #0
	beq	L182
	mov	x1, #2
	bl	_donna_path_is_separator_at
	mov	x1, x0
	mov	x0, x20
	mov	x2, #16
	sub	sp, sp, x2
	mov	x20, sp
	cmp	x1, #0
	beq	L179
	bl	_donna_path_is_ascii_alpha
	str	x0, [x20]
	b	L181
L179:
	mov	x0, #0
	str	x0, [x20]
	mov	x0, #0
L181:
	str	x0, [x19]
	b	L185
L182:
	mov	x0, #0
	str	x0, [x19]
	mov	x0, #0
	b	L185
L184:
	mov	x0, #0
L185:
	ldr	x19, [x29, 24]
	ldr	x20, [x29, 16]
	mov sp, x29
	ldp	x29, x30, [sp], 32
	ret
/* end function donna_path_has_windows_drive_prefix */

.text
.balign 4
_donna_path_is_ascii_alpha:
	hint	#34
	stp	x29, x30, [sp, -16]!
	mov	x29, sp
	mov	x1, x0
	cmp	x1, #65
	cset	x0, ge
	cmp	x1, #90
	cset	x2, le
	and	x0, x0, x2
	cmp	x0, #1
	beq	L188
	cmp	x1, #97
	cset	x0, ge
	cmp	x1, #122
	cset	x1, le
	and	x0, x0, x1
	b	L189
L188:
	mov	x0, #1
L189:
	ldp	x29, x30, [sp], 16
	ret
/* end function donna_path_is_ascii_alpha */

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

