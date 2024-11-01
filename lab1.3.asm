.data 0x10000000
msg1: .asciiz "Please enter a number with a decimal: "
.text
.globl main
# Inside main there are some calls (syscall) which will change the
# value in $31 ($ra) which initially contains the return address
# from main. This needs to be saved.
main: 	add.d $f0, $f30, $f28 # save $31 in $16
label1: li $v0, 4 # system call for print_int
la $a0, msg1 # address of string to print
syscall
#
# now get an integer from the user
li $v0, 6 # system call for read_int
syscall # the integer placed in $v0
#
# do some computation here with the number
add.d $f2, $f2, $f0 # move the number in $t0
#
# print the result
li $v0, 2 # system call for print_int
add.d $f12, $f12, $f2 # move number to print in $a0
syscall
# restore now the return address in $ra and return from main
add.d $f30, $f28, $f0 # return address back in $31
jr $ra 	# return from main