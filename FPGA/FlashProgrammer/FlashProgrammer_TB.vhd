--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   22:08:29 11/26/2009
-- Design Name:   
-- Module Name:   E:/FPGA/Projects/Current Projects/Subsystems/FlashProgrammer/FlashProgrammer_TB.vhd
-- Project Name:  FlashProgrammer
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: FlashProgrammer
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
USE ieee.std_logic_unsigned.all;
USE ieee.numeric_std.ALL;
 
ENTITY FlashProgrammer_TB IS
END FlashProgrammer_TB;
 
ARCHITECTURE behavior OF FlashProgrammer_TB IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT FlashProgrammer
    PORT(
         board_clk : IN  std_logic;
         start_button : IN  std_logic;
         flashSTS : IN  std_logic;
         flashWE : OUT  std_logic;
         flashOE : OUT  std_logic;
         flashCE : OUT  std_logic;
         flashADDR : OUT  std_logic_vector(22 downto 0);
         flashDATA : INOUT  std_logic_vector(15 downto 0);
         flashRP : OUT  std_logic;
         flashDATA_to_LEDs : OUT  std_logic_vector(6 downto 0);
         status_LED : OUT  std_logic
        );
    END COMPONENT;
    

   --Inputs
   signal board_clk : std_logic := '0';
   signal start_button : std_logic := '0';
   signal flashSTS : std_logic := '0';

	--BiDirs
   signal flashDATA : std_logic_vector(15 downto 0);

 	--Outputs
   signal flashWE : std_logic;
   signal flashOE : std_logic;
   signal flashCE : std_logic;
   signal flashADDR : std_logic_vector(22 downto 0);
   signal flashRP : std_logic;
   signal flashDATA_to_LEDs : std_logic_vector(6 downto 0);
   signal status_LED : std_logic;

   -- Clock period definitions
   constant board_clk_period : time := 20 ns;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: FlashProgrammer PORT MAP (
          board_clk => board_clk,
          start_button => start_button,
          flashSTS => flashSTS,
          flashWE => flashWE,
          flashOE => flashOE,
          flashCE => flashCE,
          flashADDR => flashADDR,
          flashDATA => flashDATA,
          flashRP => flashRP,
          flashDATA_to_LEDs => flashDATA_to_LEDs,
          status_LED => status_LED
        );

   -- Clock process definitions
   board_clk_process :process
   begin
		board_clk <= '0';
		wait for board_clk_period/2;
		board_clk <= '1';
		wait for board_clk_period/2;
   end process;
 

   -- Stimulus process
   stim_proc: process
   begin		
      wait for 5000 ns;
			start_button <= '1';
		wait for 8000 ns;
			start_button <= '0';
			flashSTS <= '0';
		wait for 4000 ns;
			flashSTS <= '1';
		wait;
   end process;

END;
