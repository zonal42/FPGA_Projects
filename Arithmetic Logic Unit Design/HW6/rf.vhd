----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    11:31:44 08/12/2020 
-- Design Name: 
-- Module Name:    rf - Behavioral 
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

entity rf is
    Port ( wren : in  STD_LOGIC;
           wdat : in  STD_LOGIC_VECTOR(15 downto 0);
           clk : in  STD_LOGIC;
           rw : in  STD_LOGIC_VECTOR(3 downto 0);
           ra : in  STD_LOGIC_VECTOR(3 downto 0);
           rb : in  STD_LOGIC_VECTOR(3 downto 0);
           adata : out  STD_LOGIC_VECTOR(15 downto 0);
           bdata : out  STD_LOGIC_VECTOR(15 downto 0));
end rf;

architecture Behavioral of rf is
component demux
Port ( data : in  STD_LOGIC;
           sel: in  STD_LOGIC_VECTOR (3 downto 0);
           seldata: out  STD_LOGIC_VECTOR (15 downto 0));
end component;

component mux1x16
Port ( input : in  STD_LOGIC_VECTOR (255 downto 0);
           selecter : in  STD_LOGIC_VECTOR (3 downto 0);
           out_data : out  STD_LOGIC_VECTOR (15 downto 0));
end component;

component reg_16_bits
    Port ( datain : in  STD_LOGIC_VECTOR (15 downto 0);
           en : in  STD_LOGIC;
           clk : in  STD_LOGIC;
           outputs : out STD_LOGIC_VECTOR (15 downto 0));
end component;


signal tmp : std_logic_vector(15 downto 0):=(others=>'0');
signal reg_out : std_logic_vector(255 downto 0):=(others=>'0');
signal demux_out : std_logic_vector(15 downto 0);
begin
tmp<=wdat;
wrdemux: demux port map(data=>wren,
								sel=>rw,
								seldata=>demux_out);
g0:for i in 0 to 15 generate
	regi:reg_16_bits port map(datain=>tmp,
									  en=>demux_out(i),
									  clk=>clk,
									  outputs=>reg_out((16*i)+15 downto 16*i));
end generate;

muxa : mux1x16 port map(input=>reg_out,
							   selecter=>ra,
								out_data=>adata);
							  
muxb : mux1x16 port map(input=>reg_out,
							   selecter=>rb,
								out_data=>bdata);

end Behavioral;

