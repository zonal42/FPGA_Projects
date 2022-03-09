----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    13:30:27 08/13/2020 
-- Design Name: 
-- Module Name:    top_module - Behavioral 
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

entity top_module is
    Port ( wrena : in  STD_LOGIC;
           wdata : in  STD_LOGIC_VECTOR (15 downto 0);
           clk : in  STD_LOGIC;

			  sel : in  STD_LOGIC_VECTOR (3 downto 0);
           rw : in  STD_LOGIC_VECTOR (3 downto 0);
           ra : in  STD_LOGIC_VECTOR (3 downto 0);
           rb : in  STD_LOGIC_VECTOR (3 downto 0);
			  sum_out : out  STD_LOGIC_VECTOR (15 downto 0);
			  carry : out std_logic;
			  negative : out std_logic;
			  oflow : out std_logic;
			  zero : out std_logic);
end top_module;

architecture Behavioral of top_module is
signal count: std_logic_vector(2 downto 0) :="000";
signal a_dat, b_dat, alu_out, w_dat: std_logic_vector(15 downto 0);
signal a_add, b_add, w_add: std_logic_vector(3 downto 0);
component alu_16_bit
Port ( sel : in  STD_LOGIC_VECTOR (3 downto 0);
           a : in  STD_LOGIC_VECTOR (15 downto 0);
           b : in  STD_LOGIC_VECTOR (15 downto 0);
           s : out  STD_LOGIC_VECTOR (15 downto 0);
			  cflag : out std_logic;
			  clk : in std_logic;
			  nflag : out std_logic;
			  oflag : out std_logic;
			  zflag : out std_logic;
           cout : out  STD_LOGIC);
end component;

component rf
    Port ( wren : in  STD_LOGIC;
           wdat : in  STD_LOGIC_VECTOR(15 downto 0);
           clk : in  STD_LOGIC;
           rw : in  STD_LOGIC_VECTOR(3 downto 0);
           ra : in  STD_LOGIC_VECTOR(3 downto 0);
           rb : in  STD_LOGIC_VECTOR(3 downto 0);
           adata : out  STD_LOGIC_VECTOR(15 downto 0);
           bdata : out  STD_LOGIC_VECTOR(15 downto 0));
end component;









begin





reg:rf port map(wren=>wrena,
					 wdat=>w_dat,
					 clk=>clk,
					 rw=>w_add,
					 ra=>a_add,
					 rb=>b_add,
					 adata=>a_dat,
					 bdata=>b_dat);
					 
					 
alu:alu_16_bit port map(sel=>sel,
								clk=>clk,
								 a=>a_dat,
								 b=>b_dat,
								 s=>alu_out,
								 cflag=>carry,
								 nflag=>negative,
								 oflag=>oflow,
								 zflag=>zero
								 );
								 

process(clk,w_dat,Rw,ra,rb,wdata,alu_out)
begin
		a_add <= Ra;
		b_add <= Rb;
		w_add <= Rw;
	if Rw = "0000" or Rw = "0001" then
		w_dat <= wdata;
	else
		w_dat <= alu_out;
	end if;
end process;
sum_out <= alu_out;
end Behavioral;

