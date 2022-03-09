----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    13:23:19 08/03/2020 
-- Design Name: 
-- Module Name:    key_generator - Behavioral 
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
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;
use ieee.std_logic_unsigned.all;
-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity key_generator is
    Port ( key_register : in  STD_LOGIC_VECTOR (79 downto 0);
           state : in  STD_LOGIC_VECTOR (4 downto 0);
           round_key : out  STD_LOGIC_VECTOR (79 downto 0));
end key_generator;

architecture Behavioral of key_generator is
component S_BOX 
PORT(
		sin : IN std_logic_vector(3 downto 0);          
		sout : OUT std_logic_vector(3 downto 0)
		);
end component;


signal tmp1 : STD_LOGIC_VECTOR(79 DOWNTO 0);
signal NK_register : STD_LOGIC_VECTOR(79 DOWNTO 0);
signal tmp2 : STD_LOGIC_VECTOR(4 DOWNTO 0);
signal s_out : STD_LOGIC_VECTOR(3 DOWNTO 0);


begin
NK_register <= key_register (66 downto 0) & key_register (79 downto 67);

sbox:S_BOX PORT MAP(
		sin => NK_register(3 DOWNTO 0) ,
		sout => s_out
);
tmp1 <= NK_register(79 downto 4) & s_out;
		tmp2 <= tmp1(63 downto 59) XOR  (state-1); 
		round_key <= NK_register(79 DOWNTO 64) & tmp2 & tmp1(58 downto 0);

end Behavioral;

