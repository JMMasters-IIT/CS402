.data 0x10010000

my_array: .space 40
initial_value: .word 6 #j

.text
.globl main
main:
la $t0, my_array
lw $t1, initial_value #put 6 or j into $t1
li $t2, 0 #i=0
li $a3, 10 #what i needs to get to to break loop

Loop: 
ble $a3, $t2, End #branch if less than or equal to $a3 (10)
sw $t1, 0($t0) #put j in the array
lw $a0, 0($t0) #put j into $a0 to print
li $v0, 1 #call to print int
syscall
addi $t1, $t1, 1 #increment j by 1
addi $t2, $t2, 1 #increment i by 1 to break loop
addi $t0, $t0, 4 #add offset to base
j Loop

End:
li $v0, 10
syscall
