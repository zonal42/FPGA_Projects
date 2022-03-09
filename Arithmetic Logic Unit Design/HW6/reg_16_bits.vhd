----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    10:09:25 08/12/2020 
-- Design Name: 
-- Module Name:    reg_16_bits - Behavioral 
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

entity reg_16_bits is
    Port ( datain : in  STD_LOGIC_VECTOR (15 downto 0);
           en : in  STD_LOGIC;
           clk : in  STD_LOGIC;
           outputs : out STD_LOGIC_VECTOR (15 downto 0));
end reg_16_bits;

architecture Behavioral of reg_16_bits is
signal reg_value : STD_LOGIC_VECTOR (15 downto 0);
begin
process(clk)
begin
if(rising_edge(clk))then
	if(en='1')then
		reg_value<=datain;
	else
		reg_value<=reg_value;
end if;
end if;
end process;
outputs<=reg_value;

end Behavioral;

