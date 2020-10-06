LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.numeric_std.all;
USE work.my_package.ALL;

ENTITY DataMem IS
   PORT( 
      A        : IN  std_logic_vector (n_bits_address - 1 DOWNTO 0);
      MemWrite : IN  std_logic;
      WD       : IN  std_logic_vector (data_mem_width - 1 DOWNTO 0);
      clk      : IN  std_logic;
      rst      : IN  std_logic;
      RD       : OUT std_logic_vector (data_mem_width - 1 DOWNTO 0) := (others=>'0')
   );
END DataMem;

ARCHITECTURE behav OF DataMem IS

   -- Internal signal declarations
   SIGNAL data_mem  : mem_type(0 to data_mem_depth - 1);

BEGIN

   -- **************************** --
   -- DO NOT MODIFY or CHANGE the ---
   -- code template provided above --
   -- **************************** --
   
   ----- insert your code here ------
    RD <= data_mem(to_integer(unsigned(A))) WHEN ((TO_INTEGER(UNSIGNED(A)) >= 0) AND (TO_INTEGER(UNSIGNED(A)) < data_mem_depth)) ELSE (others => '0');

    
    write_process : process (clk, rst, MemWrite, A)
    begin
        if (rst = '1') then
            data_mem <= initial_data_mem;
        elsif (clk'EVENT and clk = '1' and MemWrite = '1' and ((to_integer(unsigned(A)) >= 0) AND (to_integer(unsigned(A)) < data_mem_depth))) then
            data_mem(to_integer(unsigned(A))) <= WD;
        end if;
    end process write_process;
   
   ----------------------------------    

END behav;
