--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   09:28:56 07/14/2020
-- Design Name:   
-- Module Name:   C:/Users/TUTEL-50/Desktop/HW2_VHDL/HW2/HW2_3_SIM.vhd
-- Project Name:  HW2
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: HW2_3_IMP
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
 
ENTITY HW2_3_SIM IS
END HW2_3_SIM;
 
ARCHITECTURE behavior OF HW2_3_SIM IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT HW2_3_IMP
    PORT(
         clk : IN  std_logic;
         x : IN  std_logic;
         demuxer : OUT  std_logic_vector(1 downto 0):="00"
        );
    END COMPONENT;
    

   --Inputs
   signal clk : std_logic := '0';
   signal x : std_logic := '0';

	--BiDirs
   signal demuxer : std_logic_vector(1 downto 0);

   -- Clock period definitions
   constant clk_period : time := 10 ns;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: HW2_3_IMP PORT MAP (
          clk => clk,
          x => x,
          demuxer => demuxer
        );

   -- Clock process definitions
   clk_process :process
   begin
		clk <= '0';
		wait for clk_period/2;
		clk <= '1';
		wait for clk_period/2;
   end process;
 

   -- Stimulus process
   stim_proc: process
   begin		
      -- hold reset state for 100 ns.
      wait for 100 ns;	
		x<='0';
      wait for clk_period*10;

      -- insert stimulus here 

      wait;
   end process;

END;
