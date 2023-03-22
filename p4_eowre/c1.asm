.data
	msg1: .asciiz "Input 3 variables "
	msg2: .asciiz "Overflow "
	msg3: .asciiz " Not Overflow "
	msg4: .asciiz "Division by Zero"
	lf: .asciiz "\n"

text:

.globl main

main:
	li $v0,4 # print_string syscall code = 4
	la $a0, msg1
	syscall
	li $v0,5 # read_int syscall code = 5
	syscall
	move $t0,$v0 # syscall results returned in $v0
	li $t1, 0 # initialize counter (i)
	li $t2, 0 # initialize sum
loop:	addi $t1, $t1, 1 # i = i + 1
	add $t2, $t2, $t1 # sum = sum + i
	beq $t0, $t1, exit # if i = N, continue
	j loop
	# Exit routine - print msg2
exit: li $v0, 4 # print_string syscall code = 4
	la $a0, msg2
	syscall
	# Exit routne - print msg3
exit1: li $v0, 4 # print_string syscall code = 4
	la $a0, msg2
	syscall
	# Print sum
	li $v0,1 # print_string syscall code = 4
	move $a0, $t2
	syscall
	# Print newline
	li $v0,4 # print_string syscall code = 4
	la $a0, lf
	syscall
	li $v0,10 # exit
	syscall