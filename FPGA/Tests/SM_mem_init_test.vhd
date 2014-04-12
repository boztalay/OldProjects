library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity SM_mem_init_test is
	Port (clock : in STD_LOGIC;
			reset : in STD_LOGIC;
			
			RAM_wait : in STD_LOGIC;
			
			memory_data_bus : inout STD_LOGIC_VECTOR(15 downto 0);
			memory_address_bus : out STD_LOGIC_VECTOR(22 downto 0);
			
			SM_reset : out STD_LOGIC;
			
			RAM_ce : out STD_LOGIC;
			RAM_we : out STD_LOGIC;
			RAM_oe : out STD_LOGIC;
			RAM_lb : out STD_LOGIC;
			RAM_ub : out STD_LOGIC;
			RAM_cre : out STD_LOGIC;
			RAM_adv : out STD_LOGIC;
			RAM_clk : out STD_LOGIC);
end entity;

architecture Behavioral of SM_mem_init_test is

component four_dig_7seg is
    Port ( clock : in  STD_LOGIC;
           display_data : in  STD_LOGIC_VECTOR (15 downto 0);
           anodes : out  STD_LOGIC_VECTOR (3 downto 0);
           to_display : out  STD_LOGIC_VECTOR (6 downto 0));
end component;

signal state : STD_LOGIC_VECTOR(4 downto 0);
signal SM_wait_counter : STD_LOGIC_VECTOR(2 downto 0);

signal clk_100MHz : STD_LOGIC;
signal RAM_clk_en : STD_LOGIC;

signal output_enable : STD_LOGIC;
signal memory_data_bus_in : STD_LOGIC_VECTOR(15 downto 0);
signal memory_data_bus_out : STD_LOGIC_VECTOR(15 downto 0);

signal collected_data : STD_LOGIC_VECTOR(15 downto 0);

begin

	--The state machine
	process (clk_100MHz, reset)
	begin
		if reset = '1' then
			state <= "00000";
			SM_reset <= '1';
			SM_wait_counter <= "000";
			output_enable <= '0';
			RAM_ce <= '1';
			RAM_we <= '1';
			RAM_oe <= '0';
			RAM_adv <= '1';
			RAM_lb <= '0';
			RAM_ub <= '0';
			RAM_cre <= '0';
			RAM_clk_en <= '0';
		elsif falling_edge(clk_100MHz) then
			case state is
				--These first states put the memory into synchronous mode
				--Read cycle one
				when "00000" =>
					SM_reset <= '1';
					RAM_ce <= '0';
					RAM_we <= '1';
					RAM_oe <= '0';
					RAM_lb <= '0';
					RAM_ub <= '0';
					RAM_clk_en <= '0';
					RAM_cre <= '0';
					memory_address_bus <= (others => '1');
			
					if SM_wait_counter = "111" then
						SM_wait_counter <= "000";
						state <= "00001";
					else
						SM_wait_counter <= SM_wait_counter + 1;
						state <= "00000";
					end if;
				when "00001" =>
					RAM_ce <= '1';

					if SM_wait_counter = "111" then
						SM_wait_counter <= "000";
						state <= "00010";
					else
						SM_wait_counter <= SM_wait_counter + 1;
						state <= "00001";
					end if;
					
				--Read cycle two
				when "00010" =>
					RAM_ce <= '0';
					memory_address_bus <= (others => '1');
					
					if SM_wait_counter = "111" then
						SM_wait_counter <= "000";
						state <= "00011";
					else
						SM_wait_counter <= SM_wait_counter + 1;
						state <= "00010";
					end if;
				when "00011" =>
					RAM_ce <= '1';

					if SM_wait_counter = "111" then
						SM_wait_counter <= "000";
						state <= "00100";
					else
						SM_wait_counter <= SM_wait_counter + 1;
						state <= "00011";
					end if;
					
				--Write cycle one
				when "00100" =>
					--Setup state for the first write cycle
					RAM_oe <= '1';
					RAM_ce <= '0';
					memory_address_bus <= (others => '1');
					output_enable <= '1';
					memory_data_bus_out <= x"0001";
					
					if SM_wait_counter = "111" then
						SM_wait_counter <= "000";
						state <= "00101";
					else
						SM_wait_counter <= SM_wait_counter + 1;
						state <= "00100";
					end if;
				when "00101" =>
					--Second half of the first write cycle
					RAM_we <= '0';
					
					if SM_wait_counter = "111" then
						SM_wait_counter <= "000";
						state <= "00110";
					else
						SM_wait_counter <= SM_wait_counter + 1;
						state <= "00101";
					end if;
				when "00110" =>
					RAM_ce <= '1';
					
					if SM_wait_counter = "111" then
						SM_wait_counter <= "000";
						state <= "00111";
					else
						SM_wait_counter <= SM_wait_counter + 1;
						state <= "00110";
					end if;
				
				--Second write cycle
				when "00111" =>
					RAM_ce <= '0';
					memory_data_bus_out <= b"0001110101001111"; --BCR data
					
					if SM_wait_counter = "111" then
						SM_wait_counter <= "000";
						state <= "01000";
					else
						SM_wait_counter <= SM_wait_counter + 1;
						state <= "00111";
					end if;
				when "01000" =>
					output_enable <= '0';
					RAM_ce <= '1';
					
					if SM_wait_counter = "111" then
						SM_wait_counter <= "000";
						state <= "01001"; 
					else
						SM_wait_counter <= SM_wait_counter + 1;
						state <= "01000";
					end if;
				
				--End of initialization, begin normal operation

				--Wait state, also enable RAM_clk
				when "01001" => 
					RAM_clk_en <= '1';
					output_enable <= '1';
					state <= "01010";
					
				--Set up the signals for a write
				when "01010" =>
					RAM_ce <= '0';
					RAM_adv <= '0';
					RAM_we <= '0';
					RAM_oe <= '1';
					memory_address_bus <= b"00000000000000000000001";
					state <= "01011";
					
				--Wait for RAM_wait
				when "01100" =>
					RAM_adv <= '0';
					
					if RAM_wait = '1' then
						state <= "01101";
					else
						state <= "01100";
					end if;
				
				--Begin the writes
				when "01101" =>
					memory_data_bus_out <= x"000F";
					state <= "01110";
					
				when "01110" =>
					memory_data_bus_out <= x"000E";
					state <= "01111";
					
				when "01111" =>
					memory_data_bus_out <= x"000D";
					state <= "10000";
					
				when "10000" =>
					memory_data_bus_out <= x"000C";
					state <= "10001";
					
				--End the write
				when "10001" =>
					RAM_ce <= '1';
					state <= "10010";
					
				--A wait cycle
				when "10010" =>
					state <= "10011";
					
				--Set up the signals for a read
				when "10011" =>
					RAM_ce <= '0';
					RAM_adv <= '0';
					RAM_oe <= '0';
					RAM_we <= '1';
					output_enable <= '0';
					memory_address_bus <= b"00000000000000000000001";
					state <= "10100";
					
				--Read into a register
				when "10100" =>
					collected_data(3 downto 0) <= memory_data_bus_in(3 downto 0);
					state <= "10101";
					
				when "10101" =>
					collected_data(7 downto 4) <= memory_data_bus_in(3 downto 0);
					state <= "10110";
					
				when "10110" =>
					collected_data(11 downto 8) <= memory_data_bus_in(3 downto 0);
					state <= "10111";
					
				when "10111" =>
					collected_data(15 downto 12) <= memory_data_bus_in(3 downto 0);
					state <= "11000";
					
				--End the read and wait here
				when "11000" => 
					RAM_ce <= '1';
					RAM_oe <= '1';
					RAM_we <= '1';
					state <= "11000";
					
				when others =>
					state <= "00000";
			
			end case;
		end if;
	end process;
	
	--A tristate buffer for the memory data bus
	tristate : process (output_enable, memory_data_bus_in)
	begin
		if output_enable = '1' then
			memory_data_bus <= memory_data_bus_out;
		else
			memory_data_bus <= (others => 'Z');
		end if;
		
		memory_data_bus_in <= memory_data_bus;
	end process;
	
	--Handles the enabling of the RAM clock
	RAM_clock : process (RAM_clk, RAM_clk_en)
	begin
		if RAM_clk_en = '1' then
			RAM_clk <= clk_100MHz;
		else
			RAM_clk <= 'Z';
		end if;
	end process;
	
	display: four_dig_7seg port map (clock => clock,
												display_data => collected_data,
												anodes => anodes,
												to_display => decoder_out);
	
	clk_100MHz <= clock;
	
					
end Behavioral;