----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    14:03:14 08/12/2020 
-- Design Name: 
-- Module Name:    mux4_1 - Behavioral 
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

entity mux4_1 is
 Port ( inputv : in  STD_LOGIC_VECTOR (3 downto 0);
           selecter : in  STD_LOGIC_VECTOR(1 DOWNTO 0);
           output_data : out  STD_LOGIC);
end mux4_1;

architecture Behavioral of mux4_1 is

begin
with selecter select 
output_data<=	inputv(3) when "11",
			inputv(2) when "10",
			inputv(1) when "01",
			inputv(0)	when others;

end Behavioral;

