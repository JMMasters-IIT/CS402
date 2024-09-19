.data 0x10010000

msg1: .asciiz "Please enter an integer number: "
msg2: .asciiz "Please enter another integer number: "
msg3: .asciiz "I'm far away"
msg4: .asciiz "I'm nearby"

.text
.globl main
main:

li $v0, 4 # system call for print_str
la $a0, msg1 # address of string to print
syscall

li $v0, 5 #capture the input, put into $v0
syscall
move $t0, $v0 #move input to $v0
li $v0, 0 #reset $v0

li $v0, 4 # system call for print_str
la $a0, msg2 # address of string to print
syscall

li $v0, 5 #capture the other input, put into $v0
syscall
move $t1, $v0 #move input to $t1
li $v0, 0 #reset $v0 

beq $t0, $t1, Far
li $v0, 4 # system call for print_str
la $a0, msg4 # address of string to print
syscall
j End

Far:
li $v0, 4 # system call for print_str
la $a0, msg3 # address of string to print
syscall
j End

End:
li $v0, 10
syscall
