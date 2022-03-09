--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   14:33:19 08/07/2020
-- Design Name:   
-- Module Name:   C:/Users/TUTEL-50/Desktop/HW5/de_s_box_layer_sim.vhd
-- Project Name:  hw5
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: desboxlayer
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
 
ENTITY de_s_box_layer_sim IS
END de_s_box_layer_sim;
 
ARCHITECTURE behavior OF de_s_box_layer_sim IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT desboxlayer
    PORT(
         desinlayer : IN  std_logic_vector(63 downto 0);
         desoutlayer : OUT  std_logic_vector(63 downto 0)
        );
    END COMPONENT;
    

   --Inputs
   signal desinlayer : std_logic_vector(63 downto 0) := X"22220246DEFC2222";

 	--Outputs
   signal desoutlayer : std_logic_vector(63 downto 0);
   -- No clocks detected in port list. Replace <clock> below with 
   -- appropriate port name 
 

 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: desboxlayer PORT MAP (
          desinlayer => desinlayer,
          desoutlayer => desoutlayer
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
