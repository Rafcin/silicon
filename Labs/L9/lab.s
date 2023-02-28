.text
.global main
    main:        
        // Load the word to be reversed into x0
        ldr x0, =0x123456789abcdef0

        // Call the subroutine to reverse the byte order of the word
        bl reverse_word

        ldr x12, =0xf0debc9a78563412 

        mov x0, #0   // ARM 64-bit version
        mov x8, #93  // ARM 64-bit version of this (Ubuntu 64-bit, Arch64)
        svc 0 // Exit
    reverse_word:
        mov x1, xzr          // Clear x1 to store the reversed word
        mov x2, #0           // Initialize counter to 0 (starting from least significant byte)
    reverse_loop:
        lsr x3, x0, x2       // Extract a byte from the original word
        mov x4, #56          // Initialize shift amount to 56 (position of the most significant byte)
        sub x4, x4, x2, lsl #3   // Calculate shift amount to move the extracted byte to its correct position in the reversed word
        lsl x3, x3, x4       // Move the extracted byte to the correct position in the reversed word
        orr x1, x1, x3       // Combine the extracted byte with the reversed word
        add x2, x2, #8       // Increment the counter
        cmp x2, #64          // Check if all 8 bytes have been extracted and moved
        blt reverse_loop      // Continue loop until all 8 bytes have been extracted and moved
        ret                  // Return from the subroutine. The result is stored in x1.

