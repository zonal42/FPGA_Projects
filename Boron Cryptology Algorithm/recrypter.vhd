--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   16:43:45 08/11/2020
-- Design Name:   
-- Module Name:   C:/Users/TUTEL-50/Desktop/HW5/recrypter.vhd
-- Project Name:  hw5
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: boron_recrpyt
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
 
ENTITY recrypter IS
END recrypter;
 
ARCHITECTURE behavior OF recrypter IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT boron_recrpyt
    PORT(
         in_text : IN  std_logic_vector(63 downto 0);
         masterkey : IN  std_logic_vector(79 downto 0);
         start_encrypt : IN  std_logic;
         start_decrypt : IN  std_logic;
         clk : IN  std_logic;
         donee : OUT  std_logic;
         out_text : OUT  std_logic_vector(63 downto 0)
        );
    END COMPONENT;
    

   --Inputs
   signal in_text : std_logic_vector(63 downto 0) := (others => '0');
   signal masterkey : std_logic_vector(79 downto 0) := (others => '0');
   signal start_encrypt : std_logic := '0';
   signal start_decrypt : std_logic := '0';
   signal clk : std_logic := '0';

 	--Outputs
   signal donee : std_logic;
   signal out_text : std_logic_vector(63 downto 0);

   -- Clock period definitions
   constant clk_period : time := 10 ns;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: boron_recrpyt PORT MAP (
          in_text => in_text,
          masterkey => masterkey,
          start_encrypt => start_encrypt,
          start_decrypt => start_decrypt,
          clk => clk,
          donee => donee,
          out_text => out_text
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
		in_text<=X"0000000000000000";
		masterkey<=X"00000000000000000000";
		start_encrypt<='1';
		wait for 355 ns;
		start_encrypt<='0';
		start_decrypt<='1';
		wait for 265 ns;
		start_decrypt<='0';
      wait for clk_period*10;

      -- insert stimulus here 

      wait;
   end process;

END;
