.data
	outmessage: .asciiz "Enter two positive numbers, a and b\n"
	donemessage: .asciiz "Done!"
	loopmessage: .asciiz "Calculating F = i*a+b for i=0 to i=4\n"
	newline: .asciiz "\n"
	inloop1: .asciiz "F = "
.text
	li $v0, 4
	la $a0, outmessage
	syscall
	li $v0, 5
	syscall
	move $s1, $v0 #a
	li $v0, 5
	syscall
	move $s2, $v0 #b
	addi $s0, $zero, 0 #i
	li $v0 , 4
	la $a0, loopmessage
	syscall
Loop: bgt, $s0, 4, exit #Calculate F
	li $v0, 4
	la $a0, inloop1
	syscall
	mul  $t0, $s1, $s0
	add $a0, $t0, $s2
	li $v0, 1
	syscall
	li $v0, 4
	la $a0, newline
	syscall
	addi $s0, $s0, 1
	j Loop
exit: li $v0, 4
	la $a0, donemessage
	syscall