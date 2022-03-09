--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   12:24:05 10/16/2020
-- Design Name:   
-- Module Name:   C:/Users/zonal/Desktop/TUBITAKINT/Homeworks&Reports/HW6/HW6/tp_simm.vhd
-- Project Name:  HW6
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: top_module
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
 
ENTITY tp_simm IS
END tp_simm;
 
ARCHITECTURE behavior OF tp_simm IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT top_module
    PORT(
         wrena : IN  std_logic;
         wdata : IN  std_logic_vector(15 downto 0);
         clk : IN  std_logic;
         sel : IN  std_logic_vector(3 downto 0);
         rw : IN  std_logic_vector(3 downto 0);
         ra : IN  std_logic_vector(3 downto 0);
         rb : IN  std_logic_vector(3 downto 0);
         sum_out : OUT  std_logic_vector(15 downto 0);
         carry : OUT  std_logic;
         negative : OUT  std_logic;
         oflow : OUT  std_logic;
         zero : OUT  std_logic
        );
    END COMPONENT;
    

   --Inputs
   signal wrena : std_logic := '0';
   signal wdata : std_logic_vector(15 downto 0) := (others => '0');
   signal clk : std_logic := '0';
   signal sel : std_logic_vector(3 downto 0) := (others => '0');
   signal rw : std_logic_vector(3 downto 0) := (others => '0');
   signal ra : std_logic_vector(3 downto 0) := (others => '0');
   signal rb : std_logic_vector(3 downto 0) := (others => '0');

 	--Outputs
   signal sum_out : std_logic_vector(15 downto 0);
   signal carry : std_logic;
   signal negative : std_logic;
   signal oflow : std_logic;
   signal zero : std_logic;

   -- Clock period definitions
   constant clk_period : time := 10 ns;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: top_module PORT MAP (
          wrena => wrena,
          wdata => wdata,
          clk => clk,
          sel => sel,
          rw => rw,
          ra => ra,
          rb => rb,
          sum_out => sum_out,
          carry => carry,
          negative => negative,
          oflow => oflow,
          zero => zero
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
	wdata<=X"55aa";
	rw<=X"0";
	wrena<='1';
	ra<=X"0";
	wait for clk_period;
	wrena<='0';
	wdata<=X"aa55";
	rw<=X"1";
	wrena<='1';
	rb<=X"1";
	wait for clk_period;
	wrena<='0';
	sel<="0000";
	rw<=X"2";
	wrena<='1';
			wait for clk_period;
	wrena<='0';
	ra<=X"1";
	rb<=X"2";
	rw<=X"3";
sel<="0010";
wrena<='1';
wait for clk_period;
	wrena<='0';
	ra<=X"2";
	rb<=X"3";
	rw<=X"4";
sel<="1000";
wrena<='1';
wait for clk_period;
	wrena<='0';
	ra<=X"3";
	rb<=X"4";
	rw<=X"5";
sel<="1010";
wrena<='1';
wait for clk_period;
	wrena<='0';
	ra<=X"4";
	rb<=X"5";
	rw<=X"6";
sel<="0100";
wrena<='1';
wait for clk_period;
	wrena<='0';
	ra<=X"5";
	rb<=X"6";
	rw<=X"7";
sel<="0101";
wrena<='1';
wait for clk_period;
	wrena<='0';
	ra<=X"7";
	rw<=X"8";
sel<="0111";
wrena<='1';
wait for clk_period;


      -- insert stimulus here 

      wait;
   end process;

END;
