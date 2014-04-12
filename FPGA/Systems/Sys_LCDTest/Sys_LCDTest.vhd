----------------------------------------------------------------------------------
-- Company: 
-- Engineer:       Ben Oztalay
-- 
-- Create Date:    23:02:09 04/12/2009 
-- Design Name: 
-- Module Name:    Sys_LCDTest - Behavioral 
-- Project Name:   LCD Test
-- Target Devices: 
-- Tool versions: 
-- Description:    An LCD test system
--
-- Dependencies:   Subsys_LCDDrive.vhd
--
-- Revision: 
-- Revision 0.01 - File Created
--			   0.10 - Successfully Displayed "BEN" on LCD
--				0.11 - Successfully Displayed "Cat rocks my socks!" on LCD
-- Additional Comments: 
--
----------------------------------------------------------------------------------

---------Begin-----------
--Frequency Divder Code--
---------Begin-----------

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity FrequencyDivider is
	 Port ( MainCLK : in  STD_LOGIC;
			  CLK1MHz : out STD_LOGIC);
end FrequencyDivider;

architecture Behavioral of FrequencyDivider is

begin

	main : process(MainCLK)
		variable cnt, cnt2 : integer := 0;
	begin
		if (MainCLK'event and MainCLK = '1') then
			cnt := cnt + 1;
			--Division for CLK1MHz
			if (cnt = 25) then
				CLK1MHz <= '1';
			end if;
			if (cnt = 50) then
				CLK1MHz <= '0';
				cnt := 0;
			end if;
		end if;
	end process;

end architecture Behavioral;

----------End------------
--Frequency Divder Code--
----------End------------

------Begin--------
--LCD Driver Code--
------Begin--------

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

library UNISIM;
use UNISIM.VComponents.all;

entity Sys_LCDTest is
    Port ( SysCLK : in STD_LOGIC;
		     RS : out STD_LOGIC := '0';
           RW : out STD_LOGIC;
           databus : out STD_LOGIC_VECTOR (7 downto 0);
           E : out STD_LOGIC := '0');
end Sys_LCDTest;

--Architecture Begin--

architecture Behavioral of Sys_LCDTest is

--\Signals/--

signal Buf_SysCLK  : STD_LOGIC;
signal Buf_CLK1MHz : STD_LOGIC;
signal Unbuf_CLK1MHz : STD_LOGIC;

--/Signals\--

--\Components/--

component FrequencyDivider is
	 Port ( MainCLK : in  STD_LOGIC;
			  CLK1MHz : out STD_LOGIC);
end component;

--/Components\--

--\Functions/--

function char2slv (char : in character) return STD_LOGIC_VECTOR is
		variable result : STD_LOGIC_VECTOR (7 downto 0);
	begin
		case (char) is
			when ' ' =>
				result := "00100000";
			when '!' =>
				result := "00100001";
			when '#' =>
				result := "00100011";
			when '$' =>
				result := "00100100";
			when '%' =>
				result := "00100101";
			when '&' =>
				result := "00100110";
			when ''' =>
				result := "00100111";
			when '(' =>
				result := "00101000";
			when ')' =>
				result := "00101001";
			when '*' =>
				result := "00101010";
			when '+' =>
				result := "00101011";
			when ',' =>
				result := "00101100";
			when '-' =>
				result := "00101101";
			when '.' =>
				result := "00101110";
			when '/' =>
				result := "00101111";
			when '0' =>
				result := "00110000";
			when '1' =>
				result := "00110001";
			when '2' =>
				result := "00110010";
			when '3' =>
				result := "00110011";
			when '4' =>
				result := "00110100";
			when '5' =>
				result := "00110101";
			when '6' =>
				result := "00110110";
			when '7' =>
				result := "00110111";
			when '8' =>
				result := "00111000";
			when '9' =>
				result := "00111001";
			when ':' =>
				result := "00111010";
			when ';' =>
				result := "00111011";
			when '<' =>
				result := "00111100";
			when '=' =>
				result := "00111101";
			when '>' =>
				result := "00111110";
			when '?' =>
				result := "00111111";
			when '@' =>
				result := "01000000";
			when 'A' =>
				result := "01000001";
			when 'B' =>
				result := "01000010";
			when 'C' =>
				result := "01000011";
			when 'D' =>
				result := "01000100";
			when 'E' =>
				result := "01000101";
			when 'F' =>
				result := "01000110";
			when 'G' =>
				result := "01000111";
			when 'H' =>
				result := "01001000";
			when 'I' =>
				result := "01001001";
			when 'J' =>
				result := "01001010";
			when 'K' =>
				result := "01001011";
			when 'L' =>
				result := "01001100";
			when 'M' =>
				result := "01001101";
			when 'N' =>
				result := "01001110";
			when 'O' =>
				result := "01001111";
			when 'P' =>
				result := "01010000";
			when 'Q' =>
				result := "01010001";
			when 'R' =>
				result := "01010010";
			when 'S' =>
				result := "01010011";
			when 'T' =>
				result := "01010100";
			when 'U' =>
				result := "01010101";
			when 'V' =>
				result := "01010110";
			when 'W' =>
				result := "01010111";
			when 'X' =>
				result := "01011000";
			when 'Y' =>
				result := "01011001";
			when 'Z' =>
				result := "01011010";
			when '[' =>
				result := "01011011";
			when ']' =>
				result := "01011101";
			when '^' =>
				result := "01011110";
			when '_' =>
				result := "01011111";
			when '`' =>
				result := "01100000";
			when 'a' =>
				result := "01100001";
			when 'b' =>
				result := "01100010";
			when 'c' =>
				result := "01100011";
			when 'd' =>
				result := "01100100";
			when 'e' =>
				result := "01100101";
			when 'f' =>
				result := "01100110";
			when 'g' =>
				result := "01100111";
			when 'h' =>
				result := "01101000";
			when 'i' =>
				result := "01101001";
			when 'j' =>
				result := "01101010";
			when 'k' =>
				result := "01101011";
			when 'l' =>
				result := "01101100";
			when 'm' =>
				result := "01101101";
			when 'n' =>
				result := "01101110";
			when 'o' =>
				result := "01101111";
			when 'p' =>
				result := "01110000";
			when 'q' =>
				result := "01110001";
			when 'r' =>
				result := "01110010";
			when 's' =>
				result := "01110011";
			when 't' =>
				result := "01110100";
			when 'u' =>
				result := "01110101";
			when 'v' =>
				result := "01110110";
			when 'w' =>
				result := "01110111";
			when 'x' =>
				result := "01111000";
			when 'y' =>
				result := "01111001";
			when 'z' =>
				result := "01111010";
			when '{' =>
				result := "01111011";
			when '|' =>
				result := "01111100";
			when '}' =>
				result := "01111101";
			when others =>
				result := "11110011";
		end case;
		
		return result;
end function char2slv;

--/Functions\--

begin

	--\BUFG Instantiations/--
	
	BUFG_BufSysCLK : BUFG
	port map (
		O => Buf_SysCLK,
		I => SysCLK
		);
		
	BUFG_BufCLK1MHz : BUFG
	port map (
		O => Buf_CLK1MHz,
		I => Unbuf_CLK1MHz
		);
		
	--/BUFG Instantiations\--
	
	G1: FrequencyDivider port map (Buf_SysCLK, Unbuf_CLK1MHz);

	main : process(Buf_CLK1MHz)
		subtype  LCDstring is string(1 to 12);
		subtype  short is integer range 0 to 13;
		variable count_us : integer := 0;
		variable index : short := 1;
		variable message : LCDstring := "Hzllo World!";
		variable wait_time : integer := 0;
		variable write_msg : boolean := false;
		constant begin_write_time : integer := 22000;
	begin
		if(Buf_CLK1MHz'event and Buf_CLK1MHz = '1') then
			count_us := count_us + 1;
		end if;
		
		--First part of startup sequence
		if (count_us >= 20000) then
			RS <= '0';
			RW <= '0';
			E <= '1';
			databus <= "00111000";
			if (count_us = 20050) then
				E <= '0';
			end if;
		end if;
		
		--Second part of startup sequence
		if (count_us >= 20100) then
			RS <= '0';
			RW <= '0';
			E <= '1';
			databus <= "00001111";
			if (count_us = 20150) then
				E <= '0';
			end if;
		end if;
		
		--Third part of startup sequence
		if (count_us >= 20200) then
			RS <= '0';
			RW <= '0';
			E <= '1';
			databus <= "00000001";
			if (count_us = 20250) then
				E <= '0';
			end if;
		end if;
		
		--Write message
		if (count_us >= begin_write_time) then
			RS <= '1';
			RW <= '0';
			E <= '1';
			databus <= char2slv(message(1));
			if((count_us = (begin_write_time + 50))) then
				E <= '0';
				wait_time := wait_time + 50;
				--index := index + 1;
			end if;
		end if;
		
		if (count_us >= begin_write_time + 100) then
			RS <= '1';
			RW <= '0';
			E <= '1';
			databus <= char2slv(message(2));
			if((count_us = (begin_write_time + 150))) then
				E <= '0';
				wait_time := wait_time + 50;
				--index := index + 1;
			end if;
		end if;
		
	
		end process;
		

end Behavioral;

-------End---------
--LCD Driver Code--
-------End---------
