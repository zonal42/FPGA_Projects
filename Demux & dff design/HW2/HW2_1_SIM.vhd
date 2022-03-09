--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   15:00:27 07/13/2020
-- Design Name:   
-- Module Name:   C:/Users/TUTEL-50/Desktop/HW2_VHDL/HW2/HW2_1_SIM.vhd
-- Project Name:  HW2
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: HW2_1
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
 
ENTITY HW2_1_SIM IS
END HW2_1_SIM;
 
ARCHITECTURE behavior OF HW2_1_SIM IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT HW2_1
    PORT(
         i : IN  std_logic_vector(3 downto 0);
         s : IN  std_logic_vector(1 downto 0);
         y : OUT  std_logic
        );
    END COMPONENT;
    

   --Inputs
   signal i : std_logic_vector(3 downto 0) := (others => '0');
   signal s : std_logic_vector(1 downto 0) := (others => '0');

 	--Outputs
   signal y : std_logic;
   -- No clocks detected in port list. Replace <clock> below with 
   -- appropriate port name 
 
 ---  constant <clock>_period : time := 10 ns;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: HW2_1 PORT MAP (
          i => i,
          s => s,
          y => y
        );

   -- Clock process definitions
--   <clock>_process :process
  -- begin
	--	<clock> <= '0';
		--wait for <clock>_period/2;
		--<clock> <= '1';
		--wait for <clock>_period/2;
   --end process;
 

   -- Stimulus process
   stim_proc: process
   begin		
      -- hold reset state for 100 ns.
      wait for 100 ns;	
		i(0)<='1';
		s<="00";
      wait for 100 ns;
		i<="0010";
		s<="00";
      wait for 100 ns;
      -- insert stimulus here 

      wait;
   end process;

END;
