----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    16:26:20 08/11/2020 
-- Design Name: 
-- Module Name:    boron_recrpyt - Behavioral 
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

entity boron_recrpyt is
    Port ( in_text : in  STD_LOGIC_VECTOR (63 downto 0);
           masterkey : in  STD_LOGIC_VECTOR (79 downto 0);
           start_encrypt : in  STD_LOGIC;
           start_decrypt : in  STD_LOGIC;
           clk : in  STD_LOGIC;
           donee : out  STD_LOGIC;
           out_text : out  STD_LOGIC_VECTOR (63 downto 0));
end boron_recrpyt;

architecture Behavioral of boron_recrpyt is
component borondetopmodule
    Port ( ciphertext : in  STD_LOGIC_VECTOR (63 downto 0);
           masterkey : in  STD_LOGIC_VECTOR (79 downto 0);
           clk : in  STD_LOGIC;
           start : in  STD_LOGIC;
           plaintext : out  STD_LOGIC_VECTOR (63 downto 0));
end component;
component boron_top_module
    Port ( mkey : in  STD_LOGIC_VECTOR (79 downto 0);
           ptext : in  STD_LOGIC_VECTOR (63 downto 0);
           clk : in  STD_LOGIC;
           ena : in  STD_LOGIC;
           done : out  STD_LOGIC;
			  lk_out : out std_logic_vector(79 downto 0);
           ctext : out  STD_LOGIC_VECTOR (63 downto 0));
end component;
signal completed: std_logic:='0';
signal lastkey: std_logic_vector(79 downto 0):=X"00000000000000000000";
signal encrypted : std_logic_vector(63 downto 0):=X"0000000000000000";
signal decrypted : std_logic_vector(63 downto 0);
signal sse,ssd: std_logic:='0';
begin
encrypter:boron_top_module port map(mkey=>masterkey,
												ptext=>in_text,
												clk=>clk,
												ena=>sse,
												done=>completed,
												lk_out=>lastkey,
												ctext=>encrypted);
decrypter:borondetopmodule port map(ciphertext=>encrypted,
												masterkey=>lastkey,
												clk=>clk,
												start=>ssd,
												plaintext=>decrypted);
												
donee<=completed;
out_text<=decrypted;
process(start_encrypt)
begin
if(rising_edge(start_encrypt))then
sse<='1';
sse<='0' after 260 ns;
end if;
end process;

process(start_decrypt)
begin
if(rising_edge(start_decrypt))then
ssd<='1';
ssd<='0' after 270 ns;

end if;
end process;

end Behavioral;

