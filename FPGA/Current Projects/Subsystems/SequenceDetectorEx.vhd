----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 		 Ben Oztalay
-- 
-- Create Date:    21:41:11 09/24/2009 
-- Design Name: 
-- Module Name:    SequenceDetectorEx - Behavioral 
-- Project Name: 
-- Target Devices: 
-- Tool versions: 
-- Description:    A simple state machine that detects sequences of three 1s in a
--                 binary string and outputs a 1 with the third 1 of every sequence.
-- Dependencies: 
--
-- Revision: 
-- Revision 0.01 - File Created
-- Revision 0.70 - VHDL Written and debugged
-- Revision 1.00 - Successful simulation
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

entity SequenceDetectorEx is
    Port ( clock  : in  STD_LOGIC;
			  reset  : in  STD_LOGIC;
			  input  : in  STD_LOGIC;
           output : out STD_LOGIC);
end SequenceDetectorEx;

architecture StateMachine of SequenceDetectorEx is

type states is (A, B, C);
signal present_state, next_state : states;

begin

	goto_state: process (clock, reset, next_state) is
	begin
		if reset = '1' then
			present_state <= A;
		elsif (rising_edge(clock)) then
			present_state <= next_state;
		end if;
	end process;
	
	states_proc: process (clock, reset, input, present_state) is
	begin
		case present_state is
			when A =>
				output <= '0';
				if input = '1' then
					next_state <= B;
				else
					next_state <= A;
				end if;		
			when B =>
				output <= '0';
				if input = '1' then
					next_state <= C;
				else
					next_state <= A;
				end if;
			when C =>
				if input = '1' then
					output <= '1';
					next_state <= C;
				else
					output <= '0';
					next_state <= A;
				end if;
		end case;
	end process;

end StateMachine;

