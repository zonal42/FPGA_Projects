--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   14:19:59 06/21/2019
-- Design Name:   
-- Module Name:   C:/Users/Administrator/Desktop/Staj_2019_book/VHDL HW/Muhammet Hamidullah Erdem/HW4/HW4_Top_Module/Sum_SR_TB.vhd
-- Project Name:  HW4_Top_Module
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: Sum_SR
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
 
ENTITY Sum_SR_TB IS
END Sum_SR_TB;
 
ARCHITECTURE behavior OF Sum_SR_TB IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT Sum_SR
    PORT(
         Serial_IN : IN  std_logic;
         reset : IN  std_logic;
         enable : IN  std_logic;
         clk : IN  std_logic;
         SUM : OUT  std_logic_vector(7 downto 0)
        );
    END COMPONENT;
    

   --Inputs
   signal Serial_IN : std_logic := '0';
   signal reset : std_logic := '0';
   signal enable : std_logic := '0';
   signal clk : std_logic := '0';

 	--Outputs
   signal SUM : std_logic_vector(7 downto 0);

   -- Clock period definitions
   constant clk_period : time := 10 ns;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: Sum_SR PORT MAP (
          Serial_IN => Serial_IN,
          reset => reset,
          enable => enable,
          clk => clk,
          SUM => SUM
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
		reset <= '1';
      wait for 100 ns;	
		reset <= '0';
		enable <= '1';
		Serial_IN <= '1';
		wait for 10 ns;
		Serial_IN <= '1';
		wait for 10 ns;
		wait for 10 ns;
		wait for 10 ns;
		wait for 10 ns;
		wait for 10 ns;
		wait for 10 ns;
		wait for 10 ns;
		Serial_IN <= '0';
		wait for 10 ns;
		enable <= '0';
      wait for clk_period*10;

      -- insert stimulus here 

      wait;
   end process;

END;
