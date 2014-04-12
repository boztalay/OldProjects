----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    22:46:30 06/12/2010 
-- Design Name: 
-- Module Name:    Test_Project - Behavioral 
-- Project Name: 
-- Target Devices: 
-- Tool versions: 
-- Description: 
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

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
library UNISIM;
use UNISIM.VComponents.all;

entity Test_Project is
	Port ( clock : in STD_LOGIC;
--			 switches : in STD_LOGIC_VECTOR(7 downto 0);
			 output : out STD_LOGIC);
end Test_Project;

architecture Behavioral of Test_Project is

signal clock_buf : STD_LOGIC;
signal new_clock : STD_LOGIC;
signal new_clock_buf : STD_LOGIC;

signal DCM1_feedback_in : STD_LOGIC;

begin
	
	--This BUFG buffers the board clock
	board_clk: BUFG
		port map (O => clock_buf,
					 I => clock);
					 
	DCM_1 : DCM
   generic map (
      CLKDV_DIVIDE => 2.0, --  Divide by: 1.5,2.0,2.5,3.0,3.5,4.0,4.5,5.0,5.5,6.0,6.5
                           --     7.0,7.5,8.0,9.0,10.0,11.0,12.0,13.0,14.0,15.0 or 16.0
      CLKFX_DIVIDE => 2,   --  Can be any interger from 1 to 32
		CLKFX_MULTIPLY => 2, --  Can be any integer from 1 to 32
      CLKIN_DIVIDE_BY_2 => TRUE, --  TRUE/FALSE to enable CLKIN divide by two feature
      CLKIN_PERIOD => 40.0,          --  Specify period of input clock
      CLKOUT_PHASE_SHIFT => "NONE", --  Specify phase shift of NONE, FIXED or VARIABLE
      CLK_FEEDBACK => "1X",         --  Specify clock feedback of NONE, 1X or 2X
      DESKEW_ADJUST => "SYSTEM_SYNCHRONOUS", --  SOURCE_SYNCHRONOUS, SYSTEM_SYNCHRONOUS or
                                             --     an integer from 0 to 15
      DFS_FREQUENCY_MODE => "LOW",     --  HIGH or LOW frequency mode for frequency synthesis
      DLL_FREQUENCY_MODE => "LOW",     --  HIGH or LOW frequency mode for DLL
      DUTY_CYCLE_CORRECTION => TRUE, --  Duty cycle correction, TRUE or FALSE
      FACTORY_JF => X"C080",          --  FACTORY JF Values
      PHASE_SHIFT => 0,        --  Amount of fixed phase shift from -255 to 255
      STARTUP_WAIT => FALSE) --  Delay configuration DONE until DCM LOCK, TRUE/FALSE
     port map (
		CLKIN => clock_buf,
		
		CLKFB => DCM1_feedback_in,
		CLK0 => new_clock
		);
		
	--This BUFG buffers DCM1's feedback
	DCM1_feedback: BUF
		port map (O => DCM1_feedback_in,
					 I => new_clock);
					 
	buf_new_clk: BUFG
		port map (O => new_clock_buf,
					 I => new_clock);

	main: process (new_clock_buf) is
--		variable count : STD_LOGIC_VECTOR(7 downto 0);
	begin
--		if rising_edge(clock_buf) then
--			count := count + 1;
--			if count > switches then
--				count := (others => '0');
--				new_clock <= '0';
--			end if;
--			if count = ('0' & switches(7 downto 1)) then
--				new_clock <= '1';
--			end if;
--		end if;
		output <= new_clock_buf;
	end process;

end Behavioral;

