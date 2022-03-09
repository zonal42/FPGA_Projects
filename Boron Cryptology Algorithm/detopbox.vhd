----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    11:40:43 08/07/2020 
-- Design Name: 
-- Module Name:    detopbox - Behavioral 
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

entity detopbox is
    Port ( din : in  STD_LOGIC_VECTOR (63 downto 0);
           dout : out  STD_LOGIC_VECTOR (63 downto 0));
end detopbox;

architecture Behavioral of detopbox is
component desboxlayer
Port ( desinlayer : in  STD_LOGIC_VECTOR (63 downto 0);
       desoutlayer : out  STD_LOGIC_VECTOR (63 downto 0));
end component;

component deblockshuffle
  Port ( dinput : in  STD_LOGIC_VECTOR (63 downto 0);
         dshuffledoutput : out  STD_LOGIC_VECTOR (63 downto 0));
end component;
		signal des_shuffle_out : STD_LOGIC_VECTOR(63 DOWNTO 0);
begin


		desshuffle: deblockshuffle PORT MAP(
		dinput => din,
		dshuffledoutput => des_shuffle_out
	);
	des_box: desboxlayer PORT MAP(
		desinlayer => des_shuffle_out,
		desoutlayer => dout
	);


	

end Behavioral;

