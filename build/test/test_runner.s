.data
.balign 8
_str5:
	.ascii "0"
	.byte 0
/* end data */

.data
.balign 8
_str9:
	.ascii "1"
	.byte 0
/* end data */

.data
.balign 8
_str13:
	.ascii "2"
	.byte 0
/* end data */

.data
.balign 8
_str17:
	.ascii "3"
	.byte 0
/* end data */

.data
.balign 8
_str21:
	.ascii "4"
	.byte 0
/* end data */

.data
.balign 8
_str25:
	.ascii "5"
	.byte 0
/* end data */

.data
.balign 8
_str29:
	.ascii "6"
	.byte 0
/* end data */

.data
.balign 8
_str33:
	.ascii "7"
	.byte 0
/* end data */

.data
.balign 8
_str37:
	.ascii "8"
	.byte 0
/* end data */

.data
.balign 8
_str38:
	.ascii "9"
	.byte 0
/* end data */

.data
.balign 8
_str61:
	.ascii "-"
	.byte 0
/* end data */

.data
.balign 8
_str80:
	.ascii "<1us"
	.byte 0
/* end data */

.data
.balign 8
_str88:
	.ascii "us"
	.byte 0
/* end data */

.data
.balign 8
_str101:
	.ascii "."
	.byte 0
/* end data */

.data
.balign 8
_str105:
	.ascii "ms"
	.byte 0
/* end data */

.data
.balign 8
_str112:
	.ascii "."
	.byte 0
/* end data */

.data
.balign 8
_str116:
	.ascii "s"
	.byte 0
/* end data */

.data
.balign 8
_donna_nil:
	.quad 0
/* end data */

.data
.balign 8
_str151:
	.ascii ""
	.byte 0
/* end data */

.data
.balign 8
_str173:
	.ascii "  "
	.byte 0
/* end data */

.data
.balign 8
_str182:
	.ascii ""
	.byte 0
/* end data */

.data
.balign 8
_str183:
	.byte 27
	.ascii "[31mFailures:"
	.byte 27
	.ascii "[0m"
	.byte 0
/* end data */

.data
.balign 8
_str187:
	.ascii ""
	.byte 0
/* end data */

.data
.balign 8
_str195:
	.byte 27
	.ascii "[32m"
	.byte 194
	.byte 183
	.ascii "pass"
	.byte 27
	.ascii "[0m "
	.byte 0
/* end data */

.data
.balign 8
_str197:
	.ascii " "
	.byte 0
/* end data */

.data
.balign 8
_str200:
	.byte 27
	.ascii "[31m"
	.byte 194
	.byte 183
	.ascii "FAIL"
	.byte 27
	.ascii "[0m "
	.byte 0
/* end data */

.data
.balign 8
_str202:
	.ascii " "
	.byte 0
/* end data */

.data
.balign 8
_str216:
	.ascii "snappy_test.snap_create_test"
	.byte 0
/* end data */

.data
.balign 8
_str224:
	.ascii "snappy_test.snap_match_test"
	.byte 0
/* end data */

.data
.balign 8
_str232:
	.ascii "snappy_test.snap_mismatch_test"
	.byte 0
/* end data */

.data
.balign 8
_str261:
	.byte 27
	.ascii "[32m"
	.byte 0
/* end data */

.data
.balign 8
_str264:
	.ascii " passed"
	.byte 27
	.ascii "[0m, no failures in "
	.byte 0
/* end data */

.data
.balign 8
_str267:
	.byte 27
	.ascii "[32m"
	.byte 0
/* end data */

.data
.balign 8
_str270:
	.ascii " passed"
	.byte 27
	.ascii "[0m, "
	.byte 27
	.ascii "[31m"
	.byte 0
/* end data */

.data
.balign 8
_str274:
	.ascii " failed"
	.byte 27
	.ascii "[0m in "
	.byte 0
/* end data */

.text
.balign 4
_test_runner_digit_char:
	hint	#34
	stp	x29, x30, [sp, -16]!
	mov	x29, sp
	cmp	x0, #0
	beq	L18
	cmp	x0, #1
	beq	L17
	cmp	x0, #2
	beq	L16
	cmp	x0, #3
	beq	L15
	cmp	x0, #4
	beq	L14
	cmp	x0, #5
	beq	L13
	cmp	x0, #6
	beq	L12
	cmp	x0, #7
	beq	L11
	cmp	x0, #8
	beq	L10
	adrp	x0, _str38@page
	add	x0, x0, _str38@pageoff
	b	L19
L10:
	adrp	x0, _str37@page
	add	x0, x0, _str37@pageoff
	b	L19
L11:
	adrp	x0, _str33@page
	add	x0, x0, _str33@pageoff
	b	L19
L12:
	adrp	x0, _str29@page
	add	x0, x0, _str29@pageoff
	b	L19
L13:
	adrp	x0, _str25@page
	add	x0, x0, _str25@pageoff
	b	L19
L14:
	adrp	x0, _str21@page
	add	x0, x0, _str21@pageoff
	b	L19
L15:
	adrp	x0, _str17@page
	add	x0, x0, _str17@pageoff
	b	L19
L16:
	adrp	x0, _str13@page
	add	x0, x0, _str13@pageoff
	b	L19
L17:
	adrp	x0, _str9@page
	add	x0, x0, _str9@pageoff
	b	L19
L18:
	adrp	x0, _str5@page
	add	x0, x0, _str5@pageoff
L19:
	ldp	x29, x30, [sp], 16
	ret
/* end function test_runner_digit_char */

.text
.balign 4
_test_runner_pos_int_to_str:
	hint	#34
	stp	x29, x30, [sp, -32]!
	mov	x29, sp
	str	x19, [x29, 24]
	cmp	x0, #10
	cset	x1, lt
	cmp	x1, #1
	beq	L22
	mov	x19, x0
	mov	x0, #10
	sdiv	x0, x19, x0
	bl	_test_runner_pos_int_to_str
	mov	x17, x0
	mov	x0, x19
	mov	x19, x17
	mov	x1, #10
	sdiv	x1, x0, x1
	mov	x2, #10
	mul	x1, x1, x2
	sub	x0, x0, x1
	bl	_test_runner_digit_char
	mov	x1, x0
	mov	x0, x19
	bl	___rt_str_concat
	b	L23
L22:
	bl	_test_runner_digit_char
L23:
	ldr	x19, [x29, 24]
	ldp	x29, x30, [sp], 32
	ret
/* end function test_runner_pos_int_to_str */

.text
.balign 4
_test_runner_int_to_str:
	hint	#34
	stp	x29, x30, [sp, -16]!
	mov	x29, sp
	cmp	x0, #0
	cset	x1, lt
	cmp	x1, #1
	beq	L26
	bl	_test_runner_pos_int_to_str
	b	L27
L26:
	mov	x1, #0
	sub	x0, x1, x0
	bl	_test_runner_pos_int_to_str
	mov	x1, x0
	adrp	x0, _str61@page
	add	x0, x0, _str61@pageoff
	bl	___rt_str_concat
L27:
	ldp	x29, x30, [sp], 16
	ret
/* end function test_runner_int_to_str */

.text
.balign 4
_test_runner_two_digits:
	hint	#34
	stp	x29, x30, [sp, -32]!
	mov	x29, sp
	str	x19, [x29, 24]
	mov	x19, x0
	mov	x0, #10
	sdiv	x0, x19, x0
	bl	_test_runner_digit_char
	mov	x17, x0
	mov	x0, x19
	mov	x19, x17
	mov	x1, #10
	sdiv	x1, x0, x1
	mov	x2, #10
	mul	x1, x1, x2
	sub	x0, x0, x1
	bl	_test_runner_digit_char
	mov	x1, x0
	mov	x0, x19
	bl	___rt_str_concat
	ldr	x19, [x29, 24]
	ldp	x29, x30, [sp], 32
	ret
/* end function test_runner_two_digits */

.text
.balign 4
_test_runner_format_us:
	hint	#34
	stp	x29, x30, [sp, -48]!
	mov	x29, sp
	str	x19, [x29, 40]
	str	x20, [x29, 32]
	str	x21, [x29, 24]
	cmp	x0, #0
	cset	x1, le
	cmp	x1, #1
	beq	L37
	cmp	x0, #1000
	cset	x1, lt
	mov	x2, #16
	sub	sp, sp, x2
	mov	x19, sp
	cmp	x1, #1
	beq	L36
	mov	x1, #16960
	movk	x1, #0xf, lsl #16
	cmp	x0, x1
	cset	x1, lt
	mov	x2, #16
	sub	sp, sp, x2
	mov	x20, sp
	cmp	x1, #1
	beq	L34
	mov	x1, x0
	mov	x0, #16960
	movk	x0, #0xf, lsl #16
	sdiv	x0, x1, x0
	mov	x2, #16960
	movk	x2, #0xf, lsl #16
	mul	x2, x0, x2
	sub	x1, x1, x2
	mov	x2, #10000
	sdiv	x21, x1, x2
	bl	_test_runner_int_to_str
	adrp	x1, _str112@page
	add	x1, x1, _str112@pageoff
	bl	___rt_str_concat
	mov	x17, x0
	mov	x0, x21
	mov	x21, x17
	bl	_test_runner_two_digits
	mov	x1, x0
	mov	x0, x21
	bl	___rt_str_concat
	adrp	x1, _str116@page
	add	x1, x1, _str116@pageoff
	bl	___rt_str_concat
	str	x0, [x20]
	b	L35
L34:
	mov	x1, x0
	mov	x0, #1000
	sdiv	x0, x1, x0
	mov	x2, #1000
	mul	x2, x0, x2
	sub	x1, x1, x2
	mov	x2, #10
	sdiv	x21, x1, x2
	bl	_test_runner_int_to_str
	adrp	x1, _str101@page
	add	x1, x1, _str101@pageoff
	bl	___rt_str_concat
	mov	x17, x0
	mov	x0, x21
	mov	x21, x17
	bl	_test_runner_two_digits
	mov	x1, x0
	mov	x0, x21
	bl	___rt_str_concat
	adrp	x1, _str105@page
	add	x1, x1, _str105@pageoff
	bl	___rt_str_concat
	str	x0, [x20]
L35:
	str	x0, [x19]
	b	L38
L36:
	bl	_test_runner_int_to_str
	adrp	x1, _str88@page
	add	x1, x1, _str88@pageoff
	bl	___rt_str_concat
	str	x0, [x19]
	b	L38
L37:
	adrp	x0, _str80@page
	add	x0, x0, _str80@pageoff
L38:
	ldr	x19, [x29, 40]
	ldr	x20, [x29, 32]
	ldr	x21, [x29, 24]
	mov sp, x29
	ldp	x29, x30, [sp], 48
	ret
/* end function test_runner_format_us */

.text
.balign 4
_test_runner_reverse_strings:
	hint	#34
	stp	x29, x30, [sp, -48]!
	mov	x29, sp
	str	x19, [x29, 40]
	str	x20, [x29, 32]
	str	x21, [x29, 24]
	mov	x19, x1
	ldr	x1, [x0]
	cmp	x1, #0
	beq	L41
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
	bl	_test_runner_reverse_strings
	b	L42
L41:
	mov	x0, x19
L42:
	ldr	x19, [x29, 40]
	ldr	x20, [x29, 32]
	ldr	x21, [x29, 24]
	ldp	x29, x30, [sp], 48
	ret
/* end function test_runner_reverse_strings */

.text
.balign 4
_test_runner_append_strings:
	hint	#34
	stp	x29, x30, [sp, -32]!
	mov	x29, sp
	str	x19, [x29, 24]
	str	x20, [x29, 16]
	ldr	x2, [x0]
	cmp	x2, #0
	beq	L45
	mov	x2, #8
	add	x2, x0, x2
	ldr	x20, [x2]
	mov	x2, #16
	add	x0, x0, x2
	ldr	x0, [x0]
	bl	_test_runner_append_strings
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
	b	L46
L45:
	mov	x0, x1
L46:
	ldr	x19, [x29, 24]
	ldr	x20, [x29, 16]
	ldp	x29, x30, [sp], 32
	ret
/* end function test_runner_append_strings */

.text
.balign 4
_test_runner_add_failure:
	hint	#34
	stp	x29, x30, [sp, -32]!
	mov	x29, sp
	str	x19, [x29, 24]
	str	x20, [x29, 16]
	mov	x19, x0
	mov	x0, x2
	mov	x20, x1
	adrp	x1, _str151@page
	add	x1, x1, _str151@pageoff
	bl	_strcmp
	mov	x1, x20
	mov	x2, x0
	mov	x0, x19
	cmp	x2, #0
	mov	x20, x1
	cset	x1, eq
	cmp	x1, #1
	beq	L49
	mov	x19, x0
	mov	x0, #24
	bl	_malloc
	mov	x1, x20
	mov	x2, #1
	str	x2, [x0]
	mov	x2, #8
	add	x2, x0, x2
	str	x1, [x2]
	mov	x1, #16
	add	x1, x0, x1
	str	x19, [x1]
L49:
	ldr	x19, [x29, 24]
	ldr	x20, [x29, 16]
	ldp	x29, x30, [sp], 32
	ret
/* end function test_runner_add_failure */

.text
.balign 4
_test_runner_print_failure_names:
	hint	#34
	stp	x29, x30, [sp, -32]!
	mov	x29, sp
	str	x19, [x29, 24]
	ldr	x1, [x0]
	cmp	x1, #0
	beq	L52
	mov	x1, #8
	add	x1, x0, x1
	ldr	x1, [x1]
	mov	x2, #16
	add	x0, x0, x2
	ldr	x0, [x0]
	mov	x19, x0
	adrp	x0, _str173@page
	add	x0, x0, _str173@pageoff
	bl	___rt_str_concat
	bl	_puts
	mov	x0, x19
	bl	_test_runner_print_failure_names
L52:
	mov	w0, #0
	ldr	x19, [x29, 24]
	ldp	x29, x30, [sp], 32
	ret
/* end function test_runner_print_failure_names */

.text
.balign 4
_test_runner_print_failures:
	hint	#34
	stp	x29, x30, [sp, -32]!
	mov	x29, sp
	str	x19, [x29, 24]
	ldr	x1, [x0]
	cmp	x1, #0
	beq	L56
	mov	x19, x0
	adrp	x0, _str182@page
	add	x0, x0, _str182@pageoff
	bl	_puts
	mov	x0, x19
	mov	x19, x0
	adrp	x0, _str183@page
	add	x0, x0, _str183@pageoff
	bl	_puts
	mov	x0, x19
	adrp	x1, _donna_nil@page
	add	x1, x1, _donna_nil@pageoff
	bl	_test_runner_reverse_strings
	bl	_test_runner_print_failure_names
L56:
	mov	w0, #0
	ldr	x19, [x29, 24]
	ldp	x29, x30, [sp], 32
	ret
/* end function test_runner_print_failures */

.text
.balign 4
_test_runner_run_test:
	hint	#34
	stp	x29, x30, [sp, -48]!
	mov	x29, sp
	str	x19, [x29, 40]
	str	x20, [x29, 32]
	str	x21, [x29, 24]
	mov	x19, x1
	mov	x20, x0
	mov	x0, x2
	bl	_test_runner_format_us
	mov	x1, x20
	mov	x20, x0
	mov	x0, x19
	mov	x21, x1
	adrp	x1, _str187@page
	add	x1, x1, _str187@pageoff
	mov	x19, x0
	bl	_strcmp
	mov	x1, x21
	mov	x2, x0
	mov	x0, x19
	cmp	x2, #0
	cset	x2, eq
	cmp	x2, #1
	beq	L61
	mov	x19, x0
	adrp	x0, _str200@page
	add	x0, x0, _str200@pageoff
	bl	___rt_str_concat
	mov	x1, x20
	mov	x20, x1
	adrp	x1, _str202@page
	add	x1, x1, _str202@pageoff
	bl	___rt_str_concat
	mov	x1, x20
	bl	___rt_str_concat
	bl	_puts
	mov	x0, x19
	bl	_puts
	mov	x0, #1
	b	L64
L61:
	mov	x19, x20
	adrp	x0, _str195@page
	add	x0, x0, _str195@pageoff
	bl	___rt_str_concat
	mov	x1, x19
	mov	x19, x1
	adrp	x1, _str197@page
	add	x1, x1, _str197@pageoff
	bl	___rt_str_concat
	mov	x1, x19
	bl	___rt_str_concat
	bl	_puts
	mov	x0, #0
L64:
	ldr	x19, [x29, 40]
	ldr	x20, [x29, 32]
	ldr	x21, [x29, 24]
	ldp	x29, x30, [sp], 48
	ret
/* end function test_runner_run_test */

.text
.balign 4
_test_runner_run_case:
	hint	#34
	stp	x29, x30, [sp, -64]!
	mov	x29, sp
	str	x19, [x29, 56]
	str	x20, [x29, 48]
	str	x21, [x29, 40]
	str	x22, [x29, 32]
	str	x23, [x29, 24]
	mov	x21, x3
	mov	x19, x2
	mov	x22, x1
	mov	x20, x0
	bl	_donna_ffi_time_now_us
	mov	x3, x21
	mov	x21, x0
	blr	x3
	mov	x23, x0
	bl	_donna_ffi_time_now_us
	mov	x1, x23
	mov	x2, x0
	mov	x0, x22
	sub	x2, x2, x21
	mov	x22, x2
	mov	x2, x1
	mov	x21, x1
	mov	x1, x19
	bl	_test_runner_add_failure
	mov	x2, x22
	mov	x1, x21
	mov	x17, x0
	mov	x0, x19
	mov	x19, x17
	bl	_test_runner_run_test
	mov	x1, x0
	mov	x0, x20
	add	x20, x0, x1
	mov	x0, #16
	bl	_malloc
	str	x20, [x0]
	mov	x1, #8
	add	x1, x0, x1
	str	x19, [x1]
	ldr	x19, [x29, 56]
	ldr	x20, [x29, 48]
	ldr	x21, [x29, 40]
	ldr	x22, [x29, 32]
	ldr	x23, [x29, 24]
	ldp	x29, x30, [sp], 64
	ret
/* end function test_runner_run_case */

.text
.balign 4
_test_runner_run_module_snappy_test:
	hint	#34
	stp	x29, x30, [sp, -32]!
	mov	x29, sp
	str	x19, [x29, 24]
	str	x20, [x29, 16]
	adrp	x3, ___lambda_217@page
	add	x3, x3, ___lambda_217@pageoff
	adrp	x2, _str216@page
	add	x2, x2, _str216@pageoff
	adrp	x1, _donna_nil@page
	add	x1, x1, _donna_nil@pageoff
	mov	x0, #0
	bl	_test_runner_run_case
	mov	x1, x0
	ldr	x0, [x1]
	mov	x2, #8
	add	x1, x1, x2
	ldr	x1, [x1]
	adrp	x3, ___lambda_225@page
	add	x3, x3, ___lambda_225@pageoff
	adrp	x2, _str224@page
	add	x2, x2, _str224@pageoff
	bl	_test_runner_run_case
	mov	x1, x0
	ldr	x0, [x1]
	mov	x2, #8
	add	x1, x1, x2
	ldr	x1, [x1]
	adrp	x3, ___lambda_233@page
	add	x3, x3, ___lambda_233@pageoff
	adrp	x2, _str232@page
	add	x2, x2, _str232@pageoff
	bl	_test_runner_run_case
	ldr	x20, [x0]
	mov	x1, #8
	add	x0, x0, x1
	ldr	x19, [x0]
	mov	x0, #16
	bl	_malloc
	str	x20, [x0]
	mov	x1, #8
	add	x1, x0, x1
	str	x19, [x1]
	ldr	x19, [x29, 24]
	ldr	x20, [x29, 16]
	ldp	x29, x30, [sp], 32
	ret
/* end function test_runner_run_module_snappy_test */

.text
.balign 4
.globl _donna_program_main
_donna_program_main:
	hint	#34
	stp	x29, x30, [sp, -48]!
	mov	x29, sp
	str	x19, [x29, 40]
	str	x20, [x29, 32]
	str	x21, [x29, 24]
	str	x22, [x29, 16]
	bl	_donna_ffi_time_now_us
	mov	x22, x0
	bl	_test_runner_run_module_snappy_test
	ldr	x19, [x0]
	mov	x1, #8
	add	x0, x0, x1
	ldr	x0, [x0]
	adrp	x1, _donna_nil@page
	add	x1, x1, _donna_nil@pageoff
	bl	_test_runner_append_strings
	mov	x20, x0
	mov	x0, #3
	sub	x21, x0, x19
	bl	_donna_ffi_time_now_us
	sub	x0, x0, x22
	bl	_test_runner_format_us
	mov	x1, x0
	mov	x0, x20
	cmp	x19, #0
	mov	x20, x1
	cset	x1, eq
	cmp	x1, #1
	beq	L72
	bl	_test_runner_print_failures
	mov	x0, x21
	bl	_test_runner_int_to_str
	mov	x1, x0
	adrp	x0, _str267@page
	add	x0, x0, _str267@pageoff
	bl	___rt_str_concat
	mov	x1, x20
	mov	x20, x1
	adrp	x1, _str270@page
	add	x1, x1, _str270@pageoff
	bl	___rt_str_concat
	mov	x21, x0
	mov	x0, x19
	bl	_test_runner_int_to_str
	mov	x1, x0
	mov	x0, x21
	bl	___rt_str_concat
	mov	x1, x20
	mov	x20, x1
	adrp	x1, _str274@page
	add	x1, x1, _str274@pageoff
	bl	___rt_str_concat
	mov	x1, x20
	mov	x20, x1
	bl	___rt_str_concat
	bl	_puts
	mov	x0, x19
	b	L74
L72:
	mov	x0, x21
	bl	_test_runner_int_to_str
	mov	x1, x0
	mov	x0, x19
	mov	x19, x0
	adrp	x0, _str261@page
	add	x0, x0, _str261@pageoff
	bl	___rt_str_concat
	mov	x1, x20
	mov	x20, x1
	adrp	x1, _str264@page
	add	x1, x1, _str264@pageoff
	bl	___rt_str_concat
	mov	x1, x20
	bl	___rt_str_concat
	bl	_puts
	mov	x0, x19
L74:
	ldr	x19, [x29, 40]
	ldr	x20, [x29, 32]
	ldr	x21, [x29, 24]
	ldr	x22, [x29, 16]
	ldp	x29, x30, [sp], 48
	ret
/* end function donna_program_main */

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
___lambda_217:
	hint	#34
	stp	x29, x30, [sp, -16]!
	mov	x29, sp
	bl	_test_snappy_test_snap_create_test
	ldp	x29, x30, [sp], 16
	ret
/* end function __lambda_217 */

.text
.balign 4
___lambda_225:
	hint	#34
	stp	x29, x30, [sp, -16]!
	mov	x29, sp
	bl	_test_snappy_test_snap_match_test
	ldp	x29, x30, [sp], 16
	ret
/* end function __lambda_225 */

.text
.balign 4
___lambda_233:
	hint	#34
	stp	x29, x30, [sp, -16]!
	mov	x29, sp
	bl	_test_snappy_test_snap_mismatch_test
	ldp	x29, x30, [sp], 16
	ret
/* end function __lambda_233 */

