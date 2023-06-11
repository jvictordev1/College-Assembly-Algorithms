.data
	text1:.asciiz "jose"
	text2:.asciiz "adao"
	text3:.asciiz "the current strings are different"
	text4:.asciiz "the current strings are equal"
.text
main:
	la $t0,text1 # t0 recebe o endereço base da string1
	la $t1,text2 # t1 recebe o endereço base da string2
	
	li $t2,10 # t2 = tamanho maximo das strings
	li $s0,0 # s0 = i (contador)
	li $t4,4 # t4 = 4
	
	while:
	add $s1,$t0,$s0
	add $s2,$t1,$s0
	
	lb $s3,0($s1) # s3 = string1[i]
	lb $s4,0($s2) # s4 = string2[i]
	
	bne $s3,$s4,notequal # while(string1[i]=string2[i]) faça
		beq $s3,0,fw
	fw:	beq $s4,0,equal
		addi $s0,$s0,1
		j while
notequal:
	la $a0,text3
	li $v0,4
	syscall
	j exit
equal:
	la $a0,text4
	li $v0,4
	syscall
	j exit
exit: