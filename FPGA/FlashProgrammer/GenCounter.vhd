----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    14:39:09 11/26/2009 
-- Design Name: 
-- Module Name:    GenCounter - Behavioral 
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

entity GenCounter is
	 generic (size : integer);
    Port ( clock : in  STD_LOGIC;
           reset : in  STD_LOGIC;
           data_out : out  STD_LOGIC_VECTOR((size - 1) downto 0));
end GenCounter;

architecture Behavioral of GenCounter is

begin

	main: process(clock, reset) is
		variable count : STD_LOGIC_VECTOR((size - 1) downto 0) := (others => '0');
	begin
		if rising_edge(clock) then
				count := count + 1;
		end if;
		if reset = '1' then
			count := (others => '0');
		end if;
		data_out <= count;
	end process;

end Behavioral;

