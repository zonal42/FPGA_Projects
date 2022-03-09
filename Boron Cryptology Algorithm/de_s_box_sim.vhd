--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   14:31:41 08/07/2020
-- Design Name:   
-- Module Name:   C:/Users/TUTEL-50/Desktop/HW5/de_s_box_sim.vhd
-- Project Name:  hw5
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: de_s_box
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
 
ENTITY de_s_box_sim IS
END de_s_box_sim;
 
ARCHITECTURE behavior OF de_s_box_sim IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT de_s_box
    PORT(
         desin : IN  std_logic_vector(3 downto 0);
         desout : OUT  std_logic_vector(3 downto 0)
        );
    END COMPONENT;
    

   --Inputs
   signal desin : std_logic_vector(3 downto 0) := (others => '0');

 	--Outputs
   signal desout : std_logic_vector(3 downto 0);
   -- No clocks detected in port list. Replace <clock> below with 
   -- appropriate port name 
 

 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: de_s_box PORT MAP (
          desin => desin,
          desout => desout
        );

   -- Clock process definitions
   <clock>_process :process
   begin


   -- Stimulus process
   stim_proc: process
   begin		
      -- hold reset state for 100 ns.
      wait for 100 ns;	

      wait for 500 ns;

      -- insert stimulus here 

      wait;
   end process;

END;
