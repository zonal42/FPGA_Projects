----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    14:35:22 06/21/2019 
-- Design Name: 
-- Module Name:    Control_FSM - Behavioral 
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

entity FSM is
    Port ( resetn : in  STD_LOGIC;
           start : in  STD_LOGIC;
           clk : in  STD_LOGIC;
           reset : out  STD_LOGIC;
           load : out  STD_LOGIC;
           enable : out  STD_LOGIC);
end FSM;

architecture Behavioral of FSM is
	signal State : STD_LOGIC_VECTOR(3 DOWNTO 0) :="0000";
begin
	process(clk)
	begin
		if(rising_edge(clk)) then
			if(resetn='1') then
			reset<='0';
			load<='0';
			enable<='0';
			else
			if(start='1') then
			State<="0000";
			else
			State<=State;
			end if;
			
		   case (State) is 
      when "0000" =>
		
         State<= x"1";
         reset<='1';
         load<='1';
         enable<='1';
      when "0001" =>
			State<=x"2";
         reset<='1';
         load<='0';
         enable<='1';
      when "0010" =>
			State<=x"3";
         reset<='1';
         load<='0';
         enable<='1';
      when "0011" =>
			State<=x"4";
         reset<='1';
         load<='0';
         enable<='1';
      when "0100" =>
			State<=x"5";
         reset<='1';
         load<='0';
         enable<='1';
      when "0101" =>
			State<=x"6";
         reset<='1';
         load<='0';
         enable<='1';
      when "0110" =>
			State<=x"7";
         reset<='1';
         load<='0';
         enable<='1';
      when "0111" =>
			State<=x"8";
         reset<='1';
         load<='0';
         enable<='1';
      when "1000" =>
			State<=x"9";
         reset<='1';
         load<='0';
         enable<='1';
      when "1001" =>
			State<=x"A";
         reset<='1';
         load<='0';
         enable<='0';
		when "1010" =>
			State<=x"B";
         reset<='1';
         load<='0';
         enable<='0';
      when "1011" =>
         State<=x"C";
         reset<='1';
         load<='0';
         enable<='0';
      when others =>
         enable <='0';
   end case;
		  end if;
		end if;
end process;
end Behavioral;

