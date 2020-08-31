LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.std_logic_signed.all;

ENTITY n_bit_up_down_counter IS
	GENERIC (n_bits : NATURAL := 8);
	PORT (up_down	: IN	STD_LOGIC; -- direction of count, 1 --> counting up, 0 --> counting down
	      clk, rst	: IN	STD_LOGIC;
	      count	    : OUT	STD_LOGIC_VECTOR(n_bits-1 downto 0)
			);
END n_bit_up_down_counter;

ARCHITECTURE behavioral OF n_bit_up_down_counter IS
   
   -- Architecture declarations
   
   
   -- Internal signal declarations
   
   
BEGIN

   -- insert your design here --

   -----------------------------

END behavioral;