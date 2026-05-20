.data
.balign 8
_str0:
	.ascii "snapshots/test_create.snap"
	.byte 0
/* end data */

.data
.balign 8
_str2:
	.ascii "snapshots/test_create.snap.new"
	.byte 0
/* end data */

.data
.balign 8
_str4:
	.ascii "hello"
	.byte 0
/* end data */

.data
.balign 8
_str5:
	.ascii "test_create"
	.byte 0
/* end data */

.data
.balign 8
_str7:
	.ascii "snapshots/test_create.snap.new"
	.byte 0
/* end data */

.data
.balign 8
_str15:
	.ascii "snappy.snap should have reported new snapshot"
	.byte 0
/* end data */

.data
.balign 8
_str16:
	.ascii ""
	.byte 0
/* end data */

.data
.balign 8
_str18:
	.ascii "snapshots/test_match.snap.new"
	.byte 0
/* end data */

.data
.balign 8
_str20:
	.ascii "snapshots/test_match.snap"
	.byte 0
/* end data */

.data
.balign 8
_str21:
	.ascii "hello"
	.byte 0
/* end data */

.data
.balign 8
_str23:
	.ascii "hello"
	.byte 0
/* end data */

.data
.balign 8
_str24:
	.ascii "test_match"
	.byte 0
/* end data */

.data
.balign 8
_str32:
	.ascii "snappy.snap should have matched: "
	.byte 0
/* end data */

.data
.balign 8
_str34:
	.ascii ""
	.byte 0
/* end data */

.data
.balign 8
_str36:
	.ascii "snapshots/test_mismatch.snap.new"
	.byte 0
/* end data */

.data
.balign 8
_str38:
	.ascii "snapshots/test_mismatch.snap"
	.byte 0
/* end data */

.data
.balign 8
_str39:
	.ascii "hello"
	.byte 0
/* end data */

.data
.balign 8
_str41:
	.ascii "world"
	.byte 0
/* end data */

.data
.balign 8
_str42:
	.ascii "test_mismatch"
	.byte 0
/* end data */

.data
.balign 8
_str44:
	.ascii "snapshots/test_mismatch.snap.new"
	.byte 0
/* end data */

.data
.balign 8
_str52:
	.ascii "snappy.snap should have reported mismatch"
	.byte 0
/* end data */

.data
.balign 8
_str53:
	.ascii ""
	.byte 0
/* end data */

.text
.balign 4
.globl _test_snappy_test_snap_create_test
_test_snappy_test_snap_create_test:
	hint	#34
	stp	x29, x30, [sp, -32]!
	mov	x29, sp
	str	x19, [x29, 24]
	adrp	x0, _str0@page
	add	x0, x0, _str0@pageoff
	bl	_donna_files_delete
	adrp	x0, _str2@page
	add	x0, x0, _str2@pageoff
	bl	_donna_files_delete
	adrp	x1, _str5@page
	add	x1, x1, _str5@pageoff
	adrp	x0, _str4@page
	add	x0, x0, _str4@pageoff
	bl	_snappy_snap
	mov	x19, x0
	adrp	x0, _str7@page
	add	x0, x0, _str7@pageoff
	bl	_donna_files_delete
	mov	x0, x19
	bl	_donna_string_is_empty
	cmp	x0, #1
	beq	L2
	adrp	x0, _str16@page
	add	x0, x0, _str16@pageoff
	b	L3
L2:
	adrp	x0, _str15@page
	add	x0, x0, _str15@pageoff
L3:
	ldr	x19, [x29, 24]
	ldp	x29, x30, [sp], 32
	ret
/* end function test_snappy_test_snap_create_test */

.text
.balign 4
.globl _test_snappy_test_snap_match_test
_test_snappy_test_snap_match_test:
	hint	#34
	stp	x29, x30, [sp, -32]!
	mov	x29, sp
	str	x19, [x29, 24]
	adrp	x0, _str18@page
	add	x0, x0, _str18@pageoff
	bl	_donna_files_delete
	adrp	x1, _str21@page
	add	x1, x1, _str21@pageoff
	adrp	x0, _str20@page
	add	x0, x0, _str20@pageoff
	bl	_donna_files_write
	adrp	x1, _str24@page
	add	x1, x1, _str24@pageoff
	adrp	x0, _str23@page
	add	x0, x0, _str23@pageoff
	bl	_snappy_snap
	mov	x19, x0
	mov	x0, x19
	bl	_donna_string_is_empty
	mov	x1, x19
	cmp	x0, #0
	beq	L6
	adrp	x0, _str34@page
	add	x0, x0, _str34@pageoff
	b	L7
L6:
	adrp	x0, _str32@page
	add	x0, x0, _str32@pageoff
	bl	___rt_str_concat
L7:
	ldr	x19, [x29, 24]
	ldp	x29, x30, [sp], 32
	ret
/* end function test_snappy_test_snap_match_test */

.text
.balign 4
.globl _test_snappy_test_snap_mismatch_test
_test_snappy_test_snap_mismatch_test:
	hint	#34
	stp	x29, x30, [sp, -32]!
	mov	x29, sp
	str	x19, [x29, 24]
	adrp	x0, _str36@page
	add	x0, x0, _str36@pageoff
	bl	_donna_files_delete
	adrp	x1, _str39@page
	add	x1, x1, _str39@pageoff
	adrp	x0, _str38@page
	add	x0, x0, _str38@pageoff
	bl	_donna_files_write
	adrp	x1, _str42@page
	add	x1, x1, _str42@pageoff
	adrp	x0, _str41@page
	add	x0, x0, _str41@pageoff
	bl	_snappy_snap
	mov	x19, x0
	adrp	x0, _str44@page
	add	x0, x0, _str44@pageoff
	bl	_donna_files_delete
	mov	x0, x19
	bl	_donna_string_is_empty
	cmp	x0, #1
	beq	L10
	adrp	x0, _str53@page
	add	x0, x0, _str53@pageoff
	b	L11
L10:
	adrp	x0, _str52@page
	add	x0, x0, _str52@pageoff
L11:
	ldr	x19, [x29, 24]
	ldp	x29, x30, [sp], 32
	ret
/* end function test_snappy_test_snap_mismatch_test */

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

