.text
main:
	jal fib
	jal printInt
	jal killProgram
fib:
	li $t0,1
	addi $t1,$sp,0
	sw $t0,0($sp)
	sw $t0,-4($sp)
	li $s0,1
	
	while:
		beq $s0,9,stop
			addi $t1,$t1,0
			lw $t0,0($t1)
			addi $t1,$t1,-4
			lw $t2,0($t1)
		
			add $v0,$t0,$t2
			sw $v0,-4($t1)
			addi $s0,$s0,1
			j while
	stop:
		lw $a0,0($t1)
		jr $ra
printInt:
	li $v0,1
	syscall
	jr $ra

killProgram:
	li $v0,10
	syscall
