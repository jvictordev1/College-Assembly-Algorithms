.data
	text1:.asciiz "Type your age: "
	text2:.asciiz "Your age is: "
.text
main:
	li $v0,4
	la $a0,text1
	syscall # print Type your age:
	
	li $v0,5
	syscall # gets the age
	
	addi $s0,$v0,0
	li $v0,4
	la $a0,text2
	syscall # print your age is
	
	addi $a0,$s0,0
	li $v0,1
	syscall # print the age
exit: