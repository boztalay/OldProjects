----------------------------------------------------------------------------------
-- Company:   
-- Engineer:       Ben Oztalay
-- 
-- Create Date:    22:15:19 04/10/2009 
-- Design Name: 
-- Module Name:    Comp_DivideBy50Mil - Behavioral 
-- Project Name:   Frequency Divider
-- Target Devices: 
-- Tool versions: 
-- Description:    A frequency divider for use by a digital clock. Takes the Nexys 2 50Mhz clock
--                 and produces a 1Hz clock and 500Hz clock.
-- Dependencies:   None
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

entity Comp_FrequencyDivider is
    Port ( SysCLK : in   STD_LOGIC;
           out1   : out  STD_LOGIC;
           out2   : out  STD_LOGIC);
end Comp_FrequencyDivider;

architecture Behavioral of Comp_FrequencyDivider is

signal cntr  : STD_LOGIC_VECTOR (25 downto 0);
signal cntr2 : STD_LOGIC_VECTOR (16 downto 0);

begin

process (SysCLK)
begin

if SysCLK'event and SysCLK = '0' then
	cntr <= cntr + 1;
	if cntr = "01011111010111100001000000" then
		out1 <= '1';
		end if;
	if cntr = "10111110101111000010000000" then
		out1 <= '0';
		cntr <= "00000000000000000000000000";
		end if;
end if;

if SysCLK'event and SysCLK = '0' then
	cntr2 <= cntr2 + 1;
	if cntr2 = "01100001101010000" then
		out2 <= '1';
		end if;
	if cntr2 = "11000011010100000" then
		out2 <= '0';
		cntr2 <= "00000000000000000";
		end if;
end if;

end process;

end Behavioral;

