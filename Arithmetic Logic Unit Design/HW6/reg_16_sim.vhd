--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   10:22:51 08/12/2020
-- Design Name:   
-- Module Name:   C:/Users/TUTEL-50/Desktop/HW6/HW6/reg_16_sim.vhd
-- Project Name:  HW6
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: reg_16_bits
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
 
ENTITY reg_16_sim IS
END reg_16_sim;
 
ARCHITECTURE behavior OF reg_16_sim IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT reg_16_bits
    PORT(
         datain : IN  std_logic_vector(15 downto 0);
         en : IN  std_logic;
         clk : IN  std_logic;
         outputs : OUT  std_logic_vector(15 downto 0)
        );
    END COMPONENT;
    

   --Inputs
   signal datain : std_logic_vector(15 downto 0) := (others => '0');
   signal en : std_logic := '0';
   signal clk : std_logic := '0';

 	--Outputs
   signal outputs : std_logic_vector(15 downto 0);

   -- Clock period definitions
   constant clk_period : time := 10 ns;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: reg_16_bits PORT MAP (
          datain => datain,
          en => en,
          clk => clk,
          outputs => outputs
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
	
		datain<=X"0123";
		en<='1';
		wait for 10 ns;
		datain<=X"3210";
		en<='0';		
      wait for clk_period*10;

      -- insert stimulus here 

      wait;
   end process;

END;
