----------------------------------------------------------------------------------
-- Company: 
-- Engineer:       Ben Oztalay
-- 
-- Create Date:    01:27:41 10/03/2009 
-- Design Name: 
-- Module Name:    TestCPU1_dRAM - Behavioral 
-- Project Name:   Test CPU 1
-- Target Devices: 
-- Tool versions: 
-- Description:    The data RAM for Test CPU 1
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

entity TestCPU1_dRAM is
    Port ( clock : in  STD_LOGIC;
           reset : in  STD_LOGIC;
           write_e : in  STD_LOGIC;
			  read_e : in STD_LOGIC;
           addr : in  STD_LOGIC_VECTOR(7 downto 0);
			  data_in : in STD_LOGIC_VECTOR(15 downto 0);
			  data_out : out STD_LOGIC_VECTOR(15 downto 0));
end TestCPU1_dRAM;

architecture Behavioral of TestCPU1_dRAM is

begin

	dRAM: process (clock, reset, read_e) is
		type dRAM_array is array (255 downto 0) of
			STD_LOGIC_VECTOR(15 downto 0);
		variable dRAM: dRAM_array := (others => b"0000000000000000");
	begin
		if falling_edge(clock) then
			if reset = '1' then
				dRAM := (others => b"0000000000000000");
			elsif write_e = '1' then
				dRAM(conv_integer(unsigned(addr))) := data_in;
			end if;
		end if;
		if read_e = '0' then
			data_out <= x"0000";
		else
			data_out <= dRAM(conv_integer(unsigned(addr)));
		end if;
	end process;

end Behavioral;

