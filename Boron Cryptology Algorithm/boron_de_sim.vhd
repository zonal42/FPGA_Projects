--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   11:16:29 08/10/2020
-- Design Name:   
-- Module Name:   C:/Users/TUTEL-50/Desktop/HW5/boron_de_sim.vhd
-- Project Name:  hw5
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: borondetopmodule
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
 
ENTITY boron_de_sim IS
END boron_de_sim;
 
ARCHITECTURE behavior OF boron_de_sim IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT borondetopmodule
    PORT(
         ciphertext : IN  std_logic_vector(63 downto 0);
         masterkey : IN  std_logic_vector(79 downto 0);
         clk : IN  std_logic;
         start : IN  std_logic;
         plaintext : OUT  std_logic_vector(63 downto 0)
        );
    END COMPONENT;
    

   --Inputs
   signal ciphertext : std_logic_vector(63 downto 0) := (others => '0');
   signal masterkey : std_logic_vector(79 downto 0) := (others => '0');
   signal clk : std_logic := '0';
   signal start : std_logic := '0';

 	--Outputs
   signal plaintext : std_logic_vector(63 downto 0);

   -- Clock period definitions
   constant clk_period : time := 10 ns;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: borondetopmodule PORT MAP (
          ciphertext => ciphertext,
          masterkey => masterkey,
          clk => clk,
          start => start,
          plaintext => plaintext
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
		ciphertext<=X"5A664928B961C619";
		masterkey<=X"f5e2526885779338555a";
		start<='1';

      -- insert stimulus here 

      wait;
   end process;

END;
