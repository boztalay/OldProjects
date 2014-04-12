--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   01:52:53 10/04/2009
-- Design Name:   
-- Module Name:   C:/Users/Ben/Desktop/Folders/FPGA/Projects/Current Projects/Systems/TestCPU1/TestCPU1_iROM_TB.vhd
-- Project Name:  TestCPU1
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: TestCPU1_iROM
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
 
ENTITY TestCPU1_iROM_TB IS
END TestCPU1_iROM_TB;
 
ARCHITECTURE behavior OF TestCPU1_iROM_TB IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT TestCPU1_iROM
    PORT(
         addr : IN  std_logic_vector(10 downto 0);
         data_out : OUT  std_logic_vector(15 downto 0)
        );
    END COMPONENT;
    

   --Inputs
   signal addr : std_logic_vector(10 downto 0) := (others => '0');

 	--Outputs
   signal data_out : std_logic_vector(15 downto 0);
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: TestCPU1_iROM PORT MAP (
          addr => addr,
          data_out => data_out
        );
 

   -- Stimulus process
   stim_proc: process
   begin		
			addr <= b"00000000000";
		wait for 10 ns;
			addr <= b"00000000001";
		wait for 10 ns;
			addr <= b"00000000010";
      wait;
   end process;

END;
