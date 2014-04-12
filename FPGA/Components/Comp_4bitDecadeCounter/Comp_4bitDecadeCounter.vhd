----------------------------------------------------------------------------------
-- Company: 
-- Engineer:       Ben Oztalay
-- 
-- Create Date:    17:19:39 04/10/2009 
-- Design Name: 
-- Module Name:    Comp_4bitDecadeCounter - Behavioral 
-- Project Name:   4-Bit Decade Counter
-- Target Devices: 
-- Tool versions: 
-- Description:    A 4-bit decade counter. No reset.
--
-- Dependencies:   Comp_Dflipflop.vhd, Gate_Nand.vhd, Gate_Inv.vhd, Gate_Buf.vhd,
--                 Gate_And.vhd, Gate_Or.vhd
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

entity Comp_4bitDecadeCounter is
    Port ( CLK : in  STD_LOGIC;
           Q1 : out  STD_LOGIC;
           Q2 : out  STD_LOGIC;
           Q3 : out  STD_LOGIC;
           Q4 : out  STD_LOGIC);
end Comp_4bitDecadeCounter;

architecture Behavioral of Comp_4bitDecadeCounter is

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

component Gate_Or is 
	 Port ( A : in  STD_LOGIC;
	        B : in  STD_LOGIC;
			  Q : out STD_LOGIC);
end component;

component Gate_Buf is 
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

begin

	G1:  Comp_Dflipflop port map (S0, CLK, S1, S5);
	G2:  Comp_Dflipflop port map (S1, CLK, S2, S6);
	G3:  Comp_Dflipflop port map (S2, CLK, S3, S7);
	G4:  Comp_Dflipflop port map (S3, CLK, S4, S8);
	G5:  Gate_Or        port map    (S13, S14, S0);
	G6:  Gate_And       port map    (S10, S9, S14);
	G7:  Gate_And       port map      (S5, S6, S9);
	G8:  Gate_And       port map     (S7, S8, S10);
	G9:  Gate_And       port map   (S11, S12, S13);
	G10: Gate_And       port map     (S5, S6, S11);
	G11: Gate_And       port map     (S7, S4, S12);
	G12: Gate_Buf 		  port map          (S1, Q1);
	G13: Gate_Buf 		  port map          (S2, Q2);
	G14: Gate_Buf 		  port map          (S3, Q3);
	G15: Gate_Buf 		  port map          (S4, Q4);

end Behavioral;

