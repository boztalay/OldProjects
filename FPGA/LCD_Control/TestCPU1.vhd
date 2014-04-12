----------------------------------------------------------------------------------
-- Company: 
-- Engineer:       Ben Oztalay
-- 
-- Create Date:    16:54:53 10/01/2009 
-- Design Name: 
-- Module Name:    TestCPU1 - Behavioral 
-- Project Name:   Test CPU 1
-- Target Devices: 
-- Tool versions: 
-- Description:    A simple CPU I'm creating to get used to implementing processors
--						 in an FPGA with VHDL
-- Dependencies: 
--
-- Revision: 
-- Revision 0.01 - File Created
-- Revision 0.50 - All parts coded and simulated successfully
-- Revision 0.60 - All parts pieced together through port mapping, synthesis errors
--						 and meaningful warnings worked out.
-- Revision 1.00 - Many, many bugs worked out. The program counter was integrated with
--					    the control block to make sure there weren't two stages. Z-flag control
--                 was also moved to the control block. It's likely that I'll move it back
--                 to the ALU.
-- Additional Comments: 
--
----------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

---- Uncomment the following library declaration if instantiating
---- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity TestCPU1 is
	Port ( clock : in STD_LOGIC;
			 reset : in STD_LOGIC;
			 out_pins : out STD_LOGIC_VECTOR(31 downto 0);
			 reg_1 : out STD_LOGIC_VECTOR(15 downto 0);
			 reg_2 : out STD_LOGIC_VECTOR(15 downto 0);
			 reg_5 : out STD_LOGIC_VECTOR(15 downto 0));
end TestCPU1;

architecture Structural of TestCPU1 is

--//Component Declarations\\--

component TestCPU1_Cntl is
	Port ( clock : in STD_LOGIC;
			 reset : in STD_LOGIC;
			 main_bus : in STD_LOGIC_VECTOR(15 downto 0);
			 ALUB_out : out STD_LOGIC_VECTOR(15 downto 0);
			 ALU_op : out STD_LOGIC := '0';
			 ALU_to_bus_e : out STD_LOGIC;
			 opins_act : out STD_LOGIC;
			 RFile_ld_val : out STD_LOGIC;
			 RFile_ALUB_out : out STD_LOGIC;
			 RFile_src1_addr : out STD_LOGIC_VECTOR(2 downto 0);
			 RFile_src2_addr : out STD_LOGIC_VECTOR(2 downto 0);
			 RFile_dest_addr : out STD_LOGIC_VECTOR(2 downto 0);
			 instruction : in STD_LOGIC_VECTOR(15 downto 0);
			 program_count : out STD_LOGIC_VECTOR(10 downto 0));
end component;

component TestCPU1_ALU is
    Port ( clock : in STD_LOGIC;
			  reset : in STD_LOGIC;
			  operation : in  STD_LOGIC;
			  to_bus_e : in STD_LOGIC;
           A : in  STD_LOGIC_VECTOR (15 downto 0);
           B : in  STD_LOGIC_VECTOR (15 downto 0);
           result : out  STD_LOGIC_VECTOR (15 downto 0));
end component;

component TestCPU1_RegFile is
    Port ( clock : in  STD_LOGIC;
           reset : in  STD_LOGIC;
			  ld_val: in  STD_LOGIC;
			  ALUB_out : in STD_LOGIC;
			  src1_addr : in STD_LOGIC_VECTOR(2 downto 0);
			  src2_addr : in STD_LOGIC_VECTOR(2 downto 0);
			  dest_addr : in STD_LOGIC_VECTOR(2 downto 0);
			  data_to_load : in STD_LOGIC_VECTOR(15 downto 0);
			  to_ALUA_out : out STD_LOGIC_VECTOR(15 downto 0);
			  to_ALUB_out : out STD_LOGIC_VECTOR(15 downto 0);
			  data_collection_1 : out STD_LOGIC_VECTOR(15 downto 0)); --for test purposes only
end component;

component TestCPU1_OutPins is
    Port ( clock : in  STD_LOGIC;
           reset : in  STD_LOGIC;
			  act : in STD_LOGIC;
           data : in  STD_LOGIC_VECTOR (15 downto 0);
           output_pins : out  STD_LOGIC_VECTOR (31 downto 0));
end component;

component TestCPU1_iROM is
    Port ( addr : in  STD_LOGIC_VECTOR (10 downto 0);
           data_out : out  STD_LOGIC_VECTOR (15 downto 0));
end component;

--\\Component Declarations//--

--//Signal Declarations\\--

--Busses--

signal main_bus : STD_LOGIC_VECTOR(15 downto 0);
signal ALUA_bus : STD_LOGIC_VECTOR(15 downto 0);
signal ALUB_bus : STD_LOGIC_VECTOR(15 downto 0);
signal ALUB_from_cntl : STD_LOGIC_VECTOR(15 downto 0);
signal ALUB_from_rfile: STD_LOGIC_VECTOR(15 downto 0);
signal iRAM_addr : STD_LOGIC_VECTOR(10 downto 0);
signal instruction_bus : STD_LOGIC_VECTOR(15 downto 0);

--Control Signals--

signal ALU_op : STD_LOGIC;
signal ALU_to_bus_e : STD_LOGIC;
signal opins_act : STD_LOGIC;
signal RFile_ld_val : STD_LOGIC;
signal RFile_ALUB_out : STD_LOGIC;
signal RFile_src1_addr : STD_LOGIC_VECTOR(2 downto 0);
signal RFile_src2_addr : STD_LOGIC_VECTOR(2 downto 0);
signal RFile_dest_addr : STD_LOGIC_VECTOR(2 downto 0);

--\\Signal Declarations//--

begin

	Cntl: TestCPU1_Cntl port map (clock, reset, main_bus, ALUB_from_cntl,
											ALU_op, ALU_to_bus_e, opins_act, RFile_ld_val,
											RFile_ALUB_out, RFile_src1_addr, RFile_src2_addr,
											RFile_dest_addr, instruction_bus, iRAM_addr);
	ALU:  TestCPU1_ALU  port map (clock, reset, ALU_op, ALU_to_bus_e, ALUA_bus, ALUB_bus, main_bus);
	RegFile:  TestCPU1_RegFile port map (clock, reset, RFile_ld_val, RFile_ALUB_out, RFile_src1_addr,
													 RFile_src2_addr, RFile_dest_addr, main_bus, ALUA_bus,
													 ALUB_from_rfile, reg_1);
	Opins: TestCPU1_OutPins port map (clock, reset, opins_act, main_bus, out_pins);
	
	iROM: TestCPU1_iROM port map (iRAM_addr, instruction_bus);
	
	ALUB_bus <= (ALUB_from_cntl or ALUB_from_rfile);

end Structural;

