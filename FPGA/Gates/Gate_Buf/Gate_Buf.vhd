----------------------------------------------------------------------------------
-- Company: 
-- Engineer:       Ben oztalay
-- 
-- Create Date:    00:56:02 04/10/2009 
-- Design Name: 
-- Module Name:    Gate_Buf - Behavioral 
-- Project Name:   Buffer
-- Target Devices: 
-- Tool versions: 
-- Description:    A buffer with 1 input
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

entity Gate_Buf is
    Port ( A : in  STD_LOGIC;
           Q : out  STD_LOGIC);
end Gate_Buf;

architecture Behavioral of Gate_Buf is

begin

	Q <= A;

end Behavioral;

