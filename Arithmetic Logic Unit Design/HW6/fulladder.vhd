library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity fulladder is
    Port ( ainp : in  STD_LOGIC;
           binp : in  STD_LOGIC;
           sum : out  STD_LOGIC;
           cin : in  STD_LOGIC;
           cout : out  STD_LOGIC);
end fulladder;

architecture Behavioral of fulladder is
SIGNAL ab :std_logic;
SIGNAL ac :std_logic;
SIGNAL bc :std_logic;
begin
ab<=ainp and binp;
ac<=ainp and cin;
bc<=binp and cin;
cout<=ab or ac or bc;
sum<=ainp xor binp xor cin;


end Behavioral;

