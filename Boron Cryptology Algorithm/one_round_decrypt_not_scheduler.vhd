----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    12:36:29 08/07/2020 
-- Design Name: 
-- Module Name:    one_round_decrypt_not_scheduler - Behavioral 
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

entity one_round_decrypt_not_scheduler is
    Port ( plaintext : in  STD_LOGIC_VECTOR (63 downto 0);
           pout : out  STD_LOGIC_VECTOR (63 downto 0));
end one_round_decrypt_not_scheduler;

architecture Behavioral of one_round_decrypt_not_scheduler is
component detopbox
 Port ( din : in  STD_LOGIC_VECTOR (63 downto 0);
           dout : out  STD_LOGIC_VECTOR (63 downto 0));
		
end component;
signal tmp1:std_logic_vector(63 downto 0);
begin
dd:detopbox port map(din=>plaintext,
							dout=>tmp1);
pout<=tmp1 xor X"526885779338555a";
							


end Behavioral;

