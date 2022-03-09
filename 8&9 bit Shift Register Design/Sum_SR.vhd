----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    13:53:41 06/21/2019 
-- Design Name: 
-- Module Name:    Sum_SR - Behavioral 
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

entity SR_9_BITS is
    Port ( Serial_IN : in  STD_LOGIC;
           reset : in  STD_LOGIC;
           enable : in  STD_LOGIC;
           clk : in  STD_LOGIC;
           SUM : out  STD_LOGIC_VECTOR (7 downto 0));
end SR_9_BITS;

architecture Behavioral of SR_9_BITS is

    signal tmp: std_logic_vector(7 downto 0):="00000000";
begin

    process (clk)
    begin
        if (rising_edge(clk)) then
		   if(reset='0') then
			tmp <= "00000000";
			SUM <= "00000000";
			else
			 if(enable='1') then
				
            for i in 6 DOWNTO 0 loop
                tmp(i) <= tmp(i+1);
            end loop;
				tmp(7) <= Serial_IN;
			 
			 else
			 SUM <= tmp;
			 
          end if;
			end if; 
		  end if;
    end process;
	

end Behavioral;

