----------------------------------------------------------------------------------
-- Company:
-- Engineer:       Ben Oztalay
-- 
-- Create Date:    23:07:45 06/06/2009
-- Design Name:
-- Module Name:    Sys_KeyboardTest - Behavioral
-- Project Name:   Keyboard Test
-- Target Devices:
-- Tool versions:
-- Description:    A first-time attempt to interface a keyboard with the FPGA board.
--         The board will display the scan code in hexadecimal on two of the
--       7-segment displays.
-- Dependencies:
--
-- Revision:
-- Revision 0.01 - File Created
-- Revision 0.02 - Tested PS/2 port's data and clock lines while the keyboard is idle
--       - Result: Both are stable at high
-- Revision 0.10 - Was able to fill an 11-bit register with pieces of data from the keyboard
--                 and display the contents to LEDs on the board
--       - Note: Was only able to get proper scan codes after several keystrokes
-- Revision 0.50 - Selected and reversed the 8-bit scan code in the 11-bit piece of data
--                 (the scan code is sent LSB first)
--       - Displayed the scan code on the standard 8 LEDs on the board
--       - Added vailidity checking by checking the first and last bits to be both
--         0 and 1, respectively
--       - Added parity checking
--       - Note: I am still getting incorrect scan codes about every other keystroke.
--         How often a correct scan code is displayed changes with   the key.
--         Oddly enough, these incorrect codes are being received despite the
--         filtering of the data received, as described above
-- Revision 0.90 - After revising the parity calculations several times, I...
--			-Simply took out the parity checking
--			-And lowered bit_count's limit to 10; I had forgotten that it starts at 0!
--			-Then changed back to displaying the scan code in MSB order on the 8 LEDs
--				-I had changed it several times during experimentation
-- Revision 1.00 - Added capability to display the scan codes in hex on the 7-segment displays
--			-To do so, added a frequency divider to produce 500Hz and a 7-segment decoder
-- Revision 1.10 - Added capability to show scan code in binary on the LEDs again,as well as
--						 in hex on the displays
-- Additional Comments:
--
----------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

library UNISIM;
use UNISIM.VComponents.all;

entity Sys_KeyboardTest is
   Port ( KeyCLK   : in  STD_LOGIC;
          KeyData  : in  STD_LOGIC;
			 MainCLK  : in  STD_LOGIC;
			 Anodes   : out STD_LOGIC_VECTOR(3 downto 0);
			 Segments : out STD_LOGIC_VECTOR(6 downto 0);
			 Lights   : out STD_LOGIC_VECTOR(7 downto 0));
end Sys_KeyboardTest;

architecture Behavioral of Sys_KeyboardTest is

--\Signals/--

signal Buf_KeyCLK   : STD_LOGIC;
signal Buf_KeyData  : STD_LOGIC;
signal Buf_MainCLK  : STD_LOGIC;
signal CLK500Hz     : STD_LOGIC;
signal Buf_CLK500Hz : STD_LOGIC;
signal Dummy        : STD_LOGIC;
signal DecoderNum   : STD_LOGIC_VECTOR(3 downto 0);
signal ScanCode     : STD_LOGIC_VECTOR(7 downto 0);

--/Signals\--

--\Components/--

component Comp_FrequencyDivider is
    Port ( SysCLK : in   STD_LOGIC;
           out1   : out  STD_LOGIC;
           out2   : out  STD_LOGIC);
end component;

component Comp_7segDecoder is
    Port ( A   : in   STD_LOGIC_VECTOR (3 downto 0);
           seg : out  STD_LOGIC_VECTOR (6 downto 0));
end component;

--/Components\--

begin

--\BUFG Instantiations/--

	BUFG_BufKeyCLK : BUFG
	port map (
		O => Buf_KeyCLK,
		I => KeyCLK
		);
 
	BUFG_BufKeyData : BUFG
	port map (
		O => Buf_KeyData,
		I => KeyData
		);
		
	BUFG_BufCLK500Hz : BUFG
	port map (
		O => Buf_CLK500Hz,
		I => CLK500Hz
		);
		
	BUFG_BufMainCLK : BUFG
	port map (
		O => Buf_MainCLK,
		I => MainCLK
		);
 
--/BUFG Instantiations\--

	DispCLK: Comp_FrequencyDivider port map (Buf_MainCLK, Dummy, CLK500Hz);
	Decoder: Comp_7segDecoder port map (DecoderNum, Segments);

	main : process(Buf_KeyCLK, Buf_KeyData, ScanCode)
		variable bit_count : integer := 0;
		variable data_stor : STD_LOGIC_VECTOR(10 downto 0);
		variable started : boolean := false;
		variable parity_chk : STD_LOGIC := '0';
	begin
		if (Buf_KeyCLK'event and Buf_KeyCLK = '0') then --if the lines are idle and the clock drops
			if (started = false) then
				started := true;
			end if;
 
			if (started = true) then
				data_stor(bit_count) := Buf_KeyData; --grab the bit
				bit_count := (bit_count + 1); --increment the index
				if (bit_count > 10) then --if 11 bits have been sent, reset the counter
					bit_count := 0;
					if ((data_stor(0) = '0') and (data_stor(10) = '1')) then --check the first and last bits
							ScanCode <= data_stor(8 downto 1); --send the scan code for displaying
					end if;
					started := false; --mark the lines as idle
				end if;
			end if;
		end if;
	end process;
	
	disp : process(Buf_CLK500Hz, ScanCode)
		variable digit : STD_LOGIC := '0';
	begin
		if (Buf_CLK500Hz'event and Buf_CLK500Hz = '1') then
			if (digit = '0') then
				Anodes <= "1110";
				DecoderNum <= ScanCode(3 downto 0);
			end if;
			if (digit = '1') then
				Anodes <= "1101";
				DecoderNum <= ScanCode(7 downto 4);
			end if;
			digit := not digit;
		end if;
		
		Lights <= ScanCode;
	end process;
				
		

end Behavioral;