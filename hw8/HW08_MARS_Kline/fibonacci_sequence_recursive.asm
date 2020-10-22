
caller:		addi 	$a0, $zero, 18		# initialize argument register $a0 with n = 18
		jal	fib_seq			# call fib_seq
next:		j	exit

##############################################################################
# This routine generates Fibonacci sequence fib(0), fib(1), fib(2), ... fib(n)
# and stores it into the data segment starting at memory address 0x100100A0
# which is pointed at by register $a1

fib_seq:
####################### Insert Your Code Here ################################
sw $zero, 0($a1) 	     # fib[0] = 0
add $v0, $zero, $zero	     # return val = 0
beq $a0, $zero, return	     # if n == 0, return 0
addi $v0, $zero, 1          # return val = 1
sw $v0, 4($a1)	  	     # fib[1] = 1
beq $a0, $v0, return	     # if n == 1, return 1
addi $sp, $sp, -12          # Allocate a stack frame to hold the caller's argument $a0 and caller's return address $ra
sw $ra, 8($sp)              # Store $ra on the stack
sw $a0, 4($sp)              # Store $a0 on the stack
sw $s0, 0($sp)              # Store $s0 on the stack (we use this in our computation)
addi $a0, $a0, -1           # Decrement the argument n for our first recursive call (n = n - 1)
jal fib_seq                 # store next instruction's address in $ra and jump (recursive) to the start of the procedure -> calling fib(n-1)
add $s0, $v0, $zero         # let s0 = return value of fib(n-1)
addi $a0, $a0, -1           # Decrement argument again (n = n - 1)
jal fib_seq                 # jump and link -> calling fib(n-2)
add $v0, $s0, $v0           # return value = fib(n-1) + fib(n-2)
sll $t0, $a0, 2		     # offset = n * 4 (Each array location is 4 bytes)
add $t0, $a1, $t0	     # &fib[n] = &fib[0] + offset
sw $v0, 0($t0)		     # fib[n] = return value
lw $s0, 0($sp)              # reload the original value of $s0
lw $a0, 4($sp)              # reload argument (n) from stack into $a0
lw $ra, 8($sp)              # reload caller's return address from the stack into $ra
addi $sp, $sp, 12           # reset the stack pointer to last frame
return:
jr $ra                      # return to caller


##############################################################################

exit:		
