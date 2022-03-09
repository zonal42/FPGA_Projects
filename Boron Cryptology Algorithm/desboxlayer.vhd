----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    09:56:21 08/07/2020 
-- Design Name: 
-- Module Name:    desboxlayer - Behavioral 
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

entity desboxlayer is
    Port ( desinlayer : in  STD_LOGIC_VECTOR (63 downto 0);
           desoutlayer : out  STD_LOGIC_VECTOR (63 downto 0));
end desboxlayer;

architecture Behavioral of desboxlayer is
component de_s_box
PORT(desin : in  STD_LOGIC_VECTOR (3 downto 0);
desout : out  STD_LOGIC_VECTOR (3 downto 0));
end component;
begin
g0:for i in 0 to 15 generate
	bita: DE_S_BOX PORT MAP (desinlayer((3 + i*4) DOWNTO i*4), desoutlayer((3 + i*4) DOWNTO i*4));
end generate;




end Behavioral;

