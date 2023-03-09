/**
fact.s
@ Subroutine fact: Provided an integer in x0, fact will calculate the factorial of that integer and return it in x0.
@ x0: Must contain the input integer
@ LR: Must contain the return address
*/

.global fact
.type fact, %function
    fact:
        // Prologue
        stp x19, x30, [sp, #-16]!

        // Compare the input value with 0
        cmp x0, #0        
        // If the input value is greater than 0, jump to the base case       
        bgt base_case       
        // If the input value is 0, set the return value to 1 and jump to the exit
        mov x0, #1               
        b exit              

    base_case:
        // Save the input value in x19 register
        mov x19, x0       
        // Decrement the input value by 1       
        sub x0, x0, #1       
        // Recursively call the fact subroutine with the decremented input value     
        bl fact          
        // Multiply the result of the recursive call by the saved input value      
        mul x0, x0, x19          

    exit:
        // Exit
        ldp x19, x30, [sp], #16
        ret
