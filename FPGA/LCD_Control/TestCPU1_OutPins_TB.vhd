--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   01:28:08 10/04/2009
-- Design Name:   
-- Module Name:   C:/Users/Ben/Desktop/Folders/FPGA/Projects/Current Projects/Systems/TestCPU1/TestCPU1_OutPins_TB.vhd
-- Project Name:  TestCPU1
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: TestCPU1_OutPins
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
 
ENTITY TestCPU1_OutPins_TB IS
END TestCPU1_OutPins_TB;
 
ARCHITECTURE behavior OF TestCPU1_OutPins_TB IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT TestCPU1_OutPins
    PORT(
         clock : IN  std_logic;
         reset : IN  std_logic;
         act : IN  std_logic;
         data : IN  std_logic_vector(15 downto 0);
         output_pins : OUT  std_logic_vector(31 downto 0)
        );
    END COMPONENT;
    

   --Inputs
   signal clock : std_logic := '0';
   signal reset : std_logic := '0';
   signal act : std_logic := '0';
   signal data : std_logic_vector(15 downto 0) := (others => '0');

 	--Outputs
   signal output_pins : std_logic_vector(31 downto 0);

   -- Clock period definitions
   constant clock_period : time := 10 ns;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: TestCPU1_OutPins PORT MAP (
          clock => clock,
          reset => reset,
          act => act,
          data => data,
          output_pins => output_pins
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
			act <= '1';
			data <= "0000000000100001";
		wait for 10 ns;
			data <= "0000000000101101";
		wait for 10 ns;
			data <= "0000000000001101";
		wait for 10 ns;
			reset <= '1';
      wait;
   end process;

END;
