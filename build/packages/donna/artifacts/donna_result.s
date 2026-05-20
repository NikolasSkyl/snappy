.data
.balign 8
_donna_nil:
	.quad 0
/* end data */

.text
.balign 4
.globl _donna_result_Ok
_donna_result_Ok:
	hint	#34
	stp	x29, x30, [sp, -32]!
	mov	x29, sp
	str	x19, [x29, 24]
	mov	x19, x0
	mov	x0, #16
	bl	_malloc
	mov	x1, #0
	str	x1, [x0]
	mov	x1, #8
	add	x1, x0, x1
	str	x19, [x1]
	ldr	x19, [x29, 24]
	ldp	x29, x30, [sp], 32
	ret
/* end function donna_result_Ok */

.text
.balign 4
.globl _donna_result_Error
_donna_result_Error:
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
/* end function donna_result_Error */

.text
.balign 4
.globl _donna_result_is_ok
_donna_result_is_ok:
	hint	#34
	stp	x29, x30, [sp, -16]!
	mov	x29, sp
	ldr	x0, [x0]
	cmp	x0, #0
	beq	L6
	mov	x0, #0
	b	L7
L6:
	mov	x0, #1
L7:
	ldp	x29, x30, [sp], 16
	ret
/* end function donna_result_is_ok */

.text
.balign 4
.globl _donna_result_is_error
_donna_result_is_error:
	hint	#34
	stp	x29, x30, [sp, -16]!
	mov	x29, sp
	ldr	x0, [x0]
	cmp	x0, #0
	beq	L10
	mov	x0, #1
	b	L11
L10:
	mov	x0, #0
L11:
	ldp	x29, x30, [sp], 16
	ret
/* end function donna_result_is_error */

.text
.balign 4
.globl _donna_result_unwrap
_donna_result_unwrap:
	hint	#34
	stp	x29, x30, [sp, -16]!
	mov	x29, sp
	ldr	x2, [x0]
	cmp	x2, #0
	beq	L14
	mov	x0, x1
	b	L15
L14:
	mov	x1, #8
	add	x0, x0, x1
	ldr	x0, [x0]
L15:
	ldp	x29, x30, [sp], 16
	ret
/* end function donna_result_unwrap */

.text
.balign 4
.globl _donna_result_unwrap_error
_donna_result_unwrap_error:
	hint	#34
	stp	x29, x30, [sp, -16]!
	mov	x29, sp
	ldr	x2, [x0]
	cmp	x2, #0
	beq	L18
	mov	x1, #8
	add	x0, x0, x1
	ldr	x0, [x0]
	b	L19
L18:
	mov	x0, x1
L19:
	ldp	x29, x30, [sp], 16
	ret
/* end function donna_result_unwrap_error */

.text
.balign 4
.globl _donna_result_map
_donna_result_map:
	hint	#34
	stp	x29, x30, [sp, -32]!
	mov	x29, sp
	str	x19, [x29, 24]
	ldr	x2, [x0]
	cmp	x2, #0
	beq	L22
	mov	x1, #8
	add	x0, x0, x1
	ldr	x19, [x0]
	mov	x0, #16
	bl	_malloc
	mov	x1, #1
	str	x1, [x0]
	mov	x1, #8
	add	x1, x0, x1
	str	x19, [x1]
	b	L23
L22:
	mov	x2, #8
	add	x0, x0, x2
	ldr	x0, [x0]
	blr	x1
	mov	x19, x0
	mov	x0, #16
	bl	_malloc
	mov	x1, #0
	str	x1, [x0]
	mov	x1, #8
	add	x1, x0, x1
	str	x19, [x1]
L23:
	ldr	x19, [x29, 24]
	ldp	x29, x30, [sp], 32
	ret
/* end function donna_result_map */

.text
.balign 4
.globl _donna_result_map_error
_donna_result_map_error:
	hint	#34
	stp	x29, x30, [sp, -32]!
	mov	x29, sp
	str	x19, [x29, 24]
	ldr	x2, [x0]
	cmp	x2, #0
	beq	L26
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
	b	L27
L26:
	mov	x1, #8
	add	x0, x0, x1
	ldr	x19, [x0]
	mov	x0, #16
	bl	_malloc
	mov	x1, #0
	str	x1, [x0]
	mov	x1, #8
	add	x1, x0, x1
	str	x19, [x1]
L27:
	ldr	x19, [x29, 24]
	ldp	x29, x30, [sp], 32
	ret
/* end function donna_result_map_error */

.text
.balign 4
.globl _donna_result_then
_donna_result_then:
	hint	#34
	stp	x29, x30, [sp, -32]!
	mov	x29, sp
	str	x19, [x29, 24]
	ldr	x2, [x0]
	cmp	x2, #0
	beq	L30
	mov	x1, #8
	add	x0, x0, x1
	ldr	x19, [x0]
	mov	x0, #16
	bl	_malloc
	mov	x1, #1
	str	x1, [x0]
	mov	x1, #8
	add	x1, x0, x1
	str	x19, [x1]
	b	L31
L30:
	mov	x2, #8
	add	x0, x0, x2
	ldr	x0, [x0]
	blr	x1
L31:
	ldr	x19, [x29, 24]
	ldp	x29, x30, [sp], 32
	ret
/* end function donna_result_then */

.text
.balign 4
.globl _donna_result_or
_donna_result_or:
	hint	#34
	stp	x29, x30, [sp, -16]!
	mov	x29, sp
	ldr	x2, [x0]
	cmp	x2, #0
	beq	L34
	mov	x0, x1
L34:
	ldp	x29, x30, [sp], 16
	ret
/* end function donna_result_or */

.text
.balign 4
.globl _donna_result_to_list
_donna_result_to_list:
	hint	#34
	stp	x29, x30, [sp, -32]!
	mov	x29, sp
	str	x19, [x29, 24]
	ldr	x1, [x0]
	cmp	x1, #0
	beq	L37
	adrp	x0, _donna_nil@page
	add	x0, x0, _donna_nil@pageoff
	b	L38
L37:
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
L38:
	ldr	x19, [x29, 24]
	ldp	x29, x30, [sp], 32
	ret
/* end function donna_result_to_list */

