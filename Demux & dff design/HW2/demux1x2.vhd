----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    08:56:55 07/14/2020 
-- Design Name: 
-- Module Name:    demux1x2 - demux1x2 
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

entity demux1x2 is
    Port ( info : in  STD_LOGIC;
           sel : in  STD_LOGIC;
           outpins : out  STD_LOGIC_VECTOR (1 downto 0));
end demux1x2;

architecture demux1x2 of demux1x2 is

begin
with sel select
outpins(0)<=	info when '0',
					'0' when others;

with sel select
outpins(1)<=	info when '1',
					'0' when others;
end demux1x2;

