.data
	text: .asciiz "ascii"
.text
main:
	li $t0,0
	li $t1,5
	la $s0,text
	
	while:
		beq $t0,$t1,exit
			lb $s1,0($s0)
			addi $s1,$s1,-32
			sb $s1,0($s0)
			add $s0,$s0,1
			addi $t0,$t0,1
			j while
exit:
	la $a0,text
	li $v0,4
	syscall
	
	li $v0,10
	syscall