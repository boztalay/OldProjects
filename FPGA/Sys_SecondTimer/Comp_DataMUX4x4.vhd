----------------------------------------------------------------------------------
-- Company: 
-- Engineer:       Ben Oztalay
-- 
-- Create Date:    15:51:47 07/30/2009 
-- Design Name: 
-- Module Name:    Comp_DataMUX - Behavioral 
-- Project Name:   Data Multiplexer
-- Target Devices: 
-- Tool versions: 
-- Description:    A multiplexer that multiplexes inputs with two or more bits each.
--
-- Dependencies: 
--
-- Revision: 
-- Revision 0.01 - File Created
-- Revision 0.10 - First draft written
-- Revision 0.15 - Syntax errors fixed
-- Revision 0.30 - UCF file written
-- Revision 1.00 - Generated programming file with successul hardware test
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

entity Comp_DataMUX4x4 is
    Port ( A   : in  STD_LOGIC_VECTOR (3 downto 0);
           B   : in  STD_LOGIC_VECTOR (3 downto 0);
           C   : in  STD_LOGIC_VECTOR (3 downto 0);
           D   : in  STD_LOGIC_VECTOR (3 downto 0);
           sel : in  STD_LOGIC_VECTOR (1 downto 0);
           output : out  STD_LOGIC_VECTOR (3 downto 0));
end Comp_DataMUX4x4;

architecture Behavioral of Comp_DataMUX4x4 is

begin

	main : process(A, B, C, D, sel) is
	begin
		case sel is
			when b"00" => 
				output <= A;
			when b"01" => 
				output <= B;
			when b"10" => 
				output <= C;
			when b"11" => 
				output <= D;
			when others =>
				output <= b"0000";
		end case;
	end process main;

end Behavioral;

