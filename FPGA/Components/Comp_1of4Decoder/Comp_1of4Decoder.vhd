----------------------------------------------------------------------------------
-- Company: 
-- Engineer:       Ben Oztalay
-- 
-- Create Date:    18:06:50 04/10/2009 
-- Design Name: 
-- Module Name:    Comp_1of4Decoder - Behavioral 
-- Project Name:   1 of 4 decoder
-- Target Devices: 
-- Tool versions: 
-- Description:    A simple 1 of 4 decoder
--
-- Dependencies:   Gate_Inv.vhd, Gate_And.vhd
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

entity Comp_1of4Decoder is
    Port ( A0 : in   STD_LOGIC;
           A1 : in   STD_LOGIC;
           Q0 : out  STD_LOGIC;
           Q1 : out  STD_LOGIC;
           Q2 : out  STD_LOGIC;
           Q3 : out  STD_LOGIC);
end Comp_1of4Decoder;

architecture Behavioral of Comp_1of4Decoder is

component Gate_Inv is
	 Port ( A : in  STD_LOGIC;
			  Q : out STD_LOGIC);
end component;

component Gate_And is
	 Port ( A : in  STD_LOGIC;
	        B : in  STD_LOGIC;
			  Q : out STD_LOGIC);
end component;

signal S0 : STD_LOGIC;
signal S1 : STD_LOGIC;

begin

	G1: Gate_Inv port map     (A0, S0);
	G2: Gate_Inv port map     (A1, S1);
	G3: Gate_And port map (S0, S1, Q0);
	G4: Gate_And port map (A0, S1, Q1);
	G5: Gate_And port map (S0, A1, Q2);
	G6: Gate_And port map (A0, A1, Q3);

end Behavioral;

