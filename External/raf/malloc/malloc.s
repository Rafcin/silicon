/**
malloc.s
@ Subroutine malloc: Provided the number of bytes needed in x0, malloc will allocate that number of bytes
@                    on the heap and return a pointer to the newly allocated memory block in x0.
@ x0: Must contain the number of bytes to allocate
@ LR: Must contain the return address
@ All registers are preserved, except x0-x1 and x30
*/

.text
.global malloc
    malloc:
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
        
        // Get the page size from the system
        mov x8, #0x120 // syscall number for getpagesize
        svc #0 // execute syscall
        mov x19, x0 // save page size
        
        // Calculate the number of pages needed
        add x0, x0, x19 // add the page size to the number of bytes
        sub x0, x0, #1 // subtract 1 to ensure the allocation size is a multiple of the page size
        mov x1, x19 // move page size to x1
        udiv x0, x0, x1 // divide the allocation size by the page size
        add x0, x0, #1 // add 1 to account for the initial allocation request
        
        // Allocate memory
        mov x8, #0x22 // syscall number for mmap
        mov x1, #0 // address hint
        mov x2, x19 // allocation size
        mov x3, #0x22 // read/write, private
        mov x4, #-1 // file descriptor, not used
        mov x5, #0 // offset into file, not used
        svc #0 // execute syscall
        
        // Check if mmap failed
        cmp x0, #0xFFFFFFFFFFFFFFFF
        b.eq exit
        
        // Clean up the stack frame and return the allocated memory block address
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
        