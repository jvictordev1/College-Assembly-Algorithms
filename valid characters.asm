.data
	text1:.asciiz "olá mundo! como estão?"
	text2:.asciiz "the number of valid characters in the string is: "
.text
main:
	la $s0,text1 # s0 terá o endreço base da string a ser consultada
	addi $t0,$zero,0 # i = 0, contador de caracteres validos na string
	addi $t2,$zero,0 # j = 0, contador para varrer string
	
	while:
		add $s1,$s0,$t2 # s1 = s0 + j
		lb $t1,0($s1) # t1 = string[j]
		beq $t1,$zero,out # while (string[j]!=0) faça
			addi $t0,$t0,1 # i+=1
			addi $t2,$t2,1 # j+=1
			j while
out:
	la $a0,text2
	li $v0,4
	syscall
	
	addi $a0,$t0,0
	li $v0,1
	syscall
	j exit
exit: