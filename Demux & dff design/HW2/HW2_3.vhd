----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    16:49:15 07/13/2020 
-- Design Name: 
-- Module Name:    HW2_3 - Behavioral 
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

entity HW2_3 is
    Port ( clk : in  STD_LOGIC;
			  x	: in STD_LOGIC;
           mux : inout  STD_LOGIC_VECTOR (1 downto 0):="00");
end HW2_3;

architecture Behavioral of HW2_3 is
signal d : std_logic_vector(1 downto 0);
signal q : std_logic_vector(1 downto 0);
signal c : std_logic;
signal f : std_logic;
begin
WITH x select
mux(0)<= '1' WHEN '0',
			'0' WHEN others;
	
WITH x select
mux(1)<= '1' WHEN '1',
			'0' WHEN others;

c<=mux(1) and q(1);
d(0)<=not c;
d(1)<=mux(0);

process(clk)
begin
if(rising_edge(clk))then
	q(0)<=d(0);
	q(1)<=d(1);
end if;
end process;	
	
	

end Behavioral;

