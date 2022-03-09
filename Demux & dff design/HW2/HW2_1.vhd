----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    14:51:41 07/13/2020 
-- Design Name: 
-- Module Name:    HW2_1 - Behavioral 
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

entity HW2_1 is
    Port ( i : in  STD_LOGIC_VECTOR (3 downto 0):="0001";
           s : in  STD_LOGIC_VECTOR (1 downto 0);
           y : out  STD_LOGIC);
end HW2_1;

architecture Behavioral of HW2_1 is
SIGNAL t : std_logic;
SIGNAL z : std_logic;
begin
with s(0) select
t<=i(0) when '0',
	i(1) when '1',
	'0'	  when others;

with s(0) select
z<=i(2) when '0',
	i(3) when '1',
	'0'	  when others;
	
with s(1) select
y<=t when '0',
	z when '1',
	'0'	  when others;



end Behavioral;

