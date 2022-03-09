----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    10:14:51 08/10/2020 
-- Design Name: 
-- Module Name:    borondetopmodule - Behavioral 
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
use IEEE.STD_LOGIC_UNSIGNED.ALL;
-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity borondetopmodule is
    Port ( ciphertext : in  STD_LOGIC_VECTOR (63 downto 0);
           masterkey : in  STD_LOGIC_VECTOR (79 downto 0);
           clk : in  STD_LOGIC;
           start : in  STD_LOGIC;
           plaintext : out  STD_LOGIC_VECTOR (63 downto 0));
end borondetopmodule;

architecture Behavioral of borondetopmodule is
component decrypter
    Port ( plaintext : in  STD_LOGIC_VECTOR (63 downto 0);
           dekey : in  STD_LOGIC_VECTOR (63 downto 0);
           pout : out  STD_LOGIC_VECTOR (63 downto 0));
end component;

component dekeygenerator
Port ( keyreg : in  STD_LOGIC_VECTOR (79 downto 0);
           state : in  STD_LOGIC_VECTOR (4 downto 0);
			  enable : in std_logic;
           droundkey : out STD_LOGIC_VECTOR (79 downto 0));
end component;



signal a : std_logic:='0';
signal b : std_logic:='0';
signal dekeyen : std_logic:='0';
signal state2 : std_logic_vector(4 downto 0):="11001";
signal keygen_in : std_logic_vector(79 downto 0);
signal keygen_out : std_logic_vector(79 downto 0);
signal dec_in: std_logic_vector(63 downto 0);
signal dec_key : std_logic_vector(63 downto 0);
signal dec_out : std_logic_vector(63 downto 0);
begin

process(clk)
begin
if(rising_edge(clk))then
	if(start='0')then

		state2<="11001";
		a<='0';
		b<='0';
		
		dekeyen<='0';
	elsif(state2="11001"and a='0')then
		dekeyen<='1';
		dec_in<=ciphertext xor masterkey(63 downto 0);
		keygen_in<=masterkey;
		a<='1';
	elsif(state2="11001"and a='1' and b='0')then
		dec_key<=keygen_out(63 downto 0);
		dec_in<=ciphertext xor masterkey(63 downto 0);
		keygen_in<=keygen_out;
		state2<=state2-1;
	elsif(state2>0 and b='0')then
		dekeyen<='1';
		dec_key<=keygen_out(63 downto 0);
		dec_in<=dec_out;
		keygen_in<=keygen_out;
		state2<=state2-1;
	elsif(state2=1 and b='0')then
		
		dec_key<=keygen_out(63 downto 0);
		dec_in<=dec_out;
		keygen_in<=keygen_out;
		state2<=state2-1;
	elsif(state2=0 and b='0')then
		dekeyen<='0';
		dec_key<=keygen_out(63 downto 0);
		dec_in<=dec_out;
		keygen_in<=keygen_out;
		plaintext<=dec_out;
		b<='1';
	else

	end if;
end if;
end process;
decrypt:decrypter port map(plaintext=>dec_in,
									dekey=>dec_key,
									pout=>dec_out);

									
dekeygen:dekeygenerator port map(keyreg=>keygen_in,
											state=>state2,
											enable=>dekeyen,
											droundkey=>keygen_out);
end Behavioral;

