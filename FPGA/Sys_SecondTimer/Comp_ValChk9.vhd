----------------------------------------------------------------------------------
-- Company: 
-- Engineer:       Ben Oztalay
-- 
-- Create Date:    00:03:20 07/30/2009 
-- Design Name: 
-- Module Name:    Comp_ValChk9 - Behavioral 
-- Project Name:   Value Checker
-- Target Devices: 
-- Tool versions: 
-- Description:    A simple component to check if one value (A) is equal to
--						 another (B). Outputs a one-bit result. 0 for false, 1 for true 
--						 NOTE: Modified in this context to check against a constant value.
-- Dependencies: 
--
-- Revision: 
-- Revision 0.01 - File Created
-- Revision 0.10 - First draft written, no syntax errors occured
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

entity Comp_ValChk9 is
    Port ( A : in  STD_LOGIC_VECTOR (3 downto 0);
           equal : out  STD_LOGIC);
end Comp_ValChk9;

architecture Behavioral of Comp_ValChk9 is

begin
	
	main : process(A) is
	begin
		if A = x"9" then
			equal <= '1';
		else
			equal <= '0';
		end if;
	end process main;

end Behavioral;

