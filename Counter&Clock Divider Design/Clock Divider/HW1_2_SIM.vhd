
LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
 
-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--USE ieee.numeric_std.ALL;
 
ENTITY HW1_2_SIM IS
END HW1_2_SIM;
 
ARCHITECTURE behavior OF HW1_2_SIM IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT HW1_2_IMP
    PORT(
         x : IN  std_logic_vector(1 downto 0);
         clk : IN  std_logic;
         q : OUT  std_logic;
         res : IN  std_logic
        );
    END COMPONENT;
    

   --Inputs
   signal x : std_logic_vector(1 downto 0) := (others => '0');
   signal clk : std_logic := '0';
   signal res : std_logic := '0';

 	--Outputs
   signal q : std_logic;

   -- Clock period definitions
   constant clk_period : time := 10 ns;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: HW1_2_IMP PORT MAP (
          x => x,
          clk => clk,
          q => q,
          res => res
        );

   -- Clock process definitions
   clk_process :process
   begin
		clk <= '0';
		wait for clk_period/2;
		clk <= '1';
		wait for clk_period/2;
   end process;
 

   -- Stimulus process
   stim_proc: process
   begin		
      -- hold reset state for 100 ns.
      wait for 100 ns;	
		x<="00";
		res<='1';
		wait for 200 ns;
		x<="01";
		wait for 200 ns;
		x<="10";
		wait for 200 ns;
		x<="11";
      wait for clk_period*10;

      -- insert stimulus here 

      wait;
   end process;

END;
