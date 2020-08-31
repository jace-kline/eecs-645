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
    SIGNAL count_int : STD_LOGIC_VECTOR(n_bits-1 downto 0) := (others => '0');

BEGIN

    count <= count_int;

	asynch_reset : PROCESS(clk, rst)
	BEGIN
		IF (rst ='1') THEN
			count_int <= (others => '0');
		ELSIF (clk'EVENT AND clk = '1') THEN
			IF (up_down = '0') THEN
				count_int <= count_int - 1;
			ELSE
				count_int <= count_int + 1;
			END IF;
		END IF;
	END PROCESS;
END behavioral;
