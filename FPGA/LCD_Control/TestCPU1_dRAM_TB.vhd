--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   02:14:07 10/04/2009
-- Design Name:   
-- Module Name:   C:/Users/Ben/Desktop/Folders/FPGA/Projects/Current Projects/Systems/TestCPU1/TestCPU1_dRAM_TB.vhd
-- Project Name:  TestCPU1
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: TestCPU1_dRAM
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
 
ENTITY TestCPU1_dRAM_TB IS
END TestCPU1_dRAM_TB;
 
ARCHITECTURE behavior OF TestCPU1_dRAM_TB IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT TestCPU1_dRAM
    PORT(
         clock : IN  std_logic;
         reset : IN  std_logic;
         write_e : IN  std_logic;
         read_e : IN  std_logic;
         addr : IN  std_logic_vector(7 downto 0);
         data : IN  std_logic_vector(15 downto 0);
         to_reg_file : OUT  std_logic_vector(15 downto 0)
        );
    END COMPONENT;
    

   --Inputs
   signal clock : std_logic := '0';
   signal reset : std_logic := '0';
   signal write_e : std_logic := '0';
   signal read_e : std_logic := '0';
   signal addr : std_logic_vector(7 downto 0) := (others => '0');
   signal data : std_logic_vector(15 downto 0) := (others => '0');

 	--Outputs
   signal to_reg_file : std_logic_vector(15 downto 0);

   -- Clock period definitions
   constant clock_period : time := 10 ns;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: TestCPU1_dRAM PORT MAP (
          clock => clock,
          reset => reset,
          write_e => write_e,
          read_e => read_e,
          addr => addr,
          data => data,
          to_reg_file => to_reg_file
        );

   -- Clock process definitions
   clock_process :process
   begin
		clock <= '0';
		wait for clock_period/2;
		clock <= '1';
		wait for clock_period/2;
   end process;
 

   -- Stimulus process
   stim_proc: process
   begin		
      wait for 20 ns;
			write_e <= '1';
			addr <= x"01";
			data <= x"0001";
		wait for 10 ns;
			addr <= x"02";
			data <= x"0002";
		wait for 10 ns;
			write_e <= '0';
			read_e <= '1';
		wait for 10 ns;
			addr <= x"01";
		wait for 10 ns;
			reset <= '1';
		wait for 10 ns;	
			reset <= '0';
			read_e <= '0';
      wait;
   end process;

END;
