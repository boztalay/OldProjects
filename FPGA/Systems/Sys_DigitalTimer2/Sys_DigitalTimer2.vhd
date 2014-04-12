----------------------------------------------------------------------------------
-- Company: 
-- Engineer:       Ben Oztalay
-- 
-- Create Date:    23:31:37 04/11/2009 
-- Design Name: 
-- Module Name:    Sys_DigitalTimer2 - Behavioral 
-- Project Name:   Digital Timer
-- Target Devices: 
-- Tool versions: 
-- Description:    A digital miute timer. Starts at 00:00, goes to 99:59. Resetable.
--
-- Dependencies: 
--
-- Revision: 
-- Revision 0.01 - File Created
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
	 Port ( SysCLK   : in  STD_LOGIC;
	        Reset    : in  STD_LOGIC;
	        CLK1Hz   : out STD_LOGIC;
			  CLK400Hz : out STD_LOGIC);
end FrequencyDivider;

architecture Behavioral of FrequencyDivider is

begin

	main : process(SysCLK)
		variable cnt1, cnt2 : integer := 0;
	begin
		if (SysCLK'event and SysCLK = '1') then
		   if (Reset = '1') then
				cnt1 := 0;
			else
				cnt1 := cnt1 + 1;
			end if;
			cnt2 := cnt2 + 1;
			if (cnt1 = 25000000) then
				CLK1Hz <= '1';
			end if;
			if (cnt2 = 62500) then
				CLK400Hz <= '1';
			end if;
			if (cnt1 = 50000000) then
				CLK1Hz <= '0';
				cnt1 := 0;
			end if;
			if (cnt2 = 125000) then
				CLK400Hz <= '0';
				cnt2 := 0;
			end if;
		end if;
	end process;

end architecture Behavioral;

----------End------------
--Frequency Divder Code--
----------End------------

----------------------------------------------------------------------------------

--------Begin---------
--Digital Timer Code--
--------Begin---------

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

---- Uncomment the following library declaration if instantiating
---- any Xilinx primitives in this code.
library UNISIM;
use UNISIM.VComponents.all;

entity Sys_DigitalTimer2 is
    Port ( SysCLK   : in  STD_LOGIC;
	        Reset    : in  STD_LOGIC;
           segs     : out STD_LOGIC_VECTOR (6 downto 0);
           anodes   : out STD_LOGIC_VECTOR (3 downto 0));
end Sys_DigitalTimer2;

--Architecture--
architecture Behavioral of Sys_DigitalTimer2 is

--\Components/--

component FrequencyDivider is
	 Port ( SysCLK   : in  STD_LOGIC;
	        Reset    : in  STD_LOGIC;
	        CLK1Hz   : out STD_LOGIC;
			  CLK400Hz : out STD_LOGIC);
end component;

--/Components\--

--\Signals/--

signal Buf_CLK : STD_LOGIC;
signal CLK1   : STD_LOGIC;
signal CLK400 : STD_LOGIC;
signal Buf_CLK1   : STD_LOGIC;
signal Buf_CLK400 : STD_LOGIC;
signal dig1s  : STD_LOGIC_VECTOR (3 downto 0);
signal dig2s  : STD_LOGIC_VECTOR (3 downto 0);
signal dig3s  : STD_LOGIC_VECTOR (3 downto 0);
signal dig4s  : STD_LOGIC_VECTOR (3 downto 0);

--/Signals\--

--Architecture Begin--

begin

	--\BUFG Instantiations-/--
	BUFG_BufCLK : BUFG
	port map (
		O => Buf_CLK,
		I => SysCLK
		);
		
	BUFG_CLK1 : BUFG
	port map (
		O => Buf_CLK1,
		I => CLK1
		);
		
	BUFG_CLK400 : BUFG
	port map (
		O => Buf_CLK400,
		I => CLK400
		);		
	--/BUFG Instantiations\--

	G1: FrequencyDivider port map (Buf_CLK, Reset, CLK1, CLK400);
	
	main : process(Reset, Buf_CLK1)
		variable dig1, dig2, dig3, dig4 : STD_LOGIC_VECTOR (3 downto 0);
		variable cnt, count : integer := 1;
	begin
		--First Digit Incriment
		if (Buf_CLK1'event and Buf_CLK1 = '1') then
			dig1 := dig1 + 1;
			if (dig1 > 9) then
				dig1 := "0000";
				dig2 := dig2 + 1;
				if (dig2 > 5) then
					dig2 := "0000";
					dig3 := dig3 + 1;
					if (dig3 > 9) then
						dig3 := "0000";
						dig4 := dig4 + 1;
						if (dig4 > 9) then
							dig4 := "0000";
						end if;
					end if;
				end if;
			end if;
		end if;
		
		if (Reset = '1') then
			dig1 := "0000";
			dig2 := "0000";
			dig3 := "0000";
			dig4 := "0000";
		end if;
		
		dig1s <= dig1;
		dig2s <= dig2;
		dig3s <= dig3;
		dig4s <= dig4;		
		
	end process;
	
	--Displays the digits

	display : process(Buf_CLK400)
		variable cnt, count : integer := 1;
	begin
	if (Buf_CLK400'event and Buf_CLK400 = '1') then
		
		--If cnt is 1, then display the first digit
		if (cnt = 1) then
			count := cnt + 1;
			
			case (dig1s) is
				when "0000" =>
					segs <= "1000000";
				when "0001" =>
					segs <= "1111001";
				when "0010" =>
					segs <= "0100100";
				when "0011" =>
					segs <= "0110000";
				when "0100" =>
					segs <= "0011001";
				when "0101" =>
					segs <= "0010010";
				when "0110" =>
					segs <= "0000010";
				when "0111" =>
					segs <= "1111000";
				when "1000" =>
					segs <= "0000000";
				when "1001" =>
					segs <= "0010000";
				when others =>
				   segs <= "1000000";
			end case;
			
			anodes <= "1110";
		end if;
		
		--If cnt is 2, then display the second digit
		if (cnt = 2) then
			count := cnt + 1;
			
			case (dig2s) is
				when "0000" =>
					segs <= "1000000";
				when "0001" =>
					segs <= "1111001";
				when "0010" =>
					segs <= "0100100";
				when "0011" =>
					segs <= "0110000";
				when "0100" =>
					segs <= "0011001";
				when "0101" =>
					segs <= "0010010";
				when "0110" =>
					segs <= "0000010";
				when "0111" =>
					segs <= "1111000";
				when "1000" =>
					segs <= "0000000";
				when "1001" =>
					segs <= "0010000";
				when others =>
				   segs <= "1000000";
			end case;
			
			anodes <= "1101";
		end if;
		
		--If cnt is 3, then display the third digit
		if (cnt = 3) then
			count := cnt + 1;
			
			case (dig3s) is
				when "0000" =>
					segs <= "1000000";
				when "0001" =>
					segs <= "1111001";
				when "0010" =>
					segs <= "0100100";
				when "0011" =>
					segs <= "0110000";
				when "0100" =>
					segs <= "0011001";
				when "0101" =>
					segs <= "0010010";
				when "0110" =>
					segs <= "0000010";
				when "0111" =>
					segs <= "1111000";
				when "1000" =>
					segs <= "0000000";
				when "1001" =>
					segs <= "0010000";
				when others =>
				   segs <= "1000000";
			end case;
			
			anodes <= "1011";
		end if;
		
		--If cnt is 4, then display the fourth digit
		if (cnt = 4) then
			count := 1;
			
			case (dig4s) is
				when "0000" =>
					segs <= "1000000";
				when "0001" =>
					segs <= "1111001";
				when "0010" =>
					segs <= "0100100";
				when "0011" =>
					segs <= "0110000";
				when "0100" =>
					segs <= "0011001";
				when "0101" =>
					segs <= "0010010";
				when "0110" =>
					segs <= "0000010";
				when "0111" =>
					segs <= "1111000";
				when "1000" =>
					segs <= "0000000";
				when "1001" =>
					segs <= "0010000";
				when others =>
				   segs <= "1000000";
			end case;
			
			anodes <= "0111";
		end if;
		
		cnt := count;
		
	end if;
	
	end process;
			
end Behavioral;

---------End----------
--Digital Timer Code--
---------End----------
