--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   13:53:40 07/08/2010
-- Design Name:   
-- Module Name:   C:/Users/georgecuris/Desktop/Folders/FPGA/Projects/Current Projects/Systems/Tests/SM_mem_init_test_TB.vhd
-- Project Name:  Tests
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: SM_mem_init_test
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
 
ENTITY SM_mem_init_test_TB IS
END SM_mem_init_test_TB;
 
ARCHITECTURE behavior OF SM_mem_init_test_TB IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT SM_mem_init_test
    PORT(
         clock : IN  std_logic;
         reset : IN  std_logic;
         SM_reset : OUT  std_logic;
         RAM_ce : OUT  std_logic;
         RAM_oe : OUT  std_logic;
         RAM_we : OUT  std_logic;
         RAM_adv : OUT  std_logic;
         RAM_clk : OUT  std_logic;
         RAM_lb : OUT  std_logic;
         RAM_ub : OUT  std_logic;
         RAM_cre : OUT  std_logic;
         RAM_wait : IN  std_logic;
         memory_data_bus : OUT  std_logic_vector(15 downto 0);
         memory_address_bus : OUT  std_logic_vector(22 downto 0)
        );
    END COMPONENT;
    

   --Inputs
   signal clock : std_logic := '0';
   signal reset : std_logic := '0';
   signal RAM_wait : std_logic := '0';

 	--Outputs
   signal SM_reset : std_logic;
   signal RAM_ce : std_logic;
   signal RAM_oe : std_logic;
   signal RAM_we : std_logic;
   signal RAM_adv : std_logic;
   signal RAM_clk : std_logic;
   signal RAM_lb : std_logic;
   signal RAM_ub : std_logic;
   signal RAM_cre : std_logic;
   signal memory_data_bus : std_logic_vector(15 downto 0);
   signal memory_address_bus : std_logic_vector(22 downto 0);

   -- Clock period definitions
   constant clock_period : time := 20 ns;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: SM_mem_init_test PORT MAP (
          clock => clock,
          reset => reset,
          SM_reset => SM_reset,
          RAM_ce => RAM_ce,
          RAM_oe => RAM_oe,
          RAM_we => RAM_we,
          RAM_adv => RAM_adv,
          RAM_clk => RAM_clk,
          RAM_lb => RAM_lb,
          RAM_ub => RAM_ub,
          RAM_cre => RAM_cre,
          RAM_wait => RAM_wait,
          memory_data_bus => memory_data_bus,
          memory_address_bus => memory_address_bus
        );

   -- Clock process definitions
   clock_process :process
   begin
		clock <= '1';
		wait for clock_period/2;
		clock <= '0';
		wait for clock_period/2;
   end process; 

   -- Stimulus process
   stim_proc: process
   begin		
			reset <= '1';
		wait for 200 ns;
			reset <= '0';
			RAM_wait <= '1';
			

      wait;
   end process;

END;
