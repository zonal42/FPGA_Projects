--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   12:06:34 08/07/2020
-- Design Name:   
-- Module Name:   C:/Users/TUTEL-50/Desktop/HW5/boron_sim.vhd
-- Project Name:  hw5
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: boron_top_module
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
 
ENTITY boron_sim IS
END boron_sim;
 
ARCHITECTURE behavior OF boron_sim IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT boron_top_module
    PORT(
         mkey : IN  std_logic_vector(79 downto 0);
         ptext : IN  std_logic_vector(63 downto 0);
         clk : IN  std_logic;
         ena : IN  std_logic;
         ctext : OUT  std_logic_vector(63 downto 0)
        );
    END COMPONENT;
    

   --Inputs
   signal mkey : std_logic_vector(79 downto 0) := (others => '0');
   signal ptext : std_logic_vector(63 downto 0) := (others => '0');
   signal clk : std_logic := '0';
   signal ena : std_logic := '0';

 	--Outputs
   signal ctext : std_logic_vector(63 downto 0);

   -- Clock period definitions
   constant clk_period : time := 10 ns;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: boron_top_module PORT MAP (
          mkey => mkey,
          ptext => ptext,
          clk => clk,
          ena => ena,
          ctext => ctext
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
		ena<='1';
		mkey<=(others=>'0');
		ptext<=X"0000000000000000";
		
      wait for clk_period*10;
	wait;
      -- insert stimulus here 

      wait;
   end process;

END;
