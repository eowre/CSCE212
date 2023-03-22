.data
	outmessage: .asciiz "Enter two positive numbers, a and b\n"
.text
	li $v0, 4
	la $a0, outmessage
	syscall
	li $v0, 5
	syscall
	move $s0, $v0 #a
	li $v0, 5
	syscall
	move $s1, $v0 #b
	slti $s4, $s1, 5
	addi $t0, $zero, 4
	slt $s3, $t0, $s0
	bne $s3, $s4, Else
	sub $a0, $s0, $s1
	li $v0, 1
	syscall
	j Exit
Else: mul $a0, $s1, $s0
	li $v0, 1
	syscall
Exit: 
	