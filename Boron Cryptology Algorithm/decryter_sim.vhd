--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   09:20:35 08/10/2020
-- Design Name:   
-- Module Name:   C:/Users/TUTEL-50/Desktop/HW5/decryter_sim.vhd
-- Project Name:  hw5
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: decrypter
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
 
ENTITY decryter_sim IS
END decryter_sim;
 
ARCHITECTURE behavior OF decryter_sim IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT decrypter
    PORT(
         plaintext : IN  std_logic_vector(63 downto 0);
         dekey : IN  std_logic_vector(63 downto 0);
         pout : OUT  std_logic_vector(63 downto 0)
        );
    END COMPONENT;
    

   --Inputs
   signal plaintext : std_logic_vector(63 downto 0) := (others => '0');
   signal dekey : std_logic_vector(63 downto 0) := (others => '0');

 	--Outputs
   signal pout : std_logic_vector(63 downto 0);
   -- No clocks detected in port list. Replace <clock> below with 
   -- appropriate port name 

 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: decrypter PORT MAP (
          plaintext => plaintext,
          dekey => dekey,
          pout => pout
        );

   -- Clock process definitions

 

   -- Stimulus process
   stim_proc: process
   begin		
      -- hold reset state for 100 ns.
		plaintext<=X"6e9faffce620b3ad";
		dekey<=X"af1493442bbc99c2";
      -- insert stimulus here 

      wait;
   end process;

END;
