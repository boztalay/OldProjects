----------------------------------------------------------------------------------
-- Company: 
-- Engineer:       Ben Oztalay
-- 
-- Create Date:    17:18:34 07/30/2009 
-- Design Name: 
-- Module Name:    Comp_7segDecode - Behavioral 
-- Project Name:   7-segment decoder
-- Target Devices: 
-- Tool versions: 
-- Description:    A 7-segment decoder that takes a 4-bit number as its input and
--					    outputs the control lines to display the number in hexadecimal
--						 on a common anode 7-segment display.
-- Dependencies: 
--
-- Revision: 
-- Revision 0.01 - File Created
-- Revision 0.10 - First draft written
-- Revision 0.30 - UCF file written
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

entity Comp_7segDecode is
    Port ( number : in  STD_LOGIC_VECTOR (3 downto 0);
           segments : out  STD_LOGIC_VECTOR (6 downto 0));
end Comp_7segDecode;

architecture Behavioral of Comp_7segDecode is

begin

	with number select
	segments <=
		"1000000" when x"0",
		"1111001" when x"1",
		"0100100" when x"2",
		"0110000" when x"3",
		"0011001" when x"4",
		"0010010" when x"5",
		"0000010" when x"6",
		"1111000" when x"7",
		"0000000" when x"8",
		"0010000" when x"9",
		"0001000" when x"A",
		"0000011" when x"B",
		"1000110" when x"C",
		"0100001" when x"D",
		"0000110" when x"E",
		"0001110" when x"F",
		"0001110" when others;

end Behavioral;

