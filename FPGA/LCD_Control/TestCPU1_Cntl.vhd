----------------------------------------------------------------------------------
-- Company: 
-- Engineer:       Ben Oztalay
-- 
-- Create Date:    23:42:02 10/08/2009 
-- Design Name: 
-- Module Name:    TestCPU1_Cntl - Behavioral 
-- Project Name:   Test CPU 1
-- Target Devices: 
-- Tool versions: 
-- Description:    The instruction decoder and control block for Test CPU 1
--
-- Dependencies: 
--
-- Revision: 
-- Revision 0.01 - File Created
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

entity TestCPU1_Cntl is
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
end TestCPU1_Cntl;

architecture Behavioral of TestCPU1_Cntl is

signal PC_take_alt_addr : STD_LOGIC;
signal PC_alt_addr : STD_LOGIC_VECTOR(10 downto 0);

signal zero : STD_LOGIC;

begin

	Cntl: process (clock, reset, instruction, zero) is
	begin
		ALUB_out <= x"0000";
		ALU_op <= '0';
		ALU_to_bus_e <= '0';
		opins_act <= '0';
		PC_take_alt_addr <= '0';
		PC_alt_addr <= b"00000000000";
		RFile_ld_val <= '0';
		RFile_ALUB_out <= '0';
		RFile_src1_addr <= b"000";
		RFile_src2_addr <= b"000";
		RFile_dest_addr <= b"000";
		
		case instruction(15 downto 11) is --I know it's shameful to implement the decoder like this, but I tried the
			when "00000" =>					 --more efficient way, then added on, etc, and it got too complex, so I started
				ALU_to_bus_e <= '1';        --over. I'll probably re-do this sometime soon.
				RFile_ld_val <= '1';
				RFile_ALUB_out <= '1';
				RFile_dest_addr <= instruction(10 downto 8);
				RFile_src1_addr <= instruction(7 downto 5);
				RFile_src2_addr <= instruction(4 downto 2);
			when "00001" =>
				ALU_op <= '1';
				ALU_to_bus_e <= '1';
				RFile_ld_val <= '1';
				RFile_ALUB_out <= '1';
				RFile_dest_addr <= instruction(10 downto 8);
				RFile_src1_addr <= instruction(7 downto 5);
				RFile_src2_addr <= instruction(4 downto 2);
			when "00010" =>
				ALU_to_bus_e <= '1';
				RFile_ld_val <= '1';
				RFile_dest_addr <= instruction(10 downto 8);
				RFile_src1_addr <= instruction(7 downto 5);
				ALUB_out <= b"00000000000" & instruction(4 downto 0);
			when "00011" =>
				ALU_op <= '1';
				ALU_to_bus_e <= '1';
				RFile_ld_val <= '1';
				RFile_dest_addr <= instruction(10 downto 8);
				RFile_src1_addr <= instruction(7 downto 5);
				ALUB_out <= b"00000000000" & instruction(4 downto 0);
			when "00100" =>
				ALU_op <= '1';
				ALU_to_bus_e <= '1';
				RFile_ALUB_out <= '1';
				RFile_dest_addr <= instruction(10 downto 8);
				RFile_src1_addr <= instruction(7 downto 5);
				RFile_src2_addr <= instruction(4 downto 2);
			when "01000" =>
				if zero = '1' then
					PC_take_alt_addr <= '1';
					PC_alt_addr <= b"000" & instruction(7 downto 0);
				end if;
			when "01001" =>
				PC_take_alt_addr <= '1';
				PC_alt_addr <= instruction(10 downto 0);
			when "10000" =>
				ALU_to_bus_e <= '1';
				RFile_src1_addr <= b"000";
				opins_act <= '1';
				ALUB_out <= b"00000" & instruction(10 downto 0);
			when others =>
				null; --do nothing
		end case;					
			
	end process;
		
	PC: process (clock, reset) is
		variable PC_reg : STD_LOGIC_VECTOR(10 downto 0) := b"00000000000";
	begin
		if rising_edge(clock) then
			if reset = '1' then
				PC_reg := b"00000000000";
			elsif PC_take_alt_addr = '1' then
				PC_reg := PC_alt_addr;
			else
				PC_reg := PC_reg + 1;
			end if;
		end if;
		program_count <= PC_reg(10 downto 0);
	end process;
	
	zflag: process(clock, reset) is
		variable z_reg : STD_LOGIC;
	begin
		if rising_edge(clock) then
			if main_bus = x"0000" then
				z_reg := '1';
			else
				z_reg := '0';
			end if;
		end if;
		zero <= z_reg;
	end process;
	
end Behavioral;

