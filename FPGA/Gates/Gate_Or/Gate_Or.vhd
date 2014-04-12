----------------------------------------------------------------------------------
-- Company: 
-- Engineer:       Ben Oztalay
-- 
-- Create Date:    00:50:42 04/10/2009 
-- Design Name:    
-- Module Name:    Gate_Or - Behavioral 
-- Project Name:   OR Gate
-- Target Devices: 
-- Tool versions: 
-- Description:    An OR logic gate with two inputs
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

entity Gate_Or is
    Port ( A : in  STD_LOGIC;
           B : in  STD_LOGIC;
           Q : out  STD_LOGIC);
end Gate_Or;

architecture Behavioral of Gate_Or is

begin

	Q <= (A or B);

end Behavioral;

