----------------------------------------------------------------------------------
-- Company: 
-- Engineer:       Ben Oztalay
-- 
-- Create Date:    21:48:20 04/12/2009 
-- Design Name: 
-- Module Name:    Subsys_LCDDriver - Behavioral 
-- Project Name:   LCD Driver
-- Target Devices: 
-- Tool versions: 
-- Description:    A reusable LCD driver
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

entity Subsys_LCDDriver is
	Port ( CLK   : in  STD_LOGIC;
	       RS    : in  STD_LOGIC;
			 RW    : in  STD_LOGIC;
			 CLR   : in  STD_LOGIC;
			 RH    : in  STD_LOGIC;
			 SC    : in  STD_LOGIC;
			 datai : in  STD_LOGIC_VECTOR (7 downto 0);
			 
			 Eo     : out STD_LOGIC;
			 RSo   : out STD_LOGIC;
			 RWo   : out STD_LOGIC;
			 datao : out STD_LOGIC_VECTOR (7 downto 0));
end Subsys_LCDDriver;

architecture Behavioral of Subsys_LCDDriver is

begin

	main : process (CLK, RS, RW, CLR, RH, SC, datai)
		variable data : STD_LOGIC_VECTOR (7 downto 0) := (others => '0');
		variable RSv, RWv : STD_LOGIC := '0';
	begin
		RSv := RS;
		RWv := RW;
		data := datai;
		
		if (CLR = '1') then
			RSv := '0';
			RWv := '0';
			data := "00000001";
		end if;
		
		if (RH = '1') then
			RSv := '0';
			RWv := '0';
			data := "00000010";
		end if;
		
		if (SC = '1') then
			RSv := '0';
			RWv := '0';
			data := "00010100";
		end if;
		
		Eo <= CLK;
		RSo <= RSv;
		RWo <= RWv;
		datao <= data;
	end process;

end Behavioral;

