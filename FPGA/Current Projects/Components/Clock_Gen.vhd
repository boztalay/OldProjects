----------------------------------------------------------------------------------
-- Company: 
-- Engineer:       Ben Oztalay
-- 
-- Create Date:    01:50:30 10/15/2009 
-- Design Name: 
-- Module Name:    Clock_Gen - Behavioral 
-- Project Name: 
-- Target Devices: 
-- Tool versions: 
-- Description:    A clock generator, built for dividing the 50 MHz board clock
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

entity Clock_Gen is
    Port ( Board_Clock : in  STD_LOGIC;
           Sys_Clock : out  STD_LOGIC);
end Clock_Gen;

architecture Behavioral of Clock_Gen is

begin

	main: process(Board_Clock) is
		constant hertz  : integer := 100000;
		constant cycles : integer := (25_000_000/hertz);
		variable count  : integer := 0;
		variable output : STD_LOGIC := '0';
	begin
		if rising_edge(Board_Clock) then
			count := count + 1;
			if count > cycles then
				count := 0;
				output := not output;
			end if;
		end if;
		Sys_Clock <= output;
	end process main;
		

end Behavioral;

