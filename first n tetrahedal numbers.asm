.data
	null:.word 10
.text
main:
	li $v0,5
	syscall
	addi $t0,$v0,0
	addi $t0,$t0,1
	
	li $s0,1 # s0 = n
	
	while:
		beq $s0,$t0,exit
			li $a0,0 # a0 = total
			li $t1,1 # t1 = j
			
			addi $s1,$s0,1
			while2:
				beq $t1,$s1,out2
					li $t2,1 # t2 = i
					
					addi $t3,$t1,1
					while3:
						beq $t2,$t3,out3
							add $a0,$a0,$t2
							addi $t2,$t2,1
							j while3
					out3:
						addi $t1,$t1,1
						j while2
			out2:
				li $v0,1
				syscall
				la $a0,null
				li $v0,4
				syscall
				addi $s0,$s0,1
				j while
exit:
	li $v0,10
	syscall