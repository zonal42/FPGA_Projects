--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   12:42:04 10/16/2020
-- Design Name:   
-- Module Name:   C:/Users/zonal/Desktop/TUBITAKINT/Homeworks&Reports/HW6/HW6/alusim.vhd
-- Project Name:  HW6
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: alu_16_bit
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
 
ENTITY alusim IS
END alusim;
 
ARCHITECTURE behavior OF alusim IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT alu_16_bit
    PORT(
         sel : IN  std_logic_vector(3 downto 0);
         a : IN  std_logic_vector(15 downto 0);
         b : IN  std_logic_vector(15 downto 0);
         s : OUT  std_logic_vector(15 downto 0);
         cflag : OUT  std_logic;
         nflag : OUT  std_logic;
         oflag : OUT  std_logic;
         clk : IN  std_logic;
         zflag : OUT  std_logic;
         cout : OUT  std_logic
        );
    END COMPONENT;
    

   --Inputs
   signal sel : std_logic_vector(3 downto 0) := (others => '0');
   signal a : std_logic_vector(15 downto 0) := (others => '0');
   signal b : std_logic_vector(15 downto 0) := (others => '0');
   signal clk : std_logic := '0';

 	--Outputs
   signal s : std_logic_vector(15 downto 0);
   signal cflag : std_logic;
   signal nflag : std_logic;
   signal oflag : std_logic;
   signal zflag : std_logic;
   signal cout : std_logic;

   -- Clock period definitions
   constant clk_period : time := 10 ns;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: alu_16_bit PORT MAP (
          sel => sel,
          a => a,
          b => b,
          s => s,
          cflag => cflag,
          nflag => nflag,
          oflag => oflag,
          clk => clk,
          zflag => zflag,
          cout => cout
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
		b <= x"0101";
		a <= x"0111";
		sel <= "0000";
      wait for 100 ns;	
		sel <= "0010";
      wait for 100 ns;	
		sel <= "1000";
      wait for 100 ns;	
		sel <= "1010";
		wait for 100 ns;
		sel <= "0100";
		wait for 100 ns;
		b <= x"0101";
		a <= x"FFFF";
      wait for 100 ns;
		sel <= "0101";
		wait for 100 ns;
		a <= x"0101";
		b <= x"0FFF";
		wait for 100 ns;
		a <= x"0FFF";
		b <= x"0FFF";
		wait for 100 ns;
		sel <= "0100";
		a <= "0111111111111111";
		b <= "0111111111111111";
      wait for 1000 ns;		

      -- insert stimulus here 

      wait;
   end process;

END;
