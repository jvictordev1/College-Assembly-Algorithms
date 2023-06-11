.data
	text1:.asciiz "n = "
	text2:.asciiz "n! = "
.text
main:
	la $a0,text1
	jal imprimeStr
	jal recebeInt
	jal fat
	la $a0,text2
	jal imprimeStr
	addi $a0,$t0,0
	jal imprimeInt
	jal killProgram
	
	
imprimeInt:
	li $v0,1
	syscall
	jr $ra
	
imprimeStr:
	li $v0,4
	syscall
	jr $ra
	
recebeInt:
	li $v0,5
	syscall
	addi $a0,$v0,0
	jr $ra

fat:
	li $t0,1 # fac=1
	li $t1,1 # i=1
	addi $a0,$a0,1
	
	while:
		slt $s0,$t1,$a0 # i<=n? 1:0
		beq $s0,$zero,out
			mul $s1,$t0,$t1 # s1 = fac*i
			addi $t0,$s1,0 # fac=s1
			addi $t1,$t1,1 # i++
			j while
	out:
		jr $ra

killProgram:
	li $v0,10
	syscall