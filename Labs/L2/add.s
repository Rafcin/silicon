//
// ARM64 assembly to add two 192 bit numbers.
// Add FFFF FFFF FFFF FFFF FFFF FFFF FFFF FFFF FFFF FFFF FFFF FFFF and FFFF FFFF FFFF FFFF FFFF FFFF FFFF FFFF FFFF FFFF FFFF FFFF
// To get FFFF FFFF FFFF FFFF FFFF FFFF FFFF FFFF FFFF FFFF FFFF FFFE
//
.section .text
.globl _start
_start:
    // 192A
    // https://modexp.wordpress.com/2018/10/30/arm64-assembly/
    // I've been reading into ARM a bit more, is it ok to use .quad in this case? I think it could be cleaner.
    mov x3, #0xFFFFFFFFFFFFFFFF
    mov x4, #0xFFFFFFFFFFFFFFFF
    mov x5, #0xFFFFFFFFFFFFFFFF

    // 192B
    mov x6, #0xFFFFFFFFFFFFFFFF
    mov x7, #0xFFFFFFFFFFFFFFFF
    mov x8, #0xFFFFFFFFFFFFFFFF

    // x[3-5]=-1 
    // x[6-8]=-1
    // ---------
    // x[0-2]=-2

    adds x2, x5, x8  // Low
    adcs x1, x4, x7  // Mid
    adc x0, x3, x6  // Hig

    mov x0, #0   // ARM 64-bit version
    mov x8, #93  // ARM 64-bit version of this (Ubuntu 64-bit, Arch64)
    svc 0 // Exit
