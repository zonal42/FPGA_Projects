----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    15:07:00 06/21/2019 
-- Design Name: 
-- Module Name:    Top_Module - Behavioral 
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

entity TOPMOD is
    Port ( clk : in  STD_LOGIC;
           resetn : in  STD_LOGIC;
           start : in  STD_LOGIC;
           A : in  STD_LOGIC_VECTOR (7 downto 0);
           B : in  STD_LOGIC_VECTOR (7 downto 0);
           SUM : out  STD_LOGIC_VECTOR (7 downto 0));
end TOPMOD;

architecture Behavioral of TOPMOD is

	COMPONENT FSM
	PORT(
		resetn : IN std_logic;
		start : IN std_logic;
		clk : IN std_logic;          
		reset : OUT std_logic;
		load : OUT std_logic;
		enable : OUT std_logic
		);
	END COMPONENT;
	
	COMPONENT SREG_8_BITS
	PORT(
		load : IN std_logic;
		enable : IN std_logic;
		clk : IN std_logic;
		load_in : IN std_logic_vector(7 downto 0);          
		SO : OUT std_logic
		);
	END COMPONENT;
	
	COMPONENT DFF
	PORT(
		D : IN std_logic;
		clk : IN std_logic;
		reset : IN std_logic;          
		Q : OUT std_logic
		);
	END COMPONENT;
	
	COMPONENT FA
	PORT(
		Cin : IN std_logic;
		A : IN std_logic;
		B : IN std_logic;          
		S : OUT std_logic;
		Cout : OUT std_logic
		);
	END COMPONENT;
	
	COMPONENT SR_9_BITS
	PORT(
		Serial_IN : IN std_logic;
		reset : IN std_logic;
		enable : IN std_logic;
		clk : IN std_logic;          
		SUM : OUT std_logic_vector(7 downto 0)
		);
	END COMPONENT;
	
	signal reset : STD_LOGIC;
	signal load : STD_LOGIC;
	signal enable : STD_LOGIC;
	signal Ai : STD_LOGIC;
	signal Bi : STD_LOGIC;
	signal sum_out : STD_LOGIC;
	signal C_out : STD_LOGIC;
	signal carry_in : STD_LOGIC;

begin


	Control_FSM: FSM PORT MAP(
		resetn =>resetn ,
		start => start ,
		clk => clk ,
		reset => reset ,
		load => load  ,
		enable => enable 
	);
	
	
	Register_A: SREG_8_BITS PORT MAP(
		load => load ,
		enable => enable ,
		clk => clk,
		load_in => A ,
		SO => Ai
	);	
	
	Register_B: SREG_8_BITS PORT MAP(
		load => load ,
		enable => enable ,
		clk => clk ,
		load_in => B ,
		SO => Bi
	);	
	
	ADFF: DFF PORT MAP(
		D => C_out ,
		clk => clk ,
		reset => reset ,
		Q => carry_in 

	);
	
	CFA: FA PORT MAP(
		Cin => carry_in  ,
		A => Ai ,
		B => Bi ,
		S => sum_out ,
		Cout => C_out 
	);
	
	ASR_9_BITS: SR_9_BITS PORT MAP(
		Serial_IN => sum_out ,
		reset => reset ,
		enable => enable ,
		clk => clk ,
		SUM => SUM
	);
	


end Behavioral;

