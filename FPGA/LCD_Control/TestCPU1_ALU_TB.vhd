--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   19:13:11 10/03/2009
-- Design Name:   
-- Module Name:   C:/Users/Ben/Desktop/Folders/FPGA/Projects/Current Projects/Systems/TestCPU1/TestCPU1_ALU_TB.vhd
-- Project Name:  TestCPU1
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: TestCPU1_ALU
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
 
ENTITY TestCPU1_ALU_TB IS
END TestCPU1_ALU_TB;
 
ARCHITECTURE behavior OF TestCPU1_ALU_TB IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT TestCPU1_ALU
    PORT(
         operation : IN  std_logic;
         to_bus_e : IN  std_logic;
         A : IN  std_logic_vector(15 downto 0);
         B : IN  std_logic_vector(15 downto 0);
         result : OUT  std_logic_vector(15 downto 0);
         z_flag : OUT  std_logic
        );
    END COMPONENT;
    

   --Inputs
   signal operation : std_logic := '0';
   signal to_bus_e : std_logic := '0';
   signal A : std_logic_vector(15 downto 0) := (others => '0');
   signal B : std_logic_vector(15 downto 0) := (others => '0');

 	--Outputs
   signal result : std_logic_vector(15 downto 0);
   signal z_flag : std_logic;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: TestCPU1_ALU PORT MAP (
          operation => operation,
          to_bus_e => to_bus_e,
          A => A,
          B => B,
          result => result,
          z_flag => z_flag
        ); 

   -- Stimulus process
   stim_proc: process
   begin		
      wait for 20 ns;
			A <= x"0003";
			B <= x"0001";
			operation <= '1';
			to_bus_e <= '1';
		wait for 10 ns;
			operation <= '0';
		wait for 10 ns;
			B <= x"0003";
			operation <= '1';
		wait for 10 ns;
			to_bus_e <= '0';
      wait;
   end process;

END;
