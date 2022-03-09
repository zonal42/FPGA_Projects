library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
USE ieee.std_logic_unsigned.all;
use IEEE.NUMERIC_STD.ALL;
USE ieee.std_logic_arith.all;
-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity HW1_2_IMP is
    Port ( x : in  STD_LOGIC_VECTOR (1 downto 0);
           clk : in  STD_LOGIC;
           q : out  STD_LOGIC;
           res : in  STD_LOGIC);
end HW1_2_IMP;

architecture Behavioral of HW1_2_IMP is
SIGNAL y:std_logic_vector(3 downto 0);
SIGNAL count:std_logic_vector(3 downto 0);
begin
y<=	"0001" when x="00" else
		"0010" when x="01" else
		"0100" when x="10" else
		"1000" when x="11" else
		"0000";
process(clk)
begin
if(clk'EVENT and clk='1')then
	if(res='0') then
	count<="0000";
	elsif(res='1')then
	count<=count+1;
	END IF;
		
END IF;

END PROCESS;
q<=	count(0) when y="0001" else
		count(1) when y="0010" else
		count(2) when y="0100" else
		count(3) when y="1000" else
		'0';



end Behavioral;


