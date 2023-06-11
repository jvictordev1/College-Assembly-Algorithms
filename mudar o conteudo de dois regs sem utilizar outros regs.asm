.text
main:
	addi $t0,$zero,1
	addi $t1,$zero,2
	
	sw $t0,-4($sp)
	addi $t0,$t1,0
	
	lw $t1,-4($sp)
exit: