--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   11:02:32 10/20/2009
-- Design Name:   
-- Module Name:   E:/FPGA/Projects/Current Projects/Systems/TestCPU1/TestCPU1_SynthBench_TB.vhd
-- Project Name:  TestCPU1
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: TestCPU1_SynthBench
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
 
ENTITY TestCPU1_SynthBench_TB IS
END TestCPU1_SynthBench_TB;
 
ARCHITECTURE behavior OF TestCPU1_SynthBench_TB IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
   component TestCPU1_SynthBench is
	Port ( board_clk : in STD_LOGIC;
			 anodes : out STD_LOGIC_VECTOR(3 downto 0);
			 out_pins : out STD_LOGIC_VECTOR(31 downto 0);
			 LCD_DB : out STD_LOGIC_VECTOR(7 downto 0);
			 r2 : out STD_LOGIC_VECTOR(15 downto 0);
			 r5 : out STD_LOGIC_VECTOR(15 downto 0);
			 CPU_clk : out STD_LOGIC);
	end component;
    

   --Inputs
   signal board_clk : std_logic := '0';

 	--Outputs
   signal out_pins : std_logic_vector(31 downto 0);
	signal LCD_DB : STD_LOGIC_VECTOR(7 downto 0);
	signal r2 : STD_LOGIC_VECTOR(15 downto 0);
	signal r5 : STD_LOGIC_VECTOR(15 downto 0);
	signal CPU_clk : STD_LOGIC;

   -- Clock period definitions
   constant board_clk_period : time := 20 ns;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: TestCPU1_SynthBench PORT MAP (
          board_clk => board_clk,
          out_pins => out_pins,
			 LCD_DB => LCD_DB,
			 r2 => r2,
			 r5 => r5,
			 CPU_clk => CPU_clk
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
      wait;
   end process;

END;
