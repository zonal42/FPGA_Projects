----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    15:00:16 08/12/2020 
-- Design Name: 
-- Module Name:    alu_16_bit - Behavioral 
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

entity alu_16_bit is
    Port ( sel : in  STD_LOGIC_VECTOR (3 downto 0);
           a : in  STD_LOGIC_VECTOR (15 downto 0);
           b : in  STD_LOGIC_VECTOR (15 downto 0);
           s : out  STD_LOGIC_VECTOR (15 downto 0);
			  cflag : out std_logic;
			  nflag : out std_logic;
			  oflag : out std_logic;
			  clk : in std_logic;
			  zflag : out std_logic;
           cout : out  STD_LOGIC);
end alu_16_bit;

architecture Behavioral of alu_16_bit is
component mux 
    Port ( input : in  STD_LOGIC_VECTOR (1 downto 0);
           sel : in  STD_LOGIC;
           output : out  STD_LOGIC);
end component;
component mux4_1
 Port ( inputv : in  STD_LOGIC_VECTOR (3 downto 0);
           selecter : in  STD_LOGIC_VECTOR(1 DOWNTO 0);
           output_data : out  STD_LOGIC);
end component;

component fulladder
    Port ( ainp : in  STD_LOGIC;
           binp : in  STD_LOGIC;
           sum : out  STD_LOGIC;
           cin : in  STD_LOGIC;
           cout : out  STD_LOGIC);
end component;

signal ssum : std_logic_vector(15 downto 0);
signal mux2a : std_logic_vector(15 downto 0);
signal mux2bin0 : std_logic_vector(15 downto 0);
signal mux2bin1 : std_logic_vector(15 downto 0);
signal binv:std_logic_vector(15 downto 0);
signal mux4in2 : std_logic_vector(16 downto 0);
signal mux4inout : std_logic_vector(16 downto 0);
begin
binv<=not b;
mux4in2(0)<=sel(0);
g0:for i in 0 to 15 generate
muxi:mux port map(input(0)=>b(i),
						input(1)=>binv(i),
						sel=>sel(0),
						output=>mux2a(i));
muxa: mux port map(input(0)=>mux2bin0(i),
						input(1)=>mux4in2(i+1),
						sel=>sel(3),
						output=>ssum(i));
end generate;
g1:for i in 0 to 15 generate
	muxb:mux4_1 port map(inputv(0)=>'0',
								inputv(1)=>'1',
								inputv(2)=>mux4in2(i),
								inputv(3)=>b(i),
								selecter=>sel(2 downto 1),
								output_data=>mux4inout(i));
end generate;
g2:for i in 0 to 15 generate
fadd:fulladder port map(ainp=>a(i),
								binp=>mux2a(i),
								sum=>mux2bin0(i),
								cin=>mux4inout(i),
								cout=>mux4in2(i+1)
);


end generate;
s<=ssum;

process(clk)
begin
if rising_edge(clk) then
if sel = "0100" or sel = "0101" then
oflag <= mux4in2(16) xor mux4inout(15);
if ssum(15) = '1' then 
nflag <= '1';
else
nflag <= '0';
end if;
if ssum = x"0000" then
zflag <= '1';
else
zflag <= '0';
end if;
end if;
if sel = "0100" then
cout<=mux4in2(16);	
cflag<=mux4in2(16);	
elsif sel = "0101" then
cout<=not mux4in2(16);
cflag<=not mux4in2(16);
end if;
end if;

end process;

end Behavioral;

