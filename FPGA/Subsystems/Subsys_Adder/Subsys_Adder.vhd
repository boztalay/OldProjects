----------------------------------------------------------------------------------
-- Company: 
-- Engineer:       Ben Oztalay
-- 
-- Create Date:    03:30:43 04/10/2009 
-- Design Name: 
-- Module Name:    Subsys_Adder - Behavioral 
-- Project Name:   3-Bit Adder
-- Target Devices: 
-- Tool versions: 
-- Description:    A system that is able to store two 3-bit numbers, add them, and display their result in hexadecimal
--						 on a 7-segment display
--
-- Dependencies:   Comp_4bitRegister.vhd, Comp_FullAdder.vhd, Comp_7segDecoder.vhd, Comp_Dflipflop.vhd,
--                 Gate_Nand.vhd, Gate_And.vhd Gate_Or.vhd, Gate_Xor.vhd, Gate_Inv.vhd, Gate_Buf.vhd
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

entity Subsys_Adder is
    Port ( N1   : in   STD_LOGIC_VECTOR (3 downto 0);
           N2   : in   STD_LOGIC_VECTOR (3 downto 0);
           CLK1 : in   STD_LOGIC;
           CLK2 : in   STD_LOGIC;
           seg  : out  STD_LOGIC_VECTOR (6 downto 0);
			  ano  : out  STD_LOGIC_VECTOR (3 downto 0));
end Subsys_Adder;

architecture Behavioral of Subsys_Adder is

component Comp_4bitRegister is
    Port ( D1 : in  STD_LOGIC;
           D2 : in  STD_LOGIC;
           D3 : in  STD_LOGIC;
           D4 : in  STD_LOGIC;
           CLK : in  STD_LOGIC;
           Q1 : out  STD_LOGIC;
           Q2 : out  STD_LOGIC;
           Q3 : out  STD_LOGIC;
           Q4 : out  STD_LOGIC);
end component;

component Comp_FullAdder is
    Port ( A    : in   STD_LOGIC;
           B    : in   STD_LOGIC;
           Cin  : in   STD_LOGIC;
           S    : out  STD_LOGIC;
           Cout : out  STD_LOGIC);
end component;

component Comp_7segDecoder is
    Port ( A   : in   STD_LOGIC_VECTOR (3 downto 0);
           seg : out  STD_LOGIC_VECTOR (6 downto 0));
end component;

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

signal S13 : STD_LOGIC_VECTOR (3 downto 0);
signal S14 : STD_LOGIC;
signal S15 : STD_LOGIC;
signal S16 : STD_LOGIC;
signal S17 : STD_LOGIC;

begin

	S13(0) <= S14;
	S13(1) <= S15;
	S13(2) <= S16;
	S13(3) <= S17;
	
	G1: Comp_4bitRegister port map (N1(0), N1(1), N1(2), N1(3), CLK1, S1, S2, S3);
	G2: Comp_4bitRegister port map (N2(0), N2(1), N2(2), N2(3), CLK1, S4, S5, S6);
	G3: Comp_FullAdder    port map (S1, S4, '0', S9, S7);
	G4: Comp_FullAdder    port map (S2, S5, S7, S10, S8); 
	G5: Comp_FullAdder    port map (S3, S6, S8, S11, S12);
	G6: Comp_4bitRegister port map (S9, S10, S11, S12, CLK2, S14, S15, S16, S17);
	G7: Comp_7segDecoder  port map (S13, seg);
	
	ano <= "1110";

end Behavioral;

