----------------------------------------------------------------------------------
-- Company: 
-- Engineer:       Ben Oztalay
-- 
-- Create Date:    17:45:06 07/30/2009 
-- Design Name: 
-- Module Name:    Sys_SecondTimer - Structural 
-- Project Name:   Second Timer
-- Target Devices: 
-- Tool versions: 
-- Description:    A simple second timer with four digits (counts from 0 to 9999).
--						 Synchronous reset.
-- Dependencies: 	 
--
-- Revision: 
-- Revision 0.01 - File Created
-- Revision 0.10 - Modified all component VHD files
-- Revision 0.11 - Created all component instantiations
-- Revision 0.12 - Created all signals
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

entity Sys_SecondTimer is
    Port ( BoardClock : in  STD_LOGIC;
           Reset      : in  STD_LOGIC;
           Segments : out  STD_LOGIC_VECTOR (6 downto 0);
           Anodes   : out  STD_LOGIC_VECTOR (3 downto 0));
end Sys_SecondTimer;

--Architecture--
architecture Structural of Sys_SecondTimer is

--\Components/--

component Comp_ClockGen1Hz is
    Port ( Board_Clk : in  STD_LOGIC;
           Clock_Out : out  STD_LOGIC);
end component;
-----
component Comp_ClockGen400Hz is
    Port ( Board_Clk : in  STD_LOGIC;
           Clock_Out : out  STD_LOGIC);
end component;
-----
component Comp_Counter4bit is
    Port ( clock : in  STD_LOGIC;
           reset : in  STD_LOGIC;
           output : out  STD_LOGIC_VECTOR (3 downto 0));
end component;
-----
component Comp_ValChk9 is
    Port ( A : in  STD_LOGIC_VECTOR (3 downto 0);
           equal : out  STD_LOGIC);
end component;
-----
component Comp_GateOR is
    Port ( A : in  STD_LOGIC;
           B : in  STD_LOGIC;
           Q : out  STD_LOGIC);
end component;
-----
component Comp_DataMUX4x4 is
    Port ( A   : in  STD_LOGIC_VECTOR (3 downto 0);
           B   : in  STD_LOGIC_VECTOR (3 downto 0);
           C   : in  STD_LOGIC_VECTOR (3 downto 0);
           D   : in  STD_LOGIC_VECTOR (3 downto 0);
           sel : in  STD_LOGIC_VECTOR (1 downto 0);
           output : out  STD_LOGIC_VECTOR (3 downto 0));
end component;
-----
component Comp_Counter2bit is
    Port ( clock : in  STD_LOGIC;
			  reset : in  STD_LOGIC;
           output : out  STD_LOGIC_VECTOR (1 downto 0));
end component;
-----
component Comp_DecadeCnt4bit is
    Port ( clock : in  STD_LOGIC;
           reset : in  STD_LOGIC;
           outputs : out  STD_LOGIC_VECTOR (3 downto 0));
end component;
-----
component Comp_7segDecode is
    Port ( number : in  STD_LOGIC_VECTOR (3 downto 0);
           segments : out  STD_LOGIC_VECTOR (6 downto 0));
end component;

--/Components\--

--\Signals/--

signal Buf_BoardClock   : STD_LOGIC;
signal Buf_Clock1Hz     : STD_LOGIC;
signal Buf_Clock400Hz   : STD_LOGIC;
signal Unbuf_Clock1Hz   : STD_LOGIC;
signal Unbuf_Clock400Hz : STD_LOGIC;

signal Dig1CounterOut : STD_LOGIC_VECTOR (3 downto 0);
signal Dig2CounterOut : STD_LOGIC_VECTOR (3 downto 0);
signal Dig3CounterOut : STD_LOGIC_VECTOR (3 downto 0);
signal Dig4CounterOut : STD_LOGIC_VECTOR (3 downto 0);

signal Dig1ValChkOut : STD_LOGIC;
signal Dig2ValChkOut : STD_LOGIC;
signal Dig3ValChkOut : STD_LOGIC;
signal Dig4ValChkOut : STD_LOGIC;

signal Dig1Reset : STD_LOGIC;
signal Dig2Reset : STD_LOGIC;
signal Dig3Reset : STD_LOGIC;
signal Dig4Reset : STD_LOGIC;

signal MultiplexerOut : STD_LOGIC_VECTOR (3 downto 0);
signal Counter2bitOut : STD_LOGIC_VECTOR (1 downto 0);

signal DecadeCountOut : STD_LOGIC_VECTOR (3 downto 0);

signal ZeroSig : STD_LOGIC := '0';

--/Signals\--

--Architecture Begin--

begin
	
	--\BUFG Instantiations-/--
	BUFG_BufBoardClock : BUFG
	port map (
		O => Buf_BoardClock,
		I => BoardClock
		);

	BUFG_BufClock1Hz : BUFG
	port map (
		O => Buf_Clock1Hz,
		I => Unbuf_Clock1Hz
		);	
		
	BUFG_BufClock400Hz : BUFG
	port map (
		O => Buf_Clock400Hz,
		I => Unbuf_Clock400Hz
		);	
	--/BUFG Instantiations\--
	
	--\Port Maps/--
	
	Clock1 : Comp_ClockGen1Hz   port map (Buf_BoardClock, Unbuf_Clock1Hz);
	Clock2 : Comp_ClockGen400Hz port map (Buf_BoardClock, Unbuf_Clock400Hz);
	
	Dig1 : Comp_Counter4bit port map (Buf_Clock1Hz,  Dig1Reset, Dig1CounterOut);
	Dig2 : Comp_Counter4bit port map (Dig1ValChkOut, Dig2Reset, Dig2CounterOut);
	Dig3 : Comp_Counter4bit port map (Dig2ValChkOut, Dig3Reset, Dig3CounterOut);
	Dig4 : Comp_Counter4bit port map (Dig3ValChkOut, Dig4Reset, Dig4CounterOut);
	
	Dig1ValChk : Comp_ValChk9 port map (Dig1CounterOut, Dig1ValChkOut);
	Dig2ValChk : Comp_ValChk9 port map (Dig2CounterOut, Dig2ValChkOut);
	Dig3ValChk : Comp_ValChk9 port map (Dig3CounterOut, Dig3ValChkOut);
	Dig4ValChk : Comp_ValChk9 port map (Dig4CounterOut, Dig4ValChkOut);
	
	Dig1ResetOR : Comp_GateOR port map (Dig1ValChkOut, Reset, Dig1Reset);
	Dig2ResetOR : Comp_GateOR port map (Dig2ValChkOut, Reset, Dig2Reset);
	Dig3ResetOR : Comp_GateOR port map (Dig3ValChkOut, Reset, Dig3Reset);
	Dig4ResetOR : Comp_GateOR port map (Dig4ValChkOut, Reset, Dig4Reset);
	
	Multiplexer : Comp_DataMUX4x4  port map (Dig1CounterOut, Dig2CounterOut, Dig3CounterOut, 
											           Dig4CounterOut, Counter2bitOut, MultiplexerOut);
   Count2bit   : Comp_Counter2bit port map (Buf_Clock400Hz, ZeroSig, Counter2bitOut);
	
	DecCount : Comp_DecadeCnt4bit port map (Buf_Clock400Hz, ZeroSig, DecadeCountOut);
	
	SegDecode : Comp_7segDecode port map (MultiplexerOut, Segments);
	
	Anodes <= (not DecadeCountOut);
	
	--/Port Maps\--

end Structural;
--End Architecture--
