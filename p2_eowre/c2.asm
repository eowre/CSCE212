.data
	lpst: .asciiz "Loop starts!\n"
	lpend: .asciiz "Loop ends!\n"
	nl: .asciiz "\n"
	array: .space 40
.text
	li $v0, 4
	la $a0, lpst
	syscall
	addi $s0, $zero, 0
	addi $t0, $zero, 0
	addi $t1, $zero, 4
	#la $t0, array
Loop: bgt $s0, 5, exit
	sub $t1, $t1, $s0
	sw $t1, array($t0)
	addi $t0, $t0, 8 #index
	addi $s0, $s0, 2#increment
	j Loop
exit: li $v0, 4
	la $a0, lpend
	syscall