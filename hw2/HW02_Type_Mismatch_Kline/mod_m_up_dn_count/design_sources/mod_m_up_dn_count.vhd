LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
USE ieee.numeric_std.ALL;
USE work.my_package.ALL;

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
   
   -- **************************** --
   -- DO NOT MODIFY or CHANGE the ---
   -- code template provided above --
   -- **************************** --
   
   -- insert your code here --
    count <= count_int;

    asynch_reset : PROCESS(clk,rst)
    BEGIN
        IF (rst = '1') THEN
            count_int <= (OTHERS => '0');
        ELSIF (clk'EVENT AND clk = '1') THEN
            IF (up_down = '0') THEN
                IF(count_int = STD_LOGIC_VECTOR(TO_UNSIGNED(min, n_bits_out))) THEN
                    count_int <= STD_LOGIC_VECTOR(TO_UNSIGNED(max, n_bits_out));
                ELSE
                    count_int <= STD_LOGIC_VECTOR(UNSIGNED(count_int) - TO_UNSIGNED(1, n_bits_out));
                END IF;
            ELSE
                IF(count_int = STD_LOGIC_VECTOR(TO_UNSIGNED(max, n_bits_out))) THEN
                    count_int <= STD_LOGIC_VECTOR(TO_UNSIGNED(min, n_bits_out));
                ELSE
                    count_int <= STD_LOGIC_VECTOR(UNSIGNED(count_int) + TO_UNSIGNED(1, n_bits_out));
                END IF;
            END IF;
        END IF;
    END PROCESS;

   ---------------------------
	
END behavioral;
