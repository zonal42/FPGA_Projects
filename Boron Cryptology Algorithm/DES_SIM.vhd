--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   14:37:20 08/07/2020
-- Design Name:   
-- Module Name:   C:/Users/TUTEL-50/Desktop/HW5/DES_SIM.vhd
-- Project Name:  hw5
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: deblockshuffle
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
 
ENTITY DES_SIM IS
END DES_SIM;
 
ARCHITECTURE behavior OF DES_SIM IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT deblockshuffle
    PORT(
         dinput : IN  std_logic_vector(63 downto 0);
         dshuffledoutput : OUT  std_logic_vector(63 downto 0)
        );
    END COMPONENT;
    

   --Inputs
   signal dinput : std_logic_vector(63 downto 0) := (others => '0');

 	--Outputs
   signal dshuffledoutput : std_logic_vector(63 downto 0);
   -- No clocks detected in port list. Replace <clock> below with 
   -- appropriate port name 
 

 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: deblockshuffle PORT MAP (
          dinput => dinput,
          dshuffledoutput => dshuffledoutput
        );

   -- Clock process definitions


   -- Stimulus process
   stim_proc: process
   begin		
      -- hold reset state for 100 ns.
		dinput<=X"0123456789ABCDEF";


      -- insert stimulus here 

      wait;
   end process;

END;
