LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.numeric_std.all;
USE work.my_package.ALL;

ENTITY InstrMem IS
   PORT( 
      A     : IN  std_logic_vector (n_bits_address - 1 DOWNTO 0);
      rst   : IN  std_logic;
      Instr : OUT std_logic_vector (instr_mem_width - 1 DOWNTO 0)
   );
END InstrMem;

ARCHITECTURE behav OF InstrMem IS

   -- Internal signal declarations
   SIGNAL instr_mem  : mem_type(0 to instr_mem_depth - 1);

BEGIN

   -- **************************** --
   -- DO NOT MODIFY or CHANGE the ---
   -- code template provided above --
   -- **************************** --
   
   ----- insert your code here ------

   ---------------------------------------------------------------------------
   read_process : PROCESS (A, rst)
   ---------------------------------------------------------------------------
   BEGIN
      Instr <= (others => '0'); -- Default instruction is NOP (No OPeration)
      IF (rst = '1') THEN
         instr_mem <= my_program; -- Asynchronous reset mimicking program load
      ELSE
         IF ((TO_INTEGER(UNSIGNED(A)) >= 0) AND (TO_INTEGER(UNSIGNED(A)) < instr_mem_depth)) THEN -- Address guard for read port
            Instr <= instr_mem(TO_INTEGER(UNSIGNED(A))); -- Read operation
         END IF;
      END IF;
   END PROCESS read_process;

   ----------------------------------    

END behav;
