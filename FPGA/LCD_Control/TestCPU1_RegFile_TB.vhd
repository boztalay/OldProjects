--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   01:08:51 10/04/2009
-- Design Name:   
-- Module Name:   C:/Users/Ben/Desktop/Folders/FPGA/Projects/Current Projects/Systems/TestCPU1/TestCPU1_RegFile_TB.vhd
-- Project Name:  TestCPU1
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: TestCPU1_RegFile
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
 
ENTITY TestCPU1_RegFile_TB IS
END TestCPU1_RegFile_TB;
 
ARCHITECTURE behavior OF TestCPU1_RegFile_TB IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT TestCPU1_RegFile
    PORT(
         clock : IN  std_logic;
         reset : IN  std_logic;
         ld_val : IN  std_logic;
         ALUB_out : IN  std_logic;
         src1_addr : IN  std_logic_vector(2 downto 0);
         src2_addr : IN  std_logic_vector(2 downto 0);
         dest_addr : IN  std_logic_vector(2 downto 0);
         data_to_load : IN  std_logic_vector(15 downto 0);
         to_ALUA_out : OUT  std_logic_vector(15 downto 0);
         to_ALUB_out : OUT  std_logic_vector(15 downto 0);
         data_collection_1 : out STD_LOGIC_VECTOR(15 downto 0); --for simulation purposes only
			data_collection_2 : out STD_LOGIC_VECTOR(15 downto 0); --
			data_collection_3 : out STD_LOGIC_VECTOR(15 downto 0)); --
    END COMPONENT;
    

   --Inputs
   signal clock : std_logic := '0';
   signal reset : std_logic := '0';
   signal ld_val : std_logic := '0';
   signal ALUB_out : std_logic := '0';
   signal src1_addr : std_logic_vector(2 downto 0) := (others => '0');
   signal src2_addr : std_logic_vector(2 downto 0) := (others => '0');
   signal dest_addr : std_logic_vector(2 downto 0) := (others => '0');
   signal data_to_load : std_logic_vector(15 downto 0) := (others => '0');

 	--Outputs
   signal to_ALUA_out : std_logic_vector(15 downto 0);
   signal to_ALUB_out : std_logic_vector(15 downto 0);
	signal data_collection_1 : STD_LOGIC_VECTOR(15 downto 0); --for simulation purposes only
	signal data_collection_2 : STD_LOGIC_VECTOR(15 downto 0); --
	signal data_collection_3 : STD_LOGIC_VECTOR(15 downto 0); --

   -- Clock period definitions
   constant clock_period : time := 10 ns;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: TestCPU1_RegFile PORT MAP (
          clock => clock,
          reset => reset,
          ld_val => ld_val,
          ALUB_out => ALUB_out,
          src1_addr => src1_addr,
          src2_addr => src2_addr,
          dest_addr => dest_addr,
          data_to_load => data_to_load,
          to_ALUA_out => to_ALUA_out,
          to_ALUB_out => to_ALUB_out,
			 data_collection_1 => data_collection_1,
			 data_collection_2 => data_collection_2,
			 data_collection_3 => data_collection_3
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
      wait for 15 ns;
			ld_val <= '1';
			dest_addr <= b"001";
			data_to_load <= x"0001";
		wait for 10 ns;
			dest_addr <= b"010";
			data_to_load <= x"0002";
		wait for 10 ns;
			dest_addr <= b"011";
			data_to_load <= x"0003";
		wait for 10 ns;
			ld_val <= '0';
			ALUB_out <= '1';
			src1_addr <= b"001";
		wait for 10 ns;
			src1_addr <= b"010";
			src2_addr <= b"011";
		wait for 10 ns;
			ALUB_out <= '0';
		wait for 10 ns;
			reset <= '1';
      wait;
   end process;

END;
