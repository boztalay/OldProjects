----------------------------------------------------------------------------------
-- Company: 
-- Engineer:       Ben Oztalay
-- 
-- Create Date:    18:20:22 04/10/2009 
-- Design Name: 
-- Module Name:    Comp_4x4Multiplexer - Behavioral 
-- Project Name:   4x4 Multiplexer
-- Target Devices: 
-- Tool versions: 
-- Description:    A multiplexer with four 4-bit-wide inputs
--
-- Dependencies:   Comp_1of4Decoder.vhd, Gate_And.vhd, Gate_Inv.vhd, Gate_Or.vhd
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

entity Comp_4x4Multiplexer is
    Port ( Sel0 : in  STD_LOGIC;
           Sel1 : in  STD_LOGIC;
           A0   : in  STD_LOGIC;
           A1   : in  STD_LOGIC;
           A2   : in  STD_LOGIC;
           A3   : in  STD_LOGIC;
           B0   : in  STD_LOGIC;
           B1   : in  STD_LOGIC;
           B2 	 : in  STD_LOGIC;
           B3 	 : in  STD_LOGIC;
           C0 	 : in  STD_LOGIC;
           C1 	 : in  STD_LOGIC;
           C2 	 : in  STD_LOGIC;
           C3 	 : in  STD_LOGIC;
           D0 	 : in  STD_LOGIC;
           D1 	 : in  STD_LOGIC;
           D2 	 : in  STD_LOGIC;
           D3 	 : in  STD_LOGIC;
           Q0 	 : out STD_LOGIC;
           Q1 	 : out STD_LOGIC;
           Q2 	 : out STD_LOGIC;
           Q3 	 : out STD_LOGIC);
end Comp_4x4Multiplexer;

architecture Behavioral of Comp_4x4Multiplexer is

component Comp_1of4Decoder is
    Port ( A0 : in   STD_LOGIC;
           A1 : in   STD_LOGIC;
           Q0 : out  STD_LOGIC;
           Q1 : out  STD_LOGIC;
           Q2 : out  STD_LOGIC;
           Q3 : out  STD_LOGIC);
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

signal S0 : STD_LOGIC;
signal S1 : STD_LOGIC;
signal S2 : STD_LOGIC;
signal S3 : STD_LOGIC;
signal S4 : STD_LOGIC;
signal S5 : STD_LOGIC;
signal S6 : STD_LOGIC;
signal S7 : STD_LOGIC;
signal S8 : STD_LOGIC;
signal S9 : STD_LOGIC;
signal S10 : STD_LOGIC;
signal S11 : STD_LOGIC;
signal S12 : STD_LOGIC;
signal S13 : STD_LOGIC;
signal S14 : STD_LOGIC;
signal S15 : STD_LOGIC;
signal S16 : STD_LOGIC;
signal S17 : STD_LOGIC;
signal S18 : STD_LOGIC;
signal S19 : STD_LOGIC;
signal S20 : STD_LOGIC;
signal S21 : STD_LOGIC;
signal S22 : STD_LOGIC;
signal S23 : STD_LOGIC;
signal S24 : STD_LOGIC;
signal S25 : STD_LOGIC;
signal S26 : STD_LOGIC;
signal S27 : STD_LOGIC;

begin

	G1:  Comp_1of4Decoder port map (Sel0, Sel1, S0, S1, S2, S3);
	G2:  Gate_And         port map 					  (S0, A0, S4);
	G3:  Gate_And         port map 					  (S0, B0, S5);
	G4:  Gate_And         port map 				 	  (S0, C0, S6);
	G5:  Gate_And 			 port map 					  (S0, D0, S7);
	G6:  Gate_Or          port map                 (S4, S5, S8);
	G7:  Gate_Or          port map                 (S6, S7, S9);
	G8:  Gate_Or          port map                 (S8, S9, Q0);
	G9:  Gate_And         port map 			   	 (S1, A1, S10);
	G10: Gate_And         port map 				    (S1, B1, S11);
	G11: Gate_And         port map 				 	 (S1, C1, S12);
	G12: Gate_And 		  	 port map 			 		 (S1, D1, S13);
	G13: Gate_Or          port map              (S10, S11, S14);
	G14: Gate_Or          port map              (S12, S13, S15);
	G15: Gate_Or          port map               (S14, S15, Q1);
	G16: Gate_And         port map 			   	 (S2, A2, S16);
	G17: Gate_And         port map 				    (S2, B2, S17);
	G18: Gate_And         port map 				 	 (S2, C2, S18);
	G19: Gate_And 		  	 port map 			 		 (S2, D2, S19);
	G20: Gate_Or          port map              (S16, S17, S20);
	G21: Gate_Or          port map              (S18, S19, S21);
	G22: Gate_Or          port map               (S20, S21, Q2);
	G23: Gate_And         port map 			   	 (S3, A3, S22);
	G24: Gate_And         port map 				    (S3, B3, S23);
	G25: Gate_And         port map 				 	 (S3, C3, S24);
	G26: Gate_And 		  	 port map 			 		 (S3, D3, S25);
	G27: Gate_Or          port map              (S22, S23, S26);
	G28: Gate_Or          port map              (S24, S25, S27);
	G29: Gate_Or          port map               (S26, S27, Q3);

end Behavioral;

