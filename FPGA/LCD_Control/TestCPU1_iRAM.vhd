----------------------------------------------------------------------------------
-- Company: 
-- Engineer:       Ben Oztalay
-- 
-- Create Date:    00:30:19 10/03/2009 
-- Design Name: 
-- Module Name:    TestCPU1_iROM - Behavioral 
-- Project Name:   Test CPU 1
-- Target Devices: 
-- Tool versions: 
-- Description:    The instruction ROM for Test CPU 1
--
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

entity TestCPU1_iROM is
    Port ( addr : in  STD_LOGIC_VECTOR (10 downto 0);
           data_out : out  STD_LOGIC_VECTOR (15 downto 0));
end TestCPU1_iROM;

architecture Behavioral of TestCPU1_iROM is

begin

	iROM: process (addr) is
		type iROM_array is array (2047 downto 0) of
			STD_LOGIC_VECTOR (15 downto 0);
		variable iROM: iROM_array := (0 => "0000000000000000", --null
												1 => "0001001000011001", --addi r2, r0, 25   --loading r2 with value
												2 => "0000001001001000", --add r2, r2, r2
												3 => "0000001001001000", --add r2, r2, r2
												4 => "0000001001001000", --add r2, r2, r2
												5 => "0000001001001000", --add r2, r2, r2
												6 => "0000001001001000", --add r2, r2, r2
												7 => "0001001001010001", --addi r2, r2,17
												8 => "0000001001001000", --add r2, r2, r2
												9 => "0000001001001000", --add r2, r2, r2
												10 => "0000001001001000", --add r2, r2, r2
												11 => "0001001100001111", --addi r3, r0, 15 --loading r3 with value
												12 => "0001010000011001", --addi r4, r0, 25 --loading r4 with value
												13 => "0000010010010000", --add r4, r4, r4
												14 => "0000010010010000", --add r4, r4, r4
												15 => "0000010010010000", --add r4, r4, r4
												16 => "0000010010010000", --add r4, r4, r4
												17 => "0001010110100001", --addi r5, r5, 1  --begin waiting for 20ms
												18 => "0010000010101000", --cp r5, r2
												19 => "0100000000010101", --bz r0, 21
												20 => "0100100000010001", --jp 17
												21 => "1000000000000001", --opin 0, 1       --RS  = '0' (r1 = 0) sending set function
												22 => "1000000000000010", --opin 0, 2       --RW  = '0' //leaving at '0' for the rest
												23 => "1000000000100000", --opin 1, 0       --E   = '1'
												24 => "1000000000100011", --opin 1, 3       --DBe = '1'
												25 => "1000000000000000", --opin 0, 0       --E   = '0'
												26 => "1000000000000011", --opin 0, 3       --DBe = '0'
												27 => "0001011011000001", --addi r6, r6, 1  --begin waiting for 40us
												28 => "0010000011001100", --cp r6, r3
												29 => "0100000000011111", --bz r0, 31
												30 => "0100100000011011", --jp 27
												31 => "0001000100100001", --addi r1, r1     --increment message ROM address
												32 => "1000000000100000", --opin 1, 0       --E   = '1' (r1 = 1) sending display set
												33 => "1000000000100011", --opin 1, 3       --DBe = '1'
												34 => "1000000000000000", --opin 0, 0       --E   = '0'
												35 => "1000000000000011", --opin 0, 3       --DBe = '0'
												36 => "0001011111100001", --addi r7, r7, 1  --begin waiting for 40us
												37 => "0010000011101100", --cp r7, r3
												38 => "0100000000101000", --bz r0, 40
												39 => "0100100000100100", --jp 36
												40 => "0001000100100001", --addi r1, r1     --increment message ROM address
												41 => "1000000000100000", --opin 1, 0       --E   = '1' (r1 = 2) sending display clear
												42 => "1000000000100011", --opin 1, 3       --DBe = '1'
												43 => "1000000000000000", --opin 0, 0       --E   = '0'
												44 => "1000000000000011", --opin 0, 3       --DBe = '0'
												45 => "0001011100000000", --addi r7, r0, 0  --reset r7
												46 => "0001011111100001", --addi r7, r7, 1  --begin waiting for 1.60ms
												47 => "0010000011110000", --cp r7, r4
												48 => "0100000000110010", --bz r0, 50
												49 => "0100100000101110", --jp 46
												50 => "1000000000100001", --opin 1, 1       --RS  = '1' begin writing, leave RS = 1
												51 => "0001011100001110", --addi r7, r0, 14
												52 => "0001000100100001", --addi r1, r1     --increment message ROM address //begin writing message
												53 => "1000000000100000", --opin 1, 0       --E   = '1'
												54 => "1000000000100011", --opin 1, 3       --DBe = '1'
												55 => "1000000000000000", --opin 0, 0       --E   = '0'
												56 => "1000000000000011", --opin 0, 3       --DBe = '0'
												57 => "0001011000000000", --addi r6, r0, 0  --reset r6
												58 => "0001011011000001", --addi r6, r6, 1  --pause for 40us
												59 => "0010000011001100", --cp r6, r3
												60 => "0100000000111110", --bz r0, 62
												61 => "0100100000111010", --jp 58           --end pause
												62 => "0010000011100100", --cp r1, r7
												63 => "0100000001000001", --bz 65          
												64 => "0100100000110100", --jp 52           --loop until r1 = 14
												65 => "0100100001000010", --jp 66           --loop forever
												66 => "0100100001000001", --jp 65
												others => "0000000000000000");
												
	begin
			data_out <= iROM(conv_integer(unsigned(addr)));
	end process;

end Behavioral;

