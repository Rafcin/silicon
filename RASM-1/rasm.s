.section .data
    //Name
    name: .asciz "Rafael Szuminski\n"
    //Class
    class: .asciz "Class - CS3B\n"
    //Lab
    lab: .asciz "Lab - RASM1\n"
    //Date
    date: .asciz "02/07/23\n"

    //Input prompt
    iP: .asciz "Enter a whole number - "
    //Memory prompt
    mP: .asciz "The addresses of the 4 ints - \n"

    //Newline
    nl: .asciz "\n"
    //Open parenthesis
    sOp: .asciz "("
    //Closed parenthesis
    sCp: .asciz ")"
    //Add
    sAd: .asciz " + "
    //Sub
    sSb: .asciz " - "
    //Eq
    sEq: .asciz " = "
    //Space
    sSp: .asciz " "

    //Value strings
    //Store A
    sA: .skip 21
    //Store B
    sB: .skip 21
    //Store C
    sC: .skip 21
    //Store D
    sD: .skip 21
    //Store sum
    sS: .skip 21
    //Value ints
    //Store C (int)
    iA: .quad 0
    //Store B (int)
    iB: .quad 0
    //Store C (int)
    iC: .quad 0
    //Store D (int)
    iD: .quad 0
    //Sum
    iS: .quad 0
    //Pointers
    //Pointer A
    pA: .skip 21
    //Pointer B
    pB: .skip 21
    //Pointer C
    pC: .skip 21
    //Pointer D
    pD: .skip 21


.section .text
.global _start
    _start:
        //-------Header-------\\

        //Print the name
        ldr x0, =name
        bl putstring

        //Print the class
        ldr x0, =class
        bl putstring

        //Print the lab
        ldr x0, =lab
        bl putstring

        //Print the date
        ldr x0, =date
        bl putstring

        //-------Inputs-------\\

        //FOR EACH FOR EACH FOR EACH FOR EACH FOR EACH
        //Temp solution until I fix read_number and fix validation (check syscall macro)
        //Clean solution for now, however can be improved. Come back to this and make the input helper for future labs.
        //https://software-dl.ti.com/codegen/docs/tiarmclang/compiler_tools_user_guide/gnu_syntax_arm_asm_language/gnu_arm_directives/alphabetical_directive_directory.html
        //Start of for each
        .irpc char ABCD
            //Print the input prompt
            ldr x0, =iP
            bl putstring

            // Read the input from the user
            //Load s(A, B, C, D)
            ldr x0, =s\char
            //Load s.length 
            mov x1, 21
            //String input call
            bl getstring
            //Load string for conversion
            ldr x0, =s\char
            //Convert
            bl ascint64
            //Load quad word
            ldr x1, =i\char
            //Store
            str x0, [x1]
            mov x0, x1
            //Load x1 as str
            ldr x1, =p\char
            bl int64asc
        //End 
        .endr

        //-------Loading-------\\
        //Load A
        ldr x0, =iA
        //Deref
        ldr x0, [x0]
        //Load B
        ldr x1, =iB
        //Deref
        ldr x1, [x1]
        //Load C
        ldr x2, =iC
        //Deref
        ldr x2, [x2]
        //Load D
        ldr x3, =iD
        //Deref
        ldr x3, [x3]

        //-------Calculations-------\\
        //Add A and B
        add x0, x0, x1
        //Add C and D
        add x2, x2, x3
        //Sub sums of AB and CD
        sub x0, x0, x2 
        //Load res
        ldr x1, =iS
        //Store res in iS (sum)
        str x0, [x1]
        //Convert sum
        ldr x1, =sS
        bl int64asc

        //-------Prints-------\\
        //-------A+B-START-------\\
        //Print open par for first set
        ldr x0, =sOp
        bl putstring

        //Print A value
        ldr x0, =sA
        bl putstring

        //Print add
        ldr x0, =sAd
        bl putstring

        //Print B value
        ldr x0, =sB
        bl putstring

        //Print close par for first set
        ldr x0, =sCp
        bl putstring
        //-------A+B-END-------\\

        //Print sub
        ldr x0, =sSb
        bl putstring

        //-------C+D-START-------\\
        //Print open par for second set
        ldr x0, =sOp
        bl putstring

        //Print C value
        ldr x0, =sC
        bl putstring

        //Print add
        ldr x0, =sAd
        bl putstring

        //Print D value
        ldr x0, =sD
        bl putstring

        //Print close par for second set
        ldr x0, =sCp
        bl putstring
        //-------C+D-END-------\\

        //Print eq
        ldr x0, =sEq
        //Run put
        bl putstring

        //Sum 

        //Print sum
        ldr x0, =sS
        //Run put
        bl putstring

        //Print new line after statment
        //Print nl
        ldr x0, =nl
        bl putstring

        //-------Memory-------\\
        //Print memory prompt
        ldr x0, =mP
        //Run put
        bl putstring

        //Print memory A
        ldr x0, =pA
        //Run put
        bl putstring
        //Add space
        ldr x0, =sSp
        //Run put
        bl putstring

        //Print memory B
        ldr x0, =pB
        //Run put
        bl putstring
        //Add space
        ldr x0, =sSp
        //Run put
        bl putstring

        //Print memory C
        ldr x0, =pC
        bl putstring
        //Add space
        ldr x0, =sSp
        //Run put
        bl putstring

        //Print memory D
        ldr x0, =pD
        bl putstring
        //Add space
        ldr x0, =sSp
        bl putstring

        //Print newline after statment
        ldr x0, =nl
        bl putstring

        //Each quad is 8 bytes
        //ADR1, ADR2, ADR3, ADR4

        // Exit
        mov x0, #0   // ARM 64-bit version
        mov x8, #93  // ARM 64-bit version of this (Ubuntu 64-bit, Arch64)
        svc 0 // Exit
