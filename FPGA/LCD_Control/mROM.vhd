----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    13:06:19 10/24/2009 
-- Design Name: 
-- Module Name:    mROM - Behavioral 
-- Project Name: 
-- Target Devices: 
-- Tool versions: 
-- Description: 
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

entity mROM is
    Port ( enable : in  STD_LOGIC;
           address : in  STD_LOGIC_VECTOR (4 downto 0);
           data_out : out  STD_LOGIC_VECTOR (7 downto 0));
end mROM;

architecture Behavioral of mROM is

begin
	
	mROM: process (address) is
		type mROM_array is array (31 downto 0) of
			STD_LOGIC_VECTOR (7 downto 0);
		variable mROM: mROM_array := (0 => "00111000",
											   1 => "00001111",
												2 => "00000001",
												3 => "01001001", --'I'
												4 => "01110100", --'t'
												5 => "00100000", --' '
												6 => "01110111", --'w'
												7 => "01101111", --'o'
												8 => "01110010", --'r'
												9 => "01101011", --'k'
												10 => "01110011", --'s'
												11 => "00100001", --'!'
												12 => "00100000", --' '
												13 => "00111010", --':'
												14 => "01000100", --'D'
												others => "00000000"); --Ready to begin write cycles
												
	begin
			data_out <= mROM(conv_integer(unsigned(address)));
	end process;

end Behavioral;

