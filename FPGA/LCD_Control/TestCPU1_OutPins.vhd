----------------------------------------------------------------------------------
-- Company: 
-- Engineer:       Ben Oztalay
-- 
-- Create Date:    01:50:56 10/03/2009 
-- Design Name: 
-- Module Name:    TestCPU1_OutPins - Behavioral 
-- Project Name:   Test CPU 1
-- Target Devices: 
-- Tool versions: 
-- Description:    The output pin controller for Test CPU 1
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

entity TestCPU1_OutPins is
    Port ( clock : in  STD_LOGIC;
           reset : in  STD_LOGIC;
			  act : in STD_LOGIC;
           data : in  STD_LOGIC_VECTOR (15 downto 0);
           output_pins : out  STD_LOGIC_VECTOR (31 downto 0));
end TestCPU1_OutPins;

architecture Behavioral of TestCPU1_OutPins is

begin

	OutPins: process (clock, reset) is
		variable opin_reg: STD_LOGIC_VECTOR(31 downto 0) := (others => '0');
	begin
		if falling_edge(clock) then
			if reset = '1' then
				opin_reg := (others => '0');
			elsif act = '1' then
				opin_reg(conv_integer(unsigned(data(4 downto 0)))) := data(5);
			end if;
		output_pins <= opin_reg;
		end if;
	end process;
	
end Behavioral;

