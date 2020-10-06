LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.numeric_std.all;
USE work.my_package.ALL;

ENTITY RegFile IS
   PORT( 
      RA1      : IN  std_logic_vector (n_bits_of(reg_file_depth) - 1 DOWNTO 0);
      RA2 	   : IN  std_logic_vector (n_bits_of(reg_file_depth) - 1 DOWNTO 0);
      RegWrite : IN  std_logic;
      WA  	   : IN  std_logic_vector (n_bits_of(reg_file_depth) - 1 DOWNTO 0);
      WD  	   : IN  std_logic_vector (reg_file_width - 1 DOWNTO 0);
      clk      : IN  std_logic;
      rst      : IN  std_logic;
      RD1 	   : OUT std_logic_vector (reg_file_width - 1 DOWNTO 0) := (others => '0');
      RD2 	   : OUT std_logic_vector (reg_file_width - 1 DOWNTO 0) := (others => '0')
   );
END RegFile;

ARCHITECTURE behav OF RegFile IS

   -- Internal signal declarations
   SIGNAL reg_file  : mem_type(0 to reg_file_depth - 1) := (others=>(others=>'0'));
   
   SIGNAL RA1_index : std_logic_vector (RA1'length - 1 DOWNTO 0) := (others=>'0');
   SIGNAL RA2_index : std_logic_vector (RA2'length - 1 DOWNTO 0) := (others=>'0');
   SIGNAL WA_index  : std_logic_vector (WA'length - 1 DOWNTO 0) := (others=>'0');

BEGIN

RA1_index <= RA1;
RA2_index <= RA2;
WA_index <= WA;

read_process : process (RA1_index, RA2_index)
    variable ABOVE_MIN : boolean;
    variable BELOW_MAX : boolean;
    variable DEFAULT_VEC : std_logic_vector (reg_file_width - 1 DOWNTO 0) := (others=>'0');
begin
    ABOVE_MIN := RA1_index >= std_logic_vector(to_unsigned(0, n_bits_of(reg_file_depth)));
    BELOW_MAX := RA1_index < std_logic_vector(to_unsigned(reg_file_depth, n_bits_of(reg_file_depth)));
    if (ABOVE_MIN and BELOW_MAX) then
        RD1 <= reg_file(to_integer(unsigned(RA1_index)));
    else
        RD1 <= DEFAULT_VEC;
    end if;
    ABOVE_MIN := RA2_index >= std_logic_vector(to_unsigned(0, n_bits_of(reg_file_depth)));
    BELOW_MAX := RA2_index < std_logic_vector(to_unsigned(reg_file_depth, n_bits_of(reg_file_depth)));
    if (ABOVE_MIN and BELOW_MAX) then
        RD2 <= reg_file(to_integer(unsigned(RA2_index)));
    else
        RD2 <= DEFAULT_VEC;
    end if;     
end process read_process;

write_process : process (WA_index)
    variable ABOVE_MIN : boolean;
    variable BELOW_MAX : boolean;
begin
    if (RegWrite = '1') then
        ABOVE_MIN := WA_index > std_logic_vector(to_unsigned(0, n_bits_of(reg_file_depth)));
        BELOW_MAX := WA_index < std_logic_vector(to_unsigned(reg_file_depth, n_bits_of(reg_file_depth)));
        if (ABOVE_MIN and BELOW_MAX) then
            reg_file(to_integer(unsigned(WA_index))) <= WD;
        end if;
    end if;      
end process write_process;
   --- insert your code here ---



   -----------------------------

END behav;
