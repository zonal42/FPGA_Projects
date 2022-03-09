----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    11:15:58 07/14/2020 
-- Design Name: 
-- Module Name:    HW3 - Behavioral 
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

entity HW3 is
    Port ( number_a : in  STD_LOGIC_VECTOR (31 downto 0);
           number_b : in  STD_LOGIC_VECTOR (31 downto 0);
           s : out  STD_LOGIC_VECTOR (31 downto 0):=X"00000000";
           cout : out STD_LOGIC);
end HW3;

architecture Behavioral of HW3 is
SIGNAL numa	:	std_logic_vector(31 downto 0);
SIGNAL numb	:	std_logic_vector(31 downto 0);
SIGNAL ssum	:	std_logic_vector(31 downto 0):=X"00000000";
SIGNAL coutt	:	std_logic_vector(31 downto 0):=X"00000000";


COMPONENT fulladder
 Port ( a : in  STD_LOGIC;
           b : in  STD_LOGIC;
           cin : in  STD_LOGIC;
           s : out  STD_LOGIC;
           cout : out  STD_LOGIC);
end component;

begin
numa<=number_a;
numb<=number_b;
	adder0:fulladder PORT MAP (a=>numa(0),b=>numb(0),cin=>'0',s=>ssum(0),cout=>coutt(0));

G1: FOR i in 1 to 31 GENERATE
			adderi:fulladder PORT MAP (a=>numa(i),b=>numb(i),cin=>coutt(i-1),s=>ssum(i),cout=>coutt(i));
end GENERATE;
s<=ssum;
cout<=coutt(31);
end Behavioral;

