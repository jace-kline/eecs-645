# EECS 645 - HW 7
### Author: Jace Kline

## Problem 2.24

PC = 0x2000 0000, target = 0x4000 0000

No, no. The jump instruction (j) has an address field of 26 bits. After this value is shifted left by 2 bits, this value is multiplied by 4 and extends the value to 28 bits. We concatenate the first 4 bits from the PC address to the left of this address (most significant bits), which results in a 32-bit absolute address. Since the final jump destination address must inherit the furthest left byte from the PC address, the jump destination must be of the form 
jump_dest = 0x2000 0000 + offset, where offset <= 0x0fff fffc.
Hence, jump_dest >= 0x2000 0000 and jump_dest <= 0x2fff fffc.
As we can see, for all jump addresses possible, jump_dest < target and therefore it is not possible for a jump to reach 0x4000 0000. Since the branch-on-equal (beq) has only a 16-bit address field which is less than the jump range, it is additionally not possible to reach the target address via a 'beq' instruction.



## Problem 2.25

### 2.25.1
This instruction would be an I-format instruction. This is because it is a variation of a conditional branching instruction similar to 'beq'.

### 2.25.2
Code (without pseudo instruction 'ble'):
```
slt $t0, $zero, $t2   # $t0 = ($t2 > 0) ? 1 : 0
beq $t0, $zero, loop  # if($t0 == 0) goto loop
addi $t2, $t2, -1     # $t2 = $t2 - 1
```

Code (with pseudo instruction 'ble'):
```
ble $t2, $zero, loop  # if($t2 <= 0) goto loop
addi $t2, $t2, -1     # $t2 = $t2 - 1
```


## Problem 2.26

### 2.26.1
Assume $t1 = 10, $s2 = 0. There are 10 iterations of the loop and each iteration increments the value in $s2 by 2. Hence, we get `$s2 = 10(2) + 0 = 20`.
```Answer: $s2 = 20```

### 2.26.2
Let registers $s1, $s2, $t1, and $t2 correspond to the C integer variables A, B, i, and temp.
Equivalent C code:
```c
int i;
int B;
// ... initialize i and B ...
while(i > 0) {
  i = i - 1;
  B = B + 2;
}
```

### 2.26.3
Suppose $t1 stores value N for some N >= 0. The case when i = 0 causes 2 instructions to execute. The case when i > 0 (one iteration) causes 5 instructions to execute. Given i = N, we will execute N full iterations followed by the i = 0 case. Therefore:
```Instructions executed = 5N + 2```
