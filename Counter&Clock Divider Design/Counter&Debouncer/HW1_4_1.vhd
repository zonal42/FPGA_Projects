library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity HW1_4_1_IMP is
    Port ( clk : in  STD_LOGIC;
			  q	: out std_logic_vector(3 downto 0):="0000";
			  yi	: in std_logic;
			  res	: in std_logic
	 );
end HW1_4_1_IMP;

architecture Behavioral of HW1_4_1_IMP is
SIGNAL count: INTEGER  RANGE 0 TO 99999999;
SIGNAL count3: INTEGER  RANGE 0 TO 499999;
SIGNAL count2 : STD_LOGIC_VECTOR(3 DOWNTO 0):="0000";
SIGNAL y		: STD_LOGIC:='0';
SIGNAL dclk : STD_LOGIC:='0';
SIGNAL sclk : STD_LOGIC:='1';
SIGNAL cclk : STD_LOGIC:='1';
SIGNAL bclk : STD_LOGIC:='1';
begin

process(clk)
begin
if(rising_edge(clk))then
	if(yi='0')then	
		if(count3=499999)then
			count3<=0;
			bclk<=not bclk;
		else 	
			count3<=count3+1;
			
		end if;
	elsif(yi='1') then
		if(count=99999999)then
			count<=0;
			cclk<=not cclk;
		else 	
			count<=count+1;
			
		end if;
	end if;


end if;


END PROCESS;

process(bclk,cclk,yi)
begin
if (yi='1') then sclk<=cclk; 
else sclk<=bclk; 
end if; 
end process;


process(sclk,res)
begin
if(rising_edge(sclk))then
		if(res='0') then
			count2<="0000";
		elsif(res='1') then
			if(y='0')then
			if(count2=X"f")then
				count2<=count2-X"1";
				y<='1';
			else
				count2<=count2+X"1";
			end if;
			elsif(y='1')then
			if(count2=X"0")then
				count2<=count2+X"1";
				y<='0';
			else
				count2<=count2-X"1";
			end if;
			end if;
		end if;
end if;

END PROCESS;
q<=count2;
end Behavioral;

