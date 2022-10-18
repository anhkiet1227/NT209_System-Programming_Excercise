.section .data
# show the Good result
goodResult:
    .string "Good\n"
# show the Pass result
passResult:
    .string "Pass\n"
# show the Fail result
failResult:
    .string "Fail\n"

# declare the score
.section .bss
    .lcomm score, 2

.section .text
    .global _start

_start:
        # input the data
        movl $3, %eax
        movl $0, %ebx
        movl $score, %ecx
        movl $4, %edx
        int $0x80

        # this function is generate the first number
        
        # transfer the data to %eax
        # get the first char to %bl
        # then tranfer the first char to interger
        # transfer 10 to %cl using to split the number
        # transfer 0 to edx to clear the data
        # multiply the first number by 10
        # transfer the result to edx

        movl $score, %eax 
        mov 0(%eax), %bl 
        sub $48, %bl  
        mov $10, %cl 
        movl $0, %edx 
        imul %ecx, %ebx 
        addl %ebx, %edx

        # this function is generate the second number

        # transfer the data to %bl
        # then tranfer the second char to interger
        # add the second number to the result to get the full number as the same as the score
        
        mov 1(%eax), %bl
        sub $48, %bl 
        addl %ebx, %edx 
        
        # this function show the Good result
        # compare %dl with 80 to get the Good result or jump to Pass
        cmp $80, %dl 
        jl .passFunction
        movl $4, %eax
        movl $1, %ebx
        movl $goodResult, %ecx
        movl $6, %edx
        int $0x80
        jmp .exitFunction

# this function show the Pass result
.passFunction:
        
        # compare %dl with 55 to get the Pass result or jump to Fail
        cmp $55, %dl
        jl .failFunction
        movl $4, %eax
        movl $1, %ebx
        movl $passResult, %ecx
        movl $6, %edx
        int $0x80
        jmp .exitFunction

# this function show the Fail result
.failFunction:

        # the rest is Fail
        movl $4, %eax 
        movl $1, %ebx
        movl $failResult, %ecx
        movl $6, %edx
        int $0x80
        jmp .exitFunction

# this function to exit safely
.exitFunction: 
        movl $1, %eax
        int $0x80