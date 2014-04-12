----------------------------------------------------------------------------------
-- Company: 
-- Engineer:       Ben Oztalay
-- 
-- Create Date:    01:52:06 04/10/2009 
-- Design Name: 
-- Module Name:    Comp_4bitRegister - Behavioral 
-- Project Name:   4-bit Register
-- Target Devices: 
-- Tool versions: 
-- Description:    A four-bit register made from D flip-flops. No reset.
--
-- Dependencies:   Comp_Dflipflop.vhd, Gate_Nand.vhd, Gate_Inv.chd, Gate_Buf.vhd
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

entity Comp_4bitRegister is
    Port ( D1 : in  STD_LOGIC;
           D2 : in  STD_LOGIC;
           D3 : in  STD_LOGIC;
           D4 : in  STD_LOGIC;
           CLK : in  STD_LOGIC;
           Q1 : out  STD_LOGIC;
           Q2 : out  STD_LOGIC;
           Q3 : out  STD_LOGIC;
           Q4 : out  STD_LOGIC);
end Comp_4bitRegister;

architecture Behavioral of Comp_4bitRegister is

component Comp_Dflipflop is
    Port ( D : in  STD_LOGIC;
           CLK : in  STD_LOGIC;
           Q : out  STD_LOGIC;
           NQ : out  STD_LOGIC);
end component;

begin

	G1: Comp_Dflipflop port map (D1, CLK, Q1);
	G2: Comp_Dflipflop port map (D2, CLK, Q2);
	G3: Comp_Dflipflop port map (D3, CLK, Q3);
	G4: Comp_Dflipflop port map (D4, CLK, Q4);

end Behavioral;

