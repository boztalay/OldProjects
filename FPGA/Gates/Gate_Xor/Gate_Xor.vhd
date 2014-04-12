----------------------------------------------------------------------------------
-- Company: 
-- Engineer:       Ben Oztalay
-- 
-- Create Date:    00:52:18 04/10/2009 
-- Design Name: 
-- Module Name:    Gate_Xor - Behavioral 
-- Project Name:   XOR Gate
-- Target Devices: 
-- Tool versions: 
-- Description:    An XOR logic gate with two inputs
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

entity Gate_Xor is
    Port ( A : in  STD_LOGIC;
           B : in  STD_LOGIC;
           Q : out  STD_LOGIC);
end Gate_Xor;

architecture Behavioral of Gate_Xor is

begin

	Q <= (A xor B);

end Behavioral;

