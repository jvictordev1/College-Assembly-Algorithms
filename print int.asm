.data
	integer:.word 12
.text
	li $v0,1
	lw $a0,integer
	syscall
exit: