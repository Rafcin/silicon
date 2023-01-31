//
// Using the material from Chapters 1 and 2, and my putstring/putch external functions, 
// you are to write an assembly program that prints two (2) strings with a carriage return after each string to the terminal.
// szMsg1: .asciz "The sun did not shine."
// szMsg2: .asciz "It was too wet to play."
// chCr: .byte 10
//

.section .data
    // 22+1
    szMsg1: .asciz "The sun did not shine."
    // 23+1
    szMsg2: .asciz "It was too wet to play."
    chCr:   .byte 10

.section .text
.global _start
    _start:
        // https://www.petefreitag.com/item/863.cfm
        mov x0, #1 // Stdout
        ldr x1, =szMsg1
        // mov x2, #22 // Length of szMsg1
        mov x2, #23
        mov x8, #64
        svc 0 //Linux call

        mov x0, #1 // Stdout
        ldr x1, =chCr // New line (holy shit syntax highlighting needs to work, this drives me nuts)
        mov x2, #1 //Length of the string uno! 
        mov x8, #64
        svc 0 //Linux call

        // https://www.petefreitag.com/item/863.cfm
        mov x0, #1 // Stdout
        ldr x1, =szMsg2
        // mov x2, #23 // Length of szMsg2
        mov x2, #24 // Length of szMsg2
        mov x8, #64 // Sys
        svc 0 //Linux call

        //Another newline
        mov x0, #1 // Stdout
        ldr x1, =chCr
        mov x2, #1 
        mov x8, #64
        svc 0 //Linux call

        mov x0, #0   // ARM 64-bit version
        mov x8, #93  // ARM 64-bit version of this (Ubuntu 64-bit, Arch64)
        svc 0 // Exit
