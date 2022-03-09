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

entity HW1_3_IMP is
    Port ( x : in  STD_LOGIC;
           res : in  STD_LOGIC;
           clk : in  STD_LOGIC;
           q : out  STD_LOGIC);
end HW1_3_IMP;

architecture Behavioral of HW1_3_IMP is
--SIGNAL count:std_logic_vector(26 downto 0):="000000000000000000000000000";
SIGNAL count: INTEGER  RANGE 0 TO 49999999;
SIGNAL count2: INTEGER  RANGE 0 TO 12499999;
SIGNAL count3: std_logic_vector(7 downto 0):="00000000";
SIGNAL value: INTEGER  RANGE 0 TO 49999999;
SIGNAL value2: INTEGER  RANGE 0 TO 12499999;
SIGNAL y :std_logic:='0';
SIGNAL dclk :std_logic;


SIGNAL DCLK_INTER: STD_LOGIC:='0';
begin
process(clk)
begin
if(rising_edge(clk))then
case x is
	when '0'=>value<=49999999;
	when others=>value2<=12499999;
end case;
	if(res='0') then
	count<=0;
	elsif(res='1')then
	if(x='0')then
		if(count=value)then
			count<=0;
			DCLK_INTER<=not DCLK_INTER;
		else 	
			count<=count+1;
		end if;
	elsif(x='1')then
		if(count2=value2)then
			count2<=0;
			DCLK_INTER<=not DCLK_INTER;
		else 	
			count2<=count2+1;
		end if;	
	end if;
end if;
ELSIF(falling_edge(clk))then
 count<=count;
end if;
end process;
dclk<=DCLK_INTER;

process(dclk)
begin
if(rising_edge(dclk)) then
	if(res='0') then
		count3<="00000000";
	elsif(res='1')then
		if(count3/="11111111") then
			count3<=count3+1;
			y<='0';
		else
			count3<="00000000";
			y<='1';
		end if;
	end if;
elsif(falling_edge(dclk)) then
	count3<=count3;
	end if;
	end process;
WITH count3 select
q<= '1' when "11111111",
	 '0' when others;

end Behavioral;


