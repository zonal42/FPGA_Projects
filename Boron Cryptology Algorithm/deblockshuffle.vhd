----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    10:04:13 08/07/2020 
-- Design Name: 
-- Module Name:    deblockshuffle - Behavioral 
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

entity deblockshuffle is
    Port ( dinput : in  STD_LOGIC_VECTOR (63 downto 0);
           dshuffledoutput : out  STD_LOGIC_VECTOR (63 downto 0));
end deblockshuffle;

architecture Behavioral of deblockshuffle is

	signal  w0 : STD_LOGIC_VECTOR(15 DOWNTO 0);
	signal  w1 : STD_LOGIC_VECTOR(15 DOWNTO 0);
	signal  w2 : STD_LOGIC_VECTOR(15 DOWNTO 0);
	signal  w3 : STD_LOGIC_VECTOR(15 DOWNTO 0);
	
	signal  out0 : STD_LOGIC_VECTOR(15 DOWNTO 0);
	signal  out1 : STD_LOGIC_VECTOR(15 DOWNTO 0);
	signal  out2 : STD_LOGIC_VECTOR(15 DOWNTO 0);
	signal  out3 : STD_LOGIC_VECTOR(15 DOWNTO 0);
	
	signal  xored0 : STD_LOGIC_VECTOR(15 DOWNTO 0);
	signal  xored1 : STD_LOGIC_VECTOR(15 DOWNTO 0);
	signal  xored2 : STD_LOGIC_VECTOR(15 DOWNTO 0);
	signal  xored3 : STD_LOGIC_VECTOR(15 DOWNTO 0);
	
	signal  r0 : STD_LOGIC_VECTOR(15 DOWNTO 0);
	signal  r1 : STD_LOGIC_VECTOR(15 DOWNTO 0);
	signal  r2 : STD_LOGIC_VECTOR(15 DOWNTO 0);
	signal  r3 : STD_LOGIC_VECTOR(15 DOWNTO 0);

begin
			w0 <= dinput((15 + 0*16) downto 0*16);
			w1 <= dinput((15 + 1*16) downto 1*16);
			w2 <= dinput((15 + 2*16) downto 2*16);
			w3 <= dinput((15 + 3*16) downto 3*16);
			
			xored0 <= (w0 XOR w1);
			xored1 <= (w1 XOR w2 XOR w3);
			xored2 <= (w2 XOR w1 XOR w0);
			xored3 <= (w3 XOR w2);
			

			r0 <= xored0(0) & xored0(15 downto 1);
			r1 <= xored1(3 downto 0) & xored1(15 downto 4);
			r2 <= xored2(6 downto 0) & xored2(15 downto 7);
			r3 <= xored3(8 downto 0) & xored3(15 downto 9);
			
			out0 <= r0(7 downto 0) & r0(15 downto 8);
			out1 <= r1(7 downto 0) & r1(15 downto 8);
			out2 <= r2(7 downto 0) & r2(15 downto 8);
			out3 <= r3(7 downto 0) & r3(15 downto 8);
			
			
			dshuffledoutput<=out3&out2&out1&out0;

end Behavioral;

