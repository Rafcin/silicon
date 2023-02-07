// Subroutine read_number: This method reads a signed integer value from the user, validates it, and returns the value in the X0 register.
// The user is prompted with the message "Enter a whole number - " and the input is read using the getstring subroutine. 
// The input string is then converted to a signed integer using the ascint64 subroutine. 
// If the input is not a valid signed integer, the user is prompted with an error message "Invalid input. Please enter a whole number." 
// and the input process is repeated until a valid value is entered.

// LR: Contains the return address

// Returned register contents:
//      X0: signed integer result
// ALL AAPCS Mandated Registers are preserved
.include "../macros/syscall.inc"
.include "../macros/aapcs64.inc"

.section .data
    // Input prompt
    input_prompt: .asciz "Enter a whole number - "
    // Error prompt just in case
    error_prompt: .asciz "Invalid input. Please enter a whole number."

    // Newline
    new_line: .asciz "\n"

    // Buffer for inputs
    input_buffer: .space 21
    // Validation for integer format
    input_pattern: .asciz "%d" 

.section .text
.global read_number
read_number:
    // Start a new stack frame
    enterfn

    // Display the input prompt
    ldr x0, =input_prompt
    bl putstring

    // Read the input from the user
    ldr x0, =input_buffer
    mov x1, 21
    bl getstring

    // Convert the input string to a number
    ldr x0, =input_buffer
    bl ascint64

    // Check if the conversion was successful
    cmp x0, #0
    b.eq read_number_error

    // End the current stack frame and return the result
    exitfn

    // If the conversion was not successful, display the error prompt
read_number_error:
    ldr x0, =error_prompt
    bl putstring

    // Repeat the input process
    b read_number
