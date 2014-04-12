----------------------------------------------------------------------------------
-- Company: 
-- Engineer:       Ben Oztalay
-- 
-- Create Date:    01:03:52 04/10/2009 
-- Design Name:    
-- Module Name:    Comp_Dflipflop - Behavioral 
-- Project Name:   D Flip-flop
-- Target Devices: 
-- Tool versions: 
-- Description:    A standard D flip-flop
--  
-- Dependencies:   Gate_Nand.vhd, Gate_Inv.vhd, Gate_Buf.vhd
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

entity Comp_Dflipflop is
    Port ( D : in  STD_LOGIC;
           CLK : in  STD_LOGIC;
           Q : out  STD_LOGIC;
           NQ : out  STD_LOGIC);
end Comp_Dflipflop;

architecture Behavioral of Comp_Dflipflop is

component Gate_Nand is
	 Port ( A : in  STD_LOGIC;
	        B : in  STD_LOGIC;
			  Q : out STD_LOGIC);
end component;

component Gate_Inv is
	 Port ( A : in  STD_LOGIC;
	        Q : out STD_LOGIC);
end component;

component Gate_Buf is
	 Port ( A : in  STD_LOGIC;
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

begin

	G0:  Gate_Inv  port map     (CLK, S9);
	G1:  Gate_Nand port map   (D, S9, S0);
	G2:  Gate_Nand port map  (S0, S9, S1);
	G3:  Gate_Nand port map  (S0, S3, S2);
	G4:  Gate_Nand port map  (S1, S2, S3);
	G5:  Gate_Nand port map  (S2, S4, S5);
	G6:  Gate_Nand port map  (S3, S4, S6);
	G7:  Gate_Nand port map  (S5, S8, S7);
	G8:  Gate_Nand port map  (S6, S7, S8);
	G9:  Gate_Inv  port map      (S9, S4);
	G10: Gate_Buf  port map       (S7, Q);
	G11: Gate_Buf  port map      (S8, NQ);

end Behavioral;

