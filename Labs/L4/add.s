.data
    szX: .asciz "10"
    szY: .asciz "15"
    plus: .asciz " + "
    equals: .asciz " = "
    newline: .asciz "\n"
    strSum: .space 21
.text
.global _start
    _start:
        // Convert szX to integer and store in dbX
        ldr x0, =szX
        bl ascint64
        mov x19, x0 // dbX = result of ascint64(szX)

        // Convert szY to integer and store in dbY
        ldr x0, =szY
        bl ascint64
        add x19, x19, x0 // dbSum = dbX + result of ascint64(szY)

        // Convert dbSum to ascii and store in strSum
        mov x0, x19
        ldr x1, =strSum
        bl int64asc

        // Print "10 + 15 = 25"
        ldr x0, =szX
        bl putstring
        ldr x0, =plus
        bl putstring
        ldr x0, =szY
        bl putstring
        ldr x0, =equals
        bl putstring
        ldr x0, =strSum
        bl putstring
        ldr x0, =newline
        bl putstring
        
        mov x0, #0   // ARM 64-bit version
        mov x8, #93  // ARM 64-bit version of this (Ubuntu 64-bit, Arch64)
        svc 0 // Exit
