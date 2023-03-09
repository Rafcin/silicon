/**
memcpy.s
@ Subroutine memcpy: Provided a source address in x0, a destination address in x1, and a size in x2,
@                    memcpy will copy x2 bytes from the source address to the destination address.
@ x0: Must contain the source address
@ x1: Must contain the destination address
@ x2: Must contain the number of bytes to copy
@ All registers are preserved, except x0, x1, x2, and x30
*/

.text
.global memcpy
    memcpy:
        // Save registers x19 to x29, and the link register lr on the stack
        stp x29, x30, [sp, -16]!
        stp x19, x20, [sp, -16]!
        stp x21, x22, [sp, -16]!
        stp x23, x24, [sp, -16]!
        stp x25, x26, [sp, -16]!
        stp x27, x28, [sp, -16]!
        stp x29, lr, [sp, -16]!

        // Set up the stack frame for this function
        mov x29, sp

        // Loop through and copy each byte from source to destination
        loop:
            // Check if we've copied all bytes
            cmp x2, #0
            b.eq exit
            // Load a byte from the source address into x19
            ldrb w19, [x0], #1
            // Store the byte in the destination address
            strb w19, [x1], #1
            // Decrement the byte count
            sub x2, x2, #1
            // Repeat until all bytes are copied
            b loop

        // Clean up the stack frame
        exit:
        // Restore the saved registers x19 to x29, and the link register lr from the stack
        ldp x29, lr, [sp], 16
        ldp x27, x28, [sp], 16
        ldp x25, x26, [sp], 16
        ldp x23, x24, [sp], 16
        ldp x21, x22, [sp], 16
        ldp x19, x20, [sp], 16
        ldp x29, x30, [sp], 16
        ret
        