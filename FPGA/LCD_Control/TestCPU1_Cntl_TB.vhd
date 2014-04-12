--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   14:19:17 10/09/2009
-- Design Name:   
-- Module Name:   E:/FPGA/Projects/Current Projects/Systems/TestCPU1/TestCPU1_Cntl_TB.vhd
-- Project Name:  TestCPU1
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: TestCPU1_Cntl
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
 
ENTITY TestCPU1_Cntl_TB IS
END TestCPU1_Cntl_TB;
 
ARCHITECTURE behavior OF TestCPU1_Cntl_TB IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT TestCPU1_Cntl
    PORT(
         clock : IN  std_logic;
         Z_flag : IN  std_logic;
         instruction : IN  std_logic_vector(15 downto 0);
         ALUB_out : OUT  std_logic_vector(15 downto 0);
         addr_bus : OUT  std_logic_vector(7 downto 0);
         ALU_op : OUT  std_logic;
			ALU_to_bus_e : out STD_LOGIC;
         opins_act : OUT  std_logic;
         PC_take_alt_addr : OUT  std_logic;
         RFile_ld_val : OUT  std_logic;
         RFile_ALUB_out : OUT  std_logic;
         RFile_src1_addr : OUT  std_logic_vector(2 downto 0);
         RFile_src2_addr : OUT  std_logic_vector(2 downto 0);
         RFile_dest_addr : OUT  std_logic_vector(2 downto 0);
         dRAM_write_e : OUT  std_logic;
         dRAM_read_e : OUT  std_logic);
    END COMPONENT;
    

   --Inputs
   signal clock : std_logic := '0';
   signal Z_flag : std_logic := '0';
   signal instruction : std_logic_vector(15 downto 0) := (others => '0');

 	--Outputs
   signal ALUB_out : std_logic_vector(15 downto 0);
   signal addr_bus : std_logic_vector(7 downto 0);
   signal ALU_op : std_logic;
	signal ALU_to_bus_e : std_logic;
   signal opins_act : std_logic;
   signal PC_take_alt_addr : std_logic;
   signal RFile_ld_val : std_logic;
   signal RFile_ALUB_out : std_logic;
   signal RFile_src1_addr : std_logic_vector(2 downto 0);
   signal RFile_src2_addr : std_logic_vector(2 downto 0);
   signal RFile_dest_addr : std_logic_vector(2 downto 0);
   signal dRAM_write_e : std_logic;
   signal dRAM_read_e : std_logic;

   -- Clock period definitions
   constant clock_period : time := 10 ns;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: TestCPU1_Cntl PORT MAP (
          clock => clock,
          Z_flag => Z_flag,
          instruction => instruction,
          ALUB_out => ALUB_out,
          addr_bus => addr_bus,
          ALU_op => ALU_op,
			 ALU_to_bus_e => ALU_to_bus_e,
          opins_act => opins_act,
          PC_take_alt_addr => PC_take_alt_addr,
          RFile_ld_val => RFile_ld_val,
          RFile_ALUB_out => RFile_ALUB_out,
          RFile_src1_addr => RFile_src1_addr,
          RFile_src2_addr => RFile_src2_addr,
          RFile_dest_addr => RFile_dest_addr,
          dRAM_write_e => dRAM_write_e,
          dRAM_read_e => dRAM_read_e
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
      wait for 20 ns;
			instruction <= b"0000000101001100"; --add r1, r2, r3;
		wait for 10 ns;
			instruction <= b"0000100101001100"; --sub r1, r2, r3;
		wait for 10 ns;
			instruction <= b"0001100101000011"; --subi r1, r2, 3;
		wait for 10 ns;
			instruction <= b"0001000101000011"; --addi r1, r2, 3;
		wait for 10 ns;
			instruction <= b"0010000001001100"; --cp r2, r3;
		wait for 10 ns;
			instruction <= b"0100000000000111"; --bz r0, 7;
		wait for 10 ns;
			Z_flag <= '1';
		wait for 10 ns;
			Z_flag <= '0';
			instruction <= b"0100100000000111"; --jp 7;
		wait for 10 ns;
			instruction <= b"1000000000100001"; --opin 1, 1;
		wait for 10 ns;
			instruction <= b"1100000100000111"; --str r1, 7;
		wait for 10 ns;
			instruction <= b"1100100100000111"; --ld r1, 7;
      wait;
   end process;

END;
