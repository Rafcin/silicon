	.arch armv8-a
	.file	"rasm.cpp"
// GNU C++17 (Ubuntu 11.3.0-1ubuntu1~22.04) version 11.3.0 (aarch64-linux-gnu)
//	compiled by GNU C version 11.3.0, GMP version 6.2.1, MPFR version 4.1.0, MPC version 1.2.1, isl version isl-0.24-GMP

// GGC heuristics: --param ggc-min-expand=100 --param ggc-min-heapsize=131072
// options passed: -mlittle-endian -mabi=lp64 -fasynchronous-unwind-tables -fstack-protector-strong -fstack-clash-protection
	.text
	.local	_ZStL8__ioinit
	.comm	_ZStL8__ioinit,1,8
	.section	.rodata
	.align	3
.LC0:
	.string	"Enter a whole number: "
	.align	3
.LC1:
	.string	"X = (A + B) - (C + D) = "
	.text
	.align	2
	.global	main
	.type	main, %function
main:
.LFB1729:
	.cfi_startproc
	stp	x29, x30, [sp, -48]!	//,,,
	.cfi_def_cfa_offset 48
	.cfi_offset 29, -48
	.cfi_offset 30, -40
	mov	x29, sp	//,
// rasm.cpp:3: int main() {
	adrp	x0, :got:__stack_chk_guard	// tmp103,
	ldr	x0, [x0, #:got_lo12:__stack_chk_guard]	// tmp102, tmp103,
	ldr	x1, [x0]	// tmp127,
	str	x1, [sp, 40]	// tmp127, D.50988
	mov	x1, 0	// tmp127
// rasm.cpp:6:   std::cout << "Enter a whole number: ";
	adrp	x0, .LC0	// tmp104,
	add	x1, x0, :lo12:.LC0	//, tmp104,
	adrp	x0, :got:_ZSt4cout	// tmp105,
	ldr	x0, [x0, #:got_lo12:_ZSt4cout]	//, tmp105,
	bl	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc		//
// rasm.cpp:7:   std::cin >> A;
	add	x0, sp, 20	// tmp106,,
	mov	x1, x0	//, tmp106
	adrp	x0, :got:_ZSt3cin	// tmp107,
	ldr	x0, [x0, #:got_lo12:_ZSt3cin]	//, tmp107,
	bl	_ZNSirsERi		//
// rasm.cpp:8:   std::cout << "Enter a whole number: ";
	adrp	x0, .LC0	// tmp108,
	add	x1, x0, :lo12:.LC0	//, tmp108,
	adrp	x0, :got:_ZSt4cout	// tmp109,
	ldr	x0, [x0, #:got_lo12:_ZSt4cout]	//, tmp109,
	bl	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc		//
// rasm.cpp:9:   std::cin >> B;
	add	x0, sp, 24	// tmp110,,
	mov	x1, x0	//, tmp110
	adrp	x0, :got:_ZSt3cin	// tmp111,
	ldr	x0, [x0, #:got_lo12:_ZSt3cin]	//, tmp111,
	bl	_ZNSirsERi		//
// rasm.cpp:10:   std::cout << "Enter a whole number: ";
	adrp	x0, .LC0	// tmp112,
	add	x1, x0, :lo12:.LC0	//, tmp112,
	adrp	x0, :got:_ZSt4cout	// tmp113,
	ldr	x0, [x0, #:got_lo12:_ZSt4cout]	//, tmp113,
	bl	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc		//
// rasm.cpp:11:   std::cin >> C;
	add	x0, sp, 28	// tmp114,,
	mov	x1, x0	//, tmp114
	adrp	x0, :got:_ZSt3cin	// tmp115,
	ldr	x0, [x0, #:got_lo12:_ZSt3cin]	//, tmp115,
	bl	_ZNSirsERi		//
// rasm.cpp:12:   std::cout << "Enter a whole number: ";
	adrp	x0, .LC0	// tmp116,
	add	x1, x0, :lo12:.LC0	//, tmp116,
	adrp	x0, :got:_ZSt4cout	// tmp117,
	ldr	x0, [x0, #:got_lo12:_ZSt4cout]	//, tmp117,
	bl	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc		//
// rasm.cpp:13:   std::cin >> D;
	add	x0, sp, 32	// tmp118,,
	mov	x1, x0	//, tmp118
	adrp	x0, :got:_ZSt3cin	// tmp119,
	ldr	x0, [x0, #:got_lo12:_ZSt3cin]	//, tmp119,
	bl	_ZNSirsERi		//
// rasm.cpp:15:   X = (A + B) - (C + D);
	ldr	w1, [sp, 20]	// A.0_1, A
	ldr	w0, [sp, 24]	// B.1_2, B
	add	w1, w1, w0	// _3, A.0_1, B.1_2
// rasm.cpp:15:   X = (A + B) - (C + D);
	ldr	w2, [sp, 28]	// C.2_4, C
	ldr	w0, [sp, 32]	// D.3_5, D
	add	w0, w2, w0	// _6, C.2_4, D.3_5
// rasm.cpp:15:   X = (A + B) - (C + D);
	sub	w0, w1, w0	// tmp120, _3, _6
	str	w0, [sp, 36]	// tmp120, X
// rasm.cpp:17:   std::cout << "X = (A + B) - (C + D) = " << X << std::endl;
	adrp	x0, .LC1	// tmp121,
	add	x1, x0, :lo12:.LC1	//, tmp121,
	adrp	x0, :got:_ZSt4cout	// tmp122,
	ldr	x0, [x0, #:got_lo12:_ZSt4cout]	//, tmp122,
	bl	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc		//
// rasm.cpp:17:   std::cout << "X = (A + B) - (C + D) = " << X << std::endl;
	ldr	w1, [sp, 36]	//, X
	bl	_ZNSolsEi		//
	mov	x2, x0	// _8,
// rasm.cpp:17:   std::cout << "X = (A + B) - (C + D) = " << X << std::endl;
	adrp	x0, :got:_ZSt4endlIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_	// tmp123,
	ldr	x1, [x0, #:got_lo12:_ZSt4endlIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_]	//, tmp123,
	mov	x0, x2	//, _8
	bl	_ZNSolsEPFRSoS_E		//
// rasm.cpp:19:   return 0;
	mov	w0, 0	// _25,
// rasm.cpp:20: }
	mov	w1, w0	// <retval>, _25
	adrp	x0, :got:__stack_chk_guard	// tmp126,
	ldr	x0, [x0, #:got_lo12:__stack_chk_guard]	// tmp125, tmp126,
	ldr	x3, [sp, 40]	// tmp128, D.50988
	ldr	x2, [x0]	// tmp129,
	subs	x3, x3, x2	// tmp128, tmp129
	mov	x2, 0	// tmp129
	beq	.L3		//,
	bl	__stack_chk_fail		//
.L3:
	mov	w0, w1	//, <retval>
	ldp	x29, x30, [sp], 48	//,,,
	.cfi_restore 30
	.cfi_restore 29
	.cfi_def_cfa_offset 0
	ret	
	.cfi_endproc
.LFE1729:
	.size	main, .-main
	.align	2
	.type	_Z41__static_initialization_and_destruction_0ii, %function
_Z41__static_initialization_and_destruction_0ii:
.LFB2232:
	.cfi_startproc
	stp	x29, x30, [sp, -32]!	//,,,
	.cfi_def_cfa_offset 32
	.cfi_offset 29, -32
	.cfi_offset 30, -24
	mov	x29, sp	//,
	str	w0, [sp, 28]	// __initialize_p, __initialize_p
	str	w1, [sp, 24]	// __priority, __priority
// rasm.cpp:20: }
	ldr	w0, [sp, 28]	// tmp92, __initialize_p
	cmp	w0, 1	// tmp92,
	bne	.L6		//,
// rasm.cpp:20: }
	ldr	w1, [sp, 24]	// tmp93, __priority
	mov	w0, 65535	// tmp94,
	cmp	w1, w0	// tmp93, tmp94
	bne	.L6		//,
// /usr/include/c++/11/iostream:74:   static ios_base::Init __ioinit;
	adrp	x0, _ZStL8__ioinit	// tmp95,
	add	x0, x0, :lo12:_ZStL8__ioinit	//, tmp95,
	bl	_ZNSt8ios_base4InitC1Ev		//
	adrp	x0, __dso_handle	// tmp96,
	add	x2, x0, :lo12:__dso_handle	//, tmp96,
	adrp	x0, _ZStL8__ioinit	// tmp97,
	add	x1, x0, :lo12:_ZStL8__ioinit	//, tmp97,
	adrp	x0, :got:_ZNSt8ios_base4InitD1Ev	// tmp98,
	ldr	x0, [x0, #:got_lo12:_ZNSt8ios_base4InitD1Ev]	//, tmp98,
	bl	__cxa_atexit		//
.L6:
// rasm.cpp:20: }
	nop	
	ldp	x29, x30, [sp], 32	//,,,
	.cfi_restore 30
	.cfi_restore 29
	.cfi_def_cfa_offset 0
	ret	
	.cfi_endproc
.LFE2232:
	.size	_Z41__static_initialization_and_destruction_0ii, .-_Z41__static_initialization_and_destruction_0ii
	.align	2
	.type	_GLOBAL__sub_I_main, %function
_GLOBAL__sub_I_main:
.LFB2233:
	.cfi_startproc
	stp	x29, x30, [sp, -16]!	//,,,
	.cfi_def_cfa_offset 16
	.cfi_offset 29, -16
	.cfi_offset 30, -8
	mov	x29, sp	//,
// rasm.cpp:20: }
	mov	w1, 65535	//,
	mov	w0, 1	//,
	bl	_Z41__static_initialization_and_destruction_0ii		//
	ldp	x29, x30, [sp], 16	//,,,
	.cfi_restore 30
	.cfi_restore 29
	.cfi_def_cfa_offset 0
	ret	
	.cfi_endproc
.LFE2233:
	.size	_GLOBAL__sub_I_main, .-_GLOBAL__sub_I_main
	.section	.init_array,"aw"
	.align	3
	.xword	_GLOBAL__sub_I_main
	.hidden	__dso_handle
	.ident	"GCC: (Ubuntu 11.3.0-1ubuntu1~22.04) 11.3.0"
	.section	.note.GNU-stack,"",@progbits
