----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    09:30:11 08/12/2020 
-- Design Name: 
-- Module Name:    demux - Behavioral 
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

entity demux is
    Port ( data : in  STD_LOGIC;
           sel: in  STD_LOGIC_VECTOR (3 downto 0);
           seldata: out  STD_LOGIC_VECTOR (15 downto 0));
end demux;

architecture Behavioral of demux is
signal outdata : std_logic_vector(15 downto 0);
begin
process(data,sel)
begin
if(data='0')then
outdata<=X"0000";
else
case sel is
	when X"0"=>outdata<=X"0001";
	when X"1"=>outdata<=X"0002";
	when X"2"=>outdata<=X"0004";
	when X"3"=>outdata<=X"0008";
	when X"4"=>outdata<=X"0010";
	when X"5"=>outdata<=X"0020";
	when X"6"=>outdata<=X"0040";
	when X"7"=>outdata<=X"0080";
	when X"8"=>outdata<=X"0100";
	when X"9"=>outdata<=X"0200";
	when X"a"=>outdata<=X"0400";
	when X"b"=>outdata<=X"0800";
	when X"c"=>outdata<=X"1000";
	when X"d"=>outdata<=X"2000";
	when X"e"=>outdata<=X"4000";
	when others=>outdata<=X"8000";
	
	
	
end case;
end if;
end process;
seldata<=outdata;
end Behavioral;

