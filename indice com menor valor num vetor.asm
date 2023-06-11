.data
	vet:   54,18,67,83,5,75,31,92,48,18


	text1:.asciiz "the smallest array value is in position: "
	text2:.asciiz "the smallest value in the array is: "
	null:.word 10
.text
main:
	la $t0,vet # t0 obtem endereço base de vet
	li $t1,10 # tamanho do vetor
	li $s0,0 # contador i=0
	add $s3,$t0,0 # s3 = t0
	
	while:
		beq $s0,$t1,out # while (i<10) faça
			mul $t5,$s0,4 # t5 = i*4
			add $s1,$t0,$t5 # s1 = t0 + t4
			addi $s3,$s3,4  # s3 = s3 + 4
			
			lw $t2,0($s1) # t2 = vet[i]
			lw $t3,0($s3) # t3 = vet[i+1]
			
			slt $s1,$t2,$t3 # vet[i]<vet[i+1]? 1:0
			beq $s1,$zero,out2 # se vet[i]>=vet[i+1] va para out2
				addi $v0,$s0,0 # v0 = indice com menor valor no vetor
				addi $v1,$t2,0 # v1 = menor valor do vetor
				j while
		out2:	addi $s0,$s0,1 # i+=1
			j while
	out:
		addi $t0,$v0,0 # t0 = indice do menor valor
		addi $t1,$v1,0 # t1 = menor valor no vetor
		
		la $a0,text1
		li $v0,4
		syscall
		
		addi $a0,$t0,0
		li $v0,1
		syscall
		
		la $a0,null
		li $v0,4
		syscall
		
		la $a0,text2
		li $v0,4
		syscall
		
		addi $a0,$t1,0
		li $v0,1
		syscall
		
		j exit
exit: