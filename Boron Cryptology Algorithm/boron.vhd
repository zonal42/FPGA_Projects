----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    16:30:22 08/10/2020 
-- Design Name: 
-- Module Name:    boron - Behavioral 
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

entity boron is
Port(in_text : in std_logic_vector(63 downto 0);
	  masterkey : in std_logic_vector(79 downto 0);
	  start_encrypt,start_decrypt,clk : in std_logic;
	  out_text: out std_logic_vector(63 downto 0)
);
end boron;

architecture Behavioral of boron is
component boron_top_module
Port ( mkey : in  STD_LOGIC_VECTOR (79 downto 0);
           ptext : in  STD_LOGIC_VECTOR (63 downto 0);
           clk : in  STD_LOGIC;
           enable : in  STD_LOGIC;
           done : out  STD_LOGIC;
			  last_key_out : out std_logic_vector(79 downto 0);
           ciphertext : out  STD_LOGIC_VECTOR (63 downto 0));
end component;


component borondetopmodule
  Port ( ciphertext : in  STD_LOGIC_VECTOR (63 downto 0);
           masterkey : in  STD_LOGIC_VECTOR (79 downto 0);
           clk : in  STD_LOGIC;
           start : in  STD_LOGIC;
           plaintext : out  STD_LOGIC_VECTOR (63 downto 0));
end component;


signal encrypted,decrypted : std_logic_vector(63 downto 0);
signal lastkey : std_logic_vector(79 downto 0);



signal s_se,s_sd : std_logic:='0';

begin
encrypter:boron_top_module port map(mkey=>masterkey,
												ptext=>in_text,
												clk=>clk,
												enable=>s_se,
												last_key_out=>lastkey,
												ciphertext=>encrypted);
								
decrypter:borondetopmodule port map(ciphertext=>encrypted,
												masterkey=>lastkey,
												clk=>clk,
												start=>s_sd,
												plaintext=>decrypted);
												
out_text<=decrypted;
--process(start_encrypt)
--begin
--if(rising_edge(start_encrypt))then
--s_se<='1';
--s_se<='0' after 355 ns;
--end if;
--end process;
--process(start_decrypt)
--begin
--if(rising_edge(start_decrypt))then
--s_sd<='1';
--s_sd<='0' after 265 ns;
--end if;
--end process;
end Behavioral;


