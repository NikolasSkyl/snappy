.data
.balign 8
_str36:
	.ascii "True"
	.byte 0
/* end data */

.data
.balign 8
_str37:
	.ascii "False"
	.byte 0
/* end data */

.text
.balign 4
.globl _donna_bool_not
_donna_bool_not:
	hint	#34
	stp	x29, x30, [sp, -16]!
	mov	x29, sp
	cmp	x0, #1
	beq	L2
	mov	x0, #1
	b	L3
L2:
	mov	x0, #0
L3:
	ldp	x29, x30, [sp], 16
	ret
/* end function donna_bool_not */

.text
.balign 4
.globl _donna_bool_and
_donna_bool_and:
	hint	#34
	stp	x29, x30, [sp, -16]!
	mov	x29, sp
	mov	x17, x1
	mov	x1, x0
	mov	x0, x17
	cmp	x1, #1
	beq	L6
	mov	x0, #0
L6:
	ldp	x29, x30, [sp], 16
	ret
/* end function donna_bool_and */

.text
.balign 4
.globl _donna_bool_or
_donna_bool_or:
	hint	#34
	stp	x29, x30, [sp, -16]!
	mov	x29, sp
	mov	x17, x1
	mov	x1, x0
	mov	x0, x17
	cmp	x1, #1
	bne	L9
	mov	x0, #1
L9:
	ldp	x29, x30, [sp], 16
	ret
/* end function donna_bool_or */

.text
.balign 4
.globl _donna_bool_xor
_donna_bool_xor:
	hint	#34
	stp	x29, x30, [sp, -16]!
	mov	x29, sp
	mov	x17, x1
	mov	x1, x0
	mov	x0, x17
	cmp	x1, #1
	bne	L12
	bl	_donna_bool_not
L12:
	ldp	x29, x30, [sp], 16
	ret
/* end function donna_bool_xor */

.text
.balign 4
.globl _donna_bool_to_int
_donna_bool_to_int:
	hint	#34
	stp	x29, x30, [sp, -16]!
	mov	x29, sp
	cmp	x0, #1
	beq	L15
	mov	x0, #0
	b	L16
L15:
	mov	x0, #1
L16:
	ldp	x29, x30, [sp], 16
	ret
/* end function donna_bool_to_int */

.text
.balign 4
.globl _donna_bool_to_string
_donna_bool_to_string:
	hint	#34
	stp	x29, x30, [sp, -16]!
	mov	x29, sp
	cmp	x0, #1
	beq	L19
	adrp	x0, _str37@page
	add	x0, x0, _str37@pageoff
	b	L20
L19:
	adrp	x0, _str36@page
	add	x0, x0, _str36@pageoff
L20:
	ldp	x29, x30, [sp], 16
	ret
/* end function donna_bool_to_string */

.text
.balign 4
.globl _donna_bool_guard
_donna_bool_guard:
	hint	#34
	stp	x29, x30, [sp, -16]!
	mov	x29, sp
	mov	x17, x1
	mov	x1, x0
	mov	x0, x17
	mov	x17, x2
	mov	x2, x1
	mov	x1, x17
	cmp	x2, #1
	beq	L23
	mov	x0, x1
L23:
	ldp	x29, x30, [sp], 16
	ret
/* end function donna_bool_guard */

