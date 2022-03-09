--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   11:11:18 07/14/2020
-- Design Name:   
-- Module Name:   C:/Users/TUTEL-50/Desktop/HW2_VHDL/HW3/HW3_SIM.vhd
-- Project Name:  HW3
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: HW3
-- 
-- Dependencies:
-- 
-- Revision:
-- Revision 0.01 - File Created
-- Additional Comments:
--
-- Notes: 
-- This testbench has been automatically generated using types std_logic and
-- std_logic_vector for the ports of the unit under test.  Xilinx recommends
-- that these types always be used for the top-level I/O of a design in order
-- to guarantee that the testbench will bind correctly to the post-implementation 
-- simulation model.
--------------------------------------------------------------------------------
LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
 
-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--USE ieee.numeric_std.ALL;
 
ENTITY HW3_SIM IS
END HW3_SIM;
 
ARCHITECTURE behavior OF HW3_SIM IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT HW3
    PORT(
         number_a : IN  std_logic_vector(31 downto 0);
         number_b : IN  std_logic_vector(31 downto 0);
         s : OUT  std_logic_vector(31 downto 0):=X"00000000";
         cout : OUT  std_logic
        );
    END COMPONENT;
    

   --Inputs
   signal number_a : std_logic_vector(31 downto 0) := (others => '0');
   signal number_b : std_logic_vector(31 downto 0) := (others => '0');

 	--Outputs
   signal s : std_logic_vector(31 downto 0);
   signal cout : std_logic;
   -- No clocks detected in port list. Replace <clock> below with 
   -- appropriate port name 
 
--   constant <clock>_period : time := 10 ns;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: HW3 PORT MAP (
          number_a => number_a,
          number_b => number_b,
          s => s,
          cout => cout
        );

   -- Clock process definitions
 --  <clock>_process :process
--   begin
--		<clock> <= '0';
--		wait for <clock>_period/2;
--		<clock> <= '1';
--		wait for <clock>_period/2;
--   end process;
 

   -- Stimulus process
   stim_proc: process
   begin		
      -- hold reset state for 100 ns.
      number_a<=X"ffffffff";
		number_b<=X"00000001";
      wait for 500 ns;

      -- insert stimulus here 

      wait;
   end process;

END;
