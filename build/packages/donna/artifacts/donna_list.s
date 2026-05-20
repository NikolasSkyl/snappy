.data
.balign 8
_donna_nil:
	.quad 0
/* end data */

.text
.balign 4
.globl _donna_list_length
_donna_list_length:
	hint	#34
	stp	x29, x30, [sp, -16]!
	mov	x29, sp
	ldr	x1, [x0]
	cmp	x1, #0
	beq	L2
	mov	x1, #16
	add	x0, x0, x1
	ldr	x0, [x0]
	bl	_donna_list_length
	mov	x1, #1
	add	x0, x0, x1
	b	L3
L2:
	mov	x0, #0
L3:
	ldp	x29, x30, [sp], 16
	ret
/* end function donna_list_length */

.text
.balign 4
.globl _donna_list_head
_donna_list_head:
	hint	#34
	stp	x29, x30, [sp, -16]!
	mov	x29, sp
	ldr	x2, [x0]
	cmp	x2, #0
	beq	L6
	mov	x1, #8
	add	x0, x0, x1
	ldr	x0, [x0]
	b	L7
L6:
	mov	x0, x1
L7:
	ldp	x29, x30, [sp], 16
	ret
/* end function donna_list_head */

.text
.balign 4
.globl _donna_list_tail
_donna_list_tail:
	hint	#34
	stp	x29, x30, [sp, -16]!
	mov	x29, sp
	ldr	x1, [x0]
	cmp	x1, #0
	beq	L10
	mov	x1, #16
	add	x0, x0, x1
	ldr	x0, [x0]
	b	L11
L10:
	adrp	x0, _donna_nil@page
	add	x0, x0, _donna_nil@pageoff
L11:
	ldp	x29, x30, [sp], 16
	ret
/* end function donna_list_tail */

.text
.balign 4
.globl _donna_list_is_empty
_donna_list_is_empty:
	hint	#34
	stp	x29, x30, [sp, -16]!
	mov	x29, sp
	ldr	x0, [x0]
	cmp	x0, #0
	beq	L14
	mov	x0, #0
	b	L15
L14:
	mov	x0, #1
L15:
	ldp	x29, x30, [sp], 16
	ret
/* end function donna_list_is_empty */

.text
.balign 4
.globl _donna_list_append
_donna_list_append:
	hint	#34
	stp	x29, x30, [sp, -32]!
	mov	x29, sp
	str	x19, [x29, 24]
	str	x20, [x29, 16]
	ldr	x2, [x0]
	cmp	x2, #0
	beq	L18
	mov	x2, #8
	add	x2, x0, x2
	ldr	x20, [x2]
	mov	x2, #16
	add	x0, x0, x2
	ldr	x0, [x0]
	bl	_donna_list_append
	mov	x19, x0
	mov	x0, #24
	bl	_malloc
	mov	x1, #1
	str	x1, [x0]
	mov	x1, #8
	add	x1, x0, x1
	str	x20, [x1]
	mov	x1, #16
	add	x1, x0, x1
	str	x19, [x1]
	b	L19
L18:
	mov	x0, x1
L19:
	ldr	x19, [x29, 24]
	ldr	x20, [x29, 16]
	ldp	x29, x30, [sp], 32
	ret
/* end function donna_list_append */

.text
.balign 4
.globl _donna_list_reverse
_donna_list_reverse:
	hint	#34
	stp	x29, x30, [sp, -16]!
	mov	x29, sp
	adrp	x1, _donna_nil@page
	add	x1, x1, _donna_nil@pageoff
	bl	_donna_list_reverse_helper
	ldp	x29, x30, [sp], 16
	ret
/* end function donna_list_reverse */

.text
.balign 4
_donna_list_reverse_helper:
	hint	#34
	stp	x29, x30, [sp, -48]!
	mov	x29, sp
	str	x19, [x29, 40]
	str	x20, [x29, 32]
	str	x21, [x29, 24]
	mov	x19, x1
	ldr	x1, [x0]
	cmp	x1, #0
	beq	L24
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
	bl	_donna_list_reverse_helper
	b	L25
L24:
	mov	x0, x19
L25:
	ldr	x19, [x29, 40]
	ldr	x20, [x29, 32]
	ldr	x21, [x29, 24]
	ldp	x29, x30, [sp], 48
	ret
/* end function donna_list_reverse_helper */

.text
.balign 4
.globl _donna_list_sum
_donna_list_sum:
	hint	#34
	stp	x29, x30, [sp, -32]!
	mov	x29, sp
	str	x19, [x29, 24]
	ldr	x1, [x0]
	cmp	x1, #0
	beq	L28
	mov	x1, #8
	add	x1, x0, x1
	ldr	x19, [x1]
	mov	x1, #16
	add	x0, x0, x1
	ldr	x0, [x0]
	bl	_donna_list_sum
	add	x0, x19, x0
	b	L29
L28:
	mov	x0, #0
L29:
	ldr	x19, [x29, 24]
	ldp	x29, x30, [sp], 32
	ret
/* end function donna_list_sum */

.text
.balign 4
.globl _donna_list_nth
_donna_list_nth:
	hint	#34
	stp	x29, x30, [sp, -32]!
	mov	x29, sp
	str	x19, [x29, 24]
	mov	x3, x0
	mov	x0, x2
	mov	x2, x0
	ldr	x0, [x3]
	cmp	x0, #0
	beq	L35
	mov	x0, #8
	add	x0, x3, x0
	ldr	x0, [x0]
	mov	x4, #16
	add	x3, x3, x4
	ldr	x3, [x3]
	cmp	x1, #0
	cset	x4, eq
	mov	x5, #16
	sub	sp, sp, x5
	mov	x19, sp
	cmp	x4, #1
	beq	L34
	mov	x0, x3
	mov	x3, #1
	sub	x1, x1, x3
	bl	_donna_list_nth
	str	x0, [x19]
	b	L36
L34:
	str	x0, [x19]
	b	L36
L35:
	mov	x0, x2
L36:
	ldr	x19, [x29, 24]
	mov sp, x29
	ldp	x29, x30, [sp], 32
	ret
/* end function donna_list_nth */

.text
.balign 4
.globl _donna_list_flatten
_donna_list_flatten:
	hint	#34
	stp	x29, x30, [sp, -32]!
	mov	x29, sp
	str	x19, [x29, 24]
	ldr	x1, [x0]
	cmp	x1, #0
	beq	L39
	mov	x1, #8
	add	x1, x0, x1
	ldr	x19, [x1]
	mov	x1, #16
	add	x0, x0, x1
	ldr	x0, [x0]
	bl	_donna_list_flatten
	mov	x1, x0
	mov	x0, x19
	bl	_donna_list_append
	b	L40
L39:
	adrp	x0, _donna_nil@page
	add	x0, x0, _donna_nil@pageoff
L40:
	ldr	x19, [x29, 24]
	ldp	x29, x30, [sp], 32
	ret
/* end function donna_list_flatten */

.text
.balign 4
.globl _donna_list_take
_donna_list_take:
	hint	#34
	stp	x29, x30, [sp, -48]!
	mov	x29, sp
	str	x19, [x29, 40]
	str	x20, [x29, 32]
	str	x21, [x29, 24]
	cmp	x1, #0
	cset	x2, le
	cmp	x2, #1
	beq	L46
	mov	x2, #16
	sub	sp, sp, x2
	mov	x19, sp
	ldr	x2, [x0]
	cmp	x2, #0
	beq	L44
	mov	x2, #8
	add	x2, x0, x2
	ldr	x21, [x2]
	mov	x2, #16
	add	x0, x0, x2
	ldr	x0, [x0]
	mov	x2, #1
	sub	x1, x1, x2
	bl	_donna_list_take
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
	str	x0, [x19]
	b	L47
L44:
	adrp	x0, _donna_nil@page
	add	x0, x0, _donna_nil@pageoff
	str	x0, [x19]
	adrp	x0, _donna_nil@page
	add	x0, x0, _donna_nil@pageoff
	b	L47
L46:
	adrp	x0, _donna_nil@page
	add	x0, x0, _donna_nil@pageoff
L47:
	ldr	x19, [x29, 40]
	ldr	x20, [x29, 32]
	ldr	x21, [x29, 24]
	mov sp, x29
	ldp	x29, x30, [sp], 48
	ret
/* end function donna_list_take */

.text
.balign 4
.globl _donna_list_drop
_donna_list_drop:
	hint	#34
	stp	x29, x30, [sp, -32]!
	mov	x29, sp
	str	x19, [x29, 24]
	cmp	x1, #0
	cset	x2, le
	cmp	x2, #1
	beq	L53
	mov	x2, #16
	sub	sp, sp, x2
	mov	x19, sp
	ldr	x2, [x0]
	cmp	x2, #0
	beq	L51
	mov	x2, #16
	add	x0, x0, x2
	ldr	x0, [x0]
	mov	x2, #1
	sub	x1, x1, x2
	bl	_donna_list_drop
	str	x0, [x19]
	b	L53
L51:
	adrp	x0, _donna_nil@page
	add	x0, x0, _donna_nil@pageoff
	str	x0, [x19]
	adrp	x0, _donna_nil@page
	add	x0, x0, _donna_nil@pageoff
L53:
	ldr	x19, [x29, 24]
	mov sp, x29
	ldp	x29, x30, [sp], 32
	ret
/* end function donna_list_drop */

.text
.balign 4
.globl _donna_list_repeat
_donna_list_repeat:
	hint	#34
	stp	x29, x30, [sp, -32]!
	mov	x29, sp
	str	x19, [x29, 24]
	str	x20, [x29, 16]
	mov	x20, x0
	cmp	x1, #0
	cset	x0, le
	cmp	x0, #1
	beq	L56
	mov	x0, #1
	sub	x1, x1, x0
	mov	x0, x20
	bl	_donna_list_repeat
	mov	x19, x0
	mov	x0, #24
	bl	_malloc
	mov	x1, #1
	str	x1, [x0]
	mov	x1, #8
	add	x1, x0, x1
	str	x20, [x1]
	mov	x1, #16
	add	x1, x0, x1
	str	x19, [x1]
	b	L57
L56:
	adrp	x0, _donna_nil@page
	add	x0, x0, _donna_nil@pageoff
L57:
	ldr	x19, [x29, 24]
	ldr	x20, [x29, 16]
	ldp	x29, x30, [sp], 32
	ret
/* end function donna_list_repeat */

.text
.balign 4
.globl _donna_list_range
_donna_list_range:
	hint	#34
	stp	x29, x30, [sp, -32]!
	mov	x29, sp
	str	x19, [x29, 24]
	str	x20, [x29, 16]
	mov	x20, x0
	cmp	x20, x1
	cset	x0, ge
	cmp	x0, #1
	beq	L60
	mov	x0, #1
	add	x0, x20, x0
	bl	_donna_list_range
	mov	x19, x0
	mov	x0, #24
	bl	_malloc
	mov	x1, #1
	str	x1, [x0]
	mov	x1, #8
	add	x1, x0, x1
	str	x20, [x1]
	mov	x1, #16
	add	x1, x0, x1
	str	x19, [x1]
	b	L61
L60:
	adrp	x0, _donna_nil@page
	add	x0, x0, _donna_nil@pageoff
L61:
	ldr	x19, [x29, 24]
	ldr	x20, [x29, 16]
	ldp	x29, x30, [sp], 32
	ret
/* end function donna_list_range */

.text
.balign 4
.globl _donna_list_contains_int
_donna_list_contains_int:
	hint	#34
	stp	x29, x30, [sp, -32]!
	mov	x29, sp
	str	x19, [x29, 24]
	ldr	x2, [x0]
	cmp	x2, #0
	beq	L67
	mov	x2, #8
	add	x2, x0, x2
	ldr	x2, [x2]
	mov	x3, #16
	add	x0, x0, x3
	ldr	x0, [x0]
	cmp	x1, x2
	cset	x2, eq
	mov	x3, #16
	sub	sp, sp, x3
	mov	x19, sp
	cmp	x2, #1
	beq	L65
	bl	_donna_list_contains_int
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
/* end function donna_list_contains_int */

.text
.balign 4
.globl _donna_list_contains_str
_donna_list_contains_str:
	hint	#34
	stp	x29, x30, [sp, -32]!
	mov	x29, sp
	str	x19, [x29, 24]
	str	x20, [x29, 16]
	mov	x2, x0
	ldr	x0, [x2]
	cmp	x0, #0
	beq	L74
	mov	x0, #8
	add	x0, x2, x0
	ldr	x0, [x0]
	mov	x3, #16
	add	x2, x2, x3
	ldr	x19, [x2]
	mov	x20, x1
	bl	_donna_string_equal
	mov	x1, x20
	mov	x2, x0
	mov	x0, x19
	mov	x3, #16
	sub	sp, sp, x3
	mov	x19, sp
	cmp	x2, #1
	beq	L72
	bl	_donna_list_contains_str
	str	x0, [x19]
	b	L75
L72:
	mov	x0, #1
	str	x0, [x19]
	mov	x0, #1
	b	L75
L74:
	mov	x0, #0
L75:
	ldr	x19, [x29, 24]
	ldr	x20, [x29, 16]
	mov sp, x29
	ldp	x29, x30, [sp], 32
	ret
/* end function donna_list_contains_str */

.text
.balign 4
.globl _donna_list_zip_length
_donna_list_zip_length:
	hint	#34
	stp	x29, x30, [sp, -16]!
	mov	x29, sp
	bl	_donna_list_length
	ldp	x29, x30, [sp], 16
	ret
/* end function donna_list_zip_length */

.text
.balign 4
.globl _donna_list_minimum
_donna_list_minimum:
	hint	#34
	stp	x29, x30, [sp, -48]!
	mov	x29, sp
	str	x19, [x29, 40]
	str	x20, [x29, 32]
	str	x21, [x29, 24]
	mov	x21, x1
	ldr	x1, [x0]
	cmp	x1, #0
	beq	L87
	mov	x1, #8
	add	x1, x0, x1
	ldr	x20, [x1]
	mov	x1, #16
	add	x0, x0, x1
	ldr	x0, [x0]
	mov	x1, #16
	sub	sp, sp, x1
	mov	x19, sp
	ldr	x1, [x0]
	cmp	x1, #0
	beq	L85
	mov	x1, x21
	bl	_donna_list_minimum
	mov	x17, x0
	mov	x0, x20
	mov	x20, x17
	cmp	x0, x20
	cset	x2, lt
	mov	x1, #16
	sub	sp, sp, x1
	mov	x1, sp
	cmp	x2, #1
	beq	L83
	mov	x0, x20
	str	x0, [x1]
	b	L84
L83:
	str	x0, [x1]
L84:
	str	x0, [x19]
	b	L88
L85:
	mov	x0, x20
	str	x0, [x19]
	b	L88
L87:
	mov	x0, x21
L88:
	ldr	x19, [x29, 40]
	ldr	x20, [x29, 32]
	ldr	x21, [x29, 24]
	mov sp, x29
	ldp	x29, x30, [sp], 48
	ret
/* end function donna_list_minimum */

.text
.balign 4
.globl _donna_list_maximum
_donna_list_maximum:
	hint	#34
	stp	x29, x30, [sp, -48]!
	mov	x29, sp
	str	x19, [x29, 40]
	str	x20, [x29, 32]
	str	x21, [x29, 24]
	mov	x21, x1
	ldr	x1, [x0]
	cmp	x1, #0
	beq	L98
	mov	x1, #8
	add	x1, x0, x1
	ldr	x20, [x1]
	mov	x1, #16
	add	x0, x0, x1
	ldr	x0, [x0]
	mov	x1, #16
	sub	sp, sp, x1
	mov	x19, sp
	ldr	x1, [x0]
	cmp	x1, #0
	beq	L96
	mov	x1, x21
	bl	_donna_list_maximum
	mov	x17, x0
	mov	x0, x20
	mov	x20, x17
	cmp	x0, x20
	cset	x2, gt
	mov	x1, #16
	sub	sp, sp, x1
	mov	x1, sp
	cmp	x2, #1
	beq	L94
	mov	x0, x20
	str	x0, [x1]
	b	L95
L94:
	str	x0, [x1]
L95:
	str	x0, [x19]
	b	L99
L96:
	mov	x0, x20
	str	x0, [x19]
	b	L99
L98:
	mov	x0, x21
L99:
	ldr	x19, [x29, 40]
	ldr	x20, [x29, 32]
	ldr	x21, [x29, 24]
	mov sp, x29
	ldp	x29, x30, [sp], 48
	ret
/* end function donna_list_maximum */

.text
.balign 4
.globl _donna_list_is_sorted
_donna_list_is_sorted:
	hint	#34
	stp	x29, x30, [sp, -48]!
	mov	x29, sp
	str	x19, [x29, 40]
	str	x20, [x29, 32]
	str	x21, [x29, 24]
	mov	x1, x0
	ldr	x0, [x1]
	cmp	x0, #0
	beq	L111
	mov	x2, #16
	sub	sp, sp, x2
	mov	x2, sp
	cmp	x0, #1
	beq	L104
	mov	x0, #0
	str	x0, [x2]
	mov	x0, #0
	b	L105
L104:
	mov	x0, #16
	add	x0, x1, x0
	ldr	x0, [x0]
	ldr	x0, [x0]
	cmp	x0, #0
	cset	x0, eq
	mov	x3, #1
	and	x0, x0, x3
	str	x0, [x2]
L105:
	cmp	w0, #0
	bne	L110
	mov	x0, #8
	add	x0, x1, x0
	ldr	x0, [x0]
	mov	x2, #16
	add	x1, x1, x2
	ldr	x1, [x1]
	mov	x2, #8
	add	x2, x1, x2
	ldr	x21, [x2]
	mov	x2, #16
	add	x1, x1, x2
	ldr	x20, [x1]
	cmp	x0, x21
	cset	x0, le
	mov	x1, #16
	sub	sp, sp, x1
	mov	x19, sp
	cmp	x0, #1
	beq	L109
	mov	x0, #0
	str	x0, [x19]
	mov	x0, #0
	b	L112
L109:
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
	bl	_donna_list_is_sorted
	str	x0, [x19]
	b	L112
L110:
	mov	x0, #1
	b	L112
L111:
	mov	x0, #1
L112:
	ldr	x19, [x29, 40]
	ldr	x20, [x29, 32]
	ldr	x21, [x29, 24]
	mov sp, x29
	ldp	x29, x30, [sp], 48
	ret
/* end function donna_list_is_sorted */

.text
.balign 4
.globl _donna_list_map
_donna_list_map:
	hint	#34
	stp	x29, x30, [sp, -32]!
	mov	x29, sp
	str	x19, [x29, 24]
	str	x20, [x29, 16]
	ldr	x2, [x0]
	cmp	x2, #0
	beq	L115
	mov	x2, #8
	add	x2, x0, x2
	ldr	x19, [x2]
	mov	x2, #16
	add	x0, x0, x2
	ldr	x0, [x0]
	mov	x20, x1
	bl	_donna_list_map
	mov	x1, x20
	mov	x17, x0
	mov	x0, x19
	mov	x19, x17
	blr	x1
	mov	x20, x0
	mov	x0, #24
	bl	_malloc
	mov	x1, #1
	str	x1, [x0]
	mov	x1, #8
	add	x1, x0, x1
	str	x20, [x1]
	mov	x1, #16
	add	x1, x0, x1
	str	x19, [x1]
	b	L116
L115:
	adrp	x0, _donna_nil@page
	add	x0, x0, _donna_nil@pageoff
L116:
	ldr	x19, [x29, 24]
	ldr	x20, [x29, 16]
	ldp	x29, x30, [sp], 32
	ret
/* end function donna_list_map */

.text
.balign 4
.globl _donna_list_filter
_donna_list_filter:
	hint	#34
	stp	x29, x30, [sp, -48]!
	mov	x29, sp
	str	x19, [x29, 40]
	str	x20, [x29, 32]
	str	x21, [x29, 24]
	ldr	x2, [x0]
	cmp	x2, #0
	beq	L121
	mov	x2, #8
	add	x2, x0, x2
	ldr	x21, [x2]
	mov	x20, x1
	mov	x1, #16
	add	x0, x0, x1
	ldr	x0, [x0]
	mov	x19, x0
	mov	x0, x21
	blr	x20
	mov	x1, x20
	mov	x2, x0
	mov	x0, x19
	mov	x3, #16
	sub	sp, sp, x3
	mov	x19, sp
	cmp	x2, #1
	beq	L120
	bl	_donna_list_filter
	str	x0, [x19]
	b	L122
L120:
	bl	_donna_list_filter
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
	str	x0, [x19]
	b	L122
L121:
	adrp	x0, _donna_nil@page
	add	x0, x0, _donna_nil@pageoff
L122:
	ldr	x19, [x29, 40]
	ldr	x20, [x29, 32]
	ldr	x21, [x29, 24]
	mov sp, x29
	ldp	x29, x30, [sp], 48
	ret
/* end function donna_list_filter */

.text
.balign 4
.globl _donna_list_fold
_donna_list_fold:
	hint	#34
	stp	x29, x30, [sp, -32]!
	mov	x29, sp
	str	x19, [x29, 24]
	str	x20, [x29, 16]
	mov	x20, x2
	mov	x2, x0
	mov	x0, x1
	ldr	x1, [x2]
	cmp	x1, #0
	beq	L125
	mov	x1, #8
	add	x1, x2, x1
	ldr	x1, [x1]
	mov	x3, #16
	add	x2, x2, x3
	ldr	x19, [x2]
	blr	x20
	mov	x2, x20
	mov	x1, x0
	mov	x0, x19
	bl	_donna_list_fold
L125:
	ldr	x19, [x29, 24]
	ldr	x20, [x29, 16]
	ldp	x29, x30, [sp], 32
	ret
/* end function donna_list_fold */

.text
.balign 4
.globl _donna_list_fold_right
_donna_list_fold_right:
	hint	#34
	stp	x29, x30, [sp, -32]!
	mov	x29, sp
	str	x19, [x29, 24]
	str	x20, [x29, 16]
	ldr	x3, [x0]
	cmp	x3, #0
	beq	L128
	mov	x3, #8
	add	x3, x0, x3
	ldr	x19, [x3]
	mov	x3, #16
	add	x0, x0, x3
	ldr	x0, [x0]
	mov	x20, x2
	bl	_donna_list_fold_right
	mov	x2, x20
	mov	x1, x0
	mov	x0, x19
	blr	x2
	b	L129
L128:
	mov	x0, x1
L129:
	ldr	x19, [x29, 24]
	ldr	x20, [x29, 16]
	ldp	x29, x30, [sp], 32
	ret
/* end function donna_list_fold_right */

.text
.balign 4
.globl _donna_list_any
_donna_list_any:
	hint	#34
	stp	x29, x30, [sp, -32]!
	mov	x29, sp
	str	x19, [x29, 24]
	str	x20, [x29, 16]
	mov	x20, x1
	mov	x1, x0
	ldr	x0, [x1]
	cmp	x0, #0
	beq	L135
	mov	x0, #8
	add	x0, x1, x0
	ldr	x0, [x0]
	mov	x2, #16
	add	x1, x1, x2
	ldr	x19, [x1]
	blr	x20
	mov	x1, x20
	mov	x2, x0
	mov	x0, x19
	mov	x3, #16
	sub	sp, sp, x3
	mov	x19, sp
	cmp	x2, #1
	beq	L133
	bl	_donna_list_any
	str	x0, [x19]
	b	L136
L133:
	mov	x0, #1
	str	x0, [x19]
	mov	x0, #1
	b	L136
L135:
	mov	x0, #0
L136:
	ldr	x19, [x29, 24]
	ldr	x20, [x29, 16]
	mov sp, x29
	ldp	x29, x30, [sp], 32
	ret
/* end function donna_list_any */

.text
.balign 4
.globl _donna_list_all
_donna_list_all:
	hint	#34
	stp	x29, x30, [sp, -32]!
	mov	x29, sp
	str	x19, [x29, 24]
	str	x20, [x29, 16]
	mov	x20, x1
	mov	x1, x0
	ldr	x0, [x1]
	cmp	x0, #0
	beq	L142
	mov	x0, #8
	add	x0, x1, x0
	ldr	x0, [x0]
	mov	x2, #16
	add	x1, x1, x2
	ldr	x19, [x1]
	blr	x20
	mov	x1, x20
	mov	x2, x0
	mov	x0, x19
	mov	x3, #16
	sub	sp, sp, x3
	mov	x19, sp
	cmp	x2, #1
	beq	L141
	mov	x0, #0
	str	x0, [x19]
	mov	x0, #0
	b	L143
L141:
	bl	_donna_list_all
	str	x0, [x19]
	b	L143
L142:
	mov	x0, #1
L143:
	ldr	x19, [x29, 24]
	ldr	x20, [x29, 16]
	mov sp, x29
	ldp	x29, x30, [sp], 32
	ret
/* end function donna_list_all */

.text
.balign 4
.globl _donna_list_find
_donna_list_find:
	hint	#34
	stp	x29, x30, [sp, -48]!
	mov	x29, sp
	str	x19, [x29, 40]
	str	x20, [x29, 32]
	str	x21, [x29, 24]
	str	x22, [x29, 16]
	mov	x22, x1
	mov	x1, x0
	mov	x0, x2
	mov	x20, x0
	ldr	x0, [x1]
	cmp	x0, #0
	beq	L149
	mov	x0, #8
	add	x0, x1, x0
	ldr	x0, [x0]
	mov	x2, #16
	add	x1, x1, x2
	ldr	x21, [x1]
	mov	x19, x0
	blr	x22
	mov	x1, x22
	mov	x2, x0
	mov	x0, x19
	mov	x3, #16
	sub	sp, sp, x3
	mov	x19, sp
	cmp	x2, #1
	beq	L148
	mov	x0, x21
	mov	x2, x20
	bl	_donna_list_find
	str	x0, [x19]
	b	L150
L148:
	str	x0, [x19]
	b	L150
L149:
	mov	x0, x20
L150:
	ldr	x19, [x29, 40]
	ldr	x20, [x29, 32]
	ldr	x21, [x29, 24]
	ldr	x22, [x29, 16]
	mov sp, x29
	ldp	x29, x30, [sp], 48
	ret
/* end function donna_list_find */

.text
.balign 4
.globl _donna_list_flat_map
_donna_list_flat_map:
	hint	#34
	stp	x29, x30, [sp, -48]!
	mov	x29, sp
	str	x19, [x29, 40]
	str	x20, [x29, 32]
	str	x21, [x29, 24]
	mov	x20, x1
	mov	x1, x0
	ldr	x0, [x1]
	cmp	x0, #0
	beq	L155
	mov	x0, #8
	add	x0, x1, x0
	ldr	x0, [x0]
	mov	x2, #16
	add	x1, x1, x2
	ldr	x19, [x1]
	blr	x20
	mov	x1, x20
	mov	x2, x0
	mov	x0, x19
	mov	x3, #16
	sub	sp, sp, x3
	mov	x19, sp
	ldr	x3, [x2]
	cmp	x3, #0
	beq	L154
	mov	x3, #8
	add	x3, x2, x3
	ldr	x21, [x3]
	mov	x3, #16
	add	x2, x2, x3
	ldr	x20, [x2]
	bl	_donna_list_flat_map
	mov	x1, x0
	mov	x0, x20
	bl	_donna_list_flat_map_join
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
	str	x0, [x19]
	b	L156
L154:
	bl	_donna_list_flat_map
	str	x0, [x19]
	b	L156
L155:
	adrp	x0, _donna_nil@page
	add	x0, x0, _donna_nil@pageoff
L156:
	ldr	x19, [x29, 40]
	ldr	x20, [x29, 32]
	ldr	x21, [x29, 24]
	mov sp, x29
	ldp	x29, x30, [sp], 48
	ret
/* end function donna_list_flat_map */

.text
.balign 4
_donna_list_flat_map_join:
	hint	#34
	stp	x29, x30, [sp, -32]!
	mov	x29, sp
	str	x19, [x29, 24]
	str	x20, [x29, 16]
	ldr	x2, [x0]
	cmp	x2, #0
	beq	L159
	mov	x2, #8
	add	x2, x0, x2
	ldr	x20, [x2]
	mov	x2, #16
	add	x0, x0, x2
	ldr	x0, [x0]
	bl	_donna_list_flat_map_join
	mov	x19, x0
	mov	x0, #24
	bl	_malloc
	mov	x1, #1
	str	x1, [x0]
	mov	x1, #8
	add	x1, x0, x1
	str	x20, [x1]
	mov	x1, #16
	add	x1, x0, x1
	str	x19, [x1]
	b	L160
L159:
	mov	x0, x1
L160:
	ldr	x19, [x29, 24]
	ldr	x20, [x29, 16]
	ldp	x29, x30, [sp], 32
	ret
/* end function donna_list_flat_map_join */

.text
.balign 4
.globl _donna_list_count
_donna_list_count:
	hint	#34
	stp	x29, x30, [sp, -32]!
	mov	x29, sp
	str	x19, [x29, 24]
	str	x20, [x29, 16]
	mov	x20, x1
	mov	x1, x0
	ldr	x0, [x1]
	cmp	x0, #0
	beq	L165
	mov	x0, #8
	add	x0, x1, x0
	ldr	x0, [x0]
	mov	x2, #16
	add	x1, x1, x2
	ldr	x19, [x1]
	blr	x20
	mov	x1, x20
	mov	x2, x0
	mov	x0, x19
	mov	x3, #16
	sub	sp, sp, x3
	mov	x19, sp
	cmp	x2, #1
	beq	L164
	bl	_donna_list_count
	str	x0, [x19]
	b	L166
L164:
	bl	_donna_list_count
	mov	x1, #1
	add	x0, x0, x1
	str	x0, [x19]
	b	L166
L165:
	mov	x0, #0
L166:
	ldr	x19, [x29, 24]
	ldr	x20, [x29, 16]
	mov sp, x29
	ldp	x29, x30, [sp], 32
	ret
/* end function donna_list_count */

.text
.balign 4
.globl _donna_list_zip_with
_donna_list_zip_with:
	hint	#34
	stp	x29, x30, [sp, -48]!
	mov	x29, sp
	str	x19, [x29, 40]
	str	x20, [x29, 32]
	str	x21, [x29, 24]
	str	x22, [x29, 16]
	ldr	x3, [x0]
	cmp	x3, #0
	beq	L172
	mov	x3, #8
	add	x3, x0, x3
	ldr	x20, [x3]
	mov	x3, #16
	add	x0, x0, x3
	ldr	x0, [x0]
	mov	x3, #16
	sub	sp, sp, x3
	mov	x19, sp
	ldr	x3, [x1]
	cmp	x3, #0
	beq	L170
	mov	x3, #8
	add	x3, x1, x3
	ldr	x21, [x3]
	mov	x3, #16
	add	x1, x1, x3
	ldr	x1, [x1]
	mov	x22, x2
	bl	_donna_list_zip_with
	mov	x2, x22
	mov	x1, x21
	mov	x17, x0
	mov	x0, x20
	mov	x20, x17
	blr	x2
	mov	x21, x0
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
	str	x0, [x19]
	b	L173
L170:
	adrp	x0, _donna_nil@page
	add	x0, x0, _donna_nil@pageoff
	str	x0, [x19]
	adrp	x0, _donna_nil@page
	add	x0, x0, _donna_nil@pageoff
	b	L173
L172:
	adrp	x0, _donna_nil@page
	add	x0, x0, _donna_nil@pageoff
L173:
	ldr	x19, [x29, 40]
	ldr	x20, [x29, 32]
	ldr	x21, [x29, 24]
	ldr	x22, [x29, 16]
	mov sp, x29
	ldp	x29, x30, [sp], 48
	ret
/* end function donna_list_zip_with */

.text
.balign 4
.globl _donna_list_each
_donna_list_each:
	hint	#34
	stp	x29, x30, [sp, -32]!
	mov	x29, sp
	str	x19, [x29, 24]
	str	x20, [x29, 16]
	mov	x20, x1
	mov	x1, x0
	ldr	x0, [x1]
	cmp	x0, #0
	beq	L176
	mov	x0, #8
	add	x0, x1, x0
	ldr	x0, [x0]
	mov	x2, #16
	add	x1, x1, x2
	ldr	x19, [x1]
	blr	x20
	mov	x1, x20
	mov	x0, x19
	bl	_donna_list_each
L176:
	mov	w0, #0
	ldr	x19, [x29, 24]
	ldr	x20, [x29, 16]
	ldp	x29, x30, [sp], 32
	ret
/* end function donna_list_each */

