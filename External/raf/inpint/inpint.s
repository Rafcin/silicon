//https://arm64.syscall.sh/
.section .data
    prompt: .asciz "Enter an integer value - "
    invalid: .asciz "Invalid input value. Re-enter a value."
    error: .asciz "Invalid input. Outside 64-bit signed range."
    buffer: .word 21
.section .text
.global inpint
    inpint:
        //-------DO NOT EDIT STACK-------\\
        //Save frame pointer and link register
        stp x29, x30, [sp, -16]!
        
        //Set up new stack frame
        mov x29, sp
        sub sp, sp, #16   // allocate space for local variables, if any

        //-------INPINT-------\\
        //Skip error
        b 3f
        1:
            //Load invalid error                 
            ldr x0, =invalid
            bl putstring
            b 3f
        2:
            //Load error
            ldr x0, =error
            bl putstring
        3:
            //Load prompt
            ldr x0, =prompt
            bl putstring
            //Load address to store inp val
            ldr x0, =buffer
            //Call getstring
            bl getstring
            //Load string for convert
            ldr x0, =buffer
            //Load first byte of string for check
            ldrb w1, [x0]
            //Compare not null
            cmp w1, 0
            //If null end
            b.eq end
            //Call string to int
            bl ascint64
            //If input bad hop to 1
            b.hi 1b
            //If bad hop to 2
            b.vs 2b
            //Mov
            //mov x0, x1
            // //Load address to store int var
            // ldr x1, =value
            // //Store result .quad
            // str x0, [x1]
    
        //-------DO NOT EDIT STACK-------\\
        //Clean up stack frame and return
        add sp, sp, #16   // deallocate space for local variables, if any
        ldp x29, x30, [sp], 16
        ret


