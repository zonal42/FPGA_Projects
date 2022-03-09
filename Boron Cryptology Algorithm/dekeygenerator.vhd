----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    12:20:05 08/07/2020 
-- Design Name: 
-- Module Name:    dekeygenerator - Behavioral 
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
use IEEE.STD_LOGIC_UNSIGNED.ALL;
-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity dekeygenerator is

    Port ( keyreg : in  STD_LOGIC_VECTOR (79 downto 0);
           enable : in std_logic;
			  state : in  STD_LOGIC_VECTOR (4 downto 0);
           droundkey : out STD_LOGIC_VECTOR (79 downto 0));
end dekeygenerator;

architecture Behavioral of dekeygenerator is
component de_s_box
    Port ( desin : in  STD_LOGIC_VECTOR (3 downto 0);
           desout : out  STD_LOGIC_VECTOR (3 downto 0));
end component;
signal tmp : std_logic_vector(79 downto 0);
begin

tmp(79 downto 64)<=keyreg(79 downto 64);
tmp(58 downto 4)<=keyreg(58 downto 4);
tmp(63 downto 59)<=keyreg(63 downto 59)XOR (state-1);


							  
					

desb:de_s_box port map(desin=>keyreg(3 downto 0),
							  desout=>tmp(3 downto 0));
with enable select
droundkey<=tmp(12 downto 0)&tmp(79 downto 13) when '1',
												keyreg when others;

end Behavioral;

