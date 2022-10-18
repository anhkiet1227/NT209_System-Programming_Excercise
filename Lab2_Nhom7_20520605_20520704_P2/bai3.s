.section .data
# string capital letter
capital: 
	.string "capital letter\n"
# string small letter
small:
	.string "small letter\n"
	
# declare the string variable is str
.section .bss
	.lcomm str,1

.section .text
	.globl _start
_start:
    # system call and get the input
	movl $3, %eax
	movl $0, %ebx
	movl $str, %ecx
	movl $2, %edx
	int $0x80
	
    # check the input is capital letter or small letter
	cmpb $'a', str
    # if it is capital letter, jump to capital label 
	jle .capitalLabel
	
    # if it is small letter, use this function to print the small letter and jump to exit label
	movl $4, %eax
	movl $1, %ebx		
	movl $small, %ecx
	movl $14, %edx
	int $0x80
	
    # jump to exit label
	jmp .exitLabel
	
# this function print the capital letter
.capitalLabel:
	movl $4, %eax
	movl $1, %ebx		
	movl $capital, %ecx
	movl $16, %edx
	int $0x80 

# this function to get the exit safely
.exitLabel:
	movl $1, %eax
	int $0x80
	
	