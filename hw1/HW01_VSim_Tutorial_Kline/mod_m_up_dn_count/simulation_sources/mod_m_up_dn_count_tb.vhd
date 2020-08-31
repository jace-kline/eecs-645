LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
USE work.my_package.ALL;
USE work.math_real.ALL;
 
ENTITY mod_m_up_dn_count_tb IS
END mod_m_up_dn_count_tb;
 
ARCHITECTURE Behavioral OF mod_m_up_dn_count_tb IS 
 
   -- Component Declaration for the Unit Under Test (UUT)  
	COMPONENT mod_m_up_dn_count
		GENERIC (m : NATURAL := 16);
		PORT (up_down	: IN	STD_LOGIC; -- direction of count, 1 --> counting up, 0 --> counting down
		      clk, rst	: IN	STD_LOGIC;
		      count	: OUT	STD_LOGIC_VECTOR(n_bits_of(m) - 1 DOWNTO 0)
		     );
	END COMPONENT;
   
   -- Clock period definitions
   CONSTANT m : NATURAL := 27;
   CONSTANT clk_period : time := 10 ns;
   
   --Inputs
   SIGNAL up_down   : STD_LOGIC := '1';
   SIGNAL clk       : STD_LOGIC := '0';
   SIGNAL rst       : STD_LOGIC := '0';

   --Outputs
   SIGNAL count : STD_LOGIC_VECTOR(n_bits_of(m) - 1 downto 0);
 
BEGIN
 
   -- Instantiate the Unit Under Test (UUT)
    uut : mod_m_up_dn_count 
    		GENERIC MAP (m  => m)
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

