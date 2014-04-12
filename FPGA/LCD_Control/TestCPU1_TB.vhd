--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   00:02:25 10/12/2009
-- Design Name:   
-- Module Name:   E:/FPGA/Projects/Current Projects/Systems/TestCPU1/TestCPU1_TB.vhd
-- Project Name:  TestCPU1
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: TestCPU1
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
 
ENTITY TestCPU1_TB IS
END TestCPU1_TB;
 
ARCHITECTURE behavior OF TestCPU1_TB IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT TestCPU1
    PORT( clock : in STD_LOGIC;
			 reset : in STD_LOGIC;
			 out_pins : out STD_LOGIC_VECTOR(31 downto 0);
			 reg_1 : out STD_LOGIC_VECTOR(15 downto 0); --everything below here is for simulation and testing
			 reg_2 : out STD_LOGIC_VECTOR(15 downto 0);
			 reg_3 : out STD_LOGIC_VECTOR(15 downto 0);
			 instruction : out STD_LOGIC_VECTOR(15 downto 0));
    END COMPONENT;
    

   --Inputs
   signal clock : std_logic := '0';
   signal reset : std_logic := '0';

 	--Outputs
   signal out_pins : std_logic_vector(31 downto 0);
   signal reg_1 : std_logic_vector(15 downto 0);
   signal reg_2 : std_logic_vector(15 downto 0);
   signal reg_3 : std_logic_vector(15 downto 0);
   signal instruction : std_logic_vector(15 downto 0);

   -- Clock period definitions
   constant clock_period : time := 10 ns;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: TestCPU1 PORT MAP (
          clock => clock,
          reset => reset,
          out_pins => out_pins,
          reg_1 => reg_1,
          reg_2 => reg_2,
          reg_3 => reg_3,
          instruction => instruction
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
		wait for 20 ns;
		reset <= '0';
		wait;
   end process;

END;
