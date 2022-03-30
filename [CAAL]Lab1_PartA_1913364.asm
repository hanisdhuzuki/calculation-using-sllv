#	NURUL HANIS 1913364 CAAL LAB 1

.data
	welcomemessage:.asciiz "Welcome to Lab 1 exercise! This program will do the following computation: x * 2^y\n"	
	inputmessageX:.asciiz "\nPlease enter a number between 0-9 for x\n"
	inputmessageY:.asciiz "\nPlease enter a number between 0-9 for y\n"
	userprompt: .asciiz "\nDo you want to continue? (Y/N)\n"
	options: .space 16 #for the user options for Y or N, 16 as in 16 char
.text
.globlmain

main:
	#print welcome
	li $v0, 4
	la $a0, welcomemessage #load address
	syscall
	
	##input X
	#print inputmessageX
	li $v0, 4
	la $a0, inputmessageX
	syscall
	
	#get input x (integer)
	li $v0, 5
	syscall
	
	#store  the integer X in t0 , to keep prev value.
	move $t0, $v0
	
	##input Y
	#print inputmessageY
	li $v0, 4
	la $a0, inputmessageY
	syscall
	
	#get input Y (integer)
	li $v0, 5
	syscall
	
	#store  the integer Y in t1 , to keep prev value.
	move $t1, $v0 #y is t1
	
	#the  x * 2^y operation
	sllv $s2,$t0, $t1 #x * 2^y
	
	# DISPLAY INPUT AND RESULT
	#print input X
	li $v0, 1
	move $a0,$t0
	syscall
	
	#print *
	li $a0, '*'
	li $v0, 11 #print char
	syscall
	
	#print 2
	li $a0, '2'
	li $v0, 11 #print char
	syscall
	
	#print ^
	li $a0, '^'
	li $v0, 11 #print char
	syscall
	
	#print input Y
	li $v0, 1
	move $a0,$t1
	syscall
	
	#print =
	li $a0, '='
	li $v0, 11 #print char
	syscall
	
	#print result
	li $v0, 1
	move $a0,$s2
	syscall
	
jal UserOptions
	
end: #telling the system that the code is done
	li $v0, 10
	syscall

UserOptions:
	#loop
	#print userprompt
	li $v0, 4
	la $a0, userprompt #load address
	syscall

	#get user string
	li $a0, 8
	#users options
	la $a0, options 
	li $a1, 16
	syscall
	
	#load options into storage
	lb $t2, 0($a0)
	
	#user input
	beq $t2, 'Y', main
	beq $t2, 'y', main

jr $ra
	

	
