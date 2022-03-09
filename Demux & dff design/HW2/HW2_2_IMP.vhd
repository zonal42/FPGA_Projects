----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    08:29:12 07/14/2020 
-- Design Name: 
-- Module Name:    HW2_2_IMP - Behavioral 
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

entity HW2_2_IMP is
    Port ( x : in  STD_LOGIC;
           clk : in  STD_LOGIC;
           f : out  STD_LOGIC);
end HW2_2_IMP;

architecture Behavioral of HW2_2_IMP is
COMPONENT decoder2x4
 Port ( input : in  STD_LOGIC_VECTOR (1 downto 0);
           output : out  STD_LOGIC_VECTOR (3 downto 0));
END COMPONENT;
COMPONENT jkff
Port ( j : in  STD_LOGIC;
           k : in  STD_LOGIC;
           clock : in  STD_LOGIC;
           q : inout  STD_LOGIC:='0');
END COMPONENT;
SIGNAL z: std_logic:='0';
SIGNAL t: std_logic:='0';

SIGNAL dec : std_logic_vector(3 downto 0):="0000";
SIGNAL dec3 : std_logic;

begin

a:decoder2x4 PORT MAP(input(0)=>z,
							 input(1)=>t,
							 output=>dec);
							 
b:jkff PORT MAP(j=>dec(0),
					 k=>x,
					 clock=>clk,
					 q=>z);
					 
c:jkff PORT MAP(j=>x,
					 k=>dec(3),
					 clock=>clk,
					 q=>t);
f<=dec(1)or dec(2);
end Behavioral;

