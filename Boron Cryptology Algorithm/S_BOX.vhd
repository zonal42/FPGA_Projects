----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    10:46:17 08/03/2020 
-- Design Name: 
-- Module Name:    S_BOX - Behavioral 
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

entity S_BOX is
    Port ( sin : in  STD_LOGIC_VECTOR (3 downto 0);
           sout : out  STD_LOGIC_VECTOR (3 downto 0));
end S_BOX;

architecture Behavioral of S_BOX is

begin

process(sin)
	begin
	 case sin is 
      when "0000" =>
         sout <= X"E";
      when "0001" =>
         sout <= X"4";
      when "0010" =>
         sout <= X"B";
      when "0011" =>
         sout <= X"1";
      when "0100" =>
         sout <= X"7";
      when "0101" =>
         sout <= X"9";
      when "0110" =>
         sout <= X"C";
      when "0111" =>
         sout <= X"A";
      when "1000" =>
         sout <= X"D";
      when "1001" =>
         sout <= X"2";
      when "1010" =>
         sout <= X"0";
      when "1011" =>
         sout <= X"F";
      when "1100" =>
         sout <= X"8";
      when "1101" =>
         sout <= X"5";
      when "1110" =>
         sout <= X"3";
      when "1111" =>
         sout <= X"6";
      when others =>
         sout <= "0000";
   end case;
	end process;

end Behavioral;

