LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
 
ENTITY n_bit_up_down_counter_tb IS
END n_bit_up_down_counter_tb;
 
ARCHITECTURE Behavioral OF n_bit_up_down_counter_tb IS 
 
   -- Component Declaration for the Unit Under Test (UUT)
   COMPONENT n_bit_up_down_counter
	GENERIC (n_bits : NATURAL := 8);
	PORT (up_down	: IN	STD_LOGIC; -- direction of count, 1 --> counting up, 0 --> counting down
	      clk, rst	: IN	STD_LOGIC;
	      count	    : OUT	STD_LOGIC_VECTOR(n_bits-1 downto 0)
		  );
   END COMPONENT;   
   
   -- Clock period definitions
   CONSTANT n_bits : NATURAL := 5;
   CONSTANT clk_period : time := 10 ns;
   
   --Inputs
   SIGNAL up_down   : STD_LOGIC := '1';
   SIGNAL clk       : STD_LOGIC := '0';
   SIGNAL rst       : STD_LOGIC := '0';

   --Outputs
   SIGNAL count : STD_LOGIC_VECTOR(n_bits-1 downto 0);
 
BEGIN
 
   -- Instantiate the Unit Under Test (UUT)
    uut : n_bit_up_down_counter 
    		GENERIC MAP (n_bits  => n_bits)
    		PORT MAP    (up_down => up_down,
    			         clk     => clk,
                         rst     => rst,
                         count   => count
                         );
                                     
   -- Clock process definitions
   clk_process :process
   begin
		clk <= '0';
		wait for clk_period/2;
		clk <= '1';
		wait for clk_period/2;
   end process;

   -- Stimulus process
   stim_proc: process
   begin		
      -- insert stimulus here
		rst     <= '1';
		up_down <= '1';
    wait for clk_period*3;
    
		rst     <= '0';
		up_down <= '1';
    wait for clk_period*40;

		rst     <= '0';
		up_down <= '0';
    wait for clk_period*40;   

      wait;
   end process;

END;

