library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

-- Uncomment the following library declaration if instantiating
--- any Xilinx primitives in this code.
library UNISIM;
use UNISIM.VComponents.all;

entity tests is
	Port (clock : in STD_LOGIC;
			switches : in STD_LOGIC_VECTOR(7 downto 0);
			read_enable : in STD_LOGIC;
			reset : in STD_LOGIC;
			write_enable : in STD_LOGIC;
			anodes : out STD_LOGIC_VECTOR(3 downto 0);
			decoder_out : out STD_LOGIC_VECTOR(6 downto 0);
			test_led1 : out STD_LOGIC;
			test_led2 : out STD_LOGIC;
			empty : out STD_LOGIC;
			full : out STD_LOGIC);
end tests;

architecture Behavioral of tests is

--Queue component delcaration
component FIFO
	port (
	din: IN std_logic_VECTOR(7 downto 0);
	rd_clk: IN std_logic;
	rd_en: IN std_logic;
	rst: IN std_logic;
	wr_clk: IN std_logic;
	wr_en: IN std_logic;
	dout: OUT std_logic_VECTOR(7 downto 0);
	empty: OUT std_logic;
	full: OUT std_logic);
end component;

-- Synplicity black box declaration
attribute syn_black_box : boolean;
attribute syn_black_box of FIFO: component is true;

component Debouncer is
    Port ( clock : in  STD_LOGIC;
           reset : in  STD_LOGIC;
           input : in  STD_LOGIC;
           output : out  STD_LOGIC);
end component;

component four_dig_7seg is
    Port ( clock : in  STD_LOGIC;
           display_data : in  STD_LOGIC_VECTOR (15 downto 0);
           anodes : out  STD_LOGIC_VECTOR (3 downto 0);
           to_display : out  STD_LOGIC_VECTOR (6 downto 0));
end component;

signal read_clock : STD_LOGIC;
signal write_clock : STD_LOGIC;

signal deb_read_enable : STD_LOGIC;
signal deb_write_enable : STD_LOGIC;

signal FIFO_data_out : STD_LOGIC_VECTOR(7 downto 0);

signal display_data : STD_LOGIC_VECTOR(15 downto 0);

signal address_reg : STD_LOGIC_VECTOR(22 downto 0);
signal address_reg_enable : STD_LOGIC;

begin

	process (clock, reset)
		variable count : STD_LOGIC_VECTOR(25 downto 0);
	begin
		if reset = '1' then
			count := (others => '0');
		elsif rising_edge(clock) then
			if address_reg_enable = '1' then
				count := count + 1;
			end if;
		end if;
		read_clock <= count(25);
		write_clock <= count(25);
	end process;
	
	process(clock, reset)
	begin
		if reset = '1' then
			address_reg <= (others => '0');
		elsif rising_edge(clock) then
			address_reg <= address_reg + 1;
		end if;
	end process;

	--The camera queue
	CQ : FIFO
		port map (
			din => switches,
			rd_clk => read_clock,
			rd_en => deb_read_enable,
			rst => reset,
			wr_clk => write_clock,
			wr_en => deb_write_enable,
			dout => FIFO_data_out,
			empty => empty,
			full => full);
			
	rclk : Debouncer port map (clock => clock,
										reset => reset,
										input => read_enable,
										output => deb_read_enable);
	
	wclk : Debouncer port map (clock => clock,
										reset => reset,
										input => write_enable,
										output => deb_write_enable);
										
	display : four_dig_7seg port map (clock => clock,
												 display_data => display_data,
												 anodes => anodes,
												 to_display => decoder_out);
	
	display_data <= x"00" & FIFO_data_out;
	
	test_led1 <= read_clock;
	test_led2 <= write_clock;
	
	address_reg_enable <= '1';

end Behavioral;
