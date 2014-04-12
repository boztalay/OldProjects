----------------------------------------------------------------------------------
-- Company: 
-- Engineer:       Ben Oztalay
-- 
-- Create Date:    16:57:25 10/01/2009 
-- Design Name: 
-- Module Name:    TestCPU1_ALU - Behavioral 
-- Project Name:   Test CPU 1
-- Target Devices: 
-- Tool versions: 
-- Description:    The ALU for Test CPU 1
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

entity TestCPU1_ALU is
    Port ( clock : in STD_LOGIC;
			  reset : in STD_LOGIC;
			  operation : in  STD_LOGIC;
			  to_bus_e : in STD_LOGIC;
           A : in  STD_LOGIC_VECTOR (15 downto 0);
           B : in  STD_LOGIC_VECTOR (15 downto 0);
           result : out  STD_LOGIC_VECTOR (15 downto 0));
end TestCPU1_ALU;

architecture Behavioral of TestCPU1_ALU is

signal z : STD_LOGIC;

begin

	result_gen: process (to_bus_e, operation, A, B) is
	begin
		if to_bus_e = '1' then
			if operation = '0' then
				result <= (A + B);
			else
				result <= (A - B);
			end if;
		else
			result <= x"0000";
		end if;
	end process;
	
end Behavioral;

