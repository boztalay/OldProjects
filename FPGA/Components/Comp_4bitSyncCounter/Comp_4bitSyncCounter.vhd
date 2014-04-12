----------------------------------------------------------------------------------
-- Company: 
-- Engineer:       Ben Oztalay
-- 
-- Create Date:    14:38:09 04/10/2009 
-- Design Name: 
-- Module Name:    Comp_4bitSyncCounter - Behavioral 
-- Project Name:   4-bit synchronous counter
-- Target Devices: 
-- Tool versions: 
-- Description:    A 4-bit synchronous counter using D flip-flops. Has an enable line.
--
-- Dependencies:   Comp_Dflipflop.vhd, Gate_And.vhd, Gate_Xor.vhd, Gate_Buf.vhd, Gate_Inv.vhd,
--                 Gate_Nand.vhd
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

entity Comp_4bitSyncCounter is
    Port ( CLK : in  STD_LOGIC;
           E   : in  STD_LOGIC;
			  R   : in  STD_LOGIC;
           Q1  : out STD_LOGIC;
           Q2  : out STD_LOGIC;
           Q3  : out STD_LOGIC;
           Q4  : out STD_LOGIC);
end Comp_4bitSyncCounter;

architecture Behavioral of Comp_4bitSyncCounter is

component Comp_Dflipflop is
	 Port ( D   : in  STD_LOGIC;
	        CLK : in  STD_LOGIC;
			  Q   : out STD_LOGIC;
			  NQ  : out STD_LOGIC);
end component;

component Gate_And is
	 Port ( A : in  STD_LOGIC;
	        B : in  STD_LOGIC;
			  Q : out STD_LOGIC);
end component;

component Gate_Xor is
	 Port ( A : in  STD_LOGIC;
	        B : in  STD_LOGIC;
			  Q : out STD_LOGIC);
end component;

component Gate_Buf is
	 Port ( A : in  STD_LOGIC;
			  Q : out STD_LOGIC);
end component;

component Gate_Inv is
	 Port ( A : in  STD_LOGIC;
			  Q : out STD_LOGIC);
end component;

signal S0  : STD_LOGIC;
signal S1  : STD_LOGIC;
signal S2  : STD_LOGIC;
signal S3  : STD_LOGIC;
signal S4  : STD_LOGIC;
signal S5  : STD_LOGIC;
signal S6  : STD_LOGIC;
signal S7  : STD_LOGIC;
signal S8  : STD_LOGIC;
signal S9  : STD_LOGIC;
signal S10 : STD_LOGIC;
signal S11 : STD_LOGIC;
signal S12 : STD_LOGIC;
signal S13 : STD_LOGIC;
signal S14 : STD_LOGIC;
signal S15 : STD_LOGIC;

begin

	G0:  Gate_Inv       port map        (R, S15);
	
	G1:  Gate_Xor       port map     (E, S0, S1);
	G2:  Gate_And       port map  (S1, S15, S11);
	G3:  Comp_Dflipflop port map  (S11, CLK, S0);
	G4:  Gate_Buf       port map        (S0, Q1);
	G5:  Gate_And       port map     (E, S0, S2);
	
	G6:  Gate_Xor       port map    (S2, S3, S4);
	G7:  Gate_And       port map  (S4, S15, S12);
	G8:  Comp_Dflipflop port map  (S12, CLK, S3);
	G9:  Gate_Buf       port map        (S3, Q2);
	G10: Gate_And       port map    (S2, S3, S5);
	
	G11: Gate_Xor       port map    (S5, S6, S7);
	G12: Gate_And       port map  (S7, S15, S13);
	G13: Comp_Dflipflop port map  (S13, CLK, S6);
	G14: Gate_Buf       port map        (S6, Q3);
	G15: Gate_And       port map    (S5, S6, S8);
	
	G16: Gate_Xor       port map   (S8, S9, S10);
	G17: Gate_And       port map (S10, S15, S14);
	G18: Comp_Dflipflop port map  (S14, CLK, S9);
	G19: Gate_Buf       port map        (S9, Q4);

end Behavioral;

