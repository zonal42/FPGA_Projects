----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    12:49:20 08/03/2020 
-- Design Name: 
-- Module Name:    top_box - Behavioral 
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

entity top_box is
    Port ( sin : in  STD_LOGIC_VECTOR (63 downto 0);
           sout : out  STD_LOGIC_VECTOR (63 downto 0));
end top_box;

architecture Behavioral of top_box is
COMPONENT S_BOX_LAYER
	PORT(
		sinlayer : IN std_logic_vector(63 downto 0);          
		soutlayer : OUT std_logic_vector(63 downto 0)
		);
	END COMPONENT;
	
COMPONENT Block_Shuffle
	PORT(
		input : IN std_logic_vector(63 downto 0);          
		shuffled_output : OUT std_logic_vector(63 downto 0)
		);
	END COMPONENT;
		signal s_box_out : STD_LOGIC_VECTOR(63 DOWNTO 0);
begin

		s_box: S_BOX_LAYER PORT MAP(
		sinlayer => sin,
		soutlayer => s_box_out
	);
	
		shuffle: Block_Shuffle PORT MAP(
		input => s_box_out ,
		shuffled_output => sout
	);

end Behavioral;

