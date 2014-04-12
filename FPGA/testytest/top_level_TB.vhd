--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   14:42:21 08/16/2010
-- Design Name:   
-- Module Name:   C:/Users/georgecuris/Desktop/Folders/FPGA/Projects/Current Projects/Systems/testytest/top_level_TB.vhd
-- Project Name:  testytest
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: top_level
-- 
-- Dependencies:
-- 
-- Revision:
-- Revision 0.01 - File Created
-- Additional Comments:
--
-- Notes: 
-- This testbench has been automatically generated using types std_logic and
-- std_logic_vector for the ports of the unit under test.  Xilinx recommends
-- that these types always be used for the top-level I/O of a design in order
-- to guarantee that the testbench will bind correctly to the post-implementation 
-- simulation model.
--------------------------------------------------------------------------------
LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
USE ieee.std_logic_unsigned.all;
USE ieee.numeric_std.ALL;
 
ENTITY top_level_TB IS
END top_level_TB;
 
ARCHITECTURE behavior OF top_level_TB IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT top_level
    PORT(
         mclk : IN  std_logic;
         rst : IN  std_logic;
         CQ_write_en : IN  std_logic;
         VQ_read_en : IN  std_logic;
         memory_address_bus : INOUT  std_logic_vector(22 downto 0);
         memory_data_bus : INOUT  std_logic_vector(15 downto 0);
         anodes : OUT  std_logic_vector(3 downto 0);
         decoder_out : OUT  std_logic_vector(6 downto 0);
         RAM_oe : OUT  std_logic;
         RAM_we : OUT  std_logic;
         RAM_adv : OUT  std_logic;
         RAM_clk : OUT  std_logic;
         RAM_ub : OUT  std_logic;
         RAM_lb : OUT  std_logic;
         RAM_ce : OUT  std_logic;
         RAM_cre : OUT  std_logic;
         RAM_wait : IN  std_logic;
         LEDs : OUT  std_logic_vector(7 downto 0)
        );
    END COMPONENT;
    

   --Inputs
   signal mclk : std_logic := '0';
   signal rst : std_logic := '0';
   signal CQ_write_en : std_logic := '0';
   signal VQ_read_en : std_logic := '0';
   signal RAM_wait : std_logic := '0';

	--BiDirs
   signal memory_address_bus : std_logic_vector(22 downto 0);
   signal memory_data_bus : std_logic_vector(15 downto 0);

 	--Outputs
   signal anodes : std_logic_vector(3 downto 0);
   signal decoder_out : std_logic_vector(6 downto 0);
   signal RAM_oe : std_logic;
   signal RAM_we : std_logic;
   signal RAM_adv : std_logic;
   signal RAM_clk : std_logic;
   signal RAM_ub : std_logic;
   signal RAM_lb : std_logic;
   signal RAM_ce : std_logic;
   signal RAM_cre : std_logic;
   signal LEDs : std_logic_vector(7 downto 0);

   -- Clock period definitions
   constant mclk_period : time := 20 ns;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: top_level PORT MAP (
          mclk => mclk,
          rst => rst,
          CQ_write_en => CQ_write_en,
          VQ_read_en => VQ_read_en,
          memory_address_bus => memory_address_bus,
          memory_data_bus => memory_data_bus,
          anodes => anodes,
          decoder_out => decoder_out,
          RAM_oe => RAM_oe,
          RAM_we => RAM_we,
          RAM_adv => RAM_adv,
          RAM_clk => RAM_clk,
          RAM_ub => RAM_ub,
          RAM_lb => RAM_lb,
          RAM_ce => RAM_ce,
          RAM_cre => RAM_cre,
          RAM_wait => RAM_wait,
          LEDs => LEDs
        );

   -- Clock process definitions
   mclk_process :process
   begin
		mclk <= '1';
		wait for mclk_period/2;
		mclk <= '0';
		wait for mclk_period/2;
   end process;
	
	RAM_wait_proc :process
	begin
		RAM_wait <= '0';
			wait for 980 ns;
		RAM_wait <= '0';
			wait for 35 ns;
		RAM_wait <= '1';
			wait for 40 ns;
		RAM_wait <= '0';
			wait;
	end process;

   -- Stimulus process
   stim_proc: process
   begin		
      rst <= '1';
		wait for 300 ns;
		rst <= '0';

      wait;
   end process;

END;
