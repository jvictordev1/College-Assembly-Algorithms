.data
	vet:1,5,10,7,3,9,2,6,8,4
	text:.asciiz "num de numeros pares: "
	text2:.asciiz "num de numeros impares: "
	null:.byte 10
.text
main:
	la $a0,vet
	jal verifica
	
	la $a0,text
	sw $v0,0($sp)
	jal imprimeString
	
	lw $v0,0($sp)
	addi $a0,$v0,0
	jal imprimeInt
	
	la $a0,null
	jal imprimeString
	
	la $a0,text2
	jal imprimeString
	
	addi $a0,$v1,0
	jal imprimeInt
	
	la $a0,null
	jal imprimeString
	
	
	li $v0,10
	syscall
	
verifica:
	li $t0,0
	li $t1,10
	
	for:
		li $t2,2
		beq $t0,$t1,exit
			addi $t0,$t0,1
			lw $s0,0($a0)
			div $s0,$t2
			mfhi $t2
			addi $a0,$a0,4
			bne $t2,$zero,imp
				addi $v0,$v0,1
				j for
			imp:
				addi $v1,$v1,1
				j for
exit:
	jr $ra

imprimeString:
	li $v0,4
	syscall
	jr $ra
	
imprimeInt:
	li $v0,1
	syscall
	jr $ra