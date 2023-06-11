.data
	tab:.word 10
	text1:.asciiz "Welcome to the basic Assembly calculator! Type the operation that you want to do "
	text2:.asciiz "Invalid value! Please try again. "
	text3:.asciiz "Type the operation that you want to do: "
	text4:.asciiz "Insert the two operands (a+b)"
	text5:.asciiz "Operand a: "
	text6:.asciiz "Operand b: "
	text7:.asciiz "Result: "
	text8:.asciiz "Insert the two operands (a-b)"
	text9:.asciiz "Insert the two operands (a*b)"
	text10:.asciiz "Insert the two operands (a/b)"
	text11:.asciiz "rest: "
	goodbye:.asciiz "thanks for using my calculator, see you next time!"
	operations:.asciiz "Press: 1 to Sum | 2 to Subtraction | 3 to Multiplication | 4 to Division | 0 to Exit "
.text
main:
	la $a0,text1
	li $v0,4
	syscall
	
	la $a0,tab
	li $v0,4
	syscall
	
	switch:
		la $a0,operations
		li $v0,4
		syscall
	
		la $a0,tab
		li $v0,4
		syscall
		
		li $v0,5
		syscall
		addi $t0,$v0,0
		
		beq $t0,0,exit
			beq $t0,1,sum
			beq $t0,2,subt
			beq $t0,3,multi
			beq $t0,4,divi
					la $a0,text2
					li $v0,5
					syscall
					
					la $a0,text3
					li $v0,5
					syscall
			j switch
exit:
	la $a0,goodbye
	li $v0,4
	syscall
	
	li $v0,10
	syscall
sum:
	la $a0,text4
	li $v0,4
	syscall
	
	la $a0,tab
	li $v0,4
	syscall
	
	la $a0,text5
	li $v0,4
	syscall
	
	li $v0,5
	syscall
	addi $t1,$v0,0
	
	la $a0,text6
	li $v0,4
	syscall
	
	li $v0,5
	syscall
	addi $t2,$v0,0
	
	la $a0,text7
	li $v0,4
	syscall
	
	add $a0,$t1,$t2
	li $v0,1
	syscall
	
	la $a0,tab
	li $v0,4
	syscall
	
	j switch
subt:
	la $a0,text8
	li $v0,4
	syscall
	
	la $a0,tab
	li $v0,4
	syscall
	
	la $a0,text5
	li $v0,4
	syscall
	
	li $v0,5
	syscall
	addi $t1,$v0,0
	
	la $a0,text6
	li $v0,4
	syscall
	
	li $v0,5
	syscall
	addi $t2,$v0,0
	
	la $a0,text7
	li $v0,4
	syscall
	
	sub $a0,$t1,$t2
	li $v0,1
	syscall
	
	la $a0,tab
	li $v0,4
	syscall
	
	j switch
multi:
	la $a0,text9
	li $v0,4
	syscall
	
	la $a0,tab
	li $v0,4
	syscall
	
	la $a0,text5
	li $v0,4
	syscall
	
	li $v0,5
	syscall
	addi $t1,$v0,0
	
	la $a0,text6
	li $v0,4
	syscall
	
	li $v0,5
	syscall
	addi $t2,$v0,0
	
	la $a0,text7
	li $v0,4
	syscall
	
	mul $a0,$t1,$t2
	li $v0,1
	syscall
	
	la $a0,tab
	li $v0,4
	syscall
	
	j switch
divi:
	la $a0,text10
	li $v0,4
	syscall
	
	la $a0,tab
	li $v0,4
	syscall
	
	la $a0,text5
	li $v0,4
	syscall
	
	li $v0,5
	syscall
	addi $t1,$v0,0
	
	la $a0,text6
	li $v0,4
	syscall
	
	li $v0,5
	syscall
	addi $t2,$v0,0
	
	la $a0,text7
	li $v0,4
	syscall
	
	div $t1,$t2
	mflo $a0
	li $v0,1
	syscall
	
	la $a0,tab
	li $v0,4
	syscall
	
	la $a0,text11
	li $v0,4
	syscall
	
	mfhi $a0
	li $v0,1
	syscall
	
	j switch