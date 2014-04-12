library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity top_level is
	Port (			  
	   mclk : in std_logic;
		rst : in std_logic;
		CQ_write_en : in STD_LOGIC;
		VQ_read_en : in STD_LOGIC;
--		switches : in STD_LOGIC_VECTOR(7 downto 0);
		memory_address_bus: inout std_logic_vector(22 downto 0);
		memory_data_bus : inout std_logic_vector(15 downto 0);
		anodes : out STD_LOGIC_VECTOR(3 downto 0);
		decoder_out : out STD_LOGIC_VECTOR(6 downto 0);
		RAM_oe : out std_logic;
		RAM_we : out std_logic;
		RAM_adv : out std_logic;
		RAM_clk : out std_logic;
		RAM_ub : out std_logic;
		RAM_lb : out std_logic;
		RAM_ce : out std_logic;
		RAM_cre : out std_logic;
		RAM_wait : in std_logic;
		LEDs : out std_logic_vector(7 downto 0)
	);
end top_level;

architecture Behavioral of top_level is

component DCMi_80 is
   port ( CLKIN_IN  : in    std_logic; 
          CLKFX_OUT : out   std_logic; 
          CLK0_OUT  : out   std_logic);
end component;

component four_dig_7seg is
    Port ( clock : in  STD_LOGIC;
           display_data : in  STD_LOGIC_VECTOR (15 downto 0);
           anodes : out  STD_LOGIC_VECTOR (3 downto 0);
           to_display : out  STD_LOGIC_VECTOR (6 downto 0));
end component;

component memory is
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
--		VQ_data_out_dumb : out STD_LOGIC_VECTOR(15 downto 0);
		
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
end component;

signal clk80, dcm_clk_25, RAM_clk_en : std_logic;
signal count : std_logic_vector(24 downto 0);

signal CQ_write_clk : STD_LOGIC;
signal VQ_read_clk : STD_LOGIC;

signal display_data : STD_LOGIC_VECTOR(15 downto 0);

signal RAM_addr_s : std_logic_vector(22 downto 0);
signal RAM_data_in, RAM_data_out, RAM_data_reg : std_logic_vector(15 downto 0);
signal RAM_oe_s, RAM_oe_reg, RAM_we_s, RAM_adv_s, RAM_ub_s, RAM_lb_s, RAM_ce_s, RAM_cre_s : std_logic;

signal pclk25, clk25:std_logic;
signal clk_625 : STD_LOGIC;

signal CQ_data_in_sig : STD_LOGIC_VECTOR(15 downto 0);

begin
	
	clk25 <= count(0);		   
	pclk25 <= clk25;					
	RAM_clk <= clk80; --when RAM_clk_en='1' else 'Z';
	
	--CQ_write_clk <= count(3);
	--VQ_read_clk <= count(3);
	
	LEDs(0) <= count(24);
	
--50 MHz clock divider	
mclk_proc:  process(mclk, rst)
begin	  
	if rst = '1' then
		count <= (others => '0');
	elsif mclk'event and mclk = '1' then
		count <= count + 1;
	end if;				   
end process;

--Note, clk80 is now at 100 MHz, not 80
DCM1: DCMi_80 port map ( 
		  CLKIN_IN => pclk25,
          CLKFX_OUT => clk80, 
          CLK0_OUT => dcm_clk_25
		  );  
		  
display: four_dig_7seg port map(
			clock => mclk,
			display_data => display_data,
			anodes => anodes,
			to_display => decoder_out);
		  
MainMem: memory Port map (
		clk80 => clk80,
		rst => rst,
		empty => LEDs(1),
		full => LEDs(2),
		cam_vs => '0',
		vid_vs => '1',
		CQ_write_en => CQ_write_en,
		--CQ_write_clk => CQ_write_clk,
		CQ_data_in => CQ_data_in_sig,
		VQ_read_en => VQ_read_en,
		--VQ_read_clk => VQ_read_clk,
		VQ_data_out => display_data,
		RAM_addr  => RAM_addr_s,
		RAM_data_out  => RAM_data_out,
		RAM_data_in  => RAM_data_in,
		RAM_oe  => RAM_oe_s,
		RAM_we  => RAM_we_s,
		RAM_adv  => RAM_adv_s,
		RAM_clk_en  => RAM_clk_en,
		RAM_ub  => RAM_ub_s,
		RAM_lb  => RAM_lb_s,
		RAM_ce  => RAM_ce_s,
		RAM_cre => RAM_cre_s,
		RAM_wait => RAM_wait
	);
	
OutputRegs: process(clk80, rst)
begin							   
	if rst='1' then
		memory_address_bus <= (others=>'0'); 
		RAM_data_reg <= (others=>'0'); 
		RAM_oe_reg <= '1';
		RAM_we <= '1'; 
		RAM_adv <= '1'; 
		RAM_ub <= '1';
		RAM_lb <= '1'; 
		RAM_ce <= '1'; 
		RAM_cre <= '0';		
	elsif clk80'event and clk80='0' then
		memory_address_bus <= RAM_addr_s;
		RAM_data_reg <= RAM_data_out;
		RAM_oe_reg <= RAM_oe_s;
		RAM_we <= RAM_we_s;
		RAM_adv <= RAM_adv_s;
		RAM_ub <= RAM_ub_s;
		RAM_lb <= RAM_lb_s;
		RAM_ce <= RAM_ce_s;
		RAM_cre <= RAM_cre_s;
	end if;	
end process;		

RAM_oe <= RAM_oe_reg;
memory_data_bus <= RAM_data_reg when RAM_oe_reg='1' else (others=>'Z');
RAM_data_in <= memory_data_bus;

CQ_data_in_sig <= x"6E6E";

LEDs(7 downto 3) <= (others => '0');

end Behavioral;
