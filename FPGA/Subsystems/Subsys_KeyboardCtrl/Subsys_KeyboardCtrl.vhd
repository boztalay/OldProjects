----------------------------------------------------------------------------------
-- Company: 
-- Engineer:       Ben Oztalay
-- 
-- Create Date:    14:34:01 06/11/2009 
-- Design Name: 
-- Module Name:    Subsys_KeyboardCtrl - Behavioral 
-- Project Name:   Keyboard Controller
-- Target Devices: 
-- Tool versions: 
-- Description:    A keyboard controller for use in other projects. Outputs scan codes
--						 and whether or not the shift or caps lock keys have been pressed.
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

entity Subsys_KeyboardCtrl is
    Port ( KeyCLK   : in  STD_LOGIC;
           KeyData  : in  STD_LOGIC;
           ScanCode : out STD_LOGIC_VECTOR (7 downto 0);
           Shift    : out STD_LOGIC;
           Caps     : out STD_LOGIC);
end Subsys_KeyboardCtrl;

architecture Behavioral of Subsys_KeyboardCtrl is

begin


end Behavioral;

