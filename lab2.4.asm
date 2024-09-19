.data 0x10010000
.globl ext1
.globl ext2

var1: .word 32
var2: .word 03
ext1: .word 0
ext2: .word 0

.text
.globl main
main:

la $t1, var1 #load variable into a register
la $t2, var2 #load variable into a register

lw $t3, 0($t1) #load var1 into another register
lw $t4, 0($t2) #load var2 into another register

la $t5, ext1 #load ext1 into a register
la $t6, ext2 #load ext1 into a register

sw $t3, 0($t6) #save var1 into ext2
sw $t4, 0($t5) #save var2 into ext1

lw $a0, ext2 #print ext2 to check it's right
li $v0, 1 #telling it to print type int
syscall

li  $v0, 10         # System call to exit program
syscall             # Execute system call
