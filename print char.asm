.data
	char:.byte 'A'
.text
	li $v0,4
	la $a0,char
	syscall
exit: