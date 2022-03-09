----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    18:54:06 07/13/2020 
-- Design Name: 
-- Module Name:    jkff - Behavioral 
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

entity jkff is
    Port ( j : in  STD_LOGIC;
           k : in  STD_LOGIC;
           clock : in  STD_LOGIC;
           q : inout  STD_LOGIC:='0');
end jkff;

architecture Behavioral of jkff is


begin
process(clock)
begin
if(rising_edge(clock))then
	if(j='0' and k='0')then
		q<=q;
	elsif(j='0' and k='1')then
		q<='0';
	elsif(j='1' and k='0')then
		q<='1';
	elsif(j='1' and k='1')then
		q<=not q;
	end if;
end if;
end process;

end Behavioral;

