--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   09:52:46 08/12/2020
-- Design Name:   
-- Module Name:   C:/Users/TUTEL-50/Desktop/HW6/HW6/demux_sim.vhd
-- Project Name:  HW6
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: demux
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
 
ENTITY demux_sim IS
END demux_sim;
 
ARCHITECTURE behavior OF demux_sim IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT demux
    PORT(
         data : IN  std_logic;
         sel : IN  std_logic_vector(3 downto 0);
         seldata : OUT  std_logic_vector(15 downto 0)
        );
    END COMPONENT;
    

   --Inputs
   signal data : std_logic := '0';
   signal sel : std_logic_vector(3 downto 0) := (others => '0');

 	--Outputs
   signal seldata : std_logic_vector(15 downto 0);
   -- No clocks detected in port list. Replace <clock> below with 
   -- appropriate port name 
 

 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: demux PORT MAP (
          data => data,
          sel => sel,
          seldata => seldata
        );

   -- Clock process definitions


   -- Stimulus process
   stim_proc: process
   begin		
      -- hold reset state for 100 ns.
	data<='1';
	sel<=X"0";
	wait for 10 ns;
	sel<=X"1";
	wait for 10 ns;
	sel<=X"2";
	wait for 10 ns;
	sel<=X"3";
	wait for 10 ns;
	sel<=X"4";
	wait for 10 ns;
	sel<=X"5";
	wait for 10 ns;
	sel<=X"6";
	wait for 10 ns;
	sel<=X"7";
	wait for 10 ns;
	sel<=X"8";
	wait for 10 ns;
	sel<=X"9";
	wait for 10 ns;
	sel<=X"a";
	wait for 10 ns;
	sel<=X"b";
	wait for 10 ns;
	sel<=X"c";
	wait for 10 ns;
	sel<=X"d";
	wait for 10 ns;
	sel<=X"e";
	wait for 10 ns;
	sel<=X"f";
	wait for 10 ns;



	



	


      -- insert stimulus here 

      wait;
   end process;

END;
