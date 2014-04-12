----------------------------------------------------------------------------------
-- Company: 
-- Engineer:       Ben Oztalay
-- 
-- Create Date:    22:44:06 11/18/2009 
-- Design Name: 
-- Module Name:    Offset - Behavioral 
-- Project Name:   
-- Target Devices: 
-- Tool versions: 
-- Description:    A generic module that applies an offset (through addition only)
--                 to its input
-- Dependencies: 
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

entity Offset is
 generic ( size: integer;
           offset: integer);
    Port ( data_in  : in  STD_LOGIC_VECTOR((size-1) downto 0);
           data_out : out STD_LOGIC_VECTOR((size-1) downto 0));
end Offset;

architecture Behavioral of Offset is

begin

	main: process (data_in) is
	begin
		data_out <= (data_in + conv_std_logic_vector(offset, size));
	end process;	

end Behavioral;

