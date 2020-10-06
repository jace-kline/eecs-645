LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.numeric_std.all;
USE work.my_package.ALL;

ENTITY ALU IS
   PORT( 
      A           : IN     std_logic_vector (n_bits_alu  - 1 DOWNTO 0);
      ALUControl  : IN     std_logic_vector (n_bits_of(n_functions_alu) - 1 DOWNTO 0);
      B           : IN     std_logic_vector (n_bits_alu  - 1 DOWNTO 0);
      C           : OUT    std_logic_vector (n_bits_alu  - 1 DOWNTO 0);
      zero        : OUT    std_logic;
      overflow    : OUT    std_logic
   );
END ALU;


ARCHITECTURE behav OF ALU IS

   -- Internal signal declarations
   SIGNAL ALUControl_int : natural RANGE 0 TO (n_functions_alu - 1);
   SIGNAL C_internal : std_logic_vector(n_bits_alu  - 1 DOWNTO 0);
   SIGNAL s_A, s_B, s_C : std_logic; -- Sign bits of A, B, C

BEGIN
    ALUControl_int <= to_integer(unsigned(ALUControl));
    C <= C_internal;
    s_A <= A(n_bits_alu - 1);
    s_B <= B(n_bits_alu - 1);
    s_C <= C_internal(n_bits_alu - 1);
    zero <= '1' when (unsigned(C_internal) = 0) else '0';
    
    overflow <= '1' when (((ALUControl_int = 2) and (s_A = s_B) and (s_C /= s_A)) or 
                      ((ALUControl_int = 6) and 
                            (((s_A = '0') and (s_B = '1') and (s_C = '1')) or 
                            ((s_A = '1') and (s_B = '0') and (s_C = '0'))))) 
             else '0';
    
    calc_c : process (A, B, ALUControl_int)
    begin
        case ALUControl_int is
            when 0 => C_internal <= A and B;
            when 1 => C_internal <= A or B;
            when 2 => C_internal <= std_logic_vector(signed(A) + signed(B));
            when 6 => C_internal <= std_logic_vector(signed(A) - signed(B));
            when 7 => 
                if (signed(A) < signed(B)) then
                    C_internal <= std_logic_vector(to_signed(1,n_bits_alu));
                else 
                    C_internal <= std_logic_vector(to_signed(0,n_bits_alu));
                end if;
            when 12 => C_internal <= A nor B;
            when others => C_internal <= (others=>'0');
         end case;
    end process calc_c;

   ----------------------------------    
END behav;
