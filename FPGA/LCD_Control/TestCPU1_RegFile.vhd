----------------------------------------------------------------------------------
-- Company: 
-- Engineer:       Ben Oztalay
-- 
-- Create Date:    00:57:43 10/03/2009 
-- Design Name: 
-- Module Name:    TestCPU1_RegFile - Behavioral 
-- Project Name:   Test CPU 1
-- Target Devices: 
-- Tool versions: 
-- Description:    The register file for Test CPU 1
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

entity TestCPU1_RegFile is
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
			  data_collection_1 : out STD_LOGIC_VECTOR(15 downto 0)); --
end TestCPU1_RegFile;

architecture Behavioral of TestCPU1_RegFile is

begin

	RegFile: process (clock, reset, ALUB_out, src1_addr, src2_addr) is
		type reg_array is array (7 downto 0) of
			STD_LOGIC_VECTOR(15 downto 0);
		variable reg_file: reg_array := (others => b"0000000000000000");
	begin
		if falling_edge(clock) then
			if reset = '1' then
				reg_file := (others => b"0000000000000000");
			elsif ((ld_val = '1') and (dest_addr /= b"000")) then
				reg_file(conv_integer(unsigned(dest_addr))) := data_to_load;
			end if;
		end if;
		if ALUB_out = '0' then
			to_ALUB_out <= x"0000";
		else
			to_ALUB_out <= reg_file(conv_integer(unsigned(src2_addr)));
		end if;
		to_ALUA_out <= reg_file(conv_integer(unsigned(src1_addr)));
		data_collection_1 <= reg_file(1);
	end process;

end Behavioral;

