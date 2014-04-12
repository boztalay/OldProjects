----------------------------------------------------------------------------------
-- Company: 
-- Engineer:       Ben Oztalay
-- 
-- Create Date:    15:07:41 06/08/2009 
-- Design Name: 
-- Module Name:    Comp_16bitShiftReg - Behavioral 
-- Project Name:   16-Bit Shift Register
-- Target Devices: 
-- Tool versions: 
-- Description:    A 16-bit shift register, no reset, activates on the falling edge
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
library UNISIM;
use UNISIM.VComponents.all;

entity Comp_16bitShiftReg is
    Port ( CLK  : in STD_LOGIC;
           Data : in STD_LOGIC;
           Parallel : out STD_LOGIC_VECTOR (15 downto 0);
			  Carry    : out STD_LOGIC);
end Comp_16bitShiftReg;

architecture Behavioral of Comp_16bitShiftReg is

--\Signals/--

signal Buf_CLK  : STD_LOGIC;
signal Buf_Data : STD_LOGIC;

--/Signals\--

begin

	--\BUFG Instantiations/--
	
	BUFG_BufCLK : BUFG
	port map (
		O => Buf_CLK,
		I => CLK
		);
		
	BUFG_BufData : BUFG
	port map (
		O => Buf_Data,
		I => Data
		);
		
	--/BUFG Instantiations\--
	
	main : process(Buf_CLK, Buf_Data)
		variable storage  : STD_LOGIC_VECTOR(15 downto 0) := "0000000000000000";
		variable storage2 : STD_LOGIC_VECTOR(15 downto 0) := "0000000000000000";
	begin
		if (Buf_CLK'event and Buf_CLK = '0') then
			storage2(0)  := Buf_Data;
			storage2(1)  := storage(0);
			storage2(2)  := storage(1);
			storage2(3)  := storage(2);
			storage2(4)  := storage(3);
			storage2(5)  := storage(4);
			storage2(6)  := storage(5);
			storage2(7)  := storage(6);
			storage2(8)  := storage(7);
			storage2(9)  := storage(8);
			storage2(10) := storage(9);
			storage2(11) := storage(10);
			storage2(12) := storage(11);
			storage2(13) := storage(12);
			storage2(14) := storage(13);
			storage2(15) := storage(14);
			Carry        <= storage(15);
			storage      := storage2;
			Parallel     <= storage;
		end if;
	end process;		
	
end Behavioral;

