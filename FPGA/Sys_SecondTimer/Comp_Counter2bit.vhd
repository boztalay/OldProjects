----------------------------------------------------------------------------------
-- Company: 
-- Engineer:       Ben Oztalay
-- 
-- Create Date:    23:08:49 07/29/2009 
-- Design Name: 
-- Module Name:    Comp_Counter - Behavioral 
-- Project Name:   Binary Counter
-- Target Devices: 
-- Tool versions: 
-- Description:    A  binary counter with synchronous reset.
--
-- Dependencies: 
--
-- Revision: 
-- Revision 0.01 - File Created
-- Revision 0.10 - First draft written
-- Revision 0.15 - Syntax errors fixed
-- Revision 1.00 - Generated programming file with a successful test on hardware
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

entity Comp_Counter2bit is
    Port ( clock : in  STD_LOGIC;
           reset : in  STD_LOGIC;
           output : out  STD_LOGIC_VECTOR (1 downto 0));
end Comp_Counter2bit;

architecture Behavioral of Comp_Counter2bit is

begin

	main : process(reset, clock) is
		variable value : STD_LOGIC_VECTOR(1 downto 0) := "00";
	begin
		if falling_edge(clock) then
			if reset = '1' or value = b"11" then
				value := b"00";
			else
				value := value + b"01";
			end if;
		end if;
		output <= value;
	end process main;

end Behavioral;

