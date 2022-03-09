--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   13:38:54 06/21/2019
-- Design Name:   
-- Module Name:   C:/Users/Administrator/Desktop/Staj_2019_book/VHDL HW/Muhammet Hamidullah Erdem/HW4/HW4_Top_Module/SO_REG_TB.vhd
-- Project Name:  HW4_Top_Module
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: IN_8_bit_Shift_Register
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
 
ENTITY SO_REG_TB IS
END SO_REG_TB;
 
ARCHITECTURE behavior OF SO_REG_TB IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT IN_8_bit_Shift_Register
    PORT(
         load : IN  std_logic;
         enable : IN  std_logic;
         clk : IN  std_logic;
         load_in : IN  std_logic_vector(7 downto 0);
         SO : OUT  std_logic
        );
    END COMPONENT;
    

   --Inputs
   signal load : std_logic := '0';
   signal enable : std_logic := '0';
   signal clk : std_logic := '0';
   signal load_in : std_logic_vector(7 downto 0) := (others => '0');

 	--Outputs
   signal SO : std_logic;

   -- Clock period definitions
   constant clk_period : time := 10 ns;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: IN_8_bit_Shift_Register PORT MAP (
          load => load,
          enable => enable,
          clk => clk,
          load_in => load_in,
          SO => SO
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
		enable <= '1';
		load <= '1';
		load_in <= "11010111";
		wait for 10 ns;
		load <='0';
		wait for 100 ns;
		enable <= '0';
      wait for clk_period*10;

      -- insert stimulus here 

      wait;
   end process;

END;
