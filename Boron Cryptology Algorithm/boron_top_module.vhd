----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    15:25:43 08/03/2020 
-- Design Name: 
-- Module Name:    boron_top_module - Behavioral 
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
use IEEE.numeric_std.all;
use ieee.std_logic_unsigned.all;
-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity boron_top_module is
    Port ( mkey : in  STD_LOGIC_VECTOR (79 downto 0);
           ptext : in  STD_LOGIC_VECTOR (63 downto 0);
           clk : in  STD_LOGIC;
           ena : in  STD_LOGIC;
           done : out  STD_LOGIC;
		   lk_out : out std_logic_vector(79 downto 0);
           ctext : out  STD_LOGIC_VECTOR (63 downto 0));
end boron_top_module;

architecture Behavioral of boron_top_module is
component key_generator
Port ( key_register : in  STD_LOGIC_VECTOR (79 downto 0);
           state : in  STD_LOGIC_VECTOR (4 downto 0);
           round_key : out  STD_LOGIC_VECTOR (79 downto 0));
end component;

component top_box
  Port ( sin : in  STD_LOGIC_VECTOR (63 downto 0);
         sout : out  STD_LOGIC_VECTOR (63 downto 0));
end component;


	signal completed :std_logic:='0';
	signal key_reg :  STD_LOGIC_VECTOR (79 downto 0);
	signal lastkey :  STD_LOGIC_VECTOR (79 downto 0);
	signal rkey :  STD_LOGIC_VECTOR (79 downto 0);
	signal tmp :  STD_LOGIC_VECTOR (63 downto 0):=X"0000000000000000";

	signal abc:  STD_LOGIC_VECTOR (4 downto 0):="00000";
	signal round :  STD_LOGIC_VECTOR (63 downto 0);



begin

process(clk)
begin
if(rising_edge(clk))then

	if(ena='1')then
		if(abc="00000")then
		tmp<=ptext xor mkey(63 downto 0);
		key_reg<=mkey;
		abc<=abc+1;
		elsif(abc="11001")then
		ctext<=round xor rkey(63 downto 0);
		lastkey<=rkey;
		completed<='1';
		else
		tmp<=round xor rkey(63 downto 0);
		key_reg<=rkey;
		abc<=abc+1;
		end if;
	else
	abc<="00000";
	completed<='0';

	end if;
end if;
end process;
done<=completed;
lk_out<=lastkey;
keygen:key_generator port map(
		key_register => key_reg,
		state => abc  ,
		round_key => rkey
	);

tb:top_box port map(
	sin=>tmp,
	sout=>round);




end Behavioral;

