library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity memory is
	Port (
		clk80 : in std_logic; 
		rst : in std_logic;
		
		cam_vs : in STD_LOGIC;
		vid_vs : in STD_LOGIC;
		
		empty : out STD_LOGIC;
		full : out STD_LOGIC;
		
		CQ_write_en : in STD_LOGIC;
--		CQ_write_clk : in STD_LOGIC;
		CQ_data_in : in STD_LOGIC_VECTOR(15 downto 0);
		
		VQ_read_en : in STD_LOGIC;
--		VQ_read_clk : in STD_LOGIC;
		VQ_data_out : out STD_LOGIC_VECTOR(15 downto 0);
		
		RAM_addr : out std_logic_vector(22 downto 0);
		RAM_data_out : out std_logic_vector(15 downto 0);
		RAM_data_in : in std_logic_vector(15 downto 0);
		RAM_oe : out std_logic;
		RAM_we : out std_logic;
		RAM_adv : out std_logic;
		RAM_clk_en : out std_logic;
		RAM_ub : out std_logic;
		RAM_lb : out std_logic;
		RAM_ce : out std_logic;
		RAM_cre : out std_logic;
		RAM_wait : in std_logic;
		led : out std_logic_vector(7 downto 0)
	);
end memory;

architecture Behavioral of memory is

type state_type is (start, cfgmem, cfgmem_wait, cfgmem_done, cfgReadAry, cfgReadAry_wait, waitstate, 
						  mem_write_init, mem_write_init_wait_high, mem_write_init_wait, mem_write_data, 
						  mem_write_end, mem_read_init, mem_read_init_wait_high, mem_read_init_wait, 
						  mem_read_data, mem_read_end);
						  
signal state, next_state : state_type;

signal RAM_addr_s : std_logic_vector(22 downto 0);
signal RAM_oe_s : std_logic;

signal latency_cnt : integer;
signal data_in_reg : std_logic_vector(15 downto 0);

signal CQ_empty : STD_LOGIC;
signal CQ_read_en : STD_LOGIC;
signal CQ_data_out : STD_LOGIC_VECTOR(15 downto 0);

signal VQ_full : STD_LOGIC;
signal VQ_write_en : STD_LOGIC;
signal VQ_data_in : STD_LOGIC_VECTOR(15 downto 0);

signal write_addr_reg : STD_LOGIC_VECTOR(22 downto 0);
signal write_addr_inc : STD_LOGIC;

signal read_addr_reg : STD_LOGIC_VECTOR(22 downto 0);
signal read_addr_inc : STD_LOGIC;

signal RAM_data_in_reg : STD_LOGIC_VECTOR(15 downto 0);

signal VQ_data_in_reg : STD_LOGIC_VECTOR(15 downto 0);
signal VQ_write_en_reg : STD_LOGIC;
signal CQ_read_en_reg : STD_LOGIC;

----Queue component delcaration
--component FIFO
--	port (
--	din: IN std_logic_VECTOR(15 downto 0);
--	rd_clk: IN std_logic;
--	rd_en: IN std_logic;
--	rst: IN std_logic;
--	wr_clk: IN std_logic;
--	wr_en: IN std_logic;
--	dout: OUT std_logic_VECTOR(15 downto 0);
--	empty: OUT std_logic;
--	full: OUT std_logic);
--end component;
--
---- Synplicity black box declaration
--attribute syn_black_box : boolean;
--attribute syn_black_box of FIFO: component is true;

component fifo is
	port(
		CLR : in std_logic;
		CLK : in std_logic;
		RD : in std_logic;
		WR : in std_logic;
		DATA : in std_logic_vector(15 downto 0);
		EMPTY : out std_logic;
		FULL : out std_logic;
		Q : out std_logic_vector(15 downto 0)
	);
end component;

begin

RAM_oe <= RAM_oe_s;
RAM_addr <= RAM_addr_s;

empty <= CQ_empty;
full <= VQ_full;

CQ : fifo
	port map (	
		clr => rst,
		clk => clk80,
		rd => CQ_read_en,
		wr => CQ_write_en,
		data => CQ_data_in,
		empty => CQ_empty,
		q => CQ_data_out);
		
VQ : fifo
	port map (	
		clr => rst,
		clk => clk80,
		rd => VQ_read_en,
		wr => VQ_write_en,
		data => VQ_data_in,
		full => VQ_full,
		q => VQ_data_out);

----The camera queue
--CQ : FIFO
--	port map (
--		din => CQ_data_in,
--		rd_clk => clk80,
--		rd_en => CQ_read_en_reg,
--		rst => rst,
--		wr_clk => CQ_write_clk,
--		wr_en => CQ_write_en,
--		dout => CQ_data_out,
--		empty => CQ_empty);
--		
----The video queue
--VQ : FIFO
--	port map (
--		din => VQ_data_in_reg,
--		rd_clk => VQ_read_clk,
--		rd_en => VQ_read_en,
--		rst => rst,
--		wr_clk => clk80,
--		wr_en => VQ_write_en_reg,
--		dout => VQ_data_out,
--		full => VQ_full);

RAM_control_SM: process(clk80, rst)
begin
	if rst='1' then
		state <= start;
		latency_cnt <= 0;
	elsif clk80'event and clk80='1' then
		if state /= next_state then
			latency_cnt <= 1;
		else
			latency_cnt <= latency_cnt + 1;
		end if;
		state <= next_state;
	end if;
end process;

RAM_control_NextState: process(state, latency_cnt, RAM_wait)
begin	
	case state is
			--Configuring the memory
			when start => 
				next_state <= cfgMem;
			when cfgmem =>
				if latency_cnt < 7 then
					next_state <= cfgmem;
				else
					next_state <= cfgMem_wait;
				end if;
			when cfgmem_wait =>
				--wait is active high (default)
				if latency_cnt < 7 then		   
					next_state <= cfgMem_wait;
				else   
					next_state <= cfgmem_done;
				end if;
			when cfgmem_done =>
				if latency_cnt < 4 then
					next_state <= cfgmem_done;
				else
					next_state <= cfgReadAry;
				end if;
			when cfgReadAry =>
				if latency_cnt < 7 then		   
					next_state <= cfgReadAry;
				else
					next_state <= cfgReadAry_wait;
				end if;
			when cfgReadAry_wait =>
				if latency_cnt < 7 then		   
					next_state <= cfgReadAry_wait;
				else
					next_state <= waitstate;
				end if;
			when waitstate =>
				if latency_cnt < 7 then
					next_state <= waitstate;
				else
					next_state <= mem_write_init;
				end if;
			
			--Initiate a write to memory
			when mem_write_init =>
				next_state <= mem_write_init_wait_high;
			when mem_write_init_wait_high =>
				if RAM_wait = '1' then
					next_state <= mem_write_init_wait;
				else
					next_state <= mem_write_init_wait_high;
				end if;
			when mem_write_init_wait =>	   			   
				if RAM_wait = '1' then		   
					next_state <= mem_write_init_wait;
				else   				
					next_state <= mem_write_data;
				end if;
				
			--Write data
			when mem_write_data =>
				if CQ_empty = '1' then
					next_state <= mem_write_end;
				else
					next_state <= mem_write_data;
				end if;
			when mem_write_end =>
				if latency_cnt <= 2 then
					next_state <= mem_write_end;
				else
					next_state <= mem_read_init;
				end if;
				
			--Initiate a read from memory
			when mem_read_init =>
				next_state <= mem_read_init_wait_high;
			when mem_read_init_wait_high =>
				if RAM_wait = '1' then
					next_state <= mem_read_init_wait;
				else
					next_state <= mem_read_init_wait_high;
				end if;
			when mem_read_init_wait =>
				if RAM_wait = '1' then		   
					next_state <= mem_read_init_wait;
				else   				
					next_state <= mem_read_data;
				end if;
				
			--Read data from memory
			when mem_read_data =>
				if VQ_full = '1' then
					next_state <= mem_read_end;
				else
					next_state <= mem_read_data;
				end if;
			when mem_read_end =>
				if latency_cnt <= 2 then
					next_state <= mem_read_end;
				else
					next_state <= mem_write_init;
				end if;
				
			when others => null;
		end case;
end process;
			
RAM_controller: process(state, RAM_data_in, latency_cnt)
begin							   
		RAM_clk_en <= '1';						 
		RAM_oe_s <= '1';
		RAM_we <= '1';
		RAM_adv <= '1';
		RAM_ub <= '0';
		RAM_lb <= '0';
		RAM_ce <= '1';
		RAM_cre <= '0';
		RAM_addr_s <= (others => '0');
		RAM_data_out <= (others => '0');
		
		CQ_read_en <= '0';
		VQ_write_en <= '0';
		VQ_data_in <= (others => '0');
		
		write_addr_inc <= '0';
		read_addr_inc <= '0';
		
		case state is
			--Configure the memory
			when start => 
				RAM_clk_en <= '0';	 
			when cfgmem =>
				RAM_clk_en <= '0';	 
				RAM_addr_s <= "00010000001110100011111";
				RAM_cre <= '1';
				RAM_adv <= '0';
				RAM_ce <= '0';				
				RAM_we <= '0';				
			when cfgmem_wait =>
				--wait is active high (default)
				RAM_clk_en <= '0';	  
				RAM_addr_s <= "00010000001110100011111";
				RAM_ce <= '0';				
			when cfgmem_done =>
				RAM_clk_en <= '0';	  
				RAM_ce <= '1';				
			when cfgReadAry =>
				RAM_clk_en <= '0';	  
				RAM_ce <= '0';
				RAM_adv <= '0';				  
				RAM_oe_s <= '0';
			when cfgReadAry_wait =>
				RAM_clk_en <= '0';	  										                                                                                                                                                                                                                                                                                                                                                                                                                                                           
				RAM_ce <= '0';
				RAM_adv <= '0';				  
				RAM_oe_s <= '0';
				if latency_cnt >= 3 then		   
					RAM_adv <= '1';				
				end if;
			when waitstate =>
			
			--Initiate a write to memory
			when mem_write_init =>
				RAM_addr_s <= write_addr_reg;
				RAM_ce <= '0';
				RAM_adv <= '0';
				RAM_we <= '0';	
			when mem_write_init_wait_high =>
				RAM_ce <= '0';	
			when mem_write_init_wait =>
				RAM_ce <= '0';
				if RAM_wait = '1' then
					CQ_read_en <= '1';
				end if;
				
			--Write data
			when mem_write_data =>
				RAM_ce <= '0';
				RAM_data_out <= CQ_data_out;
				write_addr_inc <= '1';
				if CQ_empty = '0' then
					CQ_read_en <= '1';
				end if;
			when mem_write_end =>
				--All taken care of in defaults
				
			--Initiate a read from memory
			when mem_read_init =>
				RAM_addr_s <= read_addr_reg;
				RAM_ce <= '0';
				RAM_adv <= '0';			
			when mem_read_init_wait_high =>
				RAM_ce <= '0';	
				RAM_oe_s <= '0';			
			when mem_read_init_wait =>
				RAM_ce <= '0';
				RAM_oe_s <= '0';
				
			--Read data
			when mem_read_data =>
				RAM_ce <= '0';
				if VQ_full = '0' then
					VQ_data_in <= RAM_data_in_reg;
					VQ_write_en <= '1';
					read_addr_inc <= '1';
				end if;
			when mem_read_end =>
				--Taken care of up top in defaults
			
			when others => null;
		end case;
end process;

datainreg: process (clk80, rst)
begin
	if rst='1' then
		RAM_data_in_reg <= (others => '0');
	elsif clk80'event and clk80='1' then
		RAM_data_in_reg <= RAM_data_in;
	end if;
end process;

address_regs: process (clk80, rst, cam_vs, vid_vs)
begin
	if rst = '1' then
		write_addr_reg <= (others => '0');
		read_addr_reg <= (others => '0');
	elsif cam_vs = '1' then --syncs high
		write_addr_reg <= (others => '0');
	elsif vid_vs = '0' then
		read_addr_reg <= (others => '0');
	elsif falling_edge(clk80) then
		if write_addr_inc = '1' then
			write_addr_reg <= write_addr_reg + 1;
		end if;
		
		if read_addr_inc = '1' then
			read_addr_reg <= read_addr_reg + 1;
		end if;
	end if;
end process;

fifo_regs: process (clk80, rst)
begin
	if rst = '1' then
		CQ_read_en_reg <= '0';
		VQ_write_en_reg <= '0';
		VQ_data_in_reg <= (others => '0');
	elsif falling_edge(clk80) then
		CQ_read_en_reg <= CQ_read_en;
		VQ_write_en_reg <= VQ_write_en;
		VQ_data_in_reg <= VQ_data_in;
	end if;
end process;
	
end Behavioral;

