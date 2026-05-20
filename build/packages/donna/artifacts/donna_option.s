.data
.balign 8
.globl _donna_option_None
_donna_option_None:
	.quad 0
/* end data */

.data
.balign 8
_donna_nil:
	.quad 0
/* end data */

.text
.balign 4
.globl _donna_option_Some
_donna_option_Some:
	hint	#34
	stp	x29, x30, [sp, -32]!
	mov	x29, sp
	str	x19, [x29, 24]
	mov	x19, x0
	mov	x0, #16
	bl	_malloc
	mov	x1, #1
	str	x1, [x0]
	mov	x1, #8
	add	x1, x0, x1
	str	x19, [x1]
	ldr	x19, [x29, 24]
	ldp	x29, x30, [sp], 32
	ret
/* end function donna_option_Some */

.text
.balign 4
.globl _donna_option_is_some
_donna_option_is_some:
	hint	#34
	stp	x29, x30, [sp, -16]!
	mov	x29, sp
	ldr	x0, [x0]
	cmp	x0, #0
	beq	L4
	mov	x0, #1
	b	L5
L4:
	mov	x0, #0
L5:
	ldp	x29, x30, [sp], 16
	ret
/* end function donna_option_is_some */

.text
.balign 4
.globl _donna_option_is_none
_donna_option_is_none:
	hint	#34
	stp	x29, x30, [sp, -16]!
	mov	x29, sp
	ldr	x0, [x0]
	cmp	x0, #0
	beq	L8
	mov	x0, #0
	b	L9
L8:
	mov	x0, #1
L9:
	ldp	x29, x30, [sp], 16
	ret
/* end function donna_option_is_none */

.text
.balign 4
.globl _donna_option_unwrap
_donna_option_unwrap:
	hint	#34
	stp	x29, x30, [sp, -16]!
	mov	x29, sp
	ldr	x2, [x0]
	cmp	x2, #0
	beq	L12
	mov	x1, #8
	add	x0, x0, x1
	ldr	x0, [x0]
	b	L13
L12:
	mov	x0, x1
L13:
	ldp	x29, x30, [sp], 16
	ret
/* end function donna_option_unwrap */

.text
.balign 4
.globl _donna_option_map
_donna_option_map:
	hint	#34
	stp	x29, x30, [sp, -32]!
	mov	x29, sp
	str	x19, [x29, 24]
	ldr	x2, [x0]
	cmp	x2, #0
	beq	L16
	mov	x2, #8
	add	x0, x0, x2
	ldr	x0, [x0]
	blr	x1
	mov	x19, x0
	mov	x0, #16
	bl	_malloc
	mov	x1, #1
	str	x1, [x0]
	mov	x1, #8
	add	x1, x0, x1
	str	x19, [x1]
	b	L17
L16:
	adrp	x0, _donna_option_None@page
	add	x0, x0, _donna_option_None@pageoff
L17:
	ldr	x19, [x29, 24]
	ldp	x29, x30, [sp], 32
	ret
/* end function donna_option_map */

.text
.balign 4
.globl _donna_option_then
_donna_option_then:
	hint	#34
	stp	x29, x30, [sp, -16]!
	mov	x29, sp
	ldr	x2, [x0]
	cmp	x2, #0
	beq	L20
	mov	x2, #8
	add	x0, x0, x2
	ldr	x0, [x0]
	blr	x1
	b	L21
L20:
	adrp	x0, _donna_option_None@page
	add	x0, x0, _donna_option_None@pageoff
L21:
	ldp	x29, x30, [sp], 16
	ret
/* end function donna_option_then */

.text
.balign 4
.globl _donna_option_or
_donna_option_or:
	hint	#34
	stp	x29, x30, [sp, -16]!
	mov	x29, sp
	ldr	x2, [x0]
	cmp	x2, #0
	bne	L24
	mov	x0, x1
L24:
	ldp	x29, x30, [sp], 16
	ret
/* end function donna_option_or */

.text
.balign 4
.globl _donna_option_lazy_unwrap
_donna_option_lazy_unwrap:
	hint	#34
	stp	x29, x30, [sp, -16]!
	mov	x29, sp
	ldr	x2, [x0]
	cmp	x2, #0
	beq	L27
	mov	x1, #8
	add	x0, x0, x1
	ldr	x0, [x0]
	b	L28
L27:
	blr	x1
L28:
	ldp	x29, x30, [sp], 16
	ret
/* end function donna_option_lazy_unwrap */

.text
.balign 4
.globl _donna_option_filter
_donna_option_filter:
	hint	#34
	stp	x29, x30, [sp, -32]!
	mov	x29, sp
	str	x19, [x29, 24]
	str	x20, [x29, 16]
	ldr	x2, [x0]
	cmp	x2, #0
	beq	L34
	mov	x2, #8
	add	x0, x0, x2
	ldr	x20, [x0]
	mov	x0, x20
	blr	x1
	mov	x1, #16
	sub	sp, sp, x1
	mov	x19, sp
	cmp	x0, #1
	beq	L33
	adrp	x0, _donna_option_None@page
	add	x0, x0, _donna_option_None@pageoff
	str	x0, [x19]
	adrp	x0, _donna_option_None@page
	add	x0, x0, _donna_option_None@pageoff
	b	L35
L33:
	mov	x0, #16
	bl	_malloc
	mov	x1, #1
	str	x1, [x0]
	mov	x1, #8
	add	x1, x0, x1
	str	x20, [x1]
	str	x0, [x19]
	b	L35
L34:
	adrp	x0, _donna_option_None@page
	add	x0, x0, _donna_option_None@pageoff
L35:
	ldr	x19, [x29, 24]
	ldr	x20, [x29, 16]
	mov sp, x29
	ldp	x29, x30, [sp], 32
	ret
/* end function donna_option_filter */

.text
.balign 4
.globl _donna_option_to_list
_donna_option_to_list:
	hint	#34
	stp	x29, x30, [sp, -32]!
	mov	x29, sp
	str	x19, [x29, 24]
	ldr	x1, [x0]
	cmp	x1, #0
	beq	L38
	mov	x1, #8
	add	x0, x0, x1
	ldr	x19, [x0]
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
	b	L39
L38:
	adrp	x0, _donna_nil@page
	add	x0, x0, _donna_nil@pageoff
L39:
	ldr	x19, [x29, 24]
	ldp	x29, x30, [sp], 32
	ret
/* end function donna_option_to_list */

