--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   00:56:34 10/04/2009
-- Design Name:   
-- Module Name:   C:/Users/Ben/Desktop/Folders/FPGA/Projects/Current Projects/Systems/TestCPU1/TestCPU1_PC_TB.vhd
-- Project Name:  TestCPU1
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: TestCPU1_PC
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
 
ENTITY TestCPU1_PC_TB IS
END TestCPU1_PC_TB;
 
ARCHITECTURE behavior OF TestCPU1_PC_TB IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT TestCPU1_PC
    PORT(
         clock : IN  std_logic;
         reset : IN  std_logic;
         take_alt_addr : IN  std_logic;
         alt_addr : IN  std_logic_vector(15 downto 0);
         addr_out : OUT  std_logic_vector(10 downto 0)
        );
    END COMPONENT;
    

   --Inputs
   signal clock : std_logic := '0';
   signal reset : std_logic := '0';
   signal take_alt_addr : std_logic := '0';
   signal alt_addr : std_logic_vector(15 downto 0) := (others => '0');

 	--Outputs
   signal addr_out : std_logic_vector(10 downto 0);

   -- Clock period definitions
   constant clock_period : time := 10 ns;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: TestCPU1_PC PORT MAP (
          clock => clock,
          reset => reset,
          take_alt_addr => take_alt_addr,
          alt_addr => alt_addr,
          addr_out => addr_out
        );

   -- Clock process definitions
   clock_process: process
   begin
		clock <= '0';
		wait for clock_period/2;
		clock <= '1';
		wait for clock_period/2;
   end process;
 

   -- Stimulus process
   stim_proc: process
   begin		
      wait for 50 ns;
			reset <= '1';
		wait for 10 ns;
			reset <= '0';
			alt_addr <= x"0003";
			take_alt_addr <= '1';
		wait for 10 ns;
			take_alt_addr <= '0';
      wait;
   end process;

END;
