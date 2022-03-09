--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   15:30:43 06/21/2019
-- Design Name:   
-- Module Name:   C:/Users/Administrator/Desktop/Staj_2019_book/VHDL HW/Muhammet Hamidullah Erdem/HW4/HW4_Top_Module/Top_TB.vhd
-- Project Name:  HW4_Top_Module
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: Top_Module
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
 
ENTITY Top_TB IS
END Top_TB;
 
ARCHITECTURE behavior OF Top_TB IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT TOPMOD
    PORT(
         clk : IN  std_logic;
         resetn : IN  std_logic;
         start : IN  std_logic;
         A : IN  std_logic_vector(7 downto 0);
         B : IN  std_logic_vector(7 downto 0);
         SUM : OUT  std_logic_vector(7 downto 0)
        );
    END COMPONENT;
    

   --Inputs
   signal clk : std_logic := '0';
   signal resetn : std_logic := '0';
   signal start : std_logic := '0';
   signal A : std_logic_vector(7 downto 0) := (others => '0');
   signal B : std_logic_vector(7 downto 0) := (others => '0');

 	--Outputs
   signal SUM : std_logic_vector(7 downto 0);

   -- Clock period definitions
   constant clk_period : time := 10 ns;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: TOPMOD PORT MAP (
          clk => clk,
          resetn => resetn,
          start => start,
          A => A,
          B => B,
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
		resetn <= '1';
		start <= '0';
      wait for 30 ns;
		resetn <= '0';
		start <= '1';
		A <= "01100011";
		B <= "00111100";
		wait for 10 ns;
		start <= '0';
		wait for 120 ns;
		start <= '1';
		wait for 10 ns;
		start <= '0';
		A <= "01100101";
		B <= "10001100";
		wait for 40 ns;
		A <= "01100111";
		B <= "00001100";
		wait for 100 ns;
		

      wait for clk_period*10;

      -- insert stimulus here 

      wait;
   end process;

END;
