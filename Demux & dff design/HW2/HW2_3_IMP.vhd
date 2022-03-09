----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    08:54:47 07/14/2020 
-- Design Name: 
-- Module Name:    HW2_3_IMP - Behavioral 
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

entity HW2_3_IMP is
    Port ( clk : in  STD_LOGIC;
           x : in  STD_LOGIC;
           demuxer : out  STD_LOGIC_VECTOR (1 downto 0):="00");
end HW2_3_IMP;

architecture Behavioral of HW2_3_IMP is
SIGNAL d_flip_input : std_logic_vector(1 downto 0):="00";
SIGNAL d_flip_output : std_logic_vector(1 downto 0):="00";
SIGNAL c	:	std_logic;
SIGNAL ab	:	std_logic;
SIGNAL demux_out : std_logic_vector(1 downto 0):="00";
COMPONENT demux1x2
    Port ( info : in  STD_LOGIC;
           sel : in  STD_LOGIC;
           outpins : out  STD_LOGIC_VECTOR (1 downto 0));
END COMPONENT;
COMPONENT dff
    Port ( d : in  STD_LOGIC;
           clock : in  STD_LOGIC;
           q : out  STD_LOGIC);
END COMPONENT;

begin
a:demux1x2 PORT MAP(info=>d_flip_output(0),
						  sel=>x,
						  outpins=>demux_out);
b:dff PORT MAP(d=>d_flip_input(0),
					clock=>clk,
					q=>d_flip_output(0));
					


f:dff PORT MAP(d=>d_flip_input(1),
					clock=>clk,
					q=>d_flip_output(1));

ab<=demux_out(1);					
c<=ab and d_flip_output(1);
d_flip_input(0)<=not c;

d_flip_input(1)<=demux_out(0);
demuxer<=demux_out;
end Behavioral;

