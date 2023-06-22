.data
	string:.asciiz "hello"
.text
main:
	la $a0,string
	jal setPilha
	jal desemPilha
	
	li $v0,4
	syscall
	
	li $v0,10
	syscall
	
setPilha:
	li $t0,5
	li $t1,0
	addi $s1,$a0,0
	addi $sp,$sp,-5
	
	while:
	beq $t1,$t0,exit
		addi $sp,$sp,1
		lb $s0,0($s1)
		sb $s0,0($sp)
		addi $s1,$s1,1
		addi $t1,$t1,1
		j while
exit:
	jr $ra

desemPilha:
	li $t0,5
	li $t1,0
	addi $s1,$a0,0
	
	while2:
		beq $t1,$t0,exit2
			lb $s0,0($sp)
			sb $s0,0($s1)
			addi $sp,$sp,-1
			addi $s1,$s1,1
			addi $t1,$t1,1
			j while2
exit2:
	addi $sp,$sp,5
	jr $ra
