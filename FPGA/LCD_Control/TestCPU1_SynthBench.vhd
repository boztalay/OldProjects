----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    01:36:51 10/15/2009 
-- Design Name: 
-- Module Name:    TestCPU1_SynthBench - Behavioral 
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

---- Uncomment the following library declaration if instantiating
---- any Xilinx primitives in this code.
library UNISIM;
use UNISIM.VComponents.all;

entity TestCPU1_SynthBench is
	Port ( board_clk : in STD_LOGIC;
			 anodes : out STD_LOGIC_VECTOR(3 downto 0);
			 out_pins : out STD_LOGIC_VECTOR(31 downto 0);
			 LCD_DB : out STD_LOGIC_VECTOR(7 downto 0);
			 r2 : out STD_LOGIC_VECTOR(15 downto 0);
			 r5 : out STD_LOGIC_VECTOR(15 downto 0);
			 CPU_clk : out STD_LOGIC);
end TestCPU1_SynthBench;

architecture Behavioral of TestCPU1_SynthBench is

--//Component Declarations\\--

component TestCPU1 is
	Port ( clock : in STD_LOGIC;
			 reset : in STD_LOGIC;
			 out_pins : out STD_LOGIC_VECTOR(31 downto 0);
			 reg_1 : out STD_LOGIC_VECTOR(15 downto 0);
			 reg_2 : out STD_LOGIC_VECTOR(15 downto 0);
			 reg_5 : out STD_LOGIC_VECTOR(15 downto 0));
end component;

component mROM is
    Port ( enable : in  STD_LOGIC;
           address : in  STD_LOGIC_VECTOR (4 downto 0);
           data_out : out  STD_LOGIC_VECTOR (7 downto 0));
end component;

--\\Component Declarations//--

--//Signal Declarations\\--

signal buf_board_clk : STD_LOGIC;
signal buf_clock : STD_LOGIC;
signal clk_to_CPU : STD_LOGIC;
signal buf_clk_to_CPU : STD_LOGIC;
signal DCM_sig : STD_LOGIC;
signal mROM_e : STD_LOGIC;
signal mROM_addr : STD_LOGIC_VECTOR(15 downto 0);
signal output_pins : STD_LOGIC_VECTOR(31 downto 0);

--\\Signal Declarations//--

begin

	IBUFG_inst : IBUFG
		generic map (
		IOSTANDARD => "DEFAULT")
		port map (
		O => buf_board_clk, -- Clock buffer output
		I => board_clk -- Clock buffer input (connect directly to top-level port)
	);
	
	BUFG_CPUclk : BUFG
		port map (
		O => buf_clk_to_CPU,
		I => clk_to_CPU
	);
	
	DCM_main_clk : DCM --Divides 50 MHz clock to 5 MHz
   -- The following generics are only necessary if you wish to change the default behavior.
   generic map (
      CLKDV_DIVIDE => 2.0, --  Divide by: 1.5,2.0,2.5,3.0,3.5,4.0,4.5,5.0,5.5,6.0,6.5
                           --     7.0,7.5,8.0,9.0,10.0,11.0,12.0,13.0,14.0,15.0 or 16.0
      CLKFX_DIVIDE => 20,   --  Can be any interger from 1 to 32
		CLKFX_MULTIPLY => 2, --  Can be any integer from 1 to 32
      CLKIN_DIVIDE_BY_2 => FALSE, --  TRUE/FALSE to enable CLKIN divide by two feature
      CLKIN_PERIOD => 20.0,          --  Specify period of input clock
      CLKOUT_PHASE_SHIFT => "NONE", --  Specify phase shift of NONE, FIXED or VARIABLE
      CLK_FEEDBACK => "NONE",         --  Specify clock feedback of NONE, 1X or 2X
      DESKEW_ADJUST => "SYSTEM_SYNCHRONOUS", --  SOURCE_SYNCHRONOUS, SYSTEM_SYNCHRONOUS or
                                             --     an integer from 0 to 15
      DFS_FREQUENCY_MODE => "LOW",     --  HIGH or LOW frequency mode for frequency synthesis
      DLL_FREQUENCY_MODE => "LOW",     --  HIGH or LOW frequency mode for DLL
      DUTY_CYCLE_CORRECTION => TRUE, --  Duty cycle correction, TRUE or FALSE
      FACTORY_JF => X"C080",          --  FACTORY JF Values
      PHASE_SHIFT => 0,        --  Amount of fixed phase shift from -255 to 255
      STARTUP_WAIT => FALSE) --  Delay configuration DONE until DCM LOCK, TRUE/FALSE
   port map (
      CLKFX => DCM_sig,   -- DCM CLK synthesis out (M/D)
      CLKIN => buf_board_clk   -- Clock input (from IBUFG, BUFG or DCM)
	);
	
	DCM_smaller_clk : DCM --Divides 5 MHz down to 1 MHz
   -- The following generics are only necessary if you wish to change the default behavior.
   generic map (
      CLKDV_DIVIDE => 2.0, --  Divide by: 1.5,2.0,2.5,3.0,3.5,4.0,4.5,5.0,5.5,6.0,6.5
                           --     7.0,7.5,8.0,9.0,10.0,11.0,12.0,13.0,14.0,15.0 or 16.0
      CLKFX_DIVIDE => 10,   --  Can be any interger from 1 to 32
		CLKFX_MULTIPLY => 2, --  Can be any integer from 1 to 32
      CLKIN_DIVIDE_BY_2 => FALSE, --  TRUE/FALSE to enable CLKIN divide by two feature
      CLKIN_PERIOD => 50.0,          --  Specify period of input clock
      CLKOUT_PHASE_SHIFT => "NONE", --  Specify phase shift of NONE, FIXED or VARIABLE
      CLK_FEEDBACK => "NONE",         --  Specify clock feedback of NONE, 1X or 2X
      DESKEW_ADJUST => "SYSTEM_SYNCHRONOUS", --  SOURCE_SYNCHRONOUS, SYSTEM_SYNCHRONOUS or
                                             --     an integer from 0 to 15
      DFS_FREQUENCY_MODE => "LOW",     --  HIGH or LOW frequency mode for frequency synthesis
      DLL_FREQUENCY_MODE => "LOW",     --  HIGH or LOW frequency mode for DLL
      DUTY_CYCLE_CORRECTION => TRUE, --  Duty cycle correction, TRUE or FALSE
      FACTORY_JF => X"C080",          --  FACTORY JF Values
      PHASE_SHIFT => 0,        --  Amount of fixed phase shift from -255 to 255
      STARTUP_WAIT => FALSE) --  Delay configuration DONE until DCM LOCK, TRUE/FALSE
   port map (
      CLKFX => clk_to_CPU,   -- DCM CLK synthesis out (M/D)
      CLKIN => DCM_sig   -- Clock input (from IBUFG, BUFG or DCM)
	);


	CPU: TestCPU1 port map (clock => buf_clk_to_CPU, out_pins => output_pins, reset => '0',
									reg_1 => mROM_addr, reg_2 => r2, reg_5 => r5);
	MessageROM: mROM port map (output_pins(3), mROM_addr(4 downto 0), LCD_DB);

	CPU_clk <= buf_clk_to_CPU;
	out_pins <= output_pins;
	anodes <= b"1111";

end Behavioral;

