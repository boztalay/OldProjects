----------------------------------------------------------------------------------
-- Company: 
-- Engineer:       Ben Oztalay
-- 
-- Create Date:    16:37:34 07/30/2009 
-- Design Name: 
-- Module Name:    Comp_DecadeCnt4bit - Behavioral 
-- Project Name:   Decade Counter
-- Target Devices: 
-- Tool versions: 
-- Description:    A decade counter with synchronous reset.
--
-- Dependencies: 
--
-- Revision: 
-- Revision 0.01 - File Created
-- Revision 0.10 - First draft written
-- Revision 0.15 - Syntax errors fixed
-- Revision 0.30 - UCF File written
-- Revision 1.00 - Generated programming file with successful hardware test
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

entity Comp_DecadeCnt4bit is
    Port ( clock : in  STD_LOGIC;
           reset : in  STD_LOGIC;
           outputs : out  STD_LOGIC_VECTOR (3 downto 0));
end Comp_DecadeCnt4bit;

architecture Behavioral of Comp_DecadeCnt4bit is

begin

	main : process(clock, reset) is
		variable output_var : STD_LOGIC_VECTOR (3 downto 0) := b"0001";
	begin
		if falling_edge(clock) then
			case output_var is
				when b"0001" =>
					output_var := b"0010";
				when b"0010" =>
					output_var := b"0100";
				when b"0100" =>
					output_var := b"1000";
				when b"1000" =>
					output_var := b"0001";
				when others =>
					output_var := b"0001";
			end case;
			if reset = '1' then
				output_var := b"0001";
			end if;
		end if;
		outputs <= output_var;
	end process main;			

end Behavioral;

