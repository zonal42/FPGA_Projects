----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    18:24:38 07/13/2020 
-- Design Name: 
-- Module Name:    HW2_1_1 - Behavioral 
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

entity HW2_1_1 is
    Port ( ina : in  STD_LOGIC_VECTOR (3 downto 0);
           y : out  STD_LOGIC;
           s : in  STD_LOGIC_VECTOR (1 downto 0));
end HW2_1_1;

architecture Behavioral of HW2_1_1 is
component mux
Port ( input : in  STD_LOGIC_VECTOR (1 downto 0);
           s : in  STD_LOGIC;
           output : out  STD_LOGIC);
END COMPONENT;

SIGNAL z: std_logic;
SIGNAL t: std_logic;

begin
	U:mux PORT MAP(input(0)=>ina(0),
					   input(1)=>ina(1),
						s=>s(0),
						output=>z);
						
	v:mux PORT MAP(input(0)=>ina(2),
					   input(1)=>ina(3),
						s=>s(0),
						output=>t);
						
	e:mux PORT MAP(input(0)=>z,
					   input(1)=>t,
						s=>s(1),
						output=>y);					

end Behavioral;

