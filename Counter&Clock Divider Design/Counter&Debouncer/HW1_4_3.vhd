library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity HW_1_4_3 is
    Port ( clk : in  STD_LOGIC;
           yi : in  STD_LOGIC;
           q : out  STD_LOGIC_VECTOR(3 DOWNTO 0):="0000";
           res : in  STD_LOGIC;
           y2 : in  STD_LOGIC);
end HW_1_4_3;

architecture Behavioral of HW_1_4_3 is
SIGNAL count: INTEGER  RANGE 0 TO 99999999;
SIGNAL count3: INTEGER  RANGE 0 TO 499999;
SIGNAL count_db: INTEGER  RANGE 0 TO 74999;
SIGNAL count2 : INTEGER  RANGE 0 TO 15:=0;

SIGNAL dclk : STD_LOGIC:='0';
SIGNAL sclk : STD_LOGIC:='0';
SIGNAL cclk : STD_LOGIC:='0';
SIGNAL bclk : STD_LOGIC:='0';
SIGNAL dbclk : STD_LOGIC:='0';
SIGNAL d0,q0: STD_LOGIC:='0';
SIGNAL d1,q1: STD_LOGIC:='0';
SIGNAL d2,q2: STD_LOGIC:='0';
SIGNAL d3,q3: STD_LOGIC:='0';
SIGNAL d4,q4: STD_LOGIC:='0';
SIGNAL d5,q5: STD_LOGIC:='0';
SIGNAL d6,q6: STD_LOGIC:='0';
SIGNAL d7,q7: STD_LOGIC:='0';
SIGNAL d8,q8: STD_LOGIC:='0';
SIGNAL d9,q9: STD_LOGIC:='0';


SIGNAL z :STD_LOGIC:='0';
SIGNAL a :STD_LOGIC:='0';

begin
process(clk)
begin
if(rising_edge(clk))then
	if(yi='0')then	
		if(count3=499999)then
			count3<=0;
			bclk<='1';
		else 	
			count3<=count3+1;
			bclk<='0';
		end if;
	elsif(yi='1') then
		if(count=99999999)then
			count<=0;
			cclk<='1';
		else 	
			count<=count+1;
			cclk<='0';
		end if;
	end if;


end if;


END PROCESS;

process(bclk,cclk,yi)
begin
if (yi='1') then sclk<=cclk; 
elsif(yi='0') then sclk<=bclk; 
end if; 
end process;



process(clk)
begin
if(rising_edge(clk))then
if(count_db=74999)then
			count_db<=0;
			dbclk<='1';
		else 	
			count_db<=count_db+1;
			dbclk<='0';
		end if;
		end if;
end process;


process(clk)
begin
if(rising_edge(clk))then
	if(rising_edge(dbclk))then
	d0<=y2;
	q0<=d0;
	d1<=q0;
	q1<=d1;	
	d2<=q1;
	q2<=d2;
	d3<=q2;
	q3<=d3;	
	d4<=q3;	
	q4<=d4;
	d5<=q4;
	q5<=d5;
	d6<=q5;
	q6<=d6;
	d7<=q6;
	q7<=d7;
	d8<=q7;
	q8<=d8;
	d9<=q8;
	q9<=d9;
	
	end if;
end if;
end process;
z<=q0 and q1 and q2 and q3 and q4 and q5 and q6 and q7 and q8 and q9;
process(z)
begin
if(rising_edge(z))then
	a<=not a;
end if;
end process;
process(clk)
begin
if(rising_edge(clk))then
	if(rising_edge(sclk))then
		if(res='0') then
			count2<=0;
		elsif(res='1') then
				if(a='0')then
					if(count2<=0)then
					
					count2<=15;
					else
					count2<=count2-1;
					end if;
				elsif(a='1')then
					
			if(count2=15)then
				count2<=0;
				
			else
				count2<=count2+1;			
			end if;
			
			end if;
				end if;
		end if;
	end if;

end process;


with count2 select
q<= "0000" when 0,
	 "0001" when 1,
	 "0010" when 2,
	 "0011" when 3,
	 "0100" when 4,
	 "0101" when 5,
	 "0110" when 6,
	 "0111" when 7,
	 "1000" when 8,
	 "1001" when 9,
	 "1010" when 10,
	 "1011" when 11,
	 "1100" when 12,
	 "1101" when 13,
	 "1110" when 14,
	 "1111" when others;

end Behavioral;