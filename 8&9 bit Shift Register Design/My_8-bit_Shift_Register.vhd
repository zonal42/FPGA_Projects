----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    11:49:14 06/21/2019 
-- Design Name: 
-- Module Name:    IN_8-bit_Shift_Register - Behavioral 
-- Project Name: 
-- Target Devices: 
-- Tool versions: 
-- Description: 
--
-- Dependencies: 
--
-- Revision: 
-- Revision 0.01 - File Created
-- Additional Comments: 
--
----------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
USE ieee.std_logic_signed.all ;
 USE ieee.std_logic_arith.all ;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity SREG_8_BITS is
    Port ( load : in  STD_LOGIC;
           enable : in  STD_LOGIC;
           clk : in  STD_LOGIC;
           load_in : in  STD_LOGIC_VECTOR (7 downto 0);
           SO : out  STD_LOGIC);
end SREG_8_BITS;

architecture Behavioral of SREG_8_BITS is

    signal tmp: std_logic_vector(7 downto 0):="00000000";
begin

    process (clk)
    begin
        if (rising_edge(clk)) then
			 if(enable='1') then
				if(load='1') then
				tmp <= load_in;
				else
            for i in 0 TO 6 loop
                tmp(i) <= tmp(i+1);
            end loop;
            tmp(7) <= '0';
				end if;
			 else
			 tmp<=tmp;
				
          end if;
		  end if;
    end process;
	
    SO <= tmp(0);

end Behavioral;

