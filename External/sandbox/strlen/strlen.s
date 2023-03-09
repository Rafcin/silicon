//THIS IS A TEST, JACOBS FILE RAN INTO AN ERROR OF X0 UNDEF.


// Style Sheet
// Programmer   : Jacob Campbell
// Assign #     : Lab 12
// Purpose      : External Functions
// Date         : 3/7/2023

// Subroutine mystringLength: Provided a pointer to a null terminated string, string_length will
//      return the length of the string in x0
// x0: Must point to a null terminated string
// lr: Must contain the return address
// All registers are preserved, except x0
.section text
.global strlen
    strlen:
        // Preserve x19 - x30
        str     x19, [sp, #-16]!
        str     x20, [sp, #-16]!
        str     x21, [sp, #-16]!
        str     x22, [sp, #-16]!
        str     x23, [sp, #-16]!
        str     x24, [sp, #-16]!
        str     x25, [sp, #-16]!
        str     x26, [sp, #-16]!
        str     x27, [sp, #-16]!
        str     x28, [sp, #-16]!
        str     x29, [sp, #-16]!
        str     x30, [sp, #-16]!
        str     lr, [sp, #-16]!
        mov     x29, sp                 // Set stack frame

        ldr     x1, x0                  // Move string address to x1

        mov     x0, 0x00                // if(str[i] == 0x00) we hit the end
        ldrb    w2, [x1]                // Load first byte at base address

        mov     x3, #0                  // int i = 0

        b       loop                    // Enter the loop

    loop:
        cmp     x2, 0x00                // Compare to see if we are at the null byte
        beq     end                     // Jump to end when we hit the end

        ldrb    w2, [x1], #1            // Move index pointer forward

        add     x3, x3, #1              // i++

        b       loop                    // Back to top of loop

    end:
            mov     x0, x3                  // Put string length in x0
            // Restore preserved registers
            ldr     x30, [sp], #16
            ldr     x29, [sp], #16
            ldr     x28, [sp], #16
            ldr     x27, [sp], #16
            ldr     x26, [sp], #16
            ldr     x25, [sp], #16
            ldr     x24, [sp], #16
            ldr     x23, [sp], #16
            ldr     x22, [sp], #16
            ldr     x21, [sp], #16
            ldr     x20, [sp], #16
            ldr     x19, [sp], #16

            RET                             // Return to calling fcn