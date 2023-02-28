.section .data
    //Name
    name: .asciz "Rafael Szuminski\n"
    //Class
    class: .asciz "Class - CS3B\n"
    //Lab
    lab: .asciz "Lab - RASM1\n"
    //Date
    date: .asciz "02/23/23\n"

    //Input prompt
    ipX: .asciz "Enter x - "
    ipY: .asciz "Enter y - "


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
    //Mul
    sMul: .asciz " * "
    //Eq
    sEq: .asciz " = "
    //Space
    sSp: .asciz " "
    //Const 3
    sC3: .asciz "3"
    //Const 2
    sC2: .asciz "2"

    //Value strings
    //Store X
    sX: .skip 21
    //Store Y
    sY: .skip 21
    //Store sum
    sS: .skip 21
    //Value ints
    //Store X (int)
    iX: .quad 0
    //Store Y (int)
    iY: .quad 0
    //Sum
    iS: .quad 0


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

        //Print the input X prompt
        ldr x0, =ipX
        bl putstring

        // Read the input from the user
        //Load sX
        ldr x0, =sX
        //Load s.length 
        mov x1, 21
        //String input call
        bl getstring
        //Load string for conversion
        ldr x0, =sX
        //Convert
        bl ascint64
        //Load quad word
        ldr x1, =iX
        //Store
        str x0, [x1]
        mov x0, x1

        //Print the input Y prompt
        ldr x0, =ipY
        bl putstring

        // Read the input from the user
        //Load sX
        ldr x0, =sY
        //Load s.length 
        mov x1, 21
        //String input call
        bl getstring
        //Load string for conversion
        ldr x0, =sY
        //Convert
        bl ascint64
        //Load quad word
        ldr x1, =iY
        //Store
        str x0, [x1]
        mov x0, x1

        //-------Loading-------\\
        //Load X
        ldr x2, =iX
        //Deref
        ldr x2, [x2]
        //Load Y
        ldr x3, =iY
        //Deref
        ldr x3, [x3]

        //-------Calculations-------\\
        add x0, x3, x3 
        add x0, x2, x0 
        add x0, x0, x0, lsl #1

        //Load res
        ldr x1, =iS
        //Store res in iS (sum)
        str x0, [x1]
        //Convert sum
        ldr x1, =sS
        bl int64asc

        //-------Prints-------\\

        //Print 3
        ldr x0, =sC3
        bl putstring

        //Print Mul
        ldr x0, =sMul
        bl putstring

        //Print open par
        ldr x0, =sOp
        bl putstring

        //Print X value
        ldr x0, =sX
        bl putstring

        //Print add
        ldr x0, =sAd
        bl putstring

        //Print 2
        ldr x0, =sC2
        bl putstring

        //Print Mul
        ldr x0, =sMul
        bl putstring

        //Print Y value
        ldr x0, =sY
        bl putstring

        //Print close par
        ldr x0, =sCp
        bl putstring

                //Print eq
        ldr x0, =sEq
        //Run put
        bl putstring

        //Print sum
        ldr x0, =sS
        //Run put
        bl putstring

        //Print nl
        ldr x0, =nl
        //Run put
        bl putstring

        // Exit
        mov x0, #0   // ARM 64-bit version
        mov x8, #93  // ARM 64-bit version of this (Ubuntu 64-bit, Arch64)
        svc 0 // Exit
