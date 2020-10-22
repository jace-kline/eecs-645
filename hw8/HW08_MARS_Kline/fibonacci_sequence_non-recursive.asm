caller:		addi 	$a0, $zero, 18		# initialize argument register $a0 with n = 18
		jal	fib_seq			# call fib_seq
next:		j	exit

##############################################################################
# This routine generates Fibonacci sequence fib(0), fib(1), fib(2), ... fib(n)
# and stores it into the data segment starting at memory address 0x100100A0
# which is pointed at by register $a1

fib_seq:	
####################### Insert Your Code Here ################################
sw $zero, 0($a1) # arr[0] = 0

case1:
addi $t1, $zero, 1 # t1 = 1
blt $a0, $t1, exit
sw $t1, 4($a1) # arr[1] = 1

addi $t0, $0, 2 # let i = 2
loop: 
bgt $t0, $a0, exit # if i > n, go to exit
sll $t1, $t0, 2 # index byte offset (t1) = i * 4
add $t1, $a1, $t1 # t1 = addr of fib[i]
addi $t2, $t1, -4 # t2 = addr of fib[i-1]
addi $t3, $t1, -8 # t3 = addr of fib[i-2]
lw $t2, 0($t2) # t2 = fib[i-1]
lw $t3, 0($t3) # t3 = fib[i-2]
add $t4, $t2, $t3 # t4 = fib[i-1] + fib[i-2]
sw $t4, 0($t1) # fib[i] = fib[i-1] + fib[i-2]

increment:
addi $t0, $t0, 1 # i++
j loop # jump to loop start
##############################################################################

exit:		
