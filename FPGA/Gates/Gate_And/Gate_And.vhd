----------------------------------------------------------------------------------
-- Company: 
-- Engineer:       Ben Oztalay
-- 
-- Create Date:    00:48:52 04/10/2009 
-- Design Name: 
-- Module Name:    Gate_And - Behavioral 
-- Project Name:   AND Gate
-- Target Devices: 
-- Tool versions: 
-- Description:    An AND lgoic gate with two inptus
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

entity Gate_And is
    Port ( A : in  STD_LOGIC;
           B : in  STD_LOGIC;
           Q : out  STD_LOGIC);
end Gate_And;

architecture Behavioral of Gate_And is

begin

	Q <= (A and B);

end Behavioral;

