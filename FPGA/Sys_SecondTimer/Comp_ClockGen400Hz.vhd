----------------------------------------------------------------------------------
-- Company: 
-- Engineer:       Ben Oztalay
-- 
-- Create Date:    14:57:12 07/30/2009 
-- Design Name: 
-- Module Name:    Comp_ClockGen - Behavioral 
-- Project Name:   Clock Generator
-- Target Devices: 
-- Tool versions: 
-- Description:    A device that generates a buffered clock signal in refernce to
--						 a 50 MHz outside clock. The output can be reconfigured through
--						 software to generate a different frequency.
-- Dependencies: 
--
-- Revision: 
-- Revision 0.01 - File Created
-- Revision 0.10 - First draft written
-- Revision 0.15 - Sytax errors fixed
-- Revision 0.30 - UCF File written
-- Revision 1.00 - Generated programming file with a successful hardware test
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

entity Comp_ClockGen400Hz is
    Port ( Board_Clk : in  STD_LOGIC;
           Clock_Out : out  STD_LOGIC);
end Comp_ClockGen400Hz;

architecture Behavioral of Comp_ClockGen400Hz is

begin
	
	main : process(Board_Clk) is
		constant hertz  : integer := 400;
		constant cycles : integer := (25_000_000/hertz);
		variable count  : integer := 0;
		variable output : STD_LOGIC := '0';
	begin
		if rising_edge(Board_Clk) then
			count := count + 1;
			if count > cycles then
				count := 0;
				output := not output;
			end if;
		end if;
		Clock_Out <= output;
	end process main;
	
end Behavioral;

