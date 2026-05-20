.data
.balign 8
___rt_fmt_ld:
	.ascii "%ld"
	.byte 0
/* end data */

.data
.balign 8
_str40:
	.ascii ""
	.byte 0
/* end data */

.data
.balign 8
_str54:
	.ascii ""
	.byte 0
/* end data */

.data
.balign 8
_donna_nil:
	.quad 0
/* end data */

.data
.balign 8
_str145:
	.ascii ""
	.byte 0
/* end data */

.data
.balign 8
_str170:
	.ascii ""
	.byte 0
/* end data */

.data
.balign 8
_str188:
	.ascii " "
	.byte 0
/* end data */

.data
.balign 8
_str196:
	.byte 9
	.byte 0
/* end data */

.data
.balign 8
_str204:
	.byte 13
	.byte 0
/* end data */

.data
.balign 8
_str212:
	.byte 10
	.byte 0
/* end data */

.data
.balign 8
_str225:
	.ascii ""
	.byte 0
/* end data */

.data
.balign 8
_str310:
	.ascii "-"
	.byte 0
/* end data */

.data
.balign 8
_str352:
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
_str396:
	.ascii "-"
	.byte 0
/* end data */

.data
.balign 8
_str404:
	.ascii ""
	.byte 0
/* end data */

.text
.balign 4
.globl _donna_string_length
_donna_string_length:
	hint	#34
	stp	x29, x30, [sp, -16]!
	mov	x29, sp
	bl	_strlen
	ldp	x29, x30, [sp], 16
	ret
/* end function donna_string_length */

.text
.balign 4
.globl _donna_string_concat
_donna_string_concat:
	hint	#34
	stp	x29, x30, [sp, -16]!
	mov	x29, sp
	bl	___rt_str_concat
	ldp	x29, x30, [sp], 16
	ret
/* end function donna_string_concat */

.text
.balign 4
.globl _donna_string_equal
_donna_string_equal:
	hint	#34
	stp	x29, x30, [sp, -16]!
	mov	x29, sp
	bl	_strcmp
	cmp	x0, #0
	cset	x0, eq
	ldp	x29, x30, [sp], 16
	ret
/* end function donna_string_equal */

.text
.balign 4
.globl _donna_string_is_empty
_donna_string_is_empty:
	hint	#34
	stp	x29, x30, [sp, -16]!
	mov	x29, sp
	bl	_strlen
	cmp	x0, #0
	cset	x0, eq
	ldp	x29, x30, [sp], 16
	ret
/* end function donna_string_is_empty */

.text
.balign 4
.globl _donna_string_char_at
_donna_string_char_at:
	hint	#34
	stp	x29, x30, [sp, -16]!
	mov	x29, sp
	add	x0, x0, x1
	ldrb	w0, [x0]
	ldp	x29, x30, [sp], 16
	ret
/* end function donna_string_char_at */

.text
.balign 4
.globl _donna_string_char_str
_donna_string_char_str:
	hint	#34
	stp	x29, x30, [sp, -16]!
	mov	x29, sp
	add	x0, x0, x1
	mov	x1, #1
	bl	_strndup
	ldp	x29, x30, [sp], 16
	ret
/* end function donna_string_char_str */

.text
.balign 4
.globl _donna_string_slice
_donna_string_slice:
	hint	#34
	stp	x29, x30, [sp, -16]!
	mov	x29, sp
	mov	x17, x1
	mov	x1, x0
	mov	x0, x17
	mov	x17, x2
	mov	x2, x1
	mov	x1, x17
	add	x0, x2, x0
	bl	_strndup
	ldp	x29, x30, [sp], 16
	ret
/* end function donna_string_slice */

.text
.balign 4
.globl _donna_string_starts_with
_donna_string_starts_with:
	hint	#34
	stp	x29, x30, [sp, -48]!
	mov	x29, sp
	str	x19, [x29, 40]
	str	x20, [x29, 32]
	str	x21, [x29, 24]
	mov	x19, x1
	mov	x20, x0
	mov	x0, x19
	bl	_strlen
	mov	x21, x0
	mov	x0, x20
	mov	x20, x0
	bl	_strlen
	mov	x1, x21
	mov	x2, x0
	mov	x0, x20
	cmp	x1, x2
	cset	x2, gt
	cmp	x2, #1
	beq	L16
	bl	_strndup
	mov	x1, x19
	bl	_strcmp
	cmp	x0, #0
	cset	x0, eq
	b	L17
L16:
	mov	x0, #0
L17:
	ldr	x19, [x29, 40]
	ldr	x20, [x29, 32]
	ldr	x21, [x29, 24]
	ldp	x29, x30, [sp], 48
	ret
/* end function donna_string_starts_with */

.text
.balign 4
.globl _donna_string_ends_with
_donna_string_ends_with:
	hint	#34
	stp	x29, x30, [sp, -48]!
	mov	x29, sp
	str	x19, [x29, 40]
	str	x20, [x29, 32]
	str	x21, [x29, 24]
	mov	x19, x1
	mov	x20, x0
	mov	x0, x19
	bl	_strlen
	mov	x21, x0
	mov	x0, x20
	mov	x20, x0
	bl	_strlen
	mov	x1, x21
	mov	x2, x0
	mov	x0, x20
	cmp	x1, x2
	cset	x3, gt
	cmp	x3, #1
	beq	L20
	sub	x2, x2, x1
	add	x0, x0, x2
	bl	_strndup
	mov	x1, x19
	bl	_strcmp
	cmp	x0, #0
	cset	x0, eq
	b	L21
L20:
	mov	x0, #0
L21:
	ldr	x19, [x29, 40]
	ldr	x20, [x29, 32]
	ldr	x21, [x29, 24]
	ldp	x29, x30, [sp], 48
	ret
/* end function donna_string_ends_with */

.text
.balign 4
.globl _donna_string_from_int
_donna_string_from_int:
	hint	#34
	stp	x29, x30, [sp, -16]!
	mov	x29, sp
	bl	___rt_int_to_str
	ldp	x29, x30, [sp], 16
	ret
/* end function donna_string_from_int */

.text
.balign 4
.globl _donna_string_repeat
_donna_string_repeat:
	hint	#34
	stp	x29, x30, [sp, -16]!
	mov	x29, sp
	adrp	x2, _str40@page
	add	x2, x2, _str40@pageoff
	bl	_donna_string_repeat_helper
	ldp	x29, x30, [sp], 16
	ret
/* end function donna_string_repeat */

.text
.balign 4
_donna_string_repeat_helper:
	hint	#34
	stp	x29, x30, [sp, -32]!
	mov	x29, sp
	str	x19, [x29, 24]
	str	x20, [x29, 16]
	mov	x19, x0
	mov	x0, x2
	cmp	x1, #0
	cset	x2, le
	cmp	x2, #1
	beq	L28
	mov	x2, #1
	sub	x1, x1, x2
	mov	x20, x1
	mov	x1, x19
	bl	___rt_str_concat
	mov	x1, x20
	mov	x2, x0
	mov	x0, x19
	bl	_donna_string_repeat_helper
L28:
	ldr	x19, [x29, 24]
	ldr	x20, [x29, 16]
	ldp	x29, x30, [sp], 32
	ret
/* end function donna_string_repeat_helper */

.text
.balign 4
.globl _donna_string_reverse
_donna_string_reverse:
	hint	#34
	stp	x29, x30, [sp, -32]!
	mov	x29, sp
	str	x19, [x29, 24]
	mov	x19, x0
	bl	_strlen
	mov	x1, x0
	mov	x0, x19
	mov	x2, #1
	sub	x1, x1, x2
	adrp	x2, _str54@page
	add	x2, x2, _str54@pageoff
	bl	_donna_string_reverse_helper
	ldr	x19, [x29, 24]
	ldp	x29, x30, [sp], 32
	ret
/* end function donna_string_reverse */

.text
.balign 4
_donna_string_reverse_helper:
	hint	#34
	stp	x29, x30, [sp, -48]!
	mov	x29, sp
	str	x19, [x29, 40]
	str	x20, [x29, 32]
	str	x21, [x29, 24]
	mov	x20, x1
	mov	x19, x0
	mov	x0, x2
	cmp	x20, #0
	cset	x1, lt
	cmp	x1, #1
	beq	L33
	mov	x21, x0
	add	x0, x19, x20
	mov	x1, #1
	bl	_strndup
	mov	x1, x0
	mov	x0, x21
	mov	x2, #1
	sub	x20, x20, x2
	bl	___rt_str_concat
	mov	x1, x20
	mov	x2, x0
	mov	x0, x19
	bl	_donna_string_reverse_helper
L33:
	ldr	x19, [x29, 40]
	ldr	x20, [x29, 32]
	ldr	x21, [x29, 24]
	ldp	x29, x30, [sp], 48
	ret
/* end function donna_string_reverse_helper */

.text
.balign 4
.globl _donna_string_contains
_donna_string_contains:
	hint	#34
	stp	x29, x30, [sp, -16]!
	mov	x29, sp
	bl	_donna_string_index_of
	cmp	x0, #0
	cset	x0, ge
	ldp	x29, x30, [sp], 16
	ret
/* end function donna_string_contains */

.text
.balign 4
.globl _donna_string_index_of
_donna_string_index_of:
	hint	#34
	stp	x29, x30, [sp, -16]!
	mov	x29, sp
	mov	x2, #0
	bl	_donna_string_index_of_from
	ldp	x29, x30, [sp], 16
	ret
/* end function donna_string_index_of */

.text
.balign 4
.globl _donna_string_index_of_from
_donna_string_index_of_from:
	hint	#34
	stp	x29, x30, [sp, -16]!
	mov	x29, sp
	bl	_donna_ffi_string_index_of
	ldp	x29, x30, [sp], 16
	ret
/* end function donna_string_index_of_from */

.text
.balign 4
.globl _donna_string_split
_donna_string_split:
	hint	#34
	stp	x29, x30, [sp, -48]!
	mov	x29, sp
	str	x19, [x29, 40]
	str	x20, [x29, 32]
	str	x21, [x29, 24]
	mov	x20, x1
	mov	x19, x0
	mov	x0, x19
	bl	_strlen
	mov	x21, x0
	mov	x0, x20
	bl	_strlen
	mov	x2, x21
	mov	x1, x20
	mov	x3, x0
	cmp	x3, #0
	cset	x0, eq
	cmp	x0, #1
	beq	L42
	adrp	x6, _donna_nil@page
	add	x6, x6, _donna_nil@pageoff
	mov	x5, #0
	mov	x4, #0
	mov	x0, x19
	bl	_donna_string_split_helper
	b	L43
L42:
	mov	x0, #24
	bl	_malloc
	mov	x1, #1
	str	x1, [x0]
	mov	x1, #8
	add	x1, x0, x1
	str	x19, [x1]
	mov	x1, #16
	add	x2, x0, x1
	adrp	x1, _donna_nil@page
	add	x1, x1, _donna_nil@pageoff
	str	x1, [x2]
L43:
	ldr	x19, [x29, 40]
	ldr	x20, [x29, 32]
	ldr	x21, [x29, 24]
	ldp	x29, x30, [sp], 48
	ret
/* end function donna_string_split */

.text
.balign 4
_donna_string_split_helper:
	hint	#34
	stp	x29, x30, [sp, -96]!
	mov	x29, sp
	str	x19, [x29, 88]
	str	x20, [x29, 80]
	str	x21, [x29, 72]
	str	x22, [x29, 64]
	str	x23, [x29, 56]
	str	x24, [x29, 48]
	str	x25, [x29, 40]
	str	x26, [x29, 32]
	mov	x25, x6
	mov	x24, x5
	mov	x23, x4
	mov	x22, x3
	add	x26, x22, x24
	cmp	x26, x2
	mov	x21, x2
	cset	x2, gt
	add	x7, x0, x23
	str	x7, [x29, 16]
	cmp	x2, #1
	beq	L49
	mov	x19, x0
	add	x0, x0, x24
	mov	x20, x1
	mov	x1, x22
	bl	_strndup
	mov	x1, x20
	mov	x20, x1
	bl	_strcmp
	mov	x6, x25
	mov	x5, x24
	mov	x4, x23
	mov	x3, x22
	mov	x2, x21
	mov	x1, x20
	mov	x8, x0
	mov	x0, x19
	ldr	x7, [x29, 16]
	cmp	x8, #0
	cset	x8, eq
	mov	x9, #16
	sub	sp, sp, x9
	mov	x19, sp
	cmp	x8, #1
	beq	L47
	mov	x7, #1
	add	x5, x5, x7
	mov	x20, x6
	mov	x25, x3
	mov	x24, x2
	mov	x21, x0
	bl	_donna_string_split_helper
	str	x0, [x19]
	b	L51
L47:
	mov	x20, x6
	mov	x25, x3
	mov	x24, x2
	mov	x21, x0
	mov	x0, x7
	mov	x23, x1
	sub	x1, x5, x4
	bl	_strndup
	mov	x17, x0
	mov	x0, x21
	mov	x21, x17
	mov	x22, x0
	mov	x0, #24
	bl	_malloc
	mov	x4, x26
	mov	x3, x25
	mov	x2, x24
	mov	x1, x23
	mov	x6, x0
	mov	x0, x22
	mov	x5, #1
	str	x5, [x6]
	mov	x5, #8
	add	x5, x6, x5
	str	x21, [x5]
	mov	x5, #16
	add	x5, x6, x5
	str	x20, [x5]
	mov	x5, x4
	bl	_donna_string_split_helper
	str	x0, [x19]
	b	L51
L49:
	mov	x0, x7
	mov	x20, x25
	mov	x4, x23
	mov	x2, x21
	sub	x1, x2, x4
	bl	_strndup
	mov	x19, x0
	mov	x0, #24
	bl	_malloc
	mov	x6, x20
	mov	x1, #1
	str	x1, [x0]
	mov	x1, #8
	add	x1, x0, x1
	str	x19, [x1]
	mov	x1, #16
	add	x1, x0, x1
	str	x6, [x1]
	bl	_donna_string_list_reverse
L51:
	ldr	x19, [x29, 88]
	ldr	x20, [x29, 80]
	ldr	x21, [x29, 72]
	ldr	x22, [x29, 64]
	ldr	x23, [x29, 56]
	ldr	x24, [x29, 48]
	ldr	x25, [x29, 40]
	ldr	x26, [x29, 32]
	mov sp, x29
	ldp	x29, x30, [sp], 96
	ret
/* end function donna_string_split_helper */

.text
.balign 4
_donna_string_list_reverse:
	hint	#34
	stp	x29, x30, [sp, -16]!
	mov	x29, sp
	adrp	x1, _donna_nil@page
	add	x1, x1, _donna_nil@pageoff
	bl	_donna_string_list_reverse_helper
	ldp	x29, x30, [sp], 16
	ret
/* end function donna_string_list_reverse */

.text
.balign 4
_donna_string_list_reverse_helper:
	hint	#34
	stp	x29, x30, [sp, -48]!
	mov	x29, sp
	str	x19, [x29, 40]
	str	x20, [x29, 32]
	str	x21, [x29, 24]
	mov	x19, x1
	ldr	x1, [x0]
	cmp	x1, #0
	beq	L56
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
	bl	_donna_string_list_reverse_helper
	b	L57
L56:
	mov	x0, x19
L57:
	ldr	x19, [x29, 40]
	ldr	x20, [x29, 32]
	ldr	x21, [x29, 24]
	ldp	x29, x30, [sp], 48
	ret
/* end function donna_string_list_reverse_helper */

.text
.balign 4
.globl _donna_string_trim_start
_donna_string_trim_start:
	hint	#34
	stp	x29, x30, [sp, -32]!
	mov	x29, sp
	str	x19, [x29, 24]
	mov	x19, x0
	bl	_strlen
	mov	x2, x0
	mov	x0, x19
	mov	x1, #0
	bl	_donna_string_trim_start_from
	ldr	x19, [x29, 24]
	ldp	x29, x30, [sp], 32
	ret
/* end function donna_string_trim_start */

.text
.balign 4
_donna_string_trim_start_from:
	hint	#34
	stp	x29, x30, [sp, -48]!
	mov	x29, sp
	str	x19, [x29, 40]
	str	x20, [x29, 32]
	str	x21, [x29, 24]
	str	x22, [x29, 16]
	cmp	x1, x2
	mov	x22, x2
	cset	x2, ge
	cmp	x2, #1
	beq	L65
	add	x20, x0, x1
	mov	x21, x1
	mov	x1, #1
	mov	x19, x0
	mov	x0, x20
	bl	_strndup
	bl	_donna_string_is_ws
	mov	x2, x22
	mov	x1, x21
	mov	x3, x0
	mov	x0, x19
	mov	x4, #16
	sub	sp, sp, x4
	mov	x19, sp
	cmp	x3, #1
	beq	L64
	mov	x0, x20
	sub	x1, x2, x1
	bl	_strndup
	str	x0, [x19]
	b	L66
L64:
	mov	x3, #1
	add	x1, x1, x3
	bl	_donna_string_trim_start_from
	str	x0, [x19]
	b	L66
L65:
	adrp	x0, _str145@page
	add	x0, x0, _str145@pageoff
L66:
	ldr	x19, [x29, 40]
	ldr	x20, [x29, 32]
	ldr	x21, [x29, 24]
	ldr	x22, [x29, 16]
	mov sp, x29
	ldp	x29, x30, [sp], 48
	ret
/* end function donna_string_trim_start_from */

.text
.balign 4
.globl _donna_string_trim_end
_donna_string_trim_end:
	hint	#34
	stp	x29, x30, [sp, -32]!
	mov	x29, sp
	str	x19, [x29, 24]
	mov	x19, x0
	bl	_strlen
	mov	x1, x0
	mov	x0, x19
	mov	x2, #1
	sub	x1, x1, x2
	bl	_donna_string_trim_end_to
	ldr	x19, [x29, 24]
	ldp	x29, x30, [sp], 32
	ret
/* end function donna_string_trim_end */

.text
.balign 4
_donna_string_trim_end_to:
	hint	#34
	stp	x29, x30, [sp, -32]!
	mov	x29, sp
	str	x19, [x29, 24]
	str	x20, [x29, 16]
	cmp	x1, #0
	cset	x2, lt
	cmp	x2, #1
	beq	L73
	mov	x19, x0
	add	x0, x0, x1
	mov	x20, x1
	mov	x1, #1
	bl	_strndup
	bl	_donna_string_is_ws
	mov	x1, x20
	mov	x2, x0
	mov	x0, x19
	mov	x3, #16
	sub	sp, sp, x3
	mov	x19, sp
	cmp	x2, #1
	beq	L72
	mov	x2, #1
	add	x1, x1, x2
	bl	_strndup
	str	x0, [x19]
	b	L74
L72:
	mov	x2, #1
	sub	x1, x1, x2
	bl	_donna_string_trim_end_to
	str	x0, [x19]
	b	L74
L73:
	adrp	x0, _str170@page
	add	x0, x0, _str170@pageoff
L74:
	ldr	x19, [x29, 24]
	ldr	x20, [x29, 16]
	mov sp, x29
	ldp	x29, x30, [sp], 32
	ret
/* end function donna_string_trim_end_to */

.text
.balign 4
.globl _donna_string_trim
_donna_string_trim:
	hint	#34
	stp	x29, x30, [sp, -16]!
	mov	x29, sp
	bl	_donna_string_trim_start
	bl	_donna_string_trim_end
	ldp	x29, x30, [sp], 16
	ret
/* end function donna_string_trim */

.text
.balign 4
_donna_string_is_ws:
	hint	#34
	stp	x29, x30, [sp, -32]!
	mov	x29, sp
	str	x19, [x29, 24]
	str	x20, [x29, 16]
	adrp	x1, _str188@page
	add	x1, x1, _str188@pageoff
	mov	x19, x0
	bl	_strcmp
	mov	x1, x0
	mov	x0, x19
	cmp	x1, #0
	cset	x1, eq
	cmp	x1, #1
	beq	L86
	adrp	x1, _str196@page
	add	x1, x1, _str196@pageoff
	mov	x19, x0
	bl	_strcmp
	mov	x1, x0
	mov	x0, x19
	cmp	x1, #0
	cset	x1, eq
	mov	x2, #16
	sub	sp, sp, x2
	mov	x19, sp
	cmp	x1, #1
	beq	L84
	adrp	x1, _str204@page
	add	x1, x1, _str204@pageoff
	mov	x20, x0
	bl	_strcmp
	mov	x1, x0
	mov	x0, x20
	cmp	x1, #0
	cset	x1, eq
	mov	x2, #16
	sub	sp, sp, x2
	mov	x20, sp
	cmp	x1, #1
	beq	L81
	adrp	x1, _str212@page
	add	x1, x1, _str212@pageoff
	bl	_strcmp
	cmp	x0, #0
	cset	x0, eq
	str	x0, [x20]
	b	L83
L81:
	mov	x0, #1
	str	x0, [x20]
	mov	x0, #1
L83:
	str	x0, [x19]
	b	L87
L84:
	mov	x0, #1
	str	x0, [x19]
	mov	x0, #1
	b	L87
L86:
	mov	x0, #1
L87:
	ldr	x19, [x29, 24]
	ldr	x20, [x29, 16]
	mov sp, x29
	ldp	x29, x30, [sp], 32
	ret
/* end function donna_string_is_ws */

.text
.balign 4
.globl _donna_string_replace
_donna_string_replace:
	hint	#34
	stp	x29, x30, [sp, -16]!
	mov	x29, sp
	bl	_donna_ffi_string_replace
	ldp	x29, x30, [sp], 16
	ret
/* end function donna_string_replace */

.text
.balign 4
.globl _donna_string_join
_donna_string_join:
	hint	#34
	stp	x29, x30, [sp, -32]!
	mov	x29, sp
	str	x19, [x29, 24]
	str	x20, [x29, 16]
	ldr	x2, [x0]
	cmp	x2, #0
	beq	L98
	mov	x3, #16
	sub	sp, sp, x3
	mov	x3, sp
	cmp	x2, #1
	beq	L94
	mov	x2, #0
	str	x2, [x3]
	mov	x2, #0
	b	L95
L94:
	mov	x2, #16
	add	x2, x0, x2
	ldr	x2, [x2]
	ldr	x2, [x2]
	cmp	x2, #0
	cset	x2, eq
	mov	x4, #1
	and	x2, x2, x4
	str	x2, [x3]
L95:
	cmp	w2, #0
	bne	L97
	mov	x2, x0
	mov	x0, #8
	add	x0, x2, x0
	ldr	x0, [x0]
	mov	x3, #16
	add	x2, x2, x3
	ldr	x19, [x2]
	mov	x20, x1
	bl	___rt_str_concat
	mov	x1, x20
	mov	x17, x0
	mov	x0, x19
	mov	x19, x17
	bl	_donna_string_join
	mov	x1, x0
	mov	x0, x19
	bl	___rt_str_concat
	b	L99
L97:
	mov	x1, #8
	add	x0, x0, x1
	ldr	x0, [x0]
	b	L99
L98:
	adrp	x0, _str225@page
	add	x0, x0, _str225@pageoff
L99:
	ldr	x19, [x29, 24]
	ldr	x20, [x29, 16]
	mov sp, x29
	ldp	x29, x30, [sp], 32
	ret
/* end function donna_string_join */

.text
.balign 4
.globl _donna_string_pad_left
_donna_string_pad_left:
	hint	#34
	stp	x29, x30, [sp, -48]!
	mov	x29, sp
	str	x19, [x29, 40]
	str	x20, [x29, 32]
	str	x21, [x29, 24]
	mov	x21, x1
	mov	x19, x0
	mov	x0, x2
	mov	x20, x0
	mov	x0, x19
	bl	_strlen
	mov	x1, x21
	mov	x2, x0
	mov	x0, x20
	cmp	x2, x1
	cset	x3, ge
	cmp	x3, #1
	beq	L102
	sub	x1, x1, x2
	bl	_donna_string_repeat
	mov	x1, x19
	bl	___rt_str_concat
	b	L103
L102:
	mov	x0, x19
L103:
	ldr	x19, [x29, 40]
	ldr	x20, [x29, 32]
	ldr	x21, [x29, 24]
	ldp	x29, x30, [sp], 48
	ret
/* end function donna_string_pad_left */

.text
.balign 4
.globl _donna_string_is_digits
_donna_string_is_digits:
	hint	#34
	stp	x29, x30, [sp, -32]!
	mov	x29, sp
	str	x19, [x29, 24]
	mov	x19, x0
	bl	_strlen
	mov	x2, x0
	mov	x0, x19
	cmp	x2, #0
	cset	x1, eq
	cmp	x1, #1
	beq	L106
	mov	x1, #0
	bl	_donna_string_all_digits
	b	L107
L106:
	mov	x0, #0
L107:
	ldr	x19, [x29, 24]
	ldp	x29, x30, [sp], 32
	ret
/* end function donna_string_is_digits */

.text
.balign 4
_donna_string_all_digits:
	hint	#34
	stp	x29, x30, [sp, -32]!
	mov	x29, sp
	str	x19, [x29, 24]
	str	x20, [x29, 16]
	cmp	x1, x2
	cset	x3, eq
	cmp	x3, #1
	beq	L117
	add	x3, x0, x1
	ldrb	w3, [x3]
	cmp	x3, #48
	cset	x4, lt
	mov	x5, #16
	sub	sp, sp, x5
	mov	x19, sp
	cmp	x4, #1
	beq	L115
	cmp	x3, #57
	cset	x3, gt
	mov	x4, #16
	sub	sp, sp, x4
	mov	x20, sp
	cmp	x3, #1
	beq	L112
	mov	x3, #1
	add	x1, x1, x3
	bl	_donna_string_all_digits
	str	x0, [x20]
	b	L114
L112:
	mov	x0, #0
	str	x0, [x20]
	mov	x0, #0
L114:
	str	x0, [x19]
	b	L118
L115:
	mov	x0, #0
	str	x0, [x19]
	mov	x0, #0
	b	L118
L117:
	mov	x0, #1
L118:
	ldr	x19, [x29, 24]
	ldr	x20, [x29, 16]
	mov sp, x29
	ldp	x29, x30, [sp], 32
	ret
/* end function donna_string_all_digits */

.text
.balign 4
.globl _donna_string_to_int
_donna_string_to_int:
	hint	#34
	stp	x29, x30, [sp, -32]!
	mov	x29, sp
	str	x19, [x29, 24]
	str	x20, [x29, 16]
	mov	x19, x0
	bl	_strlen
	mov	x2, x0
	mov	x0, x19
	mov	x1, #0
	bl	_donna_string_trim_start_from
	mov	x19, x0
	bl	_strlen
	mov	x20, x0
	mov	x0, x19
	cmp	x20, #0
	cset	x1, eq
	cmp	x1, #1
	beq	L123
	mov	x1, #1
	mov	x19, x0
	bl	_strndup
	adrp	x1, _str310@page
	add	x1, x1, _str310@pageoff
	bl	_strcmp
	mov	x2, x20
	mov	x1, x0
	mov	x0, x19
	cmp	x1, #0
	cset	x1, eq
	mov	x3, #16
	sub	sp, sp, x3
	mov	x19, sp
	cmp	x1, #1
	beq	L122
	mov	x3, #0
	mov	x1, #0
	bl	_donna_string_parse_digits
	str	x0, [x19]
	b	L124
L122:
	mov	x3, #0
	mov	x1, #1
	bl	_donna_string_parse_digits
	mov	x1, x0
	mov	x0, #0
	sub	x0, x0, x1
	str	x0, [x19]
	b	L124
L123:
	mov	x0, #0
L124:
	ldr	x19, [x29, 24]
	ldr	x20, [x29, 16]
	mov sp, x29
	ldp	x29, x30, [sp], 32
	ret
/* end function donna_string_to_int */

.text
.balign 4
_donna_string_parse_digits:
	hint	#34
	stp	x29, x30, [sp, -32]!
	mov	x29, sp
	str	x19, [x29, 24]
	str	x20, [x29, 16]
	mov	x4, x3
	cmp	x1, x2
	cset	x3, ge
	cmp	x3, #1
	beq	L134
	add	x3, x0, x1
	ldrb	w3, [x3]
	mov	x5, #48
	sub	x3, x3, x5
	cmp	x3, #0
	cset	x5, lt
	mov	x6, #16
	sub	sp, sp, x6
	mov	x19, sp
	cmp	x5, #1
	beq	L132
	cmp	x3, #9
	cset	x5, gt
	mov	x6, #16
	sub	sp, sp, x6
	mov	x20, sp
	cmp	x5, #1
	beq	L129
	mov	x5, #1
	add	x1, x1, x5
	mov	x5, #10
	mul	x4, x4, x5
	add	x3, x3, x4
	bl	_donna_string_parse_digits
	str	x0, [x20]
	b	L131
L129:
	mov	x0, x4
	str	x0, [x20]
L131:
	str	x0, [x19]
	b	L135
L132:
	mov	x0, x4
	str	x0, [x19]
	b	L135
L134:
	mov	x0, x4
L135:
	ldr	x19, [x29, 24]
	ldr	x20, [x29, 16]
	mov sp, x29
	ldp	x29, x30, [sp], 32
	ret
/* end function donna_string_parse_digits */

.text
.balign 4
.globl _donna_string_lowercase
_donna_string_lowercase:
	hint	#34
	stp	x29, x30, [sp, -32]!
	mov	x29, sp
	str	x19, [x29, 24]
	mov	x19, x0
	bl	_strlen
	mov	x2, x0
	mov	x0, x19
	adrp	x3, _str352@page
	add	x3, x3, _str352@pageoff
	mov	x1, #0
	bl	_donna_string_lowercase_helper
	ldr	x19, [x29, 24]
	ldp	x29, x30, [sp], 32
	ret
/* end function donna_string_lowercase */

.text
.balign 4
_donna_string_lowercase_helper:
	hint	#34
	stp	x29, x30, [sp, -64]!
	mov	x29, sp
	str	x19, [x29, 56]
	str	x20, [x29, 48]
	str	x21, [x29, 40]
	str	x22, [x29, 32]
	str	x23, [x29, 24]
	mov	x20, x1
	mov	x19, x0
	mov	x0, x3
	cmp	x20, x2
	cset	x1, ge
	cmp	x1, #1
	beq	L145
	mov	x22, x0
	add	x0, x19, x20
	ldrb	w0, [x0]
	cmp	x0, #65
	cset	x1, ge
	cmp	x0, #90
	cset	x3, le
	and	x1, x1, x3
	mov	x23, x2
	mov	x2, #16
	sub	sp, sp, x2
	mov	x21, sp
	cmp	x1, #1
	beq	L143
	mov	x0, x22
	mov	x1, x20
	mov	x22, x0
	mov	x0, x19
	bl	_donna_string_char_str
	mov	x1, x0
	str	x1, [x21]
	mov	x0, x22
	mov	x2, x23
	b	L144
L143:
	mov	x1, #32
	add	x0, x0, x1
	bl	_donna_string_char_from_code
	mov	x2, x23
	mov	x1, x0
	mov	x0, x22
	str	x1, [x21]
L144:
	mov	x21, x2
	mov	x2, #1
	add	x20, x20, x2
	bl	___rt_str_concat
	mov	x2, x21
	mov	x1, x20
	mov	x3, x0
	mov	x0, x19
	bl	_donna_string_lowercase_helper
L145:
	ldr	x19, [x29, 56]
	ldr	x20, [x29, 48]
	ldr	x21, [x29, 40]
	ldr	x22, [x29, 32]
	ldr	x23, [x29, 24]
	mov sp, x29
	ldp	x29, x30, [sp], 64
	ret
/* end function donna_string_lowercase_helper */

.text
.balign 4
.globl _donna_string_to_slug
_donna_string_to_slug:
	hint	#34
	stp	x29, x30, [sp, -32]!
	mov	x29, sp
	str	x19, [x29, 24]
	mov	x19, x0
	bl	_donna_string_lowercase
	mov	x17, x0
	mov	x0, x19
	mov	x19, x17
	bl	_strlen
	mov	x2, x0
	mov	x0, x19
	adrp	x3, _str380@page
	add	x3, x3, _str380@pageoff
	mov	x1, #0
	bl	_donna_string_slug_helper
	ldr	x19, [x29, 24]
	ldp	x29, x30, [sp], 32
	ret
/* end function donna_string_to_slug */

.text
.balign 4
_donna_string_slug_helper:
	hint	#34
	stp	x29, x30, [sp, -64]!
	mov	x29, sp
	str	x19, [x29, 56]
	str	x20, [x29, 48]
	str	x21, [x29, 40]
	str	x22, [x29, 32]
	str	x23, [x29, 24]
	str	x24, [x29, 16]
	mov	x20, x1
	mov	x19, x0
	mov	x0, x3
	cmp	x20, x2
	cset	x1, ge
	cmp	x1, #1
	beq	L159
	mov	x22, x0
	add	x0, x19, x20
	ldrb	w0, [x0]
	cmp	x0, #32
	cset	x1, eq
	mov	x23, x2
	mov	x2, #16
	sub	sp, sp, x2
	mov	x21, sp
	cmp	x1, #1
	beq	L155
	bl	_donna_string_is_slug_char
	mov	x2, x23
	mov	x1, x0
	mov	x0, x22
	mov	x24, x2
	mov	x2, #16
	sub	sp, sp, x2
	mov	x22, sp
	cmp	x1, #1
	beq	L153
	adrp	x1, _str404@page
	add	x1, x1, _str404@pageoff
	str	x1, [x22]
	mov	x2, x24
	adrp	x1, _str404@page
	add	x1, x1, _str404@pageoff
	b	L154
L153:
	mov	x1, x20
	mov	x23, x0
	mov	x0, x19
	bl	_donna_string_char_str
	mov	x2, x24
	mov	x1, x0
	mov	x0, x23
	str	x1, [x22]
L154:
	str	x1, [x21]
	b	L158
L155:
	mov	x0, x22
	mov	x2, x23
	adrp	x1, _str396@page
	add	x1, x1, _str396@pageoff
	str	x1, [x21]
	adrp	x1, _str396@page
	add	x1, x1, _str396@pageoff
L158:
	mov	x21, x2
	mov	x2, #1
	add	x20, x20, x2
	bl	___rt_str_concat
	mov	x2, x21
	mov	x1, x20
	mov	x3, x0
	mov	x0, x19
	bl	_donna_string_slug_helper
L159:
	ldr	x19, [x29, 56]
	ldr	x20, [x29, 48]
	ldr	x21, [x29, 40]
	ldr	x22, [x29, 32]
	ldr	x23, [x29, 24]
	ldr	x24, [x29, 16]
	mov sp, x29
	ldp	x29, x30, [sp], 64
	ret
/* end function donna_string_slug_helper */

.text
.balign 4
_donna_string_is_slug_char:
	hint	#34
	stp	x29, x30, [sp, -16]!
	mov	x29, sp
	cmp	x0, #97
	cset	x1, ge
	cmp	x0, #122
	cset	x2, le
	and	x1, x1, x2
	cmp	x1, #1
	beq	L165
	cmp	x0, #48
	cset	x1, ge
	cmp	x0, #57
	cset	x2, le
	and	x2, x1, x2
	mov	x1, #16
	sub	sp, sp, x1
	mov	x1, sp
	cmp	x2, #1
	beq	L163
	cmp	x0, #45
	cset	x0, eq
	str	x0, [x1]
	b	L166
L163:
	mov	x0, #1
	str	x0, [x1]
	mov	x0, #1
	b	L166
L165:
	mov	x0, #1
L166:
	mov sp, x29
	ldp	x29, x30, [sp], 16
	ret
/* end function donna_string_is_slug_char */

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

.text
.balign 4
___rt_int_to_str:
	hint	#34
	stp	x29, x30, [sp, -32]!
	mov	x29, sp
	str	x19, [x29, 24]
	mov	x19, x0
	mov	x0, #32
	bl	_malloc
	mov	x1, #16
	sub	sp, sp, x1
	mov	x1, #0
	add	x1, sp, x1
	str	x19, [x1]
	adrp	x1, ___rt_fmt_ld@page
	add	x1, x1, ___rt_fmt_ld@pageoff
	mov	x19, x0
	bl	_sprintf
	mov	x0, x19
	mov	x1, #16
	add	sp, sp, x1
	ldr	x19, [x29, 24]
	ldp	x29, x30, [sp], 32
	ret
/* end function __rt_int_to_str */

