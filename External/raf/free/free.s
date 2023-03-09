/**
free.s
@ Subroutine free: Provided an address in x0, free will deallocate the memory block pointed to by the address.
@                  If the address provided is not a valid address, the program will exit.
@ x0: Must contain the address of the block to free
@ LR: Must contain the return address
@ All registers are preserved, except x0 and x30
*/

.text
.global free
    free:
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
        
        // Check if address is valid
        cmp x0, #0
        b.eq exit
        
        // Deallocate memory
        mov x8, #0x4002 // syscall number for munmap
        mov x1, x0 // address
        mov x2, x1 // size
        svc #0 // execute syscall
        
        // Check if munmap failed
        cmp x0, #0xFFFFFFFFFFFFFFFF
        b.eq exit
        
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
        