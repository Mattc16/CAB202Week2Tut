.section .init0 // Places code at the top of programme memory

entry:
    ldi r16, 0xFF
    mov r1, r16
    ldi r22, 0x10
    ldi r16, 0xCC
    mov r4, r16
// DO NOT EDIT ABOVE THIS LINE //

    
    // Ex 2.0
    // 
    // Write assembly code to add the numbers 53 and 34
    // together, and store the result in register R0.
    //
    // Hint: 
    //   Recall the "ldi" instruction is used to load a value into a register,
    //   and the "mov" instruction will copy a value between registers.
    ldi r16, 0b00110101
    ldi r17, 0x22
    add r16, r17
    mov r0, r16


    // Write your code for Ex 2.0 above this line.
    mov r16, r0
    call avremu_r16out



    // Ex 2.1
    // 
    // Using an "and" instruction clear only bits 2, 3 and 7 of R1.
    ldi r17, 0b01110011
    and r1, r17


    // Write your code for Ex 2.1 above this line.
    mov r16, r1
    call avremu_r16out



    // Ex 2.2
    // 
    // Using an "ori" instruction set only bits 1, 3 and 5 of R20.
    ldi r20, 0x00
    ori r20, 0b00101010



    // Write your code for Ex 2.2 above this line.
    mov r16, r20
    call avremu_r16out



    // Ex 2.3
    // 
    // Using exactly one instruction, add 1 to the value of r0.
    //
    // Hint:
    //   You can find a full list of arithmetic instructions summarised in
    //   table 5-2 of the AVR Instruction Set Manual.
    ldi r24, 0b00000001
    add r0, r24


    // Write your code for Ex 2.3 above this line.
    mov r16, r0
    call avremu_r16out



    // Ex 2.4
    //
    // Write assembly code to add 44 to 14685 storing the result
    // in register pair R30:R31 (low byte in R30).
    ldi r30, 0b01011101
    ldi r31, 0b00111001
    addiw r30, 0b00101100


    // Write your code for Ex 2.4 above this line.
    mov r16, r30
    call avremu_r16out
    mov r16, r31
    call avremu_r16out



    // Ex 2.5
    //
    // Step 1: Encode the decimal value -4 as a two's complement, 8-bit binary number.
    // Step 2: Write down the result of Step 1 as a hexadecimal literal.
    // Step 3: Swap the two nibbles of the hexadecimal literal you wrote in Step 2.
    // Step 4: Write assembly code to load the result of Step 3 into register R21.
    ldi r21, 0xFC
    swap r21

    
    // Write your code for Ex 2.5 above this line.
    mov r16, r21
    call avremu_r16out



    // Ex 2.6
    //
    // Write assembly code to use an "add" instruction to subtract the value in r22
    // from 91, and store the result in r23.
    ldi r21, 0b1010100
    add r22, r21
    mov r23, r22


    // Write your code for Ex 2.6 above this line.
    mov r16, r23
    call avremu_r16out



    // Ex 2.7
    //
    // Write assembly code to multiply the number 20 by 2
    // and store the result in R2.
    ldi r18, 0b00010100
    lsl r18
    mov r2, r18


    // Write your code for Ex 2.7 above this line.
    mov r16, r2
    call avremu_r16out

    
    
    // Ex 2.8
    //
    // Write assembly code to divide the number -37 by 4
    // and store the result in R3.
    ldi r19, 0b11011011
    lsr r19
    lsr r19
    mov r3, r19


    // Write your code for Ex 2.8 above this line.
    mov r16, r3
    call avremu_r16out



    // Ex 2.9
    //
    // Write assembly code to toggle the most significant bit, and
    // least significant 4 bits of R4.
    ldi r16, 0b10001111
    eor r4, r16


    // Write your code for Ex 2.9 above this line.
    mov r16, r4
    call avremu_r16out



// END OF TUTORIAL02 EXERCISES //
// DO NOT EDIT BELOW THIS LINE //

    ldi r16, 0x22      // DISP_EN (PB1) | DISP_DP (PB5)
    sts 0x0420, r16    // Set as outputs
    sts 0x0424, r16    // Drive high

    break   // Terminate here for autograder

    ldi r16, 0x20 // DISP_DP (PB5)
    ldi r17, 0x00

loop:
    // Delay
    com r17
    brne loop
    inc r18
    brne loop
    inc r19
    brne loop

    // Toggle DP LED
    sts 0x0427, r16     
    
    // Loop
    rjmp loop

// This procedure outputs the contents of r16 when using the emulator.
// Address 0x1500 is reserved in the memory map so this procedure has 
// no effect when running on the ATtiny1626 hardware.
avremu_r16out:
    sts 0x1500, r16
    ret
