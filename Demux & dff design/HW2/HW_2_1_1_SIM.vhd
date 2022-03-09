--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   18:41:09 07/13/2020
-- Design Name:   
-- Module Name:   C:/Users/TUTEL-50/Desktop/HW2_VHDL/HW2/HW_2_1_1_SIM.vhd
-- Project Name:  HW2
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: HW2_1_1
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
 
ENTITY HW_2_1_1_SIM IS
END HW_2_1_1_SIM;
 
ARCHITECTURE behavior OF HW_2_1_1_SIM IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT HW2_1_1
    PORT(
         ina : IN  std_logic_vector(3 downto 0);
         y : OUT  std_logic;
         s : IN  std_logic_vector(1 downto 0)
        );
    END COMPONENT;
    

   --Inputs
   signal ina : std_logic_vector(3 downto 0) := (others => '0');
   signal s : std_logic_vector(1 downto 0) := (others => '0');

 	--Outputs
   signal y : std_logic;
   -- No clocks detected in port list. Replace <clock> below with 
   -- appropriate port name 
 
--   constant <clock>_period : time := 10 ns;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: HW2_1_1 PORT MAP (
          ina => ina,
          y => y,
          s => s
        );

   -- Clock process definitions
--   <clock>_process :process
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
      wait for 100 ns;	
		ina<="0001";
		s<="00";
      wait for 100 ns;
		ina<="0100";
		s<="10";


      -- insert stimulus here 

      wait;
   end process;

END;
