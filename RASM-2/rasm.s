.data
    //Inputs
    //Limit for inputs
    buffer: .word 21  
    
    //Input prompts
    prompt: .asciz "Enter your a number -  "
    prompt_sum: .asciz "The sum is "
    prompt_dif: .asciz "\nThe difference is "
    prompt_pro: .asciz "\nThe product is "
    prompt_quo: .asciz "\nThe quotient is "
    prompt_rem: .asciz "\nThe remainder is "
    prompt_exit: .asciz "\nThank you for using my program!! Good Day!\n"
    nl:  .asciz "\n\n"

    //Errors
    error_div_by_zero: .asciz "\nInput can not be divied by zero. No quotient or remainder is given if the input provided is zero." 
    error_overflow_add: .asciz "Overflow during addition" 
    error_overflow_sub: .asciz "\nOverflow during subtraction" 
    error_signed_mul: .asciz "\nMultiplied value outside the signed 64-bit range." 
    error_signed_input: .asciz "Input is outside of the signed 64-bit range - \n"
    error_invalid_input: .asciz "Invalid input, input must be integer. Re-enter the value - \n" 

    //Sum string
    string_sum: .skip 21  
    //Dif string
    string_dif: .skip 21  
    //String prod
    string_prod: .skip 21  
    //String quo
    string_quo: .skip 21
    //String rem
    string_rem: .skip 21

    //Quads
    //X input quad
    iX: .quad 0
    //Y input quad
    iY: .quad 0
    //Quo quad
    iQ: .quad 0

.global main
.text
    /**
    TARM64 assembly program that takes two integers as input, performs various arithmetic operations on them, and outputs the results. 
    The program defines various strings for user prompts and error messages, as well as variables for storing input values and result strings.
    **/
    //We rename this to main for GDB purposes. Makefile uses `-e main`
    main:
        //Display header, just call pgrmh. Prgrmh will be moved to each RASM and Lab becuase it changes based on the lab.
        //I like making the code cleaner.
        bl pgrmh
    loop:
        //Use irpc to loop for N inputs, in this case X and Y.
        .irpc var XY
        //Skip errors, nothing input yet
            b 3f                   
            1:
                //Load invalid error message
                ldr x0,=error_invalid_input
                //Run putstring for invalid error message
                bl  putstring
                //Jump to branch 3.
                b   3f
            2:  
                //Uh oh another error, if input error load input error
                ldr x0,=error_signed_input
                //Putstring for input error message
                bl  putstring
            3:
                //----Prompt user input----//
                //Load prompt for input
                ldr x0,=prompt   
                //Call putstring for prompt
                bl  putstring           

                //----Get input----//
                //Load address to store the input var
                ldr x0,=buffer       
                //Call getstring for input
                bl  getstring     

                //----Handle conversion----//
                //Load string variable for conversion
                //Load conversion
                ldr x0,=buffer       
                //Load first byte for comp
                ldrb w1,[x0]            
                //Check if input is not null
                cmp w1,0                
                //If null END THE PROGRAM
                b.eq end                
                //Else convert
                bl ascint64             
                //If invalid input jump to 1 and error
                b.hi 1b                 
                //If invalid input jump to 1 and error
                b.vs 2b                 
                //Load for storing int
                ldr x1,=i\var           
                //Store the int value
                str x0,[x1]
        .endr
        //Jump to sum and do sum calculation first.
        b sum

    /**
     ____ _____     __
    |  _ \_ _\ \   / /
    | | | | | \ \ / / 
    | |_| | |  \ V /  
    |____/___|  \_/   
                   
    **/

    // Divide error handler
    div_error:
        //Load error for div
        ldr x0,=error_div_by_zero  
        //Print error via putstring       
        bl  putstring               
    calculate_div:
        //Load newline
        ldr x0,=nl          
        //Print new line
        bl  putstring       
        //Return to loop        
        b   loop                    


    /**
      __  __ _   _ _     
    |  \/  | | | | |    
    | |\/| | | | | |    
    | |  | | |_| | |___ 
    |_|  |_|\___/|_____|

    DEPENDS ON DIV    
    **/
    mul_overflow:
        //Load mul error
        ldr x0,=error_signed_mul
        //Print
        bl  putstring
    calculate_mul:
        // Calculate and output quotient
        //Load X
        ldr x0,=iX                 
        //Deref X
        ldr x0,[x0]
        //Load Y
        ldr x1,=iY
        //Deref Y
        ldr x1,[x1]
        //Check if 0, then error
        cmp x1,#0
        //Branch to error
        b.eq div_error
        // x0 = X / Y
        sdiv x0,x0,x1        
        //Load IQ and str Q       
        ldr x1,=iQ        
        //Store
        str x0,[x1]
        //Load str quo for conver
        ldr x1,=string_quo
        //Convert
        bl int64asc
        //Load quo
        ldr x0,=prompt_quo
        //Print
        bl putstring
        //Load str quo
        ldr x0,=string_quo
        //Print
        bl putstring

        // Calculate and output remainder 
        // remainder = numerator - (quotient * denominator)
        //Load Y
        ldr x0,=iY                  
        //Deref Y
        ldr x0,[x0]         
        //Load Q        
        ldr x1,=iQ               
        ldr x1,[x1]      
        //x0 = q * d
        mul x0,x0,x1          
        //Load X      
        ldr x1,=iX
        //Deref
        ldr x1,[x1]
        //x0 = numerator - (q * d)
        SUB x0,x1,x0         
        //Load rem for convert
        ldr x1,=string_rem
        //Convert
        bl  int64asc
        //Load rem
        ldr x0,=prompt_rem
        //Print rem
        bl  putstring
        //Load rem
        ldr x0,=string_rem
        //Print rem
        bl  putstring
        //Jump to calc
        b   calculate_div

    /**
     ____  _   _ ____  
    / ___|| | | | __ ) 
    \___ \| | | |  _ \ 
     ___) | |_| | |_) |
    |____/ \___/|____/ 
                    
    DEPENDS ON MUL
    **/
    //Handle sub overflow
    sub_overflow:
        //Load sub error
        ldr x0,=error_overflow_sub       
        //Print sub error
        bl  putstring               
    calculate_sub:
        //Load X        
        ldr x1,=iX                  
        //Deref
        ldr x1,[x1]                
        //Load Y
        ldr x2,=iY                  
        //Deref
        ldr x2,[x2]                
        //x0 = x * y
        mul x0,x1,x2                
        //x1 = x0 / x
        sdiv x1,x0,x1               
        //If x0 / x ! = y
        cmp x1,x2                   
        //Throw overflow
        b.ne mul_overflow            
        //Load string prod
        ldr x1,=string_prod       
        //Convert int to str       
        bl  int64asc               
        //Load prompt for pro
        ldr x0,=prompt_pro           
        //Print prompt for pro
        bl  putstring               
        //Load string prod
        ldr x0,=string_prod              
        //Print string prod
        bl  putstring               
        //Branch to normal mul
        b   calculate_mul              

    /**
     ____  _   _ __  __ 
    / ___|| | | |  \/  |
    \___ \| | | | |\/| |
     ___) | |_| | |  | |
    |____/ \___/|_|  |_|
                     
    Sum takes X and Y and adds them.
    sum_overflow: If there is an overflow during sum execution, jump to sum overflow and display the error.
    calculate_sum: If everything is fine, then cont.
    DEPENDS ON SUB
    **/

    sum:
        //Calculate the sum for the values X and Y
        //Load X value
        ldr x1,=iX                  
        //Deref X
        ldr x1,[x1]
        //Load Y value                 
        ldr x2,=iY   
        //Deref Y               
        ldr x2,[x2]        
        //Add X and Y         
        adds x0,x1,x2

        //Now the fun part, if there is an overflow, jump to overflow.               
        b.vs sum_overflow    

        //Load sum        
        ldr x1,=string_sum  
        //Conver sum to string          
        bl  int64asc                
        //Load sum prompt
        ldr x0,=prompt_sum            
        //Print sum promp via putstring
        bl  putstring               
        //Load sum
        ldr x0,=string_sum               
        //Print sum via putstring
        bl  putstring    
        //Avoid error           
        b   calculate_sum             
    sum_overflow:
        //Load add overflow error
        ldr x0,=error_overflow_add
        //Call putstring to print add overflow error message
        bl putstring               
    calculate_sum:
        // Calculate and output difference
        //Load X
        ldr x1,=iX       
        //Deref X           
        ldr x1,[x1]    
        //Load Y             
        ldr x2,=iY  
        //Deref Y                
        ldr x2,[x2]    
        //x0 = x - y              
        subs x0,x1,x2                
        b.vs sub_overflow         
        ldr x1,=string_dif             
        bl  int64asc                
        ldr x0,=prompt_dif           
        bl  putstring              
        ldr x0,=string_dif             
        bl  putstring               
        b   calculate_sub               

    end:
        //Load exit prompt
        ldr x0,=prompt_exit
        //Print exit
        bl  putstring
        // Exit
        mov x0, #0   // ARM 64-bit version
        mov x8, #93  // ARM 64-bit version of this (Ubuntu 64-bit, Arch64)
        svc 0 // Exit
    .end
