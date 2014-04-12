----------------------------------------------------------------------------------
-- Company: 
-- Engineer:       Ben Oztalay
-- 
-- Create Date:    17:06:40 10/01/2009 
-- Design Name: 
-- Module Name:    TestCPU1_PC - Behavioral 
-- Project Name:   Test CPU 1
-- Target Devices: 
-- Tool versions: 
-- Description:    The program counter and related control logic for the Test CPU 1
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

entity TestCPU1_PC is
    Port ( clock : in STD_LOGIC;
			  reset : in STD_LOGIC;
			  take_alt_addr : in  STD_LOGIC;
           alt_addr : in  STD_LOGIC_VECTOR (15 downto 0);
           addr_out : out  STD_LOGIC_VECTOR (10 downto 0));
end TestCPU1_PC;

architecture Behavioral of TestCPU1_PC is

begin

	PC: process (clock, reset) is
		variable PC_reg : STD_LOGIC_VECTOR(10 downto 0) := b"00000000000";
	begin
		if rising_edge(clock) then
			if reset = '1' then
				PC_reg := b"00000000000";
			elsif take_alt_addr = '1' then
				PC_reg := alt_addr(10 downto 0);
			else
				PC_reg := PC_reg + 1;
			end if;
			addr_out <= PC_reg;
		end if;
	end process;
	
end Behavioral;

