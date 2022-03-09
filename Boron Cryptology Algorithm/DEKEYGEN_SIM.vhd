--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   09:01:12 08/10/2020
-- Design Name:   
-- Module Name:   C:/Users/TUTEL-50/Desktop/HW5/DEKEYGEN_SIM.vhd
-- Project Name:  hw5
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: dekeygenerator
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
 
ENTITY DEKEYGEN_SIM IS
END DEKEYGEN_SIM;
 
ARCHITECTURE behavior OF DEKEYGEN_SIM IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT dekeygenerator
    PORT(
         keyreg : IN  std_logic_vector(79 downto 0);
         state : IN  std_logic_vector(4 downto 0);
         droundkey : OUT  std_logic_vector(79 downto 0)
        );
    END COMPONENT;
    

   --Inputs
   signal keyreg : std_logic_vector(79 downto 0) := (others => '0');
   signal state : std_logic_vector(4 downto 0) := (others => '0');

 	--Outputs
   signal droundkey : std_logic_vector(79 downto 0);
   -- No clocks detected in port list. Replace <clock> below with 
   -- appropriate port name 
 

 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: dekeygenerator PORT MAP (
          keyreg => keyreg,
          state => state,
          droundkey => droundkey
        );

   -- Clock process definitions


   -- Stimulus process
   stim_proc: process
   begin		
      -- hold reset state for 100 ns.
		keyreg<=X"f5e2526885779338555a";
		state<="11000";
		
      -- insert stimulus here 

      wait;
   end process;

END;
