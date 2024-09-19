.data 0x10010000
var1: .word 8 # Saved as 8
var2: .word 37 # Saved as 37
var3: .word 63 # Saved as 63
var4: .word 120 # Saved as 120

first: .byte 'J' # First letter of my first name
last: .byte 'M' # First letter of last name

.text
.globl main
main:

lui $1, 4097 #load var1 into register
lw $9, 0($1)

lui $1, 4097 #load var4 into register
lw $12, 12($1)

lui $1, 4097 #load var2 into register
lw $10, 4($1)

lui $1, 4097 #load var3 into register
lw $11, 8($1)

addu $13, $0, $9 #put var1 into another register
addu $9, $t0, $12 #put var4 into var1's register
addu $12, $0, $13 #put var1 into var4's register

addu $8, $0, $10 #put var2 into another register
addu $10, $0, $11 #put var3 into var2's register
addu $11, $8, $8 #put var2 into var3's register

lui $1, 4097 #save the swap back in var1
sw $9, 0($1)

lui $1, 4097 #save the swap back in var4
sw $12, 12($1)

lui $1, 4097 #save the swap back in var2
sw $10, 4($1)

lui $1, 4097 #save the swap back in var3
sw $11, 8($1)

end:
j end
