--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   12:20:27 08/12/2020
-- Design Name:   
-- Module Name:   C:/Users/TUTEL-50/Desktop/HW6/HW6/rf_sim.vhd
-- Project Name:  HW6
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: rf
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
 
ENTITY rf_sim IS
END rf_sim;
 
ARCHITECTURE behavior OF rf_sim IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT rf
    PORT(
         wren : IN  std_logic;
         wdat : IN  std_logic_vector(15 downto 0);
         clk : IN  std_logic;
         rw : IN  std_logic_vector(3 downto 0);
         ra : IN  std_logic_vector(3 downto 0);
         rb : IN  std_logic_vector(3 downto 0);
         adata : OUT  std_logic_vector(15 downto 0);
         bdata : OUT  std_logic_vector(15 downto 0)
        );
    END COMPONENT;
    

   --Inputs
   signal wren : std_logic := '0';
   signal wdat : std_logic_vector(15 downto 0) := (others => '0');
   signal clk : std_logic := '0';
   signal rw : std_logic_vector(3 downto 0) := (others => '0');
   signal ra : std_logic_vector(3 downto 0) := (others => '0');
   signal rb : std_logic_vector(3 downto 0) := (others => '0');

 	--Outputs
   signal adata : std_logic_vector(15 downto 0);
   signal bdata : std_logic_vector(15 downto 0);

   -- Clock period definitions
   constant clk_period : time := 10 ns;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: rf PORT MAP (
          wren => wren,
          wdat => wdat,
          clk => clk,
          rw => rw,
          ra => ra,
          rb => rb,
          adata => adata,
          bdata => bdata
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
		wdat<=x"FEDC";
		wren<='1';
		rw<=X"0";
		ra<=X"0";
		rb<=X"f";
		wait for clk_period;
		wren<='0';
		wdat<=x"CDEF";
		wait for clk_period;
		wren<='1';
		rw<=X"f";


      wait for clk_period*10;

      -- insert stimulus here 

      wait;
   end process;

END;
