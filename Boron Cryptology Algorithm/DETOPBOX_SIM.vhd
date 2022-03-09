--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   15:35:42 08/07/2020
-- Design Name:   
-- Module Name:   C:/Users/TUTEL-50/Desktop/HW5/DETOPBOX_SIM.vhd
-- Project Name:  hw5
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: detopbox
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
 
ENTITY DETOPBOX_SIM IS
END DETOPBOX_SIM;
 
ARCHITECTURE behavior OF DETOPBOX_SIM IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT detopbox
    PORT(
         din : IN  std_logic_vector(63 downto 0);
         dout : OUT  std_logic_vector(63 downto 0)
        );
    END COMPONENT;
    

   --Inputs
   signal din : std_logic_vector(63 downto 0) := X"0123456789ABCDEF";

 	--Outputs
   signal dout : std_logic_vector(63 downto 0);
   -- No clocks detected in port list. Replace <clock> below with 
   -- appropriate port name 
 

 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: detopbox PORT MAP (
          din => din,
          dout => dout
        );

   -- Clock process definitions

 

   -- Stimulus process
   stim_proc: process
   begin		
      -- hold reset state for 100 ns.
      wait for 100 ns;	



      -- insert stimulus here 

      wait;
   end process;

END;
