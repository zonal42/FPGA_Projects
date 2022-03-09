----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    10:03:18 07/14/4040 
-- Design Name: 
-- Module Name:    fulladder - fulladder 
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

entity fulladder is
    Port ( a : in  STD_LOGIC;
           b : in  STD_LOGIC;
           cin : in  STD_LOGIC:='0';
           s : out  STD_LOGIC;
           cout : out  STD_LOGIC);
end fulladder;

architecture fulladder of fulladder is
SIGNAL summ : std_logic;
SIGNAL ccout : std_logic;
SIGNAL aa : std_logic;
SIGNAL ab : std_logic;
SIGNAL ac : std_logic;




begin


summ<= a xor b xor cin after 20 ns;
aa<=a and cin ;
ab<=a and b ;
ac<=b and cin ;
ccout<=aa or ab or ac after 30 ns;
s<=summ;
cout<=ccout;

end fulladder;

