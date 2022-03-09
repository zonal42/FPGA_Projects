----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    10:33:05 08/12/2020 
-- Design Name: 
-- Module Name:    mux1x16 - Behavioral 
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

entity mux1x16 is
    Port ( input : in  STD_LOGIC_VECTOR (255 downto 0);
           selecter : in  STD_LOGIC_VECTOR (3 downto 0);
           out_data : out  STD_LOGIC_VECTOR (15 downto 0));
end mux1x16;

architecture Behavioral of mux1x16 is
signal out_value : std_logic_vector(15 downto 0);


begin

process(input,selecter)
begin
case selecter is
when X"0"=>out_value<=input(((16*0)+15) downto (16*0));
when X"1"=>out_value<=input(((16*1)+15) downto (16*1));
when X"2"=>out_value<=input(((16*2)+15) downto (16*2));
when X"3"=>out_value<=input(((16*3)+15) downto (16*3));
when X"4"=>out_value<=input(((16*4)+15) downto (16*4));
when X"5"=>out_value<=input(((16*5)+15) downto (16*5));
when X"6"=>out_value<=input(((16*6)+15) downto (16*6));
when X"7"=>out_value<=input(((16*7)+15) downto (16*7));
when X"8"=>out_value<=input(((16*8)+15) downto (16*8));
when X"9"=>out_value<=input(((16*9)+15) downto (16*9));
when X"A"=>out_value<=input(((16*10)+15) downto (16*10));
when X"B"=>out_value<=input(((16*11)+15) downto (16*11));
when X"C"=>out_value<=input(((16*12)+15) downto (16*12));
when X"D"=>out_value<=input(((16*13)+15) downto (16*13));
when X"E"=>out_value<=input(((16*14)+15) downto (16*14));
when X"F"=>out_value<=input(((16*15)+15) downto (16*15));
when OTHERS=>out_value<=x"0000";


END CASE;
end process;
out_data<=out_value;
end Behavioral;

