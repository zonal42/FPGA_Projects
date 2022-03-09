----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    12:34:51 08/03/2020 
-- Design Name: 
-- Module Name:    block_shuffle - Behavioral 
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

entity block_shuffle is
    Port ( input : in  STD_LOGIC_VECTOR (63 downto 0);
           shuffled_output : out  STD_LOGIC_VECTOR (63 downto 0));
end block_shuffle;

architecture Behavioral of block_shuffle is

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
			w0 <= input((15 + 0*16) downto 0*16);
			w1 <= input((15 + 1*16) downto 1*16);
			w2 <= input((15 + 2*16) downto 2*16);
			w3 <= input((15 + 3*16) downto 3*16);
			
			
			out0 <= w0(7 downto 0) & w0(15 downto 8);
			out1 <= w1(7 downto 0) & w1(15 downto 8);
			out2 <= w2(7 downto 0) & w2(15 downto 8);
			out3 <= w3(7 downto 0) & w3(15 downto 8);
			
			r0 <= out0(14 downto 0) & out0(15);
			r1 <= out1(11 downto 0) & out1(15 downto 12);
			r2 <= out2(8 downto 0) & out2(15 downto 9);
			r3 <= out3(6 downto 0) & out3(15 downto 7);
			
			xored0 <= (r3 XOR r1 XOR r0);
			xored1 <= (r3 XOR r1);
			xored2 <= (r2 XOR r0);
			xored3 <= (r3 XOR r2 XOR r0);

			shuffled_output<=xored3&xored2&xored1&xored0;
end Behavioral;

