.data
.balign 8
_str5:
	.ascii ""
	.byte 0
/* end data */

.data
.balign 8
_str7:
	.ascii "fail: "
	.byte 0
/* end data */

.data
.balign 8
_str10:
	.ascii "expected equal Int values"
	.byte 0
/* end data */

.data
.balign 8
_str14:
	.ascii "expected equal String values"
	.byte 0
/* end data */

.data
.balign 8
_str16:
	.ascii "expected True"
	.byte 0
/* end data */

.data
.balign 8
_str19:
	.ascii "expected False"
	.byte 0
/* end data */

.text
.balign 4
_donna_test_should_ok:
	hint	#34
	stp	x29, x30, [sp, -16]!
	mov	x29, sp
	mov	x17, x1
	mov	x1, x0
	mov	x0, x17
	cmp	x1, #1
	bne	L2
	adrp	x0, _str5@page
	add	x0, x0, _str5@pageoff
L2:
	ldp	x29, x30, [sp], 16
	ret
/* end function donna_test_should_ok */

.text
.balign 4
.globl _donna_test_should_fail
_donna_test_should_fail:
	hint	#34
	stp	x29, x30, [sp, -16]!
	mov	x29, sp
	mov	x1, x0
	adrp	x0, _str7@page
	add	x0, x0, _str7@pageoff
	bl	___rt_str_concat
	ldp	x29, x30, [sp], 16
	ret
/* end function donna_test_should_fail */

.text
.balign 4
.globl _donna_test_should_equal_int
_donna_test_should_equal_int:
	hint	#34
	stp	x29, x30, [sp, -16]!
	mov	x29, sp
	cmp	x0, x1
	cset	x0, eq
	adrp	x1, _str10@page
	add	x1, x1, _str10@pageoff
	bl	_donna_test_should_ok
	ldp	x29, x30, [sp], 16
	ret
/* end function donna_test_should_equal_int */

.text
.balign 4
.globl _donna_test_should_equal_string
_donna_test_should_equal_string:
	hint	#34
	stp	x29, x30, [sp, -16]!
	mov	x29, sp
	bl	_strcmp
	cmp	x0, #0
	cset	x0, eq
	adrp	x1, _str14@page
	add	x1, x1, _str14@pageoff
	bl	_donna_test_should_ok
	ldp	x29, x30, [sp], 16
	ret
/* end function donna_test_should_equal_string */

.text
.balign 4
.globl _donna_test_should_be_true
_donna_test_should_be_true:
	hint	#34
	stp	x29, x30, [sp, -16]!
	mov	x29, sp
	adrp	x1, _str16@page
	add	x1, x1, _str16@pageoff
	bl	_donna_test_should_ok
	ldp	x29, x30, [sp], 16
	ret
/* end function donna_test_should_be_true */

.text
.balign 4
.globl _donna_test_should_be_false
_donna_test_should_be_false:
	hint	#34
	stp	x29, x30, [sp, -16]!
	mov	x29, sp
	mov	x1, #1
	eor	x0, x0, x1
	adrp	x1, _str19@page
	add	x1, x1, _str19@pageoff
	bl	_donna_test_should_ok
	ldp	x29, x30, [sp], 16
	ret
/* end function donna_test_should_be_false */

.text
.balign 4
.globl _donna_test_should_is_true
_donna_test_should_is_true:
	hint	#34
	stp	x29, x30, [sp, -16]!
	mov	x29, sp
	bl	_donna_test_should_be_true
	ldp	x29, x30, [sp], 16
	ret
/* end function donna_test_should_is_true */

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

