--------------------------------------------------------------------------------
-- Copyright (c) 1995-2008 Xilinx, Inc.  All rights reserved.
--------------------------------------------------------------------------------
--   ____  ____
--  /   /\/   /
-- /___/  \  /    Vendor: Xilinx
-- \   \   \/     Version: K.31
--  \   \         Application: netgen
--  /   /         Filename: Subsys_Adder_synthesis.vhd
-- /___/   /\     Timestamp: Sun Apr 12 03:25:34 2009
-- \   \  /  \ 
--  \___\/\___\
--             
-- Command	: -intstyle ise -ar Structure -tm Subsys_Adder -w -dir netgen/synthesis -ofmt vhdl -sim Subsys_Adder.ngc Subsys_Adder_synthesis.vhd 
-- Device	: xc3s500e-4-fg320
-- Input file	: Subsys_Adder.ngc
-- Output file	: C:\Users\Ben\Desktop\FPGAprojects\Subsystems\Subsys_Adder\netgen\synthesis\Subsys_Adder_synthesis.vhd
-- # of Entities	: 1
-- Design Name	: Subsys_Adder
-- Xilinx	: C:\Xilinx\10.1\ISE
--             
-- Purpose:    
--     This VHDL netlist is a verification model and uses simulation 
--     primitives which may not represent the true implementation of the 
--     device, however the netlist is functionally correct and should not 
--     be modified. This file cannot be synthesized and should only be used 
--     with supported simulation tools.
--             
-- Reference:  
--     Development System Reference Guide, Chapter 23
--     Synthesis and Simulation Design Guide, Chapter 6
--             
--------------------------------------------------------------------------------

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
use UNISIM.VPKG.ALL;

entity Subsys_Adder is
  port (
    CLK1 : in STD_LOGIC := 'X'; 
    CLK2 : in STD_LOGIC := 'X'; 
    ano : out STD_LOGIC_VECTOR ( 3 downto 0 ); 
    seg : out STD_LOGIC_VECTOR ( 6 downto 0 ); 
    N1 : in STD_LOGIC_VECTOR ( 3 downto 0 ); 
    N2 : in STD_LOGIC_VECTOR ( 3 downto 0 ) 
  );
end Subsys_Adder;

architecture Structure of Subsys_Adder is
  signal CLK1_IBUF_1 : STD_LOGIC; 
  signal CLK2_IBUF_3 : STD_LOGIC; 
  signal G1_G1_S3 : STD_LOGIC; 
  signal G1_G2_S3 : STD_LOGIC; 
  signal G1_G3_S3 : STD_LOGIC; 
  signal G2_G1_S3 : STD_LOGIC; 
  signal G2_G2_S3 : STD_LOGIC; 
  signal G2_G3_S3 : STD_LOGIC; 
  signal G6_G1_S3 : STD_LOGIC; 
  signal G6_G2_G4_Q : STD_LOGIC; 
  signal G6_G2_S3 : STD_LOGIC; 
  signal G6_G3_G4_Q : STD_LOGIC; 
  signal G6_G3_G4_Q1_14 : STD_LOGIC; 
  signal G6_G3_S3 : STD_LOGIC; 
  signal G6_G4_G4_Q : STD_LOGIC; 
  signal G6_G4_G4_Q1_17 : STD_LOGIC; 
  signal G6_G4_S3 : STD_LOGIC; 
  signal G7_Mrom_seg : STD_LOGIC; 
  signal G7_Mrom_seg1 : STD_LOGIC; 
  signal G7_Mrom_seg2 : STD_LOGIC; 
  signal G7_Mrom_seg3 : STD_LOGIC; 
  signal G7_Mrom_seg4 : STD_LOGIC; 
  signal G7_Mrom_seg5 : STD_LOGIC; 
  signal G7_Mrom_seg6 : STD_LOGIC; 
  signal N0 : STD_LOGIC; 
  signal N11 : STD_LOGIC; 
  signal N1_0_IBUF_31 : STD_LOGIC; 
  signal N1_1_IBUF_32 : STD_LOGIC; 
  signal N1_2_IBUF_33 : STD_LOGIC; 
  signal N2_0_IBUF_37 : STD_LOGIC; 
  signal N2_1_IBUF_38 : STD_LOGIC; 
  signal N2_2_IBUF_39 : STD_LOGIC; 
  signal S1 : STD_LOGIC; 
  signal S14 : STD_LOGIC; 
  signal S15 : STD_LOGIC; 
  signal S16 : STD_LOGIC; 
  signal S17 : STD_LOGIC; 
  signal S2 : STD_LOGIC; 
  signal S3 : STD_LOGIC; 
  signal S4 : STD_LOGIC; 
  signal S5 : STD_LOGIC; 
  signal S6 : STD_LOGIC; 
  signal S8 : STD_LOGIC; 
begin
  XST_GND : GND
    port map (
      G => N0
    );
  XST_VCC : VCC
    port map (
      P => N11
    );
  G6_G4_G7_Q1 : LUT3
    generic map(
      INIT => X"4E"
    )
    port map (
      I0 => CLK2_IBUF_3,
      I1 => S17,
      I2 => G6_G4_S3,
      O => S17
    );
  G6_G3_G7_Q1 : LUT3
    generic map(
      INIT => X"4E"
    )
    port map (
      I0 => CLK2_IBUF_3,
      I1 => S16,
      I2 => G6_G3_S3,
      O => S16
    );
  G6_G2_G7_Q1 : LUT3
    generic map(
      INIT => X"4E"
    )
    port map (
      I0 => CLK2_IBUF_3,
      I1 => S15,
      I2 => G6_G2_S3,
      O => S15
    );
  G6_G1_G7_Q1 : LUT3
    generic map(
      INIT => X"4E"
    )
    port map (
      I0 => CLK2_IBUF_3,
      I1 => S14,
      I2 => G6_G1_S3,
      O => S14
    );
  G2_G3_G7_Q1 : LUT3
    generic map(
      INIT => X"4E"
    )
    port map (
      I0 => CLK1_IBUF_1,
      I1 => S6,
      I2 => G2_G3_S3,
      O => S6
    );
  G2_G3_G4_Q1 : LUT3
    generic map(
      INIT => X"B1"
    )
    port map (
      I0 => CLK1_IBUF_1,
      I1 => N2_2_IBUF_39,
      I2 => G2_G3_S3,
      O => G2_G3_S3
    );
  G2_G2_G7_Q1 : LUT3
    generic map(
      INIT => X"4E"
    )
    port map (
      I0 => CLK1_IBUF_1,
      I1 => S5,
      I2 => G2_G2_S3,
      O => S5
    );
  G2_G2_G4_Q1 : LUT3
    generic map(
      INIT => X"B1"
    )
    port map (
      I0 => CLK1_IBUF_1,
      I1 => N2_1_IBUF_38,
      I2 => G2_G2_S3,
      O => G2_G2_S3
    );
  G2_G1_G7_Q1 : LUT3
    generic map(
      INIT => X"4E"
    )
    port map (
      I0 => CLK1_IBUF_1,
      I1 => S4,
      I2 => G2_G1_S3,
      O => S4
    );
  G2_G1_G4_Q1 : LUT3
    generic map(
      INIT => X"B1"
    )
    port map (
      I0 => CLK1_IBUF_1,
      I1 => N2_0_IBUF_37,
      I2 => G2_G1_S3,
      O => G2_G1_S3
    );
  G1_G3_G7_Q1 : LUT3
    generic map(
      INIT => X"4E"
    )
    port map (
      I0 => CLK1_IBUF_1,
      I1 => S3,
      I2 => G1_G3_S3,
      O => S3
    );
  G1_G3_G4_Q1 : LUT3
    generic map(
      INIT => X"B1"
    )
    port map (
      I0 => CLK1_IBUF_1,
      I1 => N1_2_IBUF_33,
      I2 => G1_G3_S3,
      O => G1_G3_S3
    );
  G1_G2_G7_Q1 : LUT3
    generic map(
      INIT => X"4E"
    )
    port map (
      I0 => CLK1_IBUF_1,
      I1 => S2,
      I2 => G1_G2_S3,
      O => S2
    );
  G1_G2_G4_Q1 : LUT3
    generic map(
      INIT => X"B1"
    )
    port map (
      I0 => CLK1_IBUF_1,
      I1 => N1_1_IBUF_32,
      I2 => G1_G2_S3,
      O => G1_G2_S3
    );
  G1_G1_G7_Q1 : LUT3
    generic map(
      INIT => X"4E"
    )
    port map (
      I0 => CLK1_IBUF_1,
      I1 => S1,
      I2 => G1_G1_S3,
      O => S1
    );
  G1_G1_G4_Q1 : LUT3
    generic map(
      INIT => X"B1"
    )
    port map (
      I0 => CLK1_IBUF_1,
      I1 => N1_0_IBUF_31,
      I2 => G1_G1_S3,
      O => G1_G1_S3
    );
  G4_G5_Q1 : LUT4
    generic map(
      INIT => X"EA80"
    )
    port map (
      I0 => S2,
      I1 => S1,
      I2 => S4,
      I3 => S5,
      O => S8
    );
  G7_Mrom_seg41 : LUT4
    generic map(
      INIT => X"454C"
    )
    port map (
      I0 => S17,
      I1 => S14,
      I2 => S15,
      I3 => S16,
      O => G7_Mrom_seg4
    );
  G6_G1_G4_Q1 : LUT4
    generic map(
      INIT => X"EB41"
    )
    port map (
      I0 => CLK2_IBUF_3,
      I1 => S1,
      I2 => S4,
      I3 => G6_G1_S3,
      O => G6_G1_S3
    );
  G7_Mrom_seg21 : LUT4
    generic map(
      INIT => X"80C2"
    )
    port map (
      I0 => S15,
      I1 => S17,
      I2 => S16,
      I3 => S14,
      O => G7_Mrom_seg2
    );
  G7_Mrom_seg61 : LUT4
    generic map(
      INIT => X"0941"
    )
    port map (
      I0 => S15,
      I1 => S16,
      I2 => S17,
      I3 => S14,
      O => G7_Mrom_seg6
    );
  G7_Mrom_seg51 : LUT4
    generic map(
      INIT => X"6032"
    )
    port map (
      I0 => S15,
      I1 => S17,
      I2 => S14,
      I3 => S16,
      O => G7_Mrom_seg5
    );
  G7_Mrom_seg111 : LUT4
    generic map(
      INIT => X"B860"
    )
    port map (
      I0 => S17,
      I1 => S14,
      I2 => S16,
      I3 => S15,
      O => G7_Mrom_seg1
    );
  G7_Mrom_seg31 : LUT4
    generic map(
      INIT => X"9086"
    )
    port map (
      I0 => S14,
      I1 => S16,
      I2 => S15,
      I3 => S17,
      O => G7_Mrom_seg3
    );
  G7_Mrom_seg11 : LUT4
    generic map(
      INIT => X"2812"
    )
    port map (
      I0 => S14,
      I1 => S15,
      I2 => S16,
      I3 => S17,
      O => G7_Mrom_seg
    );
  CLK1_IBUF : IBUF
    port map (
      I => CLK1,
      O => CLK1_IBUF_1
    );
  CLK2_IBUF : IBUF
    port map (
      I => CLK2,
      O => CLK2_IBUF_3
    );
  N1_2_IBUF : IBUF
    port map (
      I => N1(2),
      O => N1_2_IBUF_33
    );
  N1_1_IBUF : IBUF
    port map (
      I => N1(1),
      O => N1_1_IBUF_32
    );
  N1_0_IBUF : IBUF
    port map (
      I => N1(0),
      O => N1_0_IBUF_31
    );
  N2_2_IBUF : IBUF
    port map (
      I => N2(2),
      O => N2_2_IBUF_39
    );
  N2_1_IBUF : IBUF
    port map (
      I => N2(1),
      O => N2_1_IBUF_38
    );
  N2_0_IBUF : IBUF
    port map (
      I => N2(0),
      O => N2_0_IBUF_37
    );
  ano_3_OBUF : OBUF
    port map (
      I => N11,
      O => ano(3)
    );
  ano_2_OBUF : OBUF
    port map (
      I => N11,
      O => ano(2)
    );
  ano_1_OBUF : OBUF
    port map (
      I => N11,
      O => ano(1)
    );
  ano_0_OBUF : OBUF
    port map (
      I => N0,
      O => ano(0)
    );
  seg_6_OBUF : OBUF
    port map (
      I => G7_Mrom_seg6,
      O => seg(6)
    );
  seg_5_OBUF : OBUF
    port map (
      I => G7_Mrom_seg5,
      O => seg(5)
    );
  seg_4_OBUF : OBUF
    port map (
      I => G7_Mrom_seg4,
      O => seg(4)
    );
  seg_3_OBUF : OBUF
    port map (
      I => G7_Mrom_seg3,
      O => seg(3)
    );
  seg_2_OBUF : OBUF
    port map (
      I => G7_Mrom_seg2,
      O => seg(2)
    );
  seg_1_OBUF : OBUF
    port map (
      I => G7_Mrom_seg1,
      O => seg(1)
    );
  seg_0_OBUF : OBUF
    port map (
      I => G7_Mrom_seg,
      O => seg(0)
    );
  G6_G4_G4_Q1 : LUT4
    generic map(
      INIT => X"888D"
    )
    port map (
      I0 => CLK2_IBUF_3,
      I1 => G6_G4_S3,
      I2 => S6,
      I3 => S3,
      O => G6_G4_G4_Q
    );
  G6_G4_G4_Q2 : LUT4
    generic map(
      INIT => X"B1F5"
    )
    port map (
      I0 => CLK2_IBUF_3,
      I1 => S3,
      I2 => G6_G4_S3,
      I3 => S6,
      O => G6_G4_G4_Q1_17
    );
  G6_G4_G4_Q_f5 : MUXF5
    port map (
      I0 => G6_G4_G4_Q1_17,
      I1 => G6_G4_G4_Q,
      S => S8,
      O => G6_G4_S3
    );
  G6_G3_G4_Q1 : LUT4
    generic map(
      INIT => X"BE14"
    )
    port map (
      I0 => CLK2_IBUF_3,
      I1 => S6,
      I2 => S3,
      I3 => G6_G3_S3,
      O => G6_G3_G4_Q
    );
  G6_G3_G4_Q2 : LUT4
    generic map(
      INIT => X"EB41"
    )
    port map (
      I0 => CLK2_IBUF_3,
      I1 => S6,
      I2 => S3,
      I3 => G6_G3_S3,
      O => G6_G3_G4_Q1_14
    );
  G6_G3_G4_Q_f5 : MUXF5
    port map (
      I0 => G6_G3_G4_Q1_14,
      I1 => G6_G3_G4_Q,
      S => S8,
      O => G6_G3_S3
    );
  G6_G2_G4_Q1 : LUT4
    generic map(
      INIT => X"69A5"
    )
    port map (
      I0 => S2,
      I1 => S4,
      I2 => S5,
      I3 => S1,
      O => G6_G2_G4_Q
    );
  G6_G2_G4_Q_f5 : MUXF5
    port map (
      I0 => G6_G2_G4_Q,
      I1 => G6_G2_S3,
      S => CLK2_IBUF_3,
      O => G6_G2_S3
    );

end Structure;

