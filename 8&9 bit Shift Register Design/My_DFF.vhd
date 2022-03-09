----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    16:17:59 06/20/2019 
-- Design Name: 
-- Module Name:    My_DFF - Behavioral 
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

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity DFF is
    Port ( D : in  STD_LOGIC;
           clk : in  STD_LOGIC;
           reset : in  STD_LOGIC;
           Q : out  STD_LOGIC:='0';
           QNot : out  STD_LOGIC:='0');
end DFF;

architecture Behavioral of DFF is

begin
process (clk)
begin
   if (rising_edge(clk)) then  
		if(reset='0') then
		 Q<='0';
		 else
       Q <= D;
		 QNot <= NOT(D);
		end if;
   end if;
end process;
 

end Behavioral;

