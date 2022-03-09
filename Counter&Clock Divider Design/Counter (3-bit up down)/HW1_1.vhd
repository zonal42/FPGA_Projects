library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
USE ieee.std_logic_unsigned.all;
-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
use IEEE.NUMERIC_STD.ALL;
USE ieee.std_logic_arith.all;
-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity HW1_1_IMP is
    Port ( x : in  STD_LOGIC;
           clock : in  STD_LOGIC;
           res : in  STD_LOGIC;
           q : out  STD_LOGIC_VECTOR (2 downto 0));
end HW1_1_IMP;

architecture behavioral of HW1_1_IMP is
SIGNAL count : std_logic_vector(2 DOWNTO 0);
begin
count_sec : PROCESS(clock,res)
BEGIN
IF (res = '0') THEN
count <= (others => '0');
ELSIF (clock'EVENT AND clock ='1') THEN
CASE x IS
WHEN '0' => count <=count - "001" ;
WHEN '1' => count <= count + "001";
WHEN OTHERS => count <= count;
END CASE;
END IF;
END PROCESS count_sec;
q <= count;
end behavioral;



