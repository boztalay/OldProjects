----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    02:28:59 11/25/2009 
-- Design Name: 
-- Module Name:    FlashReadTest - Behavioral 
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

entity FlashReadTest is
    Port ( mclk : in STD_LOGIC;
			  DQ : in  STD_LOGIC_VECTOR(15 downto 0);
           A : out  STD_LOGIC_VECTOR(22 downto 0);
			  an : out STD_LOGIC_VECTOR(3 downto 0);
			  a_to_g : out STD_LOGIC_VECTOR(6 downto 0);
			  clk_led : out STD_LOGIC;
			  FlashCE_L : out STD_LOGIC;
			  FlashRP_L : out STD_LOGIC;
			  WE_L : out  STD_LOGIC;
           OE_L : out  STD_LOGIC;
           CE_L : out  STD_LOGIC);
end FlashReadTest;

architecture Behavioral of FlashReadTest is

signal clk_1hz : STD_LOGIC := '0';
signal to_decoder : STD_LOGIC_VECTOR(3 downto 0);

component Comp_7segDecoder is
    Port ( A   : in   STD_LOGIC_VECTOR (3 downto 0);
           seg : out  STD_LOGIC_VECTOR (6 downto 0));
end component;

begin

	FlashCE_L <= '0';
	CE_L <= '1';
	WE_L <= '1';
	FlashRP_L <= '1';
	OE_L <= '0';
	
	clocker: process (mclk) is
		variable count : integer := 0;
	begin
		if rising_edge(mclk) then
			count := count + 1;
		end if;
		
		if count = 50000000 then
			count := 0;
			clk_1hz <= '0';
		end if;
		
		if count = 25000000 then
			clk_1hz <= '1';
		end if;
	end process;
	
	counter: process (clk_1hz) is
		variable addr_count : STD_LOGIC_VECTOR(22 downto 0) := b"00000000000000000000000";
	begin
		if rising_edge(clk_1hz) then
			addr_count := addr_count + 1;
		end if;
		
		A <= addr_count;
	end process;
	
	disp_data: process(DQ, mclk) is
		variable clk_count : integer := 0;
		variable disp_count : integer := 0;
	begin
		if rising_edge(mclk) then
			clk_count := clk_count + 1;
			if clk_count = 250000 then
				disp_count := disp_count + 1;
				clk_count := 0;
				if disp_count = 4 then
					disp_count := 0;
				end if;
			end if;
		end if;
		
		if disp_count = 0 then
			an <= "1110";
			to_decoder <= DQ(3 downto 0);
		elsif disp_count = 1 then
			an <= "1101";
			to_decoder <= DQ(7 downto 4);
		elsif disp_count = 2 then
			an <= "1011";
			to_decoder <= DQ(11 downto 8);
		elsif disp_count = 3 then
			an <= "0111";
			to_decoder <= DQ(15 downto 12);
		end if;
	end process;
	
	decoder : Comp_7segDecoder port map (to_decoder,
													 a_to_g);
													 
	clk_led <= clk_1Hz;

end Behavioral;

