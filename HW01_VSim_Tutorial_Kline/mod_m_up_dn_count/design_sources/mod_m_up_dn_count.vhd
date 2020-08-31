LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
USE ieee.numeric_std.ALL;
USE ieee.std_logic_unsigned.ALL;
USE work.my_package.ALL;
USE work.math_real.ALL;

ENTITY mod_m_up_dn_count IS
	GENERIC (m : NATURAL := 16);
	PORT (up_down	: IN	STD_LOGIC; -- direction of count, 1 --> counting up, 0 --> counting down
	      clk, rst	: IN	STD_LOGIC;
	      count	: OUT	STD_LOGIC_VECTOR(n_bits_of(m) - 1 DOWNTO 0)
	     );
END mod_m_up_dn_count;

ARCHITECTURE behavioral OF mod_m_up_dn_count IS

   -- Architecture declarations
   CONSTANT n_bits_out : NATURAL := count'length;
   
   CONSTANT max : NATURAL := m - 1;
   CONSTANT min : NATURAL := 0;   
   
   -- Internal signal declarations
    SIGNAL count_int : STD_LOGIC_VECTOR(n_bits_out - 1 DOWNTO 0) := (OTHERS => '0');

BEGIN

   -- insert your design here --

   -----------------------------
	
END behavioral;
