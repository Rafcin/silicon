.data
    //Errors
    //Div by zero error
    error_div_by_zero: .asciz "\nCan not div by zero." 
    error_ov_add: .asciz "Overflow in addition" 
    error_ov_sub: .asciz "\nOverflow in subtraction" 
    error_mul: .asciz "\nOutside signed 64-bit range when multiplying" 
    error_input: .asciz "Outside signed 64-bit range. Re-enter value -> \n"
    error_invalid: .asciz "Can not have char for int input. Re-enter value ->\n" 

    //Prompts & Displays
    prompt: .asciz "Enter a number -> "
    dsp_sum: .asciz "The sum is -> "
    dsp_dif: .asciz "\nThe difference is -> "
    dsp_prod: .asciz "\nThe product is -> "
    dsp_quot: .asciz "\nThe quotient is -> "
    dsp_rem: .asciz "\nThe remainder is -> "
    nl: .asciz "\n\n"
    dsp_end: .asciz "\nUser has exited the program. Have a good day!\n"

    //Strings
    string_sum: .skip 21  
    string_dif: .skip 21  
    string_prod: .skip 21  
    string_quot: .skip 21  
    string_rem: .skip 21  

    //Ints
    iX: .quad 0   
    iY: .quad 0   
    iQ: .quad 0   

    //Inputs
    //Limit for inputs
    buffer: .word 21  

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
    input_loop:
        //Use irpc to input_loop for N inputs, in this case X and Y.
        //REFER to RASM 1 IRPC, has texas docs.
        //@todo move input into it's own helper. Tried this but didn't work well. Kept getting stuck.
        .irpc var XY
            //Skip errors, nothing input yet
            b 3f                    
        1:
            //Handle invalid inputs
            //Load errormsg
            //Print error msg
            //Branch
            ldr x0,=error_invalid 
            bl putstring           
            b 3f                  
        2:  
            //Handle error input
            ldr x0,=error_input 
            //Print   
            bl putstring           
        3:
            //Get prompt and print it
            ldr x0,=prompt    
            bl putstring       
            //Load buffer and get input    
            ldr x0,=buffer       
            bl getstring           
            //Load
            ldr x0,=buffer       
            //Load the first byte for checks
            ldrb w1,[x0]            
            //Comp, verify not null
            cmp w1,0               
            //If null exit program and say have a nice day 
            b.eq end                
            //Convert
            bl ascint64
            //If bad input, i.e bad char then retry             
            b.hi 1b                 
            //If input is too large retry
            b.vs 2b                 
            //Load
            ldr x1,=i\var     
            //Store the result      
            str x0,[x1]             
        .endr
        //Jump to origin, origin will do sum calcs
        b origin
        
    origin: 
        //Load the value
        ldr x1,=iX      
        //Deref            
        ldr x1,[x1]
        //Load the value                 
        ldr x2,=iY      
        //Deref            
        ldr x2,[x2]
        //X+Y sum                 
        adds x0,x1,x2
        //If overflow jump to overflow handle               
        b.vs sum_overflow            
        //Load address to store sum
        ldr x1,=string_sum         
        //Convert      
        bl int64asc
        //Load display                
        ldr x0,=dsp_sum
        //Print display            
        bl putstring        
        //Load sum       
        ldr x0,=string_sum  
        //Print             
        bl putstring   
        //Jump to sum            
        b sum 
  
    /**
        __  __ _   _ _     
        |  \/  | | | | |    
        | |\/| | | | | |    
        | |  | | |_| | |___ 
        |_|  |_|\___/|_____|
        DEPENDS ON DIV    
    **/

    mul_overflow:
        //If mul has an overflow, jump here to display the error
        ldr x0,=error_mul          
        //Print mul error
        bl putstring 

    mul:
        //https://developer.arm.com/documentation/dui0802/b/A64-General-Instructions/SDIV
        //sdiv and conditional checks
        //Load X and Y
        ldr x0,=iX                  
        ldr x0,[x0]                 
        ldr x1,=iY                  
        ldr x1,[x1]        
        // Is D = 0?         
        cmp x1,#0   
        //Can't be zero, error out                
        b.eq div_error            
        //X/Y  <- Div
        sdiv x0,x0,x1
        //load quotient               
        ldr x1,=iQ              
        str x0,[x1]    
        //Load and convert qot             
        ldr x1,=string_quot   
        //Conver I AM REALLY COLD RIGHT NOW           
        bl int64asc                
        //Load dsp qot to print
        ldr x0,=dsp_quot       
        //Print    
        bl putstring
        //Load res               
        ldr x0,=string_quot
        //Print res              
        bl putstring               

        //Load X, Y and Q
        ldr x0,=iY                  
        ldr x0,[x0]                 
        ldr x1,=iQ               
        ldr x1,[x1]      
        //q * d = r0          
        mul x0,x0,x1
        //Load neum                
        ldr x1,=iX                  
        ldr x1,[x1]
        //r0 = n - (q*d)                
        sub x0,x1,x0    
        //Load rem for conversion            
        ldr x1,=string_rem       
        //Convert     
        bl int64asc                
        ldr x0,=dsp_rem
        //Print disp rem            
        bl putstring  
        //Load result             
        ldr x0,=string_rem 
        //Print           
        bl putstring
        //Jump to div               
        b div  

    /**
        ____ _____     __
        |  _ \_ _\ \   / /
        | | | | | \ \ / / 
        | |_| | |  \ V /  
        |____/___|  \_/   
                    
    **/
    div_error:
        //Print div by zero error
        ldr x0,=error_div_by_zero         
        bl  putstring    

    div:
        //Get new line
        ldr x0,=nl    
        //Print new line       
        bl putstring   
        //User never entered, return to input_loop and go agin!            
        b input_loop   

    /**
        ____  _   _ ____  
        / ___|| | | | __ ) 
        \___ \| | | |  _ \ 
        ___) | |_| | |_) |
        |____/ \___/|____/ 
                        
        DEPENDS ON MUL
    **/
    sub_overflow:
        //Got a sub overflow? Get the error and print it!
        ldr x0,=error_ov_sub       
        bl putstring  

    sub:
        //Load X and Y
        ldr x1,=iX                  
        ldr x1,[x1]                 
        ldr x2,=iY                  
        ldr x2,[x2]         
        //X * Y        
        mul x0,x1,x2
        //r1 = r0 / X                
        sdiv x1,x0,x1    
        //If r0 / r1 is not Y           
        cmp x1,x2            
        //Handle mul overflow       
        b.ne mul_overflow    
        //Load string prod fro conversion        
        ldr x1,=string_prod              
        //Convert
        bl  int64asc      
        //Load dsp prod for print          
        ldr x0,=dsp_prod         
        //Print  
        bl  putstring
        //Load result for print               
        ldr x0,=string_prod    
        //Print          
        bl putstring
        //Jump to mul calculations               
        b mul             

    sum_overflow:
        //Get the sum overflow err
        ldr x0,=error_ov_add   
        //Print it    
        bl putstring      

    sum:
        //Load X
        ldr x1,=iX
        //Deref                  
        ldr x1,[x1]
        //Load Y                 
        ldr x2,=iY   
        //Deref               
        ldr x2,[x2]      
        //X-Y           
        subs x0,x1,x2
        //If calculation is overflow jump to overflow err               
        b.vs sub_overflow            
        //Load string dif for conversion
        ldr x1,=string_dif              
        //Convert
        bl int64asc
        //Load dsp dif for print                
        ldr x0,=dsp_dif         
        //Print  
        bl putstring      
        //Load value for print         
        ldr x0,=string_dif    
        //Print          
        bl putstring
        //Finished sum, jump to sub               
        b sub 

    end:
        //Display the end of prgrm msg
        ldr x0,=dsp_end   
        //Print it!
        bl putstring   
        // Exit
        mov x0, #0   // ARM 64-bit version
        mov x8, #93  // ARM 64-bit version of this (Ubuntu 64-bit, Arch64)
        svc 0 // Exit
        .end