.data
	text1:.asciiz "Welcome! whats your name? "
	name:.space 25
	text2:.asciiz "Hello, "
.text
main:
	la $a0,text1
	li $v0,4
	syscall # print whats your name
	
	li $v0,8
	la $a0,name
	la $a1,25
	syscall # reads the name
	
	la $a0,text2
	li $v0,4
	syscall # print hello
	
	la $a0,name
	li $v0,4
	syscall
exit: