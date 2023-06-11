.data
	vet:59,46,32,81,46,55,87,43,70,80
.text
main:
	la $a0,vet
	li $a1,10
	jal bubblesort
	
	li $v0,10
	syscall
bubblesort:
	li $t0,0 # t0 = aux
	li $t2,0 # t2 = j
	
	addi $t2,$a1,-1
	for:
		li $s1,1
		slt $s0,$s1,$t2 # 1<=j? 1:0
		beq $s0,$zero,exit
		
		li $t1,0 # t1 = i
		for2:
			slt $s0,$t1,$t2 # i<j? 1:0
			li $s1,4
			beq $s0,$zero,out
				mul $s3,$s1,$t1
				add $s3,$s3,$a0
				lw $s2,0($s3)
				addi $s4,$t1,1
				mul $s4,$s1,$s4
				add $s4,$s4,$a0
				lw $s5,0($s4)
			
				slt $s0,$s5,$s2 # vet[i+1]<vet[i]? 1:0
				beq $s0,$zero,out2
					addi $t0,$s2,0
					sw $s5,0($s3)
					sw $t0,0($s4)
					j out2
		out2:
			addi $t1,$t1,1
			j for2
			
	out:
		addi $t2,$t2,-1
		j for
exit:
	jr $ra
