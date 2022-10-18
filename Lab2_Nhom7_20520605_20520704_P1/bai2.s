.section .data
output: .string "input value: "


.section .bss
	.lcomm number, 4
	.lcomm result, 4

.section .text
	.globl _start

_start:

	movl $0, %esi

.Loop:
    # system call
	movl $4, %eax
	movl $1, %ebx			
	movl $output, %ecx
	movl $26, %edx
	int $0x80

    # input value for 4 times
	movl $3, %eax
	movl $0, %ebx			
	movl $number, %ecx
	movl $4, %edx
	int $0x80

    # transfer value from ascii to integer
    # add the value to result
	subl $48, number
	movl number, %eax	
	addl %eax, result

    # (for int i = 0; i <=3 ; i++)
	addl $1, %esi
	cmpl $3, %esi
	jle .Loop

.Done:
    # div by 4 and get the true result
	movl result, %eax
	shrl $2, %eax
	addl $48, %eax
	movl %eax, result

    # output the result
	movl $4, %eax
	movl $1, %ebx			
	movl $result, %ecx
	movl $4, %edx
	int $0x80

	movl $1, %eax
	int $0x80