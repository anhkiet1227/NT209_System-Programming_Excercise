.section .data
str: .string "Love UIT"
str_length = . -str
# get string

.section .bss
	.lcomm length, 4

.section .text
	.globl _start

_start:
    # get string length to esi
	# sub 1 to esi
	# tranfer
	# push esi to length
	movl $str_length, %esi      
	subl $1, %esi              
	addl $48, %esi             
	movl %esi, length           
	
    # show length
    movl $4, %eax               
	movl $1, %ebx			   
	movl $length, %ecx          
	movl $1, %edx               
	int $0x80                   
 
	movl $1, %eax
	int $0x80