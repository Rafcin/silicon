.section .data
    bA:     .byte   155                     // 0x9b
    rgCt:   .byte   0, 1, 2, 3              // 0 - 3 array
    bFlag:  .byte   1                       // 0x01
    chInit: .byte   0x6A                    // 'j' 105 ok too
    u16Hi:  .hword  88                      // 0x0058
    U16Lo:  .hword  45                      // 0x002D
    wAlt:   .word   16,-1,-2                // 0x0010, -1, -2
    wLtYr:  .word   1073741824              // 0x40000000
    szMsg1: .asciz  "And Sally and I"       // null append
    szMsg2: .ascii  "ABC"                   // no null termi
    dbBig:  .quad   -8                      // -8
    chCr:   .byte   10                      // 0x0A

.section .text
.globl _start
_start:
    ldr x0, =bA

    mov x0, #0   // ARM 64-bit version
    mov x8, #93  // ARM 64-bit version of this (Ubuntu 64-bit, Arch64)
    svc 0 // Exit
    