//https://arm64.syscall.sh/
.section .data
    //Name
    name: .asciz "Rafael Szuminski\n"
    //Class
    class: .asciz "Class - CS3B\n"
    //Lab
    lab: .asciz "Lab - RASM1\n"
    //Date
    date: .asciz "02/27/23\n"
    //Purpose
    purpose: .asciz "Input numeric information from the keyboard, perform addition, subtraction,multiplication, and division. Check for overflow upon all operations.\n"

    
.section .text
.global pgrmh
    pgrmh:
        //-------DO NOT EDIT-------\\

        // save frame pointer and link register
        stp x29, x30, [sp, -16]!
        
        // set up new stack frame
        mov x29, sp
        sub sp, sp, #16   // allocate space for local variables, if any

        //Print the name
        ldr x0, =name
        bl printf

        //Print the class
        ldr x0, =class
        bl printf

        //Print the lab
        ldr x0, =lab
        bl printf

        //Print the date
        ldr x0, =date
        bl printf

        //Print the purpose
        ldr x0, =purpose
        bl printf

        // clean up stack frame and return
        add sp, sp, #16   // deallocate space for local variables, if any
        ldp x29, x30, [sp], 16
        ret


