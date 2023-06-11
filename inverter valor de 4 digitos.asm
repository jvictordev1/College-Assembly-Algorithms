.text
main:
	li $a0,5382
	jal divideVal
	jal montaVal
	jal finalizaPrograma
	
divideVal:
	li $t0,10
	addi $t3,$sp,0
	addi $s0,$a0,0
	while:
		slt $t1,$s0,$t0 # s0<t0? 1:0
	
		bne $t1,$zero,stop
			addi $t3,$t3,-4
			div $s0,$t0
			mfhi $t2
			mflo $s0
			sw $t2,0($t3)
			j while
	stop:
		addi $t3,$t3,-4
		sw $s0,0($t3)
		jr $ra
montaVal:
	li $t0,1000
	li $t2,10
	addi $t3,$sp,0
	li $t1,0
	
	while2:	
		beq $t1,4,exit
			addi $t3,$t3,-4
			lw $s0,0($t3)
			mul $s1,$s0,$t0
			add $v1,$v1,$s1
			div $t0,$t2
			mflo $t0
			addi $t1,$t1,1
			j while2
	exit:
		jr $ra

finalizaPrograma:
	li $v0,10
	syscall