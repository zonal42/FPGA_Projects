----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    09:45:41 08/07/2020 
-- Design Name: 
-- Module Name:    de_s_box - Behavioral 
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

entity de_s_box is
    Port ( desin : in  STD_LOGIC_VECTOR (3 downto 0);
           desout : out  STD_LOGIC_VECTOR (3 downto 0));
end de_s_box;

architecture Behavioral of de_s_box is
 begin
process(desin)
	begin
	 case desin is 
      when X"E" =>
         desout <= X"0";
      when X"4" =>
         desout <= X"1" ;
      when X"B" =>
         desout <= X"2" ;
      when X"1" =>
         desout <= X"3";
      when X"7" =>
         desout <= X"4";
      when X"9" =>
         desout <= X"5";
      when X"C" =>
         desout <= X"6";
      when X"A" =>
         desout <= X"7";
      when X"D" =>
         desout <= X"8";
      when X"2" =>
         desout <= X"9";
      when X"0" =>
         desout <= X"A";
      when X"F" =>
         desout <= X"B";
      when X"8" =>
         desout <= X"C";
      when X"5" =>
         desout <= X"D";
      when X"3" =>
         desout <= X"E";
      when X"6" =>
         desout <= X"F";
      when others =>
         desout <= "0000";
   end case;
	end process;


end Behavioral;

