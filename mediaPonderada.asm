.data
	text1:.asciiz "Insira a "
	text2:.asciiz " nota: "
	text3:.asciiz "Parabéns! você foi aprovado! "
	text4:.asciiz "Que pena! você não foi aprovado! "
	text5:.asciiz "sua média é: "
	null:.word 10
.text
main:

	jal msgUsr
	jal calculaMedia
	jal aprovOuNao
	jal encerraPrograma
	
imprimeString:
	li $v0,4
	syscall
	jr $ra
	
imprimeInteiro:
	li $v0,1
	syscall
	jr $ra
	
quebraDeLinha:
	li $v0,4
	syscall
	jr $ra
	
recebeInteiro:
	li $v0,5
	syscall
	jr $ra
	
msgUsr:
	li $t1,1
	sw $ra,-4($sp)
	while: beq $t1,5,stop
		la $a0,text1
		jal imprimeString
	
		addi $a0,$t1,0
		jal imprimeInteiro
	
		la $a0,text2
		jal imprimeString
		
		jal recebeInteiro
		add $v1,$v1,$v0
	
		la $a0,null
		jal quebraDeLinha
		
		addi $t1,$t1,1
		j while
	stop: 
	addi $a0,$v1,0
	lw $ra,-4($sp)
	jr $ra
	
calculaMedia:
	li $t0,4
	div $a0,$t0
	mflo $a0
	jr $ra
	
aprovOuNao:
	li $t0,7
	sw $ra,-4($sp)
	sw $a0,-8($sp)
	addi $s0,$a0,1
	slt $t1,$t0,$s0
	
	beq $t1,$zero,nAprov
		la $a0,text3
		jal imprimeString
		la $a0,text5
		jal imprimeString
		lw $a0,-8($sp)
		jal imprimeInteiro
		
		lw $ra,-4($sp)
		jr $ra
	nAprov:
		la $a0,text4
		jal imprimeString
		la $a0,text5
		jal imprimeString
		lw $a0,-8($sp)
		jal imprimeInteiro
		
		lw $ra,-4($sp)
		jr $ra
	
encerraPrograma:
	li $v0,10
	syscall