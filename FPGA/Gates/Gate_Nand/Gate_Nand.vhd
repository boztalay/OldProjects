----------------------------------------------------------------------------------
-- Company: 
-- Engineer:       Ben Oztalay
-- 
-- Create Date:    01:02:05 04/10/2009 
-- Design Name: 
-- Module Name:    Gate_Nand - Behavioral 
-- Project Name:   NAND Gate
-- Target Devices: 
-- Tool versions: 
-- Description:    A NAND logic gate with 2 inputs
--  
-- Dependencies:   None
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

entity Gate_Nand is
    Port ( A : in  STD_LOGIC;
           B : in  STD_LOGIC;
           Q : out  STD_LOGIC);
end Gate_Nand;

architecture Behavioral of Gate_Nand is

begin

	Q <= (not (A and B));

end Behavioral;

