----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    19:05:03 07/02/2010 
-- Design Name: 
-- Module Name:    Sync_Mem - Behavioral 
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

entity Sync_Mem is
		Port( clock : in STD_LOGIC;
				reset : in STD_LOGIC;
				
				RAM_wait : in STD_LOGIC;
				
				memory_data_bus : inout STD_LOGIC_VECTOR(15 downto 0);
				memory_address_bus : out STD_LOGIC_VECTOR(22 downto 0);
				
				anodes : out STD_LOGIC_VECTOR(3 downto 0);
				decoder_out : out STD_LOGIC_VECTOR(6 downto 0);
			 
				RAM_ce : out STD_LOGIC;
				RAM_lb : out STD_LOGIC;
				RAM_ub : out STD_LOGIC;
				RAM_adv : out STD_LOGIC;
				RAM_cre : out STD_LOGIC;
				RAM_clk : out STD_LOGIC;
				RAM_oe : out STD_LOGIC;
				RAM_we : out STD_LOGIC;
			 
				flash_ce : out STD_LOGIC);
end Sync_Mem;

architecture Behavioral of Sync_Mem is

component four_dig_7seg is
    Port ( clock : in  STD_LOGIC;
           display_data : in  STD_LOGIC_VECTOR (15 downto 0);
           anodes : out  STD_LOGIC_VECTOR (3 downto 0);
           to_display : out  STD_LOGIC_VECTOR (6 downto 0));
end component;

signal write_enable : STD_LOGIC;

signal data_in : STD_LOGIC_VECTOR(15 downto 0);
signal data_out : STD_LOGIC_VECTOR(15 downto 0);

signal clk_200MHz : STD_LOGIC;

signal read_data : STD_LOGIC_VECTOR(15 downto 0);

signal state : STD_LOGIC_VECTOR(3 downto 0);

begin

	DCM_1 : DCM
   generic map (
      CLKDV_DIVIDE => 2.0, --  Divide by: 1.5,2.0,2.5,3.0,3.5,4.0,4.5,5.0,5.5,6.0,6.5
                           --     7.0,7.5,8.0,9.0,10.0,11.0,12.0,13.0,14.0,15.0 or 16.0
      CLKFX_DIVIDE => 2,   --  Can be any interger from 1 to 32
		CLKFX_MULTIPLY => 8, --  Can be any integer from 1 to 32
      CLKIN_DIVIDE_BY_2 => FALSE, --  TRUE/FALSE to enable CLKIN divide by two feature
      CLKIN_PERIOD => 20.0,          --  Specify period of input clock
      CLKOUT_PHASE_SHIFT => "NONE", --  Specify phase shift of NONE, FIXED or VARIABLE
      CLK_FEEDBACK => "NONE",         --  Specify clock feedback of NONE, 1X or 2X
      DESKEW_ADJUST => "SYSTEM_SYNCHRONOUS", --  SOURCE_SYNCHRONOUS, SYSTEM_SYNCHRONOUS or
                                             --     an integer from 0 to 15
      DFS_FREQUENCY_MODE => "HIGH",     --  HIGH or LOW frequency mode for frequency synthesis
      DLL_FREQUENCY_MODE => "LOW",     --  HIGH or LOW frequency mode for DLL
      DUTY_CYCLE_CORRECTION => TRUE, --  Duty cycle correction, TRUE or FALSE
      FACTORY_JF => X"C080",          --  FACTORY JF Values
      PHASE_SHIFT => 0,        --  Amount of fixed phase shift from -255 to 255
      STARTUP_WAIT => FALSE) --  Delay configuration DONE until DCM LOCK, TRUE/FALSE
   port map (
      CLKFX => clk_200MHz,   -- DCM CLK synthesis out (M/D)
      CLKIN => clock
		);

	state_machine: process(clk_200MHz, reset, state)
	begin
		if reset = '1' then
			state <= "0000";
		elsif falling_edge(clk_200MHz) then
			case (state) is
				when "0000" =>
					memory_address_bus <= b"00000000000000000000001";
					write_enable <= '0';
					RAM_adv <= '0';
					RAM_ce <= '0';
					RAM_we <= '0';
					RAM_oe <= '1';
					state <= "0001";
				when "0001" =>
					RAM_adv <= '1';
					--Wait for WAIT to go high
					if RAM_wait = '0' then
						state <= "0001";
					else
						state <= "0010";
						write_enable <= '1';
						data_out <= x"98DA";
					end if;
				when "0010" =>
					state <= "0110";
					RAM_ce <= '1';
					write_enable <= '0';
				when "0110" =>
					RAM_ce <= '0';
					RAM_adv <= '0';
					RAM_oe <= '0';
					RAM_we <= '1';
					state <= "0111";
				when "0111" =>
					RAM_adv <= '1';
					--Wait for WAIT
					if RAM_wait = '0' then
						state <= "0111";
					else
						state <= "1001";
						read_data <= data_in;
					end if;
				when "1001" =>
					state <= "1100";
					RAM_ce <= '1';
				when others =>
					state <= "1100";
			end case;
		end if;
	end process;
	
	--This models a 3-state buffer for using the bidirectional data bus
	buffer3 : process (write_enable, data_in, data_out) is
	begin
		if write_enable = '1' then
			memory_data_bus <= data_out;
		--Otherwise, don't drive the bus
		else
			memory_data_bus <= "ZZZZZZZZZZZZZZZZ";
		end if;
		data_in <= memory_data_bus;
	end process;
	
	display: four_dig_7seg port map (clock => clock,
												display_data => read_data,
												anodes => anodes,
												to_display => decoder_out);
	
	RAM_clk <= clk_200MHz;

end Behavioral;

