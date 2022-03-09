----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    10:51:38 08/03/2020 
-- Design Name: 
-- Module Name:    S_BOX_LAYER - Behavioral 
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

entity S_BOX_LAYER is
    Port ( sinlayer : in  STD_LOGIC_VECTOR (63 downto 0);
           soutlayer : out  STD_LOGIC_VECTOR (63 downto 0));
end S_BOX_LAYER;

architecture Behavioral of S_BOX_LAYER is
component S_BOX 
PORT(
		sin : IN std_logic_vector(3 downto 0);          
		sout : OUT std_logic_vector(3 downto 0)
		);
end component;
begin
g0:for i in 0 to 15 generate
	bita: S_BOX PORT MAP (sinlayer((3 + i*4) DOWNTO i*4), soutlayer((3 + i*4) DOWNTO i*4));
end generate;

end Behavioral;

