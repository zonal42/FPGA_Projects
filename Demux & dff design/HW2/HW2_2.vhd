----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    15:25:08 07/13/2020 
-- Design Name: 
-- Module Name:    HW2_2 - Behavioral 
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

entity HW2_2 is
    Port ( clk : in  STD_LOGIC;
           x : in  STD_LOGIC:='0';
           f : out  STD_LOGIC:='0'
           );
           
end HW2_2;

architecture Behavioral of HW2_2 is
SIGNAL ya: std_logic_vector(1 downto 0):="00";
SIGNAL i: std_logic_vector(3 downto 0):="0000";

begin
process(clk)
begin
if(rising_edge(clk))then
	if(i(0)='0' and x='0') then
		ya(0)<=ya(0);
	elsif(i(0)='0' and x='1') then
		ya(0)<='0';
	elsif(i(0)='1' and x='0') then
		ya(0)<='1';
	elsif(i(0)='1' and x='1') then
		ya(0)<=not ya(0);
	end if;
	end if;
end process;

process(clk)
begin
if(rising_edge(clk))then
	if(x='0' and i(3)='0') then
		ya(1)<=ya(1);
	elsif(x='0' and i(3)='1') then
		ya(1)<='0';
	elsif(x='1' and i(3)='0') then
		ya(1)<='1';
	elsif(x='1' and i(3)='1') then
		ya(1)<=not ya(1);
	end if;
	end if;
end process;

with ya select 
i<= "0001" when "10",
	 "0010" when "11",	
	 "0100" when "00",	
	 "1000" when "01",
	 "0000" when others;
	
f<=i(1)or i(2);
end Behavioral;

