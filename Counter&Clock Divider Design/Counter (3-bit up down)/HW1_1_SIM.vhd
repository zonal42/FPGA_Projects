LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
 
-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--USE ieee.numeric_std.ALL;
 
ENTITY HW1_1_SIM IS
END HW1_1_SIM;
 
ARCHITECTURE behavior OF HW1_1_SIM IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT HW1_1_IMP
    PORT(
         x : IN  std_logic;
         clock : IN  std_logic;
         en : IN  std_logic;
         res : IN  std_logic;
         q : OUT  std_logic_vector(2 downto 0)
        );
    END COMPONENT;
    

   --Inputs
   signal x : std_logic := '0';
   signal clock : std_logic := '0';
   signal en : std_logic := '0';
   signal res : std_logic := '0';

 	--Outputs
   signal q : std_logic_vector(2 downto 0);

   -- Clock period definitions
   constant clock_period : time := 10 ns;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: HW1_1_IMP PORT MAP (
          x => x,
          clock => clock,
          en => en,
          res => res,
          q => q
        );

   -- Clock process definitions
   clock_process :process
   begin
		clock <= '0';
		wait for clock_period/2;
		clock <= '1';
		wait for clock_period/2;
   end process;
 

   -- Stimulus process
   stim_proc: process
   begin		
      -- hold reset state for 100 ns.
     wait for 100 ns;	
		x<='1';
		en<='1';
		res<='1';
		wait for 510 ns;	
		x<='0';	
      wait for clock_period*10;

      -- insert stimulus here 

      wait;
   end process;

END;