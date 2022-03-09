----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    18:18:51 07/13/2020 
-- Design Name: 
-- Module Name:    mux - mux 
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

entity mux is
    Port ( input : in  STD_LOGIC_VECTOR (1 downto 0);
           s : in  STD_LOGIC;
           output : out  STD_LOGIC);
end mux;

architecture mux of mux is

begin

with s select 
output<=	input(0) when '0',
			input(1) when '1',
			'0'	when others;
end mux;

