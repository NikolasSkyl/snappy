.text
.balign 4
.globl _donna_time_monotonic_ms
_donna_time_monotonic_ms:
	hint	#34
	stp	x29, x30, [sp, -16]!
	mov	x29, sp
	bl	_donna_ffi_time_now_ms
	ldp	x29, x30, [sp], 16
	ret
/* end function donna_time_monotonic_ms */

.text
.balign 4
.globl _donna_time_monotonic_us
_donna_time_monotonic_us:
	hint	#34
	stp	x29, x30, [sp, -16]!
	mov	x29, sp
	bl	_donna_ffi_time_now_us
	ldp	x29, x30, [sp], 16
	ret
/* end function donna_time_monotonic_us */

.text
.balign 4
.globl _donna_time_now_ms
_donna_time_now_ms:
	hint	#34
	stp	x29, x30, [sp, -16]!
	mov	x29, sp
	bl	_donna_time_monotonic_ms
	ldp	x29, x30, [sp], 16
	ret
/* end function donna_time_now_ms */

.text
.balign 4
.globl _donna_time_now_us
_donna_time_now_us:
	hint	#34
	stp	x29, x30, [sp, -16]!
	mov	x29, sp
	bl	_donna_time_monotonic_us
	ldp	x29, x30, [sp], 16
	ret
/* end function donna_time_now_us */

.text
.balign 4
.globl _donna_time_unix_seconds
_donna_time_unix_seconds:
	hint	#34
	stp	x29, x30, [sp, -16]!
	mov	x29, sp
	bl	_donna_ffi_time_unix_seconds
	ldp	x29, x30, [sp], 16
	ret
/* end function donna_time_unix_seconds */

.text
.balign 4
.globl _donna_time_unix_ms
_donna_time_unix_ms:
	hint	#34
	stp	x29, x30, [sp, -16]!
	mov	x29, sp
	bl	_donna_ffi_time_unix_ms
	ldp	x29, x30, [sp], 16
	ret
/* end function donna_time_unix_ms */

.text
.balign 4
.globl _donna_time_sleep_ms
_donna_time_sleep_ms:
	hint	#34
	stp	x29, x30, [sp, -16]!
	mov	x29, sp
	bl	_donna_ffi_time_sleep_ms
	mov	w0, #0
	ldp	x29, x30, [sp], 16
	ret
/* end function donna_time_sleep_ms */

