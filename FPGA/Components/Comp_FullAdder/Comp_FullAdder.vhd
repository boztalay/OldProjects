----------------------------------------------------------------------------------
-- Company: 
-- Engineer:       Ben Oztalay
-- 
-- Create Date:    02:43:18 04/10/2009 
-- Design Name: 
-- Module Name:    Comp_FullAdder - Behavioral 
-- Project Name:   Full Adder
-- Target Devices: 
-- Tool versions: 
-- Description:    A standard full adder
--
-- Dependencies:   Gate_And.vhd, Gate_Or.vhd, Gate_Xor.vhd
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

entity Comp_FullAdder is
    Port ( A    : in   STD_LOGIC;
           B    : in   STD_LOGIC;
           Cin  : in   STD_LOGIC;
           S    : out  STD_LOGIC;
           Cout : out  STD_LOGIC);
end Comp_FullAdder;

architecture Behavioral of Comp_FullAdder is

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

component Gate_Xor is
	 Port ( A : in  STD_LOGIC;
	        B : in  STD_LOGIC;
			  Q : out STD_LOGIC);
end component;

signal S0 : STD_LOGIC;
signal S1 : STD_LOGIC;
signal S2 : STD_LOGIC;

begin

	G1: Gate_Xor port map     (A, B, S0);
	G2: Gate_Xor port map   (S0, Cin, S);
	G3: Gate_And port map  (Cin, S0, S1);
	G4: Gate_And port map     (A, B, S2);
	G5: Gate_Or  port map (S1, S2, Cout);

end Behavioral;

