--------------------------------------------------------------------------------
-- Copyright (c) 1995-2008 Xilinx, Inc.  All rights reserved.
--------------------------------------------------------------------------------
--   ____  ____
--  /   /\/   /
-- /___/  \  /    Vendor: Xilinx
-- \   \   \/     Version: K.31
--  \   \         Application: netgen
--  /   /         Filename: Sys_LCDTest_synthesis.vhd
-- /___/   /\     Timestamp: Wed Apr 15 22:11:26 2009
-- \   \  /  \ 
--  \___\/\___\
--             
-- Command	: -intstyle ise -ar Structure -tm Sys_LCDTest -w -dir netgen/synthesis -ofmt vhdl -sim Sys_LCDTest.ngc Sys_LCDTest_synthesis.vhd 
-- Device	: xc3s500e-4-fg320
-- Input file	: Sys_LCDTest.ngc
-- Output file	: C:\Users\Ben\Desktop\FPGAprojects\Systems\Sys_LCDTest\netgen\synthesis\Sys_LCDTest_synthesis.vhd
-- # of Entities	: 1
-- Design Name	: Sys_LCDTest
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

entity Sys_LCDTest is
  port (
    E : out STD_LOGIC; 
    RS : out STD_LOGIC; 
    RW : out STD_LOGIC; 
    SysCLK : in STD_LOGIC := 'X'; 
    databus : out STD_LOGIC_VECTOR ( 7 downto 0 ) 
  );
end Sys_LCDTest;

architecture Structure of Sys_LCDTest is
  signal Buf_CLK1MHz : STD_LOGIC; 
  signal Buf_SysCLK : STD_LOGIC; 
  signal E_OBUF_3 : STD_LOGIC; 
  signal G1_CLK1MHz_4 : STD_LOGIC; 
  signal G1_CLK1MHz_cmp_eq0000_5 : STD_LOGIC; 
  signal G1_Madd_cnt_add0000_cy_10_rt_22 : STD_LOGIC; 
  signal G1_Madd_cnt_add0000_cy_11_rt_24 : STD_LOGIC; 
  signal G1_Madd_cnt_add0000_cy_12_rt_26 : STD_LOGIC; 
  signal G1_Madd_cnt_add0000_cy_13_rt_28 : STD_LOGIC; 
  signal G1_Madd_cnt_add0000_cy_14_rt_30 : STD_LOGIC; 
  signal G1_Madd_cnt_add0000_cy_15_rt_32 : STD_LOGIC; 
  signal G1_Madd_cnt_add0000_cy_16_rt_34 : STD_LOGIC; 
  signal G1_Madd_cnt_add0000_cy_17_rt_36 : STD_LOGIC; 
  signal G1_Madd_cnt_add0000_cy_18_rt_38 : STD_LOGIC; 
  signal G1_Madd_cnt_add0000_cy_19_rt_40 : STD_LOGIC; 
  signal G1_Madd_cnt_add0000_cy_1_rt_42 : STD_LOGIC; 
  signal G1_Madd_cnt_add0000_cy_20_rt_44 : STD_LOGIC; 
  signal G1_Madd_cnt_add0000_cy_21_rt_46 : STD_LOGIC; 
  signal G1_Madd_cnt_add0000_cy_22_rt_48 : STD_LOGIC; 
  signal G1_Madd_cnt_add0000_cy_23_rt_50 : STD_LOGIC; 
  signal G1_Madd_cnt_add0000_cy_24_rt_52 : STD_LOGIC; 
  signal G1_Madd_cnt_add0000_cy_25_rt_54 : STD_LOGIC; 
  signal G1_Madd_cnt_add0000_cy_26_rt_56 : STD_LOGIC; 
  signal G1_Madd_cnt_add0000_cy_27_rt_58 : STD_LOGIC; 
  signal G1_Madd_cnt_add0000_cy_28_rt_60 : STD_LOGIC; 
  signal G1_Madd_cnt_add0000_cy_29_rt_62 : STD_LOGIC; 
  signal G1_Madd_cnt_add0000_cy_2_rt_64 : STD_LOGIC; 
  signal G1_Madd_cnt_add0000_cy_30_rt_66 : STD_LOGIC; 
  signal G1_Madd_cnt_add0000_cy_3_rt_68 : STD_LOGIC; 
  signal G1_Madd_cnt_add0000_cy_4_rt_70 : STD_LOGIC; 
  signal G1_Madd_cnt_add0000_cy_5_rt_72 : STD_LOGIC; 
  signal G1_Madd_cnt_add0000_cy_6_rt_74 : STD_LOGIC; 
  signal G1_Madd_cnt_add0000_cy_7_rt_76 : STD_LOGIC; 
  signal G1_Madd_cnt_add0000_cy_8_rt_78 : STD_LOGIC; 
  signal G1_Madd_cnt_add0000_cy_9_rt_80 : STD_LOGIC; 
  signal G1_Madd_cnt_add0000_xor_31_rt_82 : STD_LOGIC; 
  signal G1_Mcount_cnt_cy_10_rt_85 : STD_LOGIC; 
  signal G1_Mcount_cnt_cy_11_rt_87 : STD_LOGIC; 
  signal G1_Mcount_cnt_cy_12_rt_89 : STD_LOGIC; 
  signal G1_Mcount_cnt_cy_13_rt_91 : STD_LOGIC; 
  signal G1_Mcount_cnt_cy_14_rt_93 : STD_LOGIC; 
  signal G1_Mcount_cnt_cy_15_rt_95 : STD_LOGIC; 
  signal G1_Mcount_cnt_cy_16_rt_97 : STD_LOGIC; 
  signal G1_Mcount_cnt_cy_17_rt_99 : STD_LOGIC; 
  signal G1_Mcount_cnt_cy_18_rt_101 : STD_LOGIC; 
  signal G1_Mcount_cnt_cy_19_rt_103 : STD_LOGIC; 
  signal G1_Mcount_cnt_cy_1_rt_105 : STD_LOGIC; 
  signal G1_Mcount_cnt_cy_20_rt_107 : STD_LOGIC; 
  signal G1_Mcount_cnt_cy_21_rt_109 : STD_LOGIC; 
  signal G1_Mcount_cnt_cy_22_rt_111 : STD_LOGIC; 
  signal G1_Mcount_cnt_cy_23_rt_113 : STD_LOGIC; 
  signal G1_Mcount_cnt_cy_24_rt_115 : STD_LOGIC; 
  signal G1_Mcount_cnt_cy_25_rt_117 : STD_LOGIC; 
  signal G1_Mcount_cnt_cy_26_rt_119 : STD_LOGIC; 
  signal G1_Mcount_cnt_cy_27_rt_121 : STD_LOGIC; 
  signal G1_Mcount_cnt_cy_28_rt_123 : STD_LOGIC; 
  signal G1_Mcount_cnt_cy_29_rt_125 : STD_LOGIC; 
  signal G1_Mcount_cnt_cy_2_rt_127 : STD_LOGIC; 
  signal G1_Mcount_cnt_cy_30_rt_129 : STD_LOGIC; 
  signal G1_Mcount_cnt_cy_3_rt_131 : STD_LOGIC; 
  signal G1_Mcount_cnt_cy_4_rt_133 : STD_LOGIC; 
  signal G1_Mcount_cnt_cy_5_rt_135 : STD_LOGIC; 
  signal G1_Mcount_cnt_cy_6_rt_137 : STD_LOGIC; 
  signal G1_Mcount_cnt_cy_7_rt_139 : STD_LOGIC; 
  signal G1_Mcount_cnt_cy_8_rt_141 : STD_LOGIC; 
  signal G1_Mcount_cnt_cy_9_rt_143 : STD_LOGIC; 
  signal G1_Mcount_cnt_xor_31_rt_145 : STD_LOGIC; 
  signal G1_cnt_cmp_eq0000_209 : STD_LOGIC; 
  signal Madd_databus_add0000_cy_11_rt_212 : STD_LOGIC; 
  signal Madd_databus_add0000_cy_13_rt_215 : STD_LOGIC; 
  signal Madd_databus_add0000_cy_15_rt_218 : STD_LOGIC; 
  signal Madd_databus_add0000_cy_16_rt_220 : STD_LOGIC; 
  signal Madd_databus_add0000_cy_17_rt_222 : STD_LOGIC; 
  signal Madd_databus_add0000_cy_18_rt_224 : STD_LOGIC; 
  signal Madd_databus_add0000_cy_19_rt_226 : STD_LOGIC; 
  signal Madd_databus_add0000_cy_20_rt_228 : STD_LOGIC; 
  signal Madd_databus_add0000_cy_21_rt_230 : STD_LOGIC; 
  signal Madd_databus_add0000_cy_22_rt_232 : STD_LOGIC; 
  signal Madd_databus_add0000_cy_23_rt_234 : STD_LOGIC; 
  signal Madd_databus_add0000_cy_24_rt_236 : STD_LOGIC; 
  signal Madd_databus_add0000_cy_25_rt_238 : STD_LOGIC; 
  signal Madd_databus_add0000_cy_26_rt_240 : STD_LOGIC; 
  signal Madd_databus_add0000_cy_27_rt_242 : STD_LOGIC; 
  signal Madd_databus_add0000_cy_28_rt_244 : STD_LOGIC; 
  signal Madd_databus_add0000_cy_29_rt_246 : STD_LOGIC; 
  signal Madd_databus_add0000_cy_30_rt_248 : STD_LOGIC; 
  signal Madd_databus_add0000_cy_9_rt_255 : STD_LOGIC; 
  signal Madd_databus_add0000_lut_10_Q : STD_LOGIC; 
  signal Madd_databus_add0000_lut_12_Q : STD_LOGIC; 
  signal Madd_databus_add0000_lut_14_Q : STD_LOGIC; 
  signal Madd_databus_add0000_lut_4_Q : STD_LOGIC; 
  signal Madd_databus_add0000_lut_5_Q : STD_LOGIC; 
  signal Madd_databus_add0000_lut_6_Q : STD_LOGIC; 
  signal Madd_databus_add0000_lut_7_Q : STD_LOGIC; 
  signal Madd_databus_add0000_lut_8_Q : STD_LOGIC; 
  signal Madd_databus_add0000_xor_31_rt_264 : STD_LOGIC; 
  signal Madd_index_addsub0000_cy_10_rt_267 : STD_LOGIC; 
  signal Madd_index_addsub0000_cy_11_rt_269 : STD_LOGIC; 
  signal Madd_index_addsub0000_cy_12_rt_271 : STD_LOGIC; 
  signal Madd_index_addsub0000_cy_13_rt_273 : STD_LOGIC; 
  signal Madd_index_addsub0000_cy_14_rt_275 : STD_LOGIC; 
  signal Madd_index_addsub0000_cy_15_rt_277 : STD_LOGIC; 
  signal Madd_index_addsub0000_cy_16_rt_279 : STD_LOGIC; 
  signal Madd_index_addsub0000_cy_17_rt_281 : STD_LOGIC; 
  signal Madd_index_addsub0000_cy_18_rt_283 : STD_LOGIC; 
  signal Madd_index_addsub0000_cy_19_rt_285 : STD_LOGIC; 
  signal Madd_index_addsub0000_cy_1_rt_287 : STD_LOGIC; 
  signal Madd_index_addsub0000_cy_20_rt_289 : STD_LOGIC; 
  signal Madd_index_addsub0000_cy_21_rt_291 : STD_LOGIC; 
  signal Madd_index_addsub0000_cy_22_rt_293 : STD_LOGIC; 
  signal Madd_index_addsub0000_cy_23_rt_295 : STD_LOGIC; 
  signal Madd_index_addsub0000_cy_24_rt_297 : STD_LOGIC; 
  signal Madd_index_addsub0000_cy_25_rt_299 : STD_LOGIC; 
  signal Madd_index_addsub0000_cy_26_rt_301 : STD_LOGIC; 
  signal Madd_index_addsub0000_cy_27_rt_303 : STD_LOGIC; 
  signal Madd_index_addsub0000_cy_28_rt_305 : STD_LOGIC; 
  signal Madd_index_addsub0000_cy_29_rt_307 : STD_LOGIC; 
  signal Madd_index_addsub0000_cy_2_rt_309 : STD_LOGIC; 
  signal Madd_index_addsub0000_cy_30_rt_311 : STD_LOGIC; 
  signal Madd_index_addsub0000_cy_3_rt_313 : STD_LOGIC; 
  signal Madd_index_addsub0000_cy_4_rt_315 : STD_LOGIC; 
  signal Madd_index_addsub0000_cy_5_rt_317 : STD_LOGIC; 
  signal Madd_index_addsub0000_cy_6_rt_319 : STD_LOGIC; 
  signal Madd_index_addsub0000_cy_7_rt_321 : STD_LOGIC; 
  signal Madd_index_addsub0000_cy_8_rt_323 : STD_LOGIC; 
  signal Madd_index_addsub0000_cy_9_rt_325 : STD_LOGIC; 
  signal Madd_index_addsub0000_xor_31_rt_327 : STD_LOGIC; 
  signal Madd_wait_time_share0000_cy_10_rt_329 : STD_LOGIC; 
  signal Madd_wait_time_share0000_cy_11_rt_331 : STD_LOGIC; 
  signal Madd_wait_time_share0000_cy_12_rt_333 : STD_LOGIC; 
  signal Madd_wait_time_share0000_cy_13_rt_335 : STD_LOGIC; 
  signal Madd_wait_time_share0000_cy_14_rt_337 : STD_LOGIC; 
  signal Madd_wait_time_share0000_cy_15_rt_339 : STD_LOGIC; 
  signal Madd_wait_time_share0000_cy_16_rt_341 : STD_LOGIC; 
  signal Madd_wait_time_share0000_cy_17_rt_343 : STD_LOGIC; 
  signal Madd_wait_time_share0000_cy_18_rt_345 : STD_LOGIC; 
  signal Madd_wait_time_share0000_cy_19_rt_347 : STD_LOGIC; 
  signal Madd_wait_time_share0000_cy_20_rt_350 : STD_LOGIC; 
  signal Madd_wait_time_share0000_cy_21_rt_352 : STD_LOGIC; 
  signal Madd_wait_time_share0000_cy_22_rt_354 : STD_LOGIC; 
  signal Madd_wait_time_share0000_cy_23_rt_356 : STD_LOGIC; 
  signal Madd_wait_time_share0000_cy_24_rt_358 : STD_LOGIC; 
  signal Madd_wait_time_share0000_cy_25_rt_360 : STD_LOGIC; 
  signal Madd_wait_time_share0000_cy_26_rt_362 : STD_LOGIC; 
  signal Madd_wait_time_share0000_cy_27_rt_364 : STD_LOGIC; 
  signal Madd_wait_time_share0000_cy_28_rt_366 : STD_LOGIC; 
  signal Madd_wait_time_share0000_cy_29_rt_368 : STD_LOGIC; 
  signal Madd_wait_time_share0000_cy_2_rt_370 : STD_LOGIC; 
  signal Madd_wait_time_share0000_cy_30_rt_372 : STD_LOGIC; 
  signal Madd_wait_time_share0000_cy_3_rt_374 : STD_LOGIC; 
  signal Madd_wait_time_share0000_cy_6_rt_378 : STD_LOGIC; 
  signal Madd_wait_time_share0000_cy_7_rt_380 : STD_LOGIC; 
  signal Madd_wait_time_share0000_cy_8_rt_382 : STD_LOGIC; 
  signal Madd_wait_time_share0000_cy_9_rt_384 : STD_LOGIC; 
  signal Madd_wait_time_share0000_lut_1_Q : STD_LOGIC; 
  signal Madd_wait_time_share0000_lut_4_Q : STD_LOGIC; 
  signal Madd_wait_time_share0000_lut_5_Q : STD_LOGIC; 
  signal Madd_wait_time_share0000_xor_31_rt_388 : STD_LOGIC; 
  signal Mcompar_wait_time_cmp_ge0000_cy_0_1_422 : STD_LOGIC; 
  signal Mcompar_wait_time_cmp_ge0000_cy_0_2_423 : STD_LOGIC; 
  signal Mcompar_wait_time_cmp_ge0000_cy_0_3 : STD_LOGIC; 
  signal Mcompar_wait_time_cmp_ge0000_cy_0_0_rt_425 : STD_LOGIC; 
  signal Mcompar_wait_time_cmp_ge0000_cy_0_1_rt_426 : STD_LOGIC; 
  signal Mcompar_wait_time_cmp_ge0000_cy_0_2_rt_427 : STD_LOGIC; 
  signal Mcompar_wait_time_cmp_ge0000_cy_10_1_429 : STD_LOGIC; 
  signal Mcompar_wait_time_cmp_ge0000_cy_10_2 : STD_LOGIC; 
  signal Mcompar_wait_time_cmp_ge0000_cy_1_1_433 : STD_LOGIC; 
  signal Mcompar_wait_time_cmp_ge0000_cy_1_2_434 : STD_LOGIC; 
  signal Mcompar_wait_time_cmp_ge0000_cy_1_3 : STD_LOGIC; 
  signal Mcompar_wait_time_cmp_ge0000_cy_1_rt_436 : STD_LOGIC; 
  signal Mcompar_wait_time_cmp_ge0000_cy_2_1_438 : STD_LOGIC; 
  signal Mcompar_wait_time_cmp_ge0000_cy_2_2_439 : STD_LOGIC; 
  signal Mcompar_wait_time_cmp_ge0000_cy_2_3 : STD_LOGIC; 
  signal Mcompar_wait_time_cmp_ge0000_cy_2_1_rt_441 : STD_LOGIC; 
  signal Mcompar_wait_time_cmp_ge0000_cy_3_1_443 : STD_LOGIC; 
  signal Mcompar_wait_time_cmp_ge0000_cy_3_2_444 : STD_LOGIC; 
  signal Mcompar_wait_time_cmp_ge0000_cy_3_3 : STD_LOGIC; 
  signal Mcompar_wait_time_cmp_ge0000_cy_3_rt_446 : STD_LOGIC; 
  signal Mcompar_wait_time_cmp_ge0000_cy_4_1_448 : STD_LOGIC; 
  signal Mcompar_wait_time_cmp_ge0000_cy_4_2_449 : STD_LOGIC; 
  signal Mcompar_wait_time_cmp_ge0000_cy_4_3 : STD_LOGIC; 
  signal Mcompar_wait_time_cmp_ge0000_cy_4_2_rt_451 : STD_LOGIC; 
  signal Mcompar_wait_time_cmp_ge0000_cy_5_1_453 : STD_LOGIC; 
  signal Mcompar_wait_time_cmp_ge0000_cy_5_2_454 : STD_LOGIC; 
  signal Mcompar_wait_time_cmp_ge0000_cy_5_3 : STD_LOGIC; 
  signal Mcompar_wait_time_cmp_ge0000_cy_5_rt_456 : STD_LOGIC; 
  signal Mcompar_wait_time_cmp_ge0000_cy_6_1_458 : STD_LOGIC; 
  signal Mcompar_wait_time_cmp_ge0000_cy_6_2_459 : STD_LOGIC; 
  signal Mcompar_wait_time_cmp_ge0000_cy_6_3 : STD_LOGIC; 
  signal Mcompar_wait_time_cmp_ge0000_cy_6_0_rt_461 : STD_LOGIC; 
  signal Mcompar_wait_time_cmp_ge0000_cy_6_1_rt_462 : STD_LOGIC; 
  signal Mcompar_wait_time_cmp_ge0000_cy_7_1_464 : STD_LOGIC; 
  signal Mcompar_wait_time_cmp_ge0000_cy_7_2_465 : STD_LOGIC; 
  signal Mcompar_wait_time_cmp_ge0000_cy_7_3 : STD_LOGIC; 
  signal Mcompar_wait_time_cmp_ge0000_cy_7_rt_467 : STD_LOGIC; 
  signal Mcompar_wait_time_cmp_ge0000_cy_8_1_469 : STD_LOGIC; 
  signal Mcompar_wait_time_cmp_ge0000_cy_8_2_470 : STD_LOGIC; 
  signal Mcompar_wait_time_cmp_ge0000_cy_8_3 : STD_LOGIC; 
  signal Mcompar_wait_time_cmp_ge0000_cy_9_1_473 : STD_LOGIC; 
  signal Mcompar_wait_time_cmp_ge0000_cy_9_2_474 : STD_LOGIC; 
  signal Mcompar_wait_time_cmp_ge0000_lut_10_1_477 : STD_LOGIC; 
  signal Mcompar_wait_time_cmp_ge0000_lut_10_2_478 : STD_LOGIC; 
  signal Mcompar_wait_time_cmp_ge0000_lut_11_1 : STD_LOGIC; 
  signal Mcompar_wait_time_cmp_ge0000_lut_11_2 : STD_LOGIC; 
  signal Mcompar_wait_time_cmp_ge0000_lut_1_1_484 : STD_LOGIC; 
  signal Mcompar_wait_time_cmp_ge0000_lut_1_2_485 : STD_LOGIC; 
  signal Mcompar_wait_time_cmp_ge0000_lut_2_1_487 : STD_LOGIC; 
  signal Mcompar_wait_time_cmp_ge0000_lut_2_2_488 : STD_LOGIC; 
  signal Mcompar_wait_time_cmp_ge0000_lut_3_1 : STD_LOGIC; 
  signal Mcompar_wait_time_cmp_ge0000_lut_3_2_491 : STD_LOGIC; 
  signal Mcompar_wait_time_cmp_ge0000_lut_4_1_493 : STD_LOGIC; 
  signal Mcompar_wait_time_cmp_ge0000_lut_4_2_494 : STD_LOGIC; 
  signal Mcompar_wait_time_cmp_ge0000_lut_5_1_496 : STD_LOGIC; 
  signal Mcompar_wait_time_cmp_ge0000_lut_5_2_497 : STD_LOGIC; 
  signal Mcompar_wait_time_cmp_ge0000_lut_6_1_499 : STD_LOGIC; 
  signal Mcompar_wait_time_cmp_ge0000_lut_7_1_501 : STD_LOGIC; 
  signal Mcompar_wait_time_cmp_ge0000_lut_7_2_502 : STD_LOGIC; 
  signal Mcompar_wait_time_cmp_ge0000_lut_8_1_504 : STD_LOGIC; 
  signal Mcompar_wait_time_cmp_ge0000_lut_8_2_505 : STD_LOGIC; 
  signal Mcompar_wait_time_cmp_ge0000_lut_8_3_506 : STD_LOGIC; 
  signal Mcompar_wait_time_cmp_ge0000_lut_9_1_508 : STD_LOGIC; 
  signal Mcompar_wait_time_cmp_ge0000_lut_9_2_509 : STD_LOGIC; 
  signal Mcompar_wait_time_cmp_ge0000_lut_9_3 : STD_LOGIC; 
  signal Mcount_count_us_cy_10_rt_594 : STD_LOGIC; 
  signal Mcount_count_us_cy_11_rt_596 : STD_LOGIC; 
  signal Mcount_count_us_cy_12_rt_598 : STD_LOGIC; 
  signal Mcount_count_us_cy_13_rt_600 : STD_LOGIC; 
  signal Mcount_count_us_cy_14_rt_602 : STD_LOGIC; 
  signal Mcount_count_us_cy_15_rt_604 : STD_LOGIC; 
  signal Mcount_count_us_cy_16_rt_606 : STD_LOGIC; 
  signal Mcount_count_us_cy_17_rt_608 : STD_LOGIC; 
  signal Mcount_count_us_cy_18_rt_610 : STD_LOGIC; 
  signal Mcount_count_us_cy_19_rt_612 : STD_LOGIC; 
  signal Mcount_count_us_cy_1_rt_614 : STD_LOGIC; 
  signal Mcount_count_us_cy_20_rt_616 : STD_LOGIC; 
  signal Mcount_count_us_cy_21_rt_618 : STD_LOGIC; 
  signal Mcount_count_us_cy_22_rt_620 : STD_LOGIC; 
  signal Mcount_count_us_cy_23_rt_622 : STD_LOGIC; 
  signal Mcount_count_us_cy_24_rt_624 : STD_LOGIC; 
  signal Mcount_count_us_cy_25_rt_626 : STD_LOGIC; 
  signal Mcount_count_us_cy_26_rt_628 : STD_LOGIC; 
  signal Mcount_count_us_cy_27_rt_630 : STD_LOGIC; 
  signal Mcount_count_us_cy_28_rt_632 : STD_LOGIC; 
  signal Mcount_count_us_cy_29_rt_634 : STD_LOGIC; 
  signal Mcount_count_us_cy_2_rt_636 : STD_LOGIC; 
  signal Mcount_count_us_cy_30_rt_638 : STD_LOGIC; 
  signal Mcount_count_us_cy_3_rt_640 : STD_LOGIC; 
  signal Mcount_count_us_cy_4_rt_642 : STD_LOGIC; 
  signal Mcount_count_us_cy_5_rt_644 : STD_LOGIC; 
  signal Mcount_count_us_cy_6_rt_646 : STD_LOGIC; 
  signal Mcount_count_us_cy_7_rt_648 : STD_LOGIC; 
  signal Mcount_count_us_cy_8_rt_650 : STD_LOGIC; 
  signal Mcount_count_us_cy_9_rt_652 : STD_LOGIC; 
  signal Mcount_count_us_xor_31_rt_654 : STD_LOGIC; 
  signal Mrom_databus_mux0005 : STD_LOGIC; 
  signal Mrom_databus_mux000512 : STD_LOGIC; 
  signal N11 : STD_LOGIC; 
  signal N13 : STD_LOGIC; 
  signal N20 : STD_LOGIC; 
  signal N22 : STD_LOGIC; 
  signal N23 : STD_LOGIC; 
  signal N25 : STD_LOGIC; 
  signal N26 : STD_LOGIC; 
  signal N28 : STD_LOGIC; 
  signal N29 : STD_LOGIC; 
  signal N30 : STD_LOGIC; 
  signal N31 : STD_LOGIC; 
  signal N32 : STD_LOGIC; 
  signal N33 : STD_LOGIC; 
  signal N4 : STD_LOGIC; 
  signal N41 : STD_LOGIC; 
  signal N81 : STD_LOGIC; 
  signal N9 : STD_LOGIC; 
  signal RS_OBUF_675 : STD_LOGIC; 
  signal RS_mux0005 : STD_LOGIC; 
  signal Result_10_1 : STD_LOGIC; 
  signal Result_11_1 : STD_LOGIC; 
  signal Result_12_1 : STD_LOGIC; 
  signal Result_13_1 : STD_LOGIC; 
  signal Result_14_1 : STD_LOGIC; 
  signal Result_15_1 : STD_LOGIC; 
  signal Result_16_1 : STD_LOGIC; 
  signal Result_17_1 : STD_LOGIC; 
  signal Result_18_1 : STD_LOGIC; 
  signal Result_19_1 : STD_LOGIC; 
  signal Result_1_1 : STD_LOGIC; 
  signal Result_20_1 : STD_LOGIC; 
  signal Result_21_1 : STD_LOGIC; 
  signal Result_22_1 : STD_LOGIC; 
  signal Result_23_1 : STD_LOGIC; 
  signal Result_24_1 : STD_LOGIC; 
  signal Result_25_1 : STD_LOGIC; 
  signal Result_26_1 : STD_LOGIC; 
  signal Result_27_1 : STD_LOGIC; 
  signal Result_28_1 : STD_LOGIC; 
  signal Result_29_1 : STD_LOGIC; 
  signal Result_2_1 : STD_LOGIC; 
  signal Result_30_1 : STD_LOGIC; 
  signal Result_31_1 : STD_LOGIC; 
  signal Result_3_1 : STD_LOGIC; 
  signal Result_4_1 : STD_LOGIC; 
  signal Result_5_1 : STD_LOGIC; 
  signal Result_6_1 : STD_LOGIC; 
  signal Result_7_1 : STD_LOGIC; 
  signal Result_8_1 : STD_LOGIC; 
  signal Result_9_1 : STD_LOGIC; 
  signal SysCLK_IBUFG_741 : STD_LOGIC; 
  signal Unbuf_E_742 : STD_LOGIC; 
  signal Unbuf_E_mux0009 : STD_LOGIC; 
  signal Unbuf_E_mux0009115_744 : STD_LOGIC; 
  signal Unbuf_E_mux000919_745 : STD_LOGIC; 
  signal Unbuf_E_mux000936_759 : STD_LOGIC; 
  signal Unbuf_E_mux000968_760 : STD_LOGIC; 
  signal Unbuf_E_mux000971_761 : STD_LOGIC; 
  signal databus_0_802 : STD_LOGIC; 
  signal databus_1_803 : STD_LOGIC; 
  signal databus_2_804 : STD_LOGIC; 
  signal databus_3_805 : STD_LOGIC; 
  signal databus_4_806 : STD_LOGIC; 
  signal databus_5_807 : STD_LOGIC; 
  signal databus_6_808 : STD_LOGIC; 
  signal databus_7_809 : STD_LOGIC; 
  signal databus_cmp_ge0000 : STD_LOGIC; 
  signal databus_cmp_ge0001 : STD_LOGIC; 
  signal databus_cmp_ge0002 : STD_LOGIC; 
  signal databus_mux0006_0_84 : STD_LOGIC; 
  signal databus_mux0006_0_841_842 : STD_LOGIC; 
  signal databus_mux0006_1_27_844 : STD_LOGIC; 
  signal databus_mux0006_2_50_846 : STD_LOGIC; 
  signal databus_mux0006_3_39_848 : STD_LOGIC; 
  signal databus_not0001 : STD_LOGIC; 
  signal wait_time_cmp_ge0000 : STD_LOGIC; 
  signal wait_time_cmp_ge00001 : STD_LOGIC; 
  signal wait_time_cmp_ge0001 : STD_LOGIC; 
  signal wait_time_cmp_lt0000 : STD_LOGIC; 
  signal G1_CLK1MHz_cmp_eq00001_wg_cy : STD_LOGIC_VECTOR ( 6 downto 0 ); 
  signal G1_CLK1MHz_cmp_eq00001_wg_lut : STD_LOGIC_VECTOR ( 6 downto 0 ); 
  signal G1_Madd_cnt_add0000_cy : STD_LOGIC_VECTOR ( 30 downto 0 ); 
  signal G1_Madd_cnt_add0000_lut : STD_LOGIC_VECTOR ( 0 downto 0 ); 
  signal G1_Mcount_cnt_cy : STD_LOGIC_VECTOR ( 30 downto 0 ); 
  signal G1_Mcount_cnt_lut : STD_LOGIC_VECTOR ( 0 downto 0 ); 
  signal G1_cnt : STD_LOGIC_VECTOR ( 31 downto 0 ); 
  signal G1_cnt_add0000 : STD_LOGIC_VECTOR ( 31 downto 1 ); 
  signal Madd_databus_add0000_cy : STD_LOGIC_VECTOR ( 30 downto 4 ); 
  signal Madd_index_addsub0000_cy : STD_LOGIC_VECTOR ( 30 downto 0 ); 
  signal Madd_index_addsub0000_lut : STD_LOGIC_VECTOR ( 0 downto 0 ); 
  signal Madd_wait_time_share0000_cy : STD_LOGIC_VECTOR ( 30 downto 1 ); 
  signal Mcompar_wait_time_cmp_eq0000_cy : STD_LOGIC_VECTOR ( 15 downto 0 ); 
  signal Mcompar_wait_time_cmp_eq0000_lut : STD_LOGIC_VECTOR ( 15 downto 0 ); 
  signal Mcompar_wait_time_cmp_ge0000_cy : STD_LOGIC_VECTOR ( 11 downto 0 ); 
  signal Mcompar_wait_time_cmp_ge0000_lut : STD_LOGIC_VECTOR ( 12 downto 0 ); 
  signal Mcompar_wait_time_cmp_ge0001_cy : STD_LOGIC_VECTOR ( 30 downto 0 ); 
  signal Mcompar_wait_time_cmp_ge0001_lut : STD_LOGIC_VECTOR ( 31 downto 0 ); 
  signal Mcompar_wait_time_cmp_lt0000_cy : STD_LOGIC_VECTOR ( 8 downto 0 ); 
  signal Mcompar_wait_time_cmp_lt0000_lut : STD_LOGIC_VECTOR ( 8 downto 0 ); 
  signal Mcount_count_us_cy : STD_LOGIC_VECTOR ( 30 downto 0 ); 
  signal Mcount_count_us_lut : STD_LOGIC_VECTOR ( 0 downto 0 ); 
  signal Result : STD_LOGIC_VECTOR ( 31 downto 1 ); 
  signal Unbuf_E_mux00092_wg_cy : STD_LOGIC_VECTOR ( 5 downto 0 ); 
  signal Unbuf_E_mux00092_wg_lut : STD_LOGIC_VECTOR ( 6 downto 0 ); 
  signal count_us : STD_LOGIC_VECTOR ( 31 downto 0 ); 
  signal databus_add0000 : STD_LOGIC_VECTOR ( 31 downto 5 ); 
  signal databus_mux0006 : STD_LOGIC_VECTOR ( 7 downto 0 ); 
  signal index : STD_LOGIC_VECTOR ( 31 downto 0 ); 
  signal index_addsub0000 : STD_LOGIC_VECTOR ( 31 downto 1 ); 
  signal index_mux0003 : STD_LOGIC_VECTOR ( 31 downto 0 ); 
  signal wait_time : STD_LOGIC_VECTOR ( 31 downto 1 ); 
  signal wait_time_mux0003 : STD_LOGIC_VECTOR ( 31 downto 1 ); 
  signal wait_time_share0000 : STD_LOGIC_VECTOR ( 31 downto 2 ); 
begin
  XST_GND : GND
    port map (
      G => Mrom_databus_mux000512
    );
  XST_VCC : VCC
    port map (
      P => Mrom_databus_mux0005
    );
  RS_3 : LD
    generic map(
      INIT => '0'
    )
    port map (
      D => RS_mux0005,
      G => databus_not0001,
      Q => RS_OBUF_675
    );
  Unbuf_E : LD
    port map (
      D => Unbuf_E_mux0009,
      G => databus_not0001,
      Q => Unbuf_E_742
    );
  databus_0 : LD
    port map (
      D => databus_mux0006(0),
      G => databus_not0001,
      Q => databus_0_802
    );
  databus_1 : LD
    port map (
      D => databus_mux0006(1),
      G => databus_not0001,
      Q => databus_1_803
    );
  databus_2 : LD
    port map (
      D => databus_mux0006(2),
      G => databus_not0001,
      Q => databus_2_804
    );
  databus_3 : LD
    port map (
      D => databus_mux0006(3),
      G => databus_not0001,
      Q => databus_3_805
    );
  databus_4 : LD
    port map (
      D => databus_mux0006(4),
      G => databus_not0001,
      Q => databus_4_806
    );
  databus_5 : LD
    port map (
      D => databus_mux0006(5),
      G => databus_not0001,
      Q => databus_5_807
    );
  databus_6 : LD
    port map (
      D => databus_mux0006(6),
      G => databus_not0001,
      Q => databus_6_808
    );
  databus_7 : LD
    port map (
      D => databus_mux0006(7),
      G => databus_not0001,
      Q => databus_7_809
    );
  G1_CLK1MHz : FDRE
    port map (
      C => Buf_SysCLK,
      CE => G1_CLK1MHz_cmp_eq0000_5,
      D => Mrom_databus_mux0005,
      R => G1_cnt_cmp_eq0000_209,
      Q => G1_CLK1MHz_4
    );
  count_us_0 : FD
    generic map(
      INIT => '0'
    )
    port map (
      C => Buf_CLK1MHz,
      D => Mcount_count_us_lut(0),
      Q => count_us(0)
    );
  count_us_1 : FD
    generic map(
      INIT => '0'
    )
    port map (
      C => Buf_CLK1MHz,
      D => Result(1),
      Q => count_us(1)
    );
  count_us_2 : FD
    generic map(
      INIT => '0'
    )
    port map (
      C => Buf_CLK1MHz,
      D => Result(2),
      Q => count_us(2)
    );
  count_us_3 : FD
    generic map(
      INIT => '0'
    )
    port map (
      C => Buf_CLK1MHz,
      D => Result(3),
      Q => count_us(3)
    );
  count_us_4 : FD
    generic map(
      INIT => '0'
    )
    port map (
      C => Buf_CLK1MHz,
      D => Result(4),
      Q => count_us(4)
    );
  count_us_5 : FD
    generic map(
      INIT => '0'
    )
    port map (
      C => Buf_CLK1MHz,
      D => Result(5),
      Q => count_us(5)
    );
  count_us_6 : FD
    generic map(
      INIT => '0'
    )
    port map (
      C => Buf_CLK1MHz,
      D => Result(6),
      Q => count_us(6)
    );
  count_us_7 : FD
    generic map(
      INIT => '0'
    )
    port map (
      C => Buf_CLK1MHz,
      D => Result(7),
      Q => count_us(7)
    );
  count_us_8 : FD
    generic map(
      INIT => '0'
    )
    port map (
      C => Buf_CLK1MHz,
      D => Result(8),
      Q => count_us(8)
    );
  count_us_9 : FD
    generic map(
      INIT => '0'
    )
    port map (
      C => Buf_CLK1MHz,
      D => Result(9),
      Q => count_us(9)
    );
  count_us_10 : FD
    generic map(
      INIT => '0'
    )
    port map (
      C => Buf_CLK1MHz,
      D => Result(10),
      Q => count_us(10)
    );
  count_us_11 : FD
    generic map(
      INIT => '0'
    )
    port map (
      C => Buf_CLK1MHz,
      D => Result(11),
      Q => count_us(11)
    );
  count_us_12 : FD
    generic map(
      INIT => '0'
    )
    port map (
      C => Buf_CLK1MHz,
      D => Result(12),
      Q => count_us(12)
    );
  count_us_13 : FD
    generic map(
      INIT => '0'
    )
    port map (
      C => Buf_CLK1MHz,
      D => Result(13),
      Q => count_us(13)
    );
  count_us_14 : FD
    generic map(
      INIT => '0'
    )
    port map (
      C => Buf_CLK1MHz,
      D => Result(14),
      Q => count_us(14)
    );
  count_us_15 : FD
    generic map(
      INIT => '0'
    )
    port map (
      C => Buf_CLK1MHz,
      D => Result(15),
      Q => count_us(15)
    );
  count_us_16 : FD
    generic map(
      INIT => '0'
    )
    port map (
      C => Buf_CLK1MHz,
      D => Result(16),
      Q => count_us(16)
    );
  count_us_17 : FD
    generic map(
      INIT => '0'
    )
    port map (
      C => Buf_CLK1MHz,
      D => Result(17),
      Q => count_us(17)
    );
  count_us_18 : FD
    generic map(
      INIT => '0'
    )
    port map (
      C => Buf_CLK1MHz,
      D => Result(18),
      Q => count_us(18)
    );
  count_us_19 : FD
    generic map(
      INIT => '0'
    )
    port map (
      C => Buf_CLK1MHz,
      D => Result(19),
      Q => count_us(19)
    );
  count_us_20 : FD
    generic map(
      INIT => '0'
    )
    port map (
      C => Buf_CLK1MHz,
      D => Result(20),
      Q => count_us(20)
    );
  count_us_21 : FD
    generic map(
      INIT => '0'
    )
    port map (
      C => Buf_CLK1MHz,
      D => Result(21),
      Q => count_us(21)
    );
  count_us_22 : FD
    generic map(
      INIT => '0'
    )
    port map (
      C => Buf_CLK1MHz,
      D => Result(22),
      Q => count_us(22)
    );
  count_us_23 : FD
    generic map(
      INIT => '0'
    )
    port map (
      C => Buf_CLK1MHz,
      D => Result(23),
      Q => count_us(23)
    );
  count_us_24 : FD
    generic map(
      INIT => '0'
    )
    port map (
      C => Buf_CLK1MHz,
      D => Result(24),
      Q => count_us(24)
    );
  count_us_25 : FD
    generic map(
      INIT => '0'
    )
    port map (
      C => Buf_CLK1MHz,
      D => Result(25),
      Q => count_us(25)
    );
  count_us_26 : FD
    generic map(
      INIT => '0'
    )
    port map (
      C => Buf_CLK1MHz,
      D => Result(26),
      Q => count_us(26)
    );
  count_us_27 : FD
    generic map(
      INIT => '0'
    )
    port map (
      C => Buf_CLK1MHz,
      D => Result(27),
      Q => count_us(27)
    );
  count_us_28 : FD
    generic map(
      INIT => '0'
    )
    port map (
      C => Buf_CLK1MHz,
      D => Result(28),
      Q => count_us(28)
    );
  count_us_29 : FD
    generic map(
      INIT => '0'
    )
    port map (
      C => Buf_CLK1MHz,
      D => Result(29),
      Q => count_us(29)
    );
  count_us_30 : FD
    generic map(
      INIT => '0'
    )
    port map (
      C => Buf_CLK1MHz,
      D => Result(30),
      Q => count_us(30)
    );
  count_us_31 : FD
    generic map(
      INIT => '0'
    )
    port map (
      C => Buf_CLK1MHz,
      D => Result(31),
      Q => count_us(31)
    );
  G1_cnt_0 : FDR
    generic map(
      INIT => '0'
    )
    port map (
      C => Buf_SysCLK,
      D => G1_Mcount_cnt_lut(0),
      R => G1_cnt_cmp_eq0000_209,
      Q => G1_cnt(0)
    );
  G1_cnt_1 : FDR
    generic map(
      INIT => '0'
    )
    port map (
      C => Buf_SysCLK,
      D => Result_1_1,
      R => G1_cnt_cmp_eq0000_209,
      Q => G1_cnt(1)
    );
  G1_cnt_2 : FDR
    generic map(
      INIT => '0'
    )
    port map (
      C => Buf_SysCLK,
      D => Result_2_1,
      R => G1_cnt_cmp_eq0000_209,
      Q => G1_cnt(2)
    );
  G1_cnt_3 : FDR
    generic map(
      INIT => '0'
    )
    port map (
      C => Buf_SysCLK,
      D => Result_3_1,
      R => G1_cnt_cmp_eq0000_209,
      Q => G1_cnt(3)
    );
  G1_cnt_4 : FDR
    generic map(
      INIT => '0'
    )
    port map (
      C => Buf_SysCLK,
      D => Result_4_1,
      R => G1_cnt_cmp_eq0000_209,
      Q => G1_cnt(4)
    );
  G1_cnt_5 : FDR
    generic map(
      INIT => '0'
    )
    port map (
      C => Buf_SysCLK,
      D => Result_5_1,
      R => G1_cnt_cmp_eq0000_209,
      Q => G1_cnt(5)
    );
  G1_cnt_6 : FDR
    generic map(
      INIT => '0'
    )
    port map (
      C => Buf_SysCLK,
      D => Result_6_1,
      R => G1_cnt_cmp_eq0000_209,
      Q => G1_cnt(6)
    );
  G1_cnt_7 : FDR
    generic map(
      INIT => '0'
    )
    port map (
      C => Buf_SysCLK,
      D => Result_7_1,
      R => G1_cnt_cmp_eq0000_209,
      Q => G1_cnt(7)
    );
  G1_cnt_8 : FDR
    generic map(
      INIT => '0'
    )
    port map (
      C => Buf_SysCLK,
      D => Result_8_1,
      R => G1_cnt_cmp_eq0000_209,
      Q => G1_cnt(8)
    );
  G1_cnt_9 : FDR
    generic map(
      INIT => '0'
    )
    port map (
      C => Buf_SysCLK,
      D => Result_9_1,
      R => G1_cnt_cmp_eq0000_209,
      Q => G1_cnt(9)
    );
  G1_cnt_10 : FDR
    generic map(
      INIT => '0'
    )
    port map (
      C => Buf_SysCLK,
      D => Result_10_1,
      R => G1_cnt_cmp_eq0000_209,
      Q => G1_cnt(10)
    );
  G1_cnt_11 : FDR
    generic map(
      INIT => '0'
    )
    port map (
      C => Buf_SysCLK,
      D => Result_11_1,
      R => G1_cnt_cmp_eq0000_209,
      Q => G1_cnt(11)
    );
  G1_cnt_12 : FDR
    generic map(
      INIT => '0'
    )
    port map (
      C => Buf_SysCLK,
      D => Result_12_1,
      R => G1_cnt_cmp_eq0000_209,
      Q => G1_cnt(12)
    );
  G1_cnt_13 : FDR
    generic map(
      INIT => '0'
    )
    port map (
      C => Buf_SysCLK,
      D => Result_13_1,
      R => G1_cnt_cmp_eq0000_209,
      Q => G1_cnt(13)
    );
  G1_cnt_14 : FDR
    generic map(
      INIT => '0'
    )
    port map (
      C => Buf_SysCLK,
      D => Result_14_1,
      R => G1_cnt_cmp_eq0000_209,
      Q => G1_cnt(14)
    );
  G1_cnt_15 : FDR
    generic map(
      INIT => '0'
    )
    port map (
      C => Buf_SysCLK,
      D => Result_15_1,
      R => G1_cnt_cmp_eq0000_209,
      Q => G1_cnt(15)
    );
  G1_cnt_16 : FDR
    generic map(
      INIT => '0'
    )
    port map (
      C => Buf_SysCLK,
      D => Result_16_1,
      R => G1_cnt_cmp_eq0000_209,
      Q => G1_cnt(16)
    );
  G1_cnt_17 : FDR
    generic map(
      INIT => '0'
    )
    port map (
      C => Buf_SysCLK,
      D => Result_17_1,
      R => G1_cnt_cmp_eq0000_209,
      Q => G1_cnt(17)
    );
  G1_cnt_18 : FDR
    generic map(
      INIT => '0'
    )
    port map (
      C => Buf_SysCLK,
      D => Result_18_1,
      R => G1_cnt_cmp_eq0000_209,
      Q => G1_cnt(18)
    );
  G1_cnt_19 : FDR
    generic map(
      INIT => '0'
    )
    port map (
      C => Buf_SysCLK,
      D => Result_19_1,
      R => G1_cnt_cmp_eq0000_209,
      Q => G1_cnt(19)
    );
  G1_cnt_20 : FDR
    generic map(
      INIT => '0'
    )
    port map (
      C => Buf_SysCLK,
      D => Result_20_1,
      R => G1_cnt_cmp_eq0000_209,
      Q => G1_cnt(20)
    );
  G1_cnt_21 : FDR
    generic map(
      INIT => '0'
    )
    port map (
      C => Buf_SysCLK,
      D => Result_21_1,
      R => G1_cnt_cmp_eq0000_209,
      Q => G1_cnt(21)
    );
  G1_cnt_22 : FDR
    generic map(
      INIT => '0'
    )
    port map (
      C => Buf_SysCLK,
      D => Result_22_1,
      R => G1_cnt_cmp_eq0000_209,
      Q => G1_cnt(22)
    );
  G1_cnt_23 : FDR
    generic map(
      INIT => '0'
    )
    port map (
      C => Buf_SysCLK,
      D => Result_23_1,
      R => G1_cnt_cmp_eq0000_209,
      Q => G1_cnt(23)
    );
  G1_cnt_24 : FDR
    generic map(
      INIT => '0'
    )
    port map (
      C => Buf_SysCLK,
      D => Result_24_1,
      R => G1_cnt_cmp_eq0000_209,
      Q => G1_cnt(24)
    );
  G1_cnt_25 : FDR
    generic map(
      INIT => '0'
    )
    port map (
      C => Buf_SysCLK,
      D => Result_25_1,
      R => G1_cnt_cmp_eq0000_209,
      Q => G1_cnt(25)
    );
  G1_cnt_26 : FDR
    generic map(
      INIT => '0'
    )
    port map (
      C => Buf_SysCLK,
      D => Result_26_1,
      R => G1_cnt_cmp_eq0000_209,
      Q => G1_cnt(26)
    );
  G1_cnt_27 : FDR
    generic map(
      INIT => '0'
    )
    port map (
      C => Buf_SysCLK,
      D => Result_27_1,
      R => G1_cnt_cmp_eq0000_209,
      Q => G1_cnt(27)
    );
  G1_cnt_28 : FDR
    generic map(
      INIT => '0'
    )
    port map (
      C => Buf_SysCLK,
      D => Result_28_1,
      R => G1_cnt_cmp_eq0000_209,
      Q => G1_cnt(28)
    );
  G1_cnt_29 : FDR
    generic map(
      INIT => '0'
    )
    port map (
      C => Buf_SysCLK,
      D => Result_29_1,
      R => G1_cnt_cmp_eq0000_209,
      Q => G1_cnt(29)
    );
  G1_cnt_30 : FDR
    generic map(
      INIT => '0'
    )
    port map (
      C => Buf_SysCLK,
      D => Result_30_1,
      R => G1_cnt_cmp_eq0000_209,
      Q => G1_cnt(30)
    );
  G1_cnt_31 : FDR
    generic map(
      INIT => '0'
    )
    port map (
      C => Buf_SysCLK,
      D => Result_31_1,
      R => G1_cnt_cmp_eq0000_209,
      Q => G1_cnt(31)
    );
  Madd_wait_time_share0000_cy_1_Q : MUXCY
    port map (
      CI => Mrom_databus_mux000512,
      DI => Mrom_databus_mux0005,
      S => Madd_wait_time_share0000_lut_1_Q,
      O => Madd_wait_time_share0000_cy(1)
    );
  Madd_wait_time_share0000_cy_2_Q : MUXCY
    port map (
      CI => Madd_wait_time_share0000_cy(1),
      DI => Mrom_databus_mux000512,
      S => Madd_wait_time_share0000_cy_2_rt_370,
      O => Madd_wait_time_share0000_cy(2)
    );
  Madd_wait_time_share0000_xor_2_Q : XORCY
    port map (
      CI => Madd_wait_time_share0000_cy(1),
      LI => Madd_wait_time_share0000_cy_2_rt_370,
      O => wait_time_share0000(2)
    );
  Madd_wait_time_share0000_cy_3_Q : MUXCY
    port map (
      CI => Madd_wait_time_share0000_cy(2),
      DI => Mrom_databus_mux000512,
      S => Madd_wait_time_share0000_cy_3_rt_374,
      O => Madd_wait_time_share0000_cy(3)
    );
  Madd_wait_time_share0000_xor_3_Q : XORCY
    port map (
      CI => Madd_wait_time_share0000_cy(2),
      LI => Madd_wait_time_share0000_cy_3_rt_374,
      O => wait_time_share0000(3)
    );
  Madd_wait_time_share0000_cy_4_Q : MUXCY
    port map (
      CI => Madd_wait_time_share0000_cy(3),
      DI => Mrom_databus_mux0005,
      S => Madd_wait_time_share0000_lut_4_Q,
      O => Madd_wait_time_share0000_cy(4)
    );
  Madd_wait_time_share0000_xor_4_Q : XORCY
    port map (
      CI => Madd_wait_time_share0000_cy(3),
      LI => Madd_wait_time_share0000_lut_4_Q,
      O => wait_time_share0000(4)
    );
  Madd_wait_time_share0000_cy_5_Q : MUXCY
    port map (
      CI => Madd_wait_time_share0000_cy(4),
      DI => Mrom_databus_mux0005,
      S => Madd_wait_time_share0000_lut_5_Q,
      O => Madd_wait_time_share0000_cy(5)
    );
  Madd_wait_time_share0000_xor_5_Q : XORCY
    port map (
      CI => Madd_wait_time_share0000_cy(4),
      LI => Madd_wait_time_share0000_lut_5_Q,
      O => wait_time_share0000(5)
    );
  Madd_wait_time_share0000_cy_6_Q : MUXCY
    port map (
      CI => Madd_wait_time_share0000_cy(5),
      DI => Mrom_databus_mux000512,
      S => Madd_wait_time_share0000_cy_6_rt_378,
      O => Madd_wait_time_share0000_cy(6)
    );
  Madd_wait_time_share0000_xor_6_Q : XORCY
    port map (
      CI => Madd_wait_time_share0000_cy(5),
      LI => Madd_wait_time_share0000_cy_6_rt_378,
      O => wait_time_share0000(6)
    );
  Madd_wait_time_share0000_cy_7_Q : MUXCY
    port map (
      CI => Madd_wait_time_share0000_cy(6),
      DI => Mrom_databus_mux000512,
      S => Madd_wait_time_share0000_cy_7_rt_380,
      O => Madd_wait_time_share0000_cy(7)
    );
  Madd_wait_time_share0000_xor_7_Q : XORCY
    port map (
      CI => Madd_wait_time_share0000_cy(6),
      LI => Madd_wait_time_share0000_cy_7_rt_380,
      O => wait_time_share0000(7)
    );
  Madd_wait_time_share0000_cy_8_Q : MUXCY
    port map (
      CI => Madd_wait_time_share0000_cy(7),
      DI => Mrom_databus_mux000512,
      S => Madd_wait_time_share0000_cy_8_rt_382,
      O => Madd_wait_time_share0000_cy(8)
    );
  Madd_wait_time_share0000_xor_8_Q : XORCY
    port map (
      CI => Madd_wait_time_share0000_cy(7),
      LI => Madd_wait_time_share0000_cy_8_rt_382,
      O => wait_time_share0000(8)
    );
  Madd_wait_time_share0000_cy_9_Q : MUXCY
    port map (
      CI => Madd_wait_time_share0000_cy(8),
      DI => Mrom_databus_mux000512,
      S => Madd_wait_time_share0000_cy_9_rt_384,
      O => Madd_wait_time_share0000_cy(9)
    );
  Madd_wait_time_share0000_xor_9_Q : XORCY
    port map (
      CI => Madd_wait_time_share0000_cy(8),
      LI => Madd_wait_time_share0000_cy_9_rt_384,
      O => wait_time_share0000(9)
    );
  Madd_wait_time_share0000_cy_10_Q : MUXCY
    port map (
      CI => Madd_wait_time_share0000_cy(9),
      DI => Mrom_databus_mux000512,
      S => Madd_wait_time_share0000_cy_10_rt_329,
      O => Madd_wait_time_share0000_cy(10)
    );
  Madd_wait_time_share0000_xor_10_Q : XORCY
    port map (
      CI => Madd_wait_time_share0000_cy(9),
      LI => Madd_wait_time_share0000_cy_10_rt_329,
      O => wait_time_share0000(10)
    );
  Madd_wait_time_share0000_cy_11_Q : MUXCY
    port map (
      CI => Madd_wait_time_share0000_cy(10),
      DI => Mrom_databus_mux000512,
      S => Madd_wait_time_share0000_cy_11_rt_331,
      O => Madd_wait_time_share0000_cy(11)
    );
  Madd_wait_time_share0000_xor_11_Q : XORCY
    port map (
      CI => Madd_wait_time_share0000_cy(10),
      LI => Madd_wait_time_share0000_cy_11_rt_331,
      O => wait_time_share0000(11)
    );
  Madd_wait_time_share0000_cy_12_Q : MUXCY
    port map (
      CI => Madd_wait_time_share0000_cy(11),
      DI => Mrom_databus_mux000512,
      S => Madd_wait_time_share0000_cy_12_rt_333,
      O => Madd_wait_time_share0000_cy(12)
    );
  Madd_wait_time_share0000_xor_12_Q : XORCY
    port map (
      CI => Madd_wait_time_share0000_cy(11),
      LI => Madd_wait_time_share0000_cy_12_rt_333,
      O => wait_time_share0000(12)
    );
  Madd_wait_time_share0000_cy_13_Q : MUXCY
    port map (
      CI => Madd_wait_time_share0000_cy(12),
      DI => Mrom_databus_mux000512,
      S => Madd_wait_time_share0000_cy_13_rt_335,
      O => Madd_wait_time_share0000_cy(13)
    );
  Madd_wait_time_share0000_xor_13_Q : XORCY
    port map (
      CI => Madd_wait_time_share0000_cy(12),
      LI => Madd_wait_time_share0000_cy_13_rt_335,
      O => wait_time_share0000(13)
    );
  Madd_wait_time_share0000_cy_14_Q : MUXCY
    port map (
      CI => Madd_wait_time_share0000_cy(13),
      DI => Mrom_databus_mux000512,
      S => Madd_wait_time_share0000_cy_14_rt_337,
      O => Madd_wait_time_share0000_cy(14)
    );
  Madd_wait_time_share0000_xor_14_Q : XORCY
    port map (
      CI => Madd_wait_time_share0000_cy(13),
      LI => Madd_wait_time_share0000_cy_14_rt_337,
      O => wait_time_share0000(14)
    );
  Madd_wait_time_share0000_cy_15_Q : MUXCY
    port map (
      CI => Madd_wait_time_share0000_cy(14),
      DI => Mrom_databus_mux000512,
      S => Madd_wait_time_share0000_cy_15_rt_339,
      O => Madd_wait_time_share0000_cy(15)
    );
  Madd_wait_time_share0000_xor_15_Q : XORCY
    port map (
      CI => Madd_wait_time_share0000_cy(14),
      LI => Madd_wait_time_share0000_cy_15_rt_339,
      O => wait_time_share0000(15)
    );
  Madd_wait_time_share0000_cy_16_Q : MUXCY
    port map (
      CI => Madd_wait_time_share0000_cy(15),
      DI => Mrom_databus_mux000512,
      S => Madd_wait_time_share0000_cy_16_rt_341,
      O => Madd_wait_time_share0000_cy(16)
    );
  Madd_wait_time_share0000_xor_16_Q : XORCY
    port map (
      CI => Madd_wait_time_share0000_cy(15),
      LI => Madd_wait_time_share0000_cy_16_rt_341,
      O => wait_time_share0000(16)
    );
  Madd_wait_time_share0000_cy_17_Q : MUXCY
    port map (
      CI => Madd_wait_time_share0000_cy(16),
      DI => Mrom_databus_mux000512,
      S => Madd_wait_time_share0000_cy_17_rt_343,
      O => Madd_wait_time_share0000_cy(17)
    );
  Madd_wait_time_share0000_xor_17_Q : XORCY
    port map (
      CI => Madd_wait_time_share0000_cy(16),
      LI => Madd_wait_time_share0000_cy_17_rt_343,
      O => wait_time_share0000(17)
    );
  Madd_wait_time_share0000_cy_18_Q : MUXCY
    port map (
      CI => Madd_wait_time_share0000_cy(17),
      DI => Mrom_databus_mux000512,
      S => Madd_wait_time_share0000_cy_18_rt_345,
      O => Madd_wait_time_share0000_cy(18)
    );
  Madd_wait_time_share0000_xor_18_Q : XORCY
    port map (
      CI => Madd_wait_time_share0000_cy(17),
      LI => Madd_wait_time_share0000_cy_18_rt_345,
      O => wait_time_share0000(18)
    );
  Madd_wait_time_share0000_cy_19_Q : MUXCY
    port map (
      CI => Madd_wait_time_share0000_cy(18),
      DI => Mrom_databus_mux000512,
      S => Madd_wait_time_share0000_cy_19_rt_347,
      O => Madd_wait_time_share0000_cy(19)
    );
  Madd_wait_time_share0000_xor_19_Q : XORCY
    port map (
      CI => Madd_wait_time_share0000_cy(18),
      LI => Madd_wait_time_share0000_cy_19_rt_347,
      O => wait_time_share0000(19)
    );
  Madd_wait_time_share0000_cy_20_Q : MUXCY
    port map (
      CI => Madd_wait_time_share0000_cy(19),
      DI => Mrom_databus_mux000512,
      S => Madd_wait_time_share0000_cy_20_rt_350,
      O => Madd_wait_time_share0000_cy(20)
    );
  Madd_wait_time_share0000_xor_20_Q : XORCY
    port map (
      CI => Madd_wait_time_share0000_cy(19),
      LI => Madd_wait_time_share0000_cy_20_rt_350,
      O => wait_time_share0000(20)
    );
  Madd_wait_time_share0000_cy_21_Q : MUXCY
    port map (
      CI => Madd_wait_time_share0000_cy(20),
      DI => Mrom_databus_mux000512,
      S => Madd_wait_time_share0000_cy_21_rt_352,
      O => Madd_wait_time_share0000_cy(21)
    );
  Madd_wait_time_share0000_xor_21_Q : XORCY
    port map (
      CI => Madd_wait_time_share0000_cy(20),
      LI => Madd_wait_time_share0000_cy_21_rt_352,
      O => wait_time_share0000(21)
    );
  Madd_wait_time_share0000_cy_22_Q : MUXCY
    port map (
      CI => Madd_wait_time_share0000_cy(21),
      DI => Mrom_databus_mux000512,
      S => Madd_wait_time_share0000_cy_22_rt_354,
      O => Madd_wait_time_share0000_cy(22)
    );
  Madd_wait_time_share0000_xor_22_Q : XORCY
    port map (
      CI => Madd_wait_time_share0000_cy(21),
      LI => Madd_wait_time_share0000_cy_22_rt_354,
      O => wait_time_share0000(22)
    );
  Madd_wait_time_share0000_cy_23_Q : MUXCY
    port map (
      CI => Madd_wait_time_share0000_cy(22),
      DI => Mrom_databus_mux000512,
      S => Madd_wait_time_share0000_cy_23_rt_356,
      O => Madd_wait_time_share0000_cy(23)
    );
  Madd_wait_time_share0000_xor_23_Q : XORCY
    port map (
      CI => Madd_wait_time_share0000_cy(22),
      LI => Madd_wait_time_share0000_cy_23_rt_356,
      O => wait_time_share0000(23)
    );
  Madd_wait_time_share0000_cy_24_Q : MUXCY
    port map (
      CI => Madd_wait_time_share0000_cy(23),
      DI => Mrom_databus_mux000512,
      S => Madd_wait_time_share0000_cy_24_rt_358,
      O => Madd_wait_time_share0000_cy(24)
    );
  Madd_wait_time_share0000_xor_24_Q : XORCY
    port map (
      CI => Madd_wait_time_share0000_cy(23),
      LI => Madd_wait_time_share0000_cy_24_rt_358,
      O => wait_time_share0000(24)
    );
  Madd_wait_time_share0000_cy_25_Q : MUXCY
    port map (
      CI => Madd_wait_time_share0000_cy(24),
      DI => Mrom_databus_mux000512,
      S => Madd_wait_time_share0000_cy_25_rt_360,
      O => Madd_wait_time_share0000_cy(25)
    );
  Madd_wait_time_share0000_xor_25_Q : XORCY
    port map (
      CI => Madd_wait_time_share0000_cy(24),
      LI => Madd_wait_time_share0000_cy_25_rt_360,
      O => wait_time_share0000(25)
    );
  Madd_wait_time_share0000_cy_26_Q : MUXCY
    port map (
      CI => Madd_wait_time_share0000_cy(25),
      DI => Mrom_databus_mux000512,
      S => Madd_wait_time_share0000_cy_26_rt_362,
      O => Madd_wait_time_share0000_cy(26)
    );
  Madd_wait_time_share0000_xor_26_Q : XORCY
    port map (
      CI => Madd_wait_time_share0000_cy(25),
      LI => Madd_wait_time_share0000_cy_26_rt_362,
      O => wait_time_share0000(26)
    );
  Madd_wait_time_share0000_cy_27_Q : MUXCY
    port map (
      CI => Madd_wait_time_share0000_cy(26),
      DI => Mrom_databus_mux000512,
      S => Madd_wait_time_share0000_cy_27_rt_364,
      O => Madd_wait_time_share0000_cy(27)
    );
  Madd_wait_time_share0000_xor_27_Q : XORCY
    port map (
      CI => Madd_wait_time_share0000_cy(26),
      LI => Madd_wait_time_share0000_cy_27_rt_364,
      O => wait_time_share0000(27)
    );
  Madd_wait_time_share0000_cy_28_Q : MUXCY
    port map (
      CI => Madd_wait_time_share0000_cy(27),
      DI => Mrom_databus_mux000512,
      S => Madd_wait_time_share0000_cy_28_rt_366,
      O => Madd_wait_time_share0000_cy(28)
    );
  Madd_wait_time_share0000_xor_28_Q : XORCY
    port map (
      CI => Madd_wait_time_share0000_cy(27),
      LI => Madd_wait_time_share0000_cy_28_rt_366,
      O => wait_time_share0000(28)
    );
  Madd_wait_time_share0000_cy_29_Q : MUXCY
    port map (
      CI => Madd_wait_time_share0000_cy(28),
      DI => Mrom_databus_mux000512,
      S => Madd_wait_time_share0000_cy_29_rt_368,
      O => Madd_wait_time_share0000_cy(29)
    );
  Madd_wait_time_share0000_xor_29_Q : XORCY
    port map (
      CI => Madd_wait_time_share0000_cy(28),
      LI => Madd_wait_time_share0000_cy_29_rt_368,
      O => wait_time_share0000(29)
    );
  Madd_wait_time_share0000_cy_30_Q : MUXCY
    port map (
      CI => Madd_wait_time_share0000_cy(29),
      DI => Mrom_databus_mux000512,
      S => Madd_wait_time_share0000_cy_30_rt_372,
      O => Madd_wait_time_share0000_cy(30)
    );
  Madd_wait_time_share0000_xor_30_Q : XORCY
    port map (
      CI => Madd_wait_time_share0000_cy(29),
      LI => Madd_wait_time_share0000_cy_30_rt_372,
      O => wait_time_share0000(30)
    );
  Madd_wait_time_share0000_xor_31_Q : XORCY
    port map (
      CI => Madd_wait_time_share0000_cy(30),
      LI => Madd_wait_time_share0000_xor_31_rt_388,
      O => wait_time_share0000(31)
    );
  Madd_databus_add0000_cy_4_Q : MUXCY
    port map (
      CI => Mrom_databus_mux000512,
      DI => Mrom_databus_mux0005,
      S => Madd_databus_add0000_lut_4_Q,
      O => Madd_databus_add0000_cy(4)
    );
  Madd_databus_add0000_cy_5_Q : MUXCY
    port map (
      CI => Madd_databus_add0000_cy(4),
      DI => Mrom_databus_mux0005,
      S => Madd_databus_add0000_lut_5_Q,
      O => Madd_databus_add0000_cy(5)
    );
  Madd_databus_add0000_xor_5_Q : XORCY
    port map (
      CI => Madd_databus_add0000_cy(4),
      LI => Madd_databus_add0000_lut_5_Q,
      O => databus_add0000(5)
    );
  Madd_databus_add0000_cy_6_Q : MUXCY
    port map (
      CI => Madd_databus_add0000_cy(5),
      DI => Mrom_databus_mux0005,
      S => Madd_databus_add0000_lut_6_Q,
      O => Madd_databus_add0000_cy(6)
    );
  Madd_databus_add0000_xor_6_Q : XORCY
    port map (
      CI => Madd_databus_add0000_cy(5),
      LI => Madd_databus_add0000_lut_6_Q,
      O => databus_add0000(6)
    );
  Madd_databus_add0000_cy_7_Q : MUXCY
    port map (
      CI => Madd_databus_add0000_cy(6),
      DI => Mrom_databus_mux0005,
      S => Madd_databus_add0000_lut_7_Q,
      O => Madd_databus_add0000_cy(7)
    );
  Madd_databus_add0000_xor_7_Q : XORCY
    port map (
      CI => Madd_databus_add0000_cy(6),
      LI => Madd_databus_add0000_lut_7_Q,
      O => databus_add0000(7)
    );
  Madd_databus_add0000_cy_8_Q : MUXCY
    port map (
      CI => Madd_databus_add0000_cy(7),
      DI => Mrom_databus_mux0005,
      S => Madd_databus_add0000_lut_8_Q,
      O => Madd_databus_add0000_cy(8)
    );
  Madd_databus_add0000_xor_8_Q : XORCY
    port map (
      CI => Madd_databus_add0000_cy(7),
      LI => Madd_databus_add0000_lut_8_Q,
      O => databus_add0000(8)
    );
  Madd_databus_add0000_cy_9_Q : MUXCY
    port map (
      CI => Madd_databus_add0000_cy(8),
      DI => Mrom_databus_mux000512,
      S => Madd_databus_add0000_cy_9_rt_255,
      O => Madd_databus_add0000_cy(9)
    );
  Madd_databus_add0000_xor_9_Q : XORCY
    port map (
      CI => Madd_databus_add0000_cy(8),
      LI => Madd_databus_add0000_cy_9_rt_255,
      O => databus_add0000(9)
    );
  Madd_databus_add0000_cy_10_Q : MUXCY
    port map (
      CI => Madd_databus_add0000_cy(9),
      DI => Mrom_databus_mux0005,
      S => Madd_databus_add0000_lut_10_Q,
      O => Madd_databus_add0000_cy(10)
    );
  Madd_databus_add0000_xor_10_Q : XORCY
    port map (
      CI => Madd_databus_add0000_cy(9),
      LI => Madd_databus_add0000_lut_10_Q,
      O => databus_add0000(10)
    );
  Madd_databus_add0000_cy_11_Q : MUXCY
    port map (
      CI => Madd_databus_add0000_cy(10),
      DI => Mrom_databus_mux000512,
      S => Madd_databus_add0000_cy_11_rt_212,
      O => Madd_databus_add0000_cy(11)
    );
  Madd_databus_add0000_xor_11_Q : XORCY
    port map (
      CI => Madd_databus_add0000_cy(10),
      LI => Madd_databus_add0000_cy_11_rt_212,
      O => databus_add0000(11)
    );
  Madd_databus_add0000_cy_12_Q : MUXCY
    port map (
      CI => Madd_databus_add0000_cy(11),
      DI => Mrom_databus_mux0005,
      S => Madd_databus_add0000_lut_12_Q,
      O => Madd_databus_add0000_cy(12)
    );
  Madd_databus_add0000_xor_12_Q : XORCY
    port map (
      CI => Madd_databus_add0000_cy(11),
      LI => Madd_databus_add0000_lut_12_Q,
      O => databus_add0000(12)
    );
  Madd_databus_add0000_cy_13_Q : MUXCY
    port map (
      CI => Madd_databus_add0000_cy(12),
      DI => Mrom_databus_mux000512,
      S => Madd_databus_add0000_cy_13_rt_215,
      O => Madd_databus_add0000_cy(13)
    );
  Madd_databus_add0000_xor_13_Q : XORCY
    port map (
      CI => Madd_databus_add0000_cy(12),
      LI => Madd_databus_add0000_cy_13_rt_215,
      O => databus_add0000(13)
    );
  Madd_databus_add0000_cy_14_Q : MUXCY
    port map (
      CI => Madd_databus_add0000_cy(13),
      DI => Mrom_databus_mux0005,
      S => Madd_databus_add0000_lut_14_Q,
      O => Madd_databus_add0000_cy(14)
    );
  Madd_databus_add0000_xor_14_Q : XORCY
    port map (
      CI => Madd_databus_add0000_cy(13),
      LI => Madd_databus_add0000_lut_14_Q,
      O => databus_add0000(14)
    );
  Madd_databus_add0000_cy_15_Q : MUXCY
    port map (
      CI => Madd_databus_add0000_cy(14),
      DI => Mrom_databus_mux000512,
      S => Madd_databus_add0000_cy_15_rt_218,
      O => Madd_databus_add0000_cy(15)
    );
  Madd_databus_add0000_xor_15_Q : XORCY
    port map (
      CI => Madd_databus_add0000_cy(14),
      LI => Madd_databus_add0000_cy_15_rt_218,
      O => databus_add0000(15)
    );
  Madd_databus_add0000_cy_16_Q : MUXCY
    port map (
      CI => Madd_databus_add0000_cy(15),
      DI => Mrom_databus_mux000512,
      S => Madd_databus_add0000_cy_16_rt_220,
      O => Madd_databus_add0000_cy(16)
    );
  Madd_databus_add0000_xor_16_Q : XORCY
    port map (
      CI => Madd_databus_add0000_cy(15),
      LI => Madd_databus_add0000_cy_16_rt_220,
      O => databus_add0000(16)
    );
  Madd_databus_add0000_cy_17_Q : MUXCY
    port map (
      CI => Madd_databus_add0000_cy(16),
      DI => Mrom_databus_mux000512,
      S => Madd_databus_add0000_cy_17_rt_222,
      O => Madd_databus_add0000_cy(17)
    );
  Madd_databus_add0000_xor_17_Q : XORCY
    port map (
      CI => Madd_databus_add0000_cy(16),
      LI => Madd_databus_add0000_cy_17_rt_222,
      O => databus_add0000(17)
    );
  Madd_databus_add0000_cy_18_Q : MUXCY
    port map (
      CI => Madd_databus_add0000_cy(17),
      DI => Mrom_databus_mux000512,
      S => Madd_databus_add0000_cy_18_rt_224,
      O => Madd_databus_add0000_cy(18)
    );
  Madd_databus_add0000_xor_18_Q : XORCY
    port map (
      CI => Madd_databus_add0000_cy(17),
      LI => Madd_databus_add0000_cy_18_rt_224,
      O => databus_add0000(18)
    );
  Madd_databus_add0000_cy_19_Q : MUXCY
    port map (
      CI => Madd_databus_add0000_cy(18),
      DI => Mrom_databus_mux000512,
      S => Madd_databus_add0000_cy_19_rt_226,
      O => Madd_databus_add0000_cy(19)
    );
  Madd_databus_add0000_xor_19_Q : XORCY
    port map (
      CI => Madd_databus_add0000_cy(18),
      LI => Madd_databus_add0000_cy_19_rt_226,
      O => databus_add0000(19)
    );
  Madd_databus_add0000_cy_20_Q : MUXCY
    port map (
      CI => Madd_databus_add0000_cy(19),
      DI => Mrom_databus_mux000512,
      S => Madd_databus_add0000_cy_20_rt_228,
      O => Madd_databus_add0000_cy(20)
    );
  Madd_databus_add0000_xor_20_Q : XORCY
    port map (
      CI => Madd_databus_add0000_cy(19),
      LI => Madd_databus_add0000_cy_20_rt_228,
      O => databus_add0000(20)
    );
  Madd_databus_add0000_cy_21_Q : MUXCY
    port map (
      CI => Madd_databus_add0000_cy(20),
      DI => Mrom_databus_mux000512,
      S => Madd_databus_add0000_cy_21_rt_230,
      O => Madd_databus_add0000_cy(21)
    );
  Madd_databus_add0000_xor_21_Q : XORCY
    port map (
      CI => Madd_databus_add0000_cy(20),
      LI => Madd_databus_add0000_cy_21_rt_230,
      O => databus_add0000(21)
    );
  Madd_databus_add0000_cy_22_Q : MUXCY
    port map (
      CI => Madd_databus_add0000_cy(21),
      DI => Mrom_databus_mux000512,
      S => Madd_databus_add0000_cy_22_rt_232,
      O => Madd_databus_add0000_cy(22)
    );
  Madd_databus_add0000_xor_22_Q : XORCY
    port map (
      CI => Madd_databus_add0000_cy(21),
      LI => Madd_databus_add0000_cy_22_rt_232,
      O => databus_add0000(22)
    );
  Madd_databus_add0000_cy_23_Q : MUXCY
    port map (
      CI => Madd_databus_add0000_cy(22),
      DI => Mrom_databus_mux000512,
      S => Madd_databus_add0000_cy_23_rt_234,
      O => Madd_databus_add0000_cy(23)
    );
  Madd_databus_add0000_xor_23_Q : XORCY
    port map (
      CI => Madd_databus_add0000_cy(22),
      LI => Madd_databus_add0000_cy_23_rt_234,
      O => databus_add0000(23)
    );
  Madd_databus_add0000_cy_24_Q : MUXCY
    port map (
      CI => Madd_databus_add0000_cy(23),
      DI => Mrom_databus_mux000512,
      S => Madd_databus_add0000_cy_24_rt_236,
      O => Madd_databus_add0000_cy(24)
    );
  Madd_databus_add0000_xor_24_Q : XORCY
    port map (
      CI => Madd_databus_add0000_cy(23),
      LI => Madd_databus_add0000_cy_24_rt_236,
      O => databus_add0000(24)
    );
  Madd_databus_add0000_cy_25_Q : MUXCY
    port map (
      CI => Madd_databus_add0000_cy(24),
      DI => Mrom_databus_mux000512,
      S => Madd_databus_add0000_cy_25_rt_238,
      O => Madd_databus_add0000_cy(25)
    );
  Madd_databus_add0000_xor_25_Q : XORCY
    port map (
      CI => Madd_databus_add0000_cy(24),
      LI => Madd_databus_add0000_cy_25_rt_238,
      O => databus_add0000(25)
    );
  Madd_databus_add0000_cy_26_Q : MUXCY
    port map (
      CI => Madd_databus_add0000_cy(25),
      DI => Mrom_databus_mux000512,
      S => Madd_databus_add0000_cy_26_rt_240,
      O => Madd_databus_add0000_cy(26)
    );
  Madd_databus_add0000_xor_26_Q : XORCY
    port map (
      CI => Madd_databus_add0000_cy(25),
      LI => Madd_databus_add0000_cy_26_rt_240,
      O => databus_add0000(26)
    );
  Madd_databus_add0000_cy_27_Q : MUXCY
    port map (
      CI => Madd_databus_add0000_cy(26),
      DI => Mrom_databus_mux000512,
      S => Madd_databus_add0000_cy_27_rt_242,
      O => Madd_databus_add0000_cy(27)
    );
  Madd_databus_add0000_xor_27_Q : XORCY
    port map (
      CI => Madd_databus_add0000_cy(26),
      LI => Madd_databus_add0000_cy_27_rt_242,
      O => databus_add0000(27)
    );
  Madd_databus_add0000_cy_28_Q : MUXCY
    port map (
      CI => Madd_databus_add0000_cy(27),
      DI => Mrom_databus_mux000512,
      S => Madd_databus_add0000_cy_28_rt_244,
      O => Madd_databus_add0000_cy(28)
    );
  Madd_databus_add0000_xor_28_Q : XORCY
    port map (
      CI => Madd_databus_add0000_cy(27),
      LI => Madd_databus_add0000_cy_28_rt_244,
      O => databus_add0000(28)
    );
  Madd_databus_add0000_cy_29_Q : MUXCY
    port map (
      CI => Madd_databus_add0000_cy(28),
      DI => Mrom_databus_mux000512,
      S => Madd_databus_add0000_cy_29_rt_246,
      O => Madd_databus_add0000_cy(29)
    );
  Madd_databus_add0000_xor_29_Q : XORCY
    port map (
      CI => Madd_databus_add0000_cy(28),
      LI => Madd_databus_add0000_cy_29_rt_246,
      O => databus_add0000(29)
    );
  Madd_databus_add0000_cy_30_Q : MUXCY
    port map (
      CI => Madd_databus_add0000_cy(29),
      DI => Mrom_databus_mux000512,
      S => Madd_databus_add0000_cy_30_rt_248,
      O => Madd_databus_add0000_cy(30)
    );
  Madd_databus_add0000_xor_30_Q : XORCY
    port map (
      CI => Madd_databus_add0000_cy(29),
      LI => Madd_databus_add0000_cy_30_rt_248,
      O => databus_add0000(30)
    );
  Madd_databus_add0000_xor_31_Q : XORCY
    port map (
      CI => Madd_databus_add0000_cy(30),
      LI => Madd_databus_add0000_xor_31_rt_264,
      O => databus_add0000(31)
    );
  Madd_index_addsub0000_cy_0_Q : MUXCY
    port map (
      CI => Mrom_databus_mux000512,
      DI => Mrom_databus_mux0005,
      S => Madd_index_addsub0000_lut(0),
      O => Madd_index_addsub0000_cy(0)
    );
  Madd_index_addsub0000_cy_1_Q : MUXCY
    port map (
      CI => Madd_index_addsub0000_cy(0),
      DI => Mrom_databus_mux000512,
      S => Madd_index_addsub0000_cy_1_rt_287,
      O => Madd_index_addsub0000_cy(1)
    );
  Madd_index_addsub0000_xor_1_Q : XORCY
    port map (
      CI => Madd_index_addsub0000_cy(0),
      LI => Madd_index_addsub0000_cy_1_rt_287,
      O => index_addsub0000(1)
    );
  Madd_index_addsub0000_cy_2_Q : MUXCY
    port map (
      CI => Madd_index_addsub0000_cy(1),
      DI => Mrom_databus_mux000512,
      S => Madd_index_addsub0000_cy_2_rt_309,
      O => Madd_index_addsub0000_cy(2)
    );
  Madd_index_addsub0000_xor_2_Q : XORCY
    port map (
      CI => Madd_index_addsub0000_cy(1),
      LI => Madd_index_addsub0000_cy_2_rt_309,
      O => index_addsub0000(2)
    );
  Madd_index_addsub0000_cy_3_Q : MUXCY
    port map (
      CI => Madd_index_addsub0000_cy(2),
      DI => Mrom_databus_mux000512,
      S => Madd_index_addsub0000_cy_3_rt_313,
      O => Madd_index_addsub0000_cy(3)
    );
  Madd_index_addsub0000_xor_3_Q : XORCY
    port map (
      CI => Madd_index_addsub0000_cy(2),
      LI => Madd_index_addsub0000_cy_3_rt_313,
      O => index_addsub0000(3)
    );
  Madd_index_addsub0000_cy_4_Q : MUXCY
    port map (
      CI => Madd_index_addsub0000_cy(3),
      DI => Mrom_databus_mux000512,
      S => Madd_index_addsub0000_cy_4_rt_315,
      O => Madd_index_addsub0000_cy(4)
    );
  Madd_index_addsub0000_xor_4_Q : XORCY
    port map (
      CI => Madd_index_addsub0000_cy(3),
      LI => Madd_index_addsub0000_cy_4_rt_315,
      O => index_addsub0000(4)
    );
  Madd_index_addsub0000_cy_5_Q : MUXCY
    port map (
      CI => Madd_index_addsub0000_cy(4),
      DI => Mrom_databus_mux000512,
      S => Madd_index_addsub0000_cy_5_rt_317,
      O => Madd_index_addsub0000_cy(5)
    );
  Madd_index_addsub0000_xor_5_Q : XORCY
    port map (
      CI => Madd_index_addsub0000_cy(4),
      LI => Madd_index_addsub0000_cy_5_rt_317,
      O => index_addsub0000(5)
    );
  Madd_index_addsub0000_cy_6_Q : MUXCY
    port map (
      CI => Madd_index_addsub0000_cy(5),
      DI => Mrom_databus_mux000512,
      S => Madd_index_addsub0000_cy_6_rt_319,
      O => Madd_index_addsub0000_cy(6)
    );
  Madd_index_addsub0000_xor_6_Q : XORCY
    port map (
      CI => Madd_index_addsub0000_cy(5),
      LI => Madd_index_addsub0000_cy_6_rt_319,
      O => index_addsub0000(6)
    );
  Madd_index_addsub0000_cy_7_Q : MUXCY
    port map (
      CI => Madd_index_addsub0000_cy(6),
      DI => Mrom_databus_mux000512,
      S => Madd_index_addsub0000_cy_7_rt_321,
      O => Madd_index_addsub0000_cy(7)
    );
  Madd_index_addsub0000_xor_7_Q : XORCY
    port map (
      CI => Madd_index_addsub0000_cy(6),
      LI => Madd_index_addsub0000_cy_7_rt_321,
      O => index_addsub0000(7)
    );
  Madd_index_addsub0000_cy_8_Q : MUXCY
    port map (
      CI => Madd_index_addsub0000_cy(7),
      DI => Mrom_databus_mux000512,
      S => Madd_index_addsub0000_cy_8_rt_323,
      O => Madd_index_addsub0000_cy(8)
    );
  Madd_index_addsub0000_xor_8_Q : XORCY
    port map (
      CI => Madd_index_addsub0000_cy(7),
      LI => Madd_index_addsub0000_cy_8_rt_323,
      O => index_addsub0000(8)
    );
  Madd_index_addsub0000_cy_9_Q : MUXCY
    port map (
      CI => Madd_index_addsub0000_cy(8),
      DI => Mrom_databus_mux000512,
      S => Madd_index_addsub0000_cy_9_rt_325,
      O => Madd_index_addsub0000_cy(9)
    );
  Madd_index_addsub0000_xor_9_Q : XORCY
    port map (
      CI => Madd_index_addsub0000_cy(8),
      LI => Madd_index_addsub0000_cy_9_rt_325,
      O => index_addsub0000(9)
    );
  Madd_index_addsub0000_cy_10_Q : MUXCY
    port map (
      CI => Madd_index_addsub0000_cy(9),
      DI => Mrom_databus_mux000512,
      S => Madd_index_addsub0000_cy_10_rt_267,
      O => Madd_index_addsub0000_cy(10)
    );
  Madd_index_addsub0000_xor_10_Q : XORCY
    port map (
      CI => Madd_index_addsub0000_cy(9),
      LI => Madd_index_addsub0000_cy_10_rt_267,
      O => index_addsub0000(10)
    );
  Madd_index_addsub0000_cy_11_Q : MUXCY
    port map (
      CI => Madd_index_addsub0000_cy(10),
      DI => Mrom_databus_mux000512,
      S => Madd_index_addsub0000_cy_11_rt_269,
      O => Madd_index_addsub0000_cy(11)
    );
  Madd_index_addsub0000_xor_11_Q : XORCY
    port map (
      CI => Madd_index_addsub0000_cy(10),
      LI => Madd_index_addsub0000_cy_11_rt_269,
      O => index_addsub0000(11)
    );
  Madd_index_addsub0000_cy_12_Q : MUXCY
    port map (
      CI => Madd_index_addsub0000_cy(11),
      DI => Mrom_databus_mux000512,
      S => Madd_index_addsub0000_cy_12_rt_271,
      O => Madd_index_addsub0000_cy(12)
    );
  Madd_index_addsub0000_xor_12_Q : XORCY
    port map (
      CI => Madd_index_addsub0000_cy(11),
      LI => Madd_index_addsub0000_cy_12_rt_271,
      O => index_addsub0000(12)
    );
  Madd_index_addsub0000_cy_13_Q : MUXCY
    port map (
      CI => Madd_index_addsub0000_cy(12),
      DI => Mrom_databus_mux000512,
      S => Madd_index_addsub0000_cy_13_rt_273,
      O => Madd_index_addsub0000_cy(13)
    );
  Madd_index_addsub0000_xor_13_Q : XORCY
    port map (
      CI => Madd_index_addsub0000_cy(12),
      LI => Madd_index_addsub0000_cy_13_rt_273,
      O => index_addsub0000(13)
    );
  Madd_index_addsub0000_cy_14_Q : MUXCY
    port map (
      CI => Madd_index_addsub0000_cy(13),
      DI => Mrom_databus_mux000512,
      S => Madd_index_addsub0000_cy_14_rt_275,
      O => Madd_index_addsub0000_cy(14)
    );
  Madd_index_addsub0000_xor_14_Q : XORCY
    port map (
      CI => Madd_index_addsub0000_cy(13),
      LI => Madd_index_addsub0000_cy_14_rt_275,
      O => index_addsub0000(14)
    );
  Madd_index_addsub0000_cy_15_Q : MUXCY
    port map (
      CI => Madd_index_addsub0000_cy(14),
      DI => Mrom_databus_mux000512,
      S => Madd_index_addsub0000_cy_15_rt_277,
      O => Madd_index_addsub0000_cy(15)
    );
  Madd_index_addsub0000_xor_15_Q : XORCY
    port map (
      CI => Madd_index_addsub0000_cy(14),
      LI => Madd_index_addsub0000_cy_15_rt_277,
      O => index_addsub0000(15)
    );
  Madd_index_addsub0000_cy_16_Q : MUXCY
    port map (
      CI => Madd_index_addsub0000_cy(15),
      DI => Mrom_databus_mux000512,
      S => Madd_index_addsub0000_cy_16_rt_279,
      O => Madd_index_addsub0000_cy(16)
    );
  Madd_index_addsub0000_xor_16_Q : XORCY
    port map (
      CI => Madd_index_addsub0000_cy(15),
      LI => Madd_index_addsub0000_cy_16_rt_279,
      O => index_addsub0000(16)
    );
  Madd_index_addsub0000_cy_17_Q : MUXCY
    port map (
      CI => Madd_index_addsub0000_cy(16),
      DI => Mrom_databus_mux000512,
      S => Madd_index_addsub0000_cy_17_rt_281,
      O => Madd_index_addsub0000_cy(17)
    );
  Madd_index_addsub0000_xor_17_Q : XORCY
    port map (
      CI => Madd_index_addsub0000_cy(16),
      LI => Madd_index_addsub0000_cy_17_rt_281,
      O => index_addsub0000(17)
    );
  Madd_index_addsub0000_cy_18_Q : MUXCY
    port map (
      CI => Madd_index_addsub0000_cy(17),
      DI => Mrom_databus_mux000512,
      S => Madd_index_addsub0000_cy_18_rt_283,
      O => Madd_index_addsub0000_cy(18)
    );
  Madd_index_addsub0000_xor_18_Q : XORCY
    port map (
      CI => Madd_index_addsub0000_cy(17),
      LI => Madd_index_addsub0000_cy_18_rt_283,
      O => index_addsub0000(18)
    );
  Madd_index_addsub0000_cy_19_Q : MUXCY
    port map (
      CI => Madd_index_addsub0000_cy(18),
      DI => Mrom_databus_mux000512,
      S => Madd_index_addsub0000_cy_19_rt_285,
      O => Madd_index_addsub0000_cy(19)
    );
  Madd_index_addsub0000_xor_19_Q : XORCY
    port map (
      CI => Madd_index_addsub0000_cy(18),
      LI => Madd_index_addsub0000_cy_19_rt_285,
      O => index_addsub0000(19)
    );
  Madd_index_addsub0000_cy_20_Q : MUXCY
    port map (
      CI => Madd_index_addsub0000_cy(19),
      DI => Mrom_databus_mux000512,
      S => Madd_index_addsub0000_cy_20_rt_289,
      O => Madd_index_addsub0000_cy(20)
    );
  Madd_index_addsub0000_xor_20_Q : XORCY
    port map (
      CI => Madd_index_addsub0000_cy(19),
      LI => Madd_index_addsub0000_cy_20_rt_289,
      O => index_addsub0000(20)
    );
  Madd_index_addsub0000_cy_21_Q : MUXCY
    port map (
      CI => Madd_index_addsub0000_cy(20),
      DI => Mrom_databus_mux000512,
      S => Madd_index_addsub0000_cy_21_rt_291,
      O => Madd_index_addsub0000_cy(21)
    );
  Madd_index_addsub0000_xor_21_Q : XORCY
    port map (
      CI => Madd_index_addsub0000_cy(20),
      LI => Madd_index_addsub0000_cy_21_rt_291,
      O => index_addsub0000(21)
    );
  Madd_index_addsub0000_cy_22_Q : MUXCY
    port map (
      CI => Madd_index_addsub0000_cy(21),
      DI => Mrom_databus_mux000512,
      S => Madd_index_addsub0000_cy_22_rt_293,
      O => Madd_index_addsub0000_cy(22)
    );
  Madd_index_addsub0000_xor_22_Q : XORCY
    port map (
      CI => Madd_index_addsub0000_cy(21),
      LI => Madd_index_addsub0000_cy_22_rt_293,
      O => index_addsub0000(22)
    );
  Madd_index_addsub0000_cy_23_Q : MUXCY
    port map (
      CI => Madd_index_addsub0000_cy(22),
      DI => Mrom_databus_mux000512,
      S => Madd_index_addsub0000_cy_23_rt_295,
      O => Madd_index_addsub0000_cy(23)
    );
  Madd_index_addsub0000_xor_23_Q : XORCY
    port map (
      CI => Madd_index_addsub0000_cy(22),
      LI => Madd_index_addsub0000_cy_23_rt_295,
      O => index_addsub0000(23)
    );
  Madd_index_addsub0000_cy_24_Q : MUXCY
    port map (
      CI => Madd_index_addsub0000_cy(23),
      DI => Mrom_databus_mux000512,
      S => Madd_index_addsub0000_cy_24_rt_297,
      O => Madd_index_addsub0000_cy(24)
    );
  Madd_index_addsub0000_xor_24_Q : XORCY
    port map (
      CI => Madd_index_addsub0000_cy(23),
      LI => Madd_index_addsub0000_cy_24_rt_297,
      O => index_addsub0000(24)
    );
  Madd_index_addsub0000_cy_25_Q : MUXCY
    port map (
      CI => Madd_index_addsub0000_cy(24),
      DI => Mrom_databus_mux000512,
      S => Madd_index_addsub0000_cy_25_rt_299,
      O => Madd_index_addsub0000_cy(25)
    );
  Madd_index_addsub0000_xor_25_Q : XORCY
    port map (
      CI => Madd_index_addsub0000_cy(24),
      LI => Madd_index_addsub0000_cy_25_rt_299,
      O => index_addsub0000(25)
    );
  Madd_index_addsub0000_cy_26_Q : MUXCY
    port map (
      CI => Madd_index_addsub0000_cy(25),
      DI => Mrom_databus_mux000512,
      S => Madd_index_addsub0000_cy_26_rt_301,
      O => Madd_index_addsub0000_cy(26)
    );
  Madd_index_addsub0000_xor_26_Q : XORCY
    port map (
      CI => Madd_index_addsub0000_cy(25),
      LI => Madd_index_addsub0000_cy_26_rt_301,
      O => index_addsub0000(26)
    );
  Madd_index_addsub0000_cy_27_Q : MUXCY
    port map (
      CI => Madd_index_addsub0000_cy(26),
      DI => Mrom_databus_mux000512,
      S => Madd_index_addsub0000_cy_27_rt_303,
      O => Madd_index_addsub0000_cy(27)
    );
  Madd_index_addsub0000_xor_27_Q : XORCY
    port map (
      CI => Madd_index_addsub0000_cy(26),
      LI => Madd_index_addsub0000_cy_27_rt_303,
      O => index_addsub0000(27)
    );
  Madd_index_addsub0000_cy_28_Q : MUXCY
    port map (
      CI => Madd_index_addsub0000_cy(27),
      DI => Mrom_databus_mux000512,
      S => Madd_index_addsub0000_cy_28_rt_305,
      O => Madd_index_addsub0000_cy(28)
    );
  Madd_index_addsub0000_xor_28_Q : XORCY
    port map (
      CI => Madd_index_addsub0000_cy(27),
      LI => Madd_index_addsub0000_cy_28_rt_305,
      O => index_addsub0000(28)
    );
  Madd_index_addsub0000_cy_29_Q : MUXCY
    port map (
      CI => Madd_index_addsub0000_cy(28),
      DI => Mrom_databus_mux000512,
      S => Madd_index_addsub0000_cy_29_rt_307,
      O => Madd_index_addsub0000_cy(29)
    );
  Madd_index_addsub0000_xor_29_Q : XORCY
    port map (
      CI => Madd_index_addsub0000_cy(28),
      LI => Madd_index_addsub0000_cy_29_rt_307,
      O => index_addsub0000(29)
    );
  Madd_index_addsub0000_cy_30_Q : MUXCY
    port map (
      CI => Madd_index_addsub0000_cy(29),
      DI => Mrom_databus_mux000512,
      S => Madd_index_addsub0000_cy_30_rt_311,
      O => Madd_index_addsub0000_cy(30)
    );
  Madd_index_addsub0000_xor_30_Q : XORCY
    port map (
      CI => Madd_index_addsub0000_cy(29),
      LI => Madd_index_addsub0000_cy_30_rt_311,
      O => index_addsub0000(30)
    );
  Madd_index_addsub0000_xor_31_Q : XORCY
    port map (
      CI => Madd_index_addsub0000_cy(30),
      LI => Madd_index_addsub0000_xor_31_rt_327,
      O => index_addsub0000(31)
    );
  Mcompar_wait_time_cmp_ge0000_lut_0_Q : LUT4
    generic map(
      INIT => X"8000"
    )
    port map (
      I0 => count_us(4),
      I1 => count_us(5),
      I2 => count_us(6),
      I3 => count_us(7),
      O => Mcompar_wait_time_cmp_ge0000_lut(0)
    );
  Mcompar_wait_time_cmp_ge0000_cy_0_Q : MUXCY
    port map (
      CI => Mrom_databus_mux0005,
      DI => Mrom_databus_mux000512,
      S => Mcompar_wait_time_cmp_ge0000_lut(0),
      O => Mcompar_wait_time_cmp_ge0000_cy(0)
    );
  Mcompar_wait_time_cmp_ge0000_cy_1_Q : MUXCY
    port map (
      CI => Mcompar_wait_time_cmp_ge0000_cy(0),
      DI => Mrom_databus_mux000512,
      S => Mcompar_wait_time_cmp_ge0000_cy_1_rt_436,
      O => Mcompar_wait_time_cmp_ge0000_cy(1)
    );
  Mcompar_wait_time_cmp_ge0000_cy_2_Q : MUXCY
    port map (
      CI => Mcompar_wait_time_cmp_ge0000_cy(1),
      DI => Mrom_databus_mux0005,
      S => Mcompar_wait_time_cmp_ge0000_lut(2),
      O => Mcompar_wait_time_cmp_ge0000_cy(2)
    );
  Mcompar_wait_time_cmp_ge0000_cy_3_Q : MUXCY
    port map (
      CI => Mcompar_wait_time_cmp_ge0000_cy(2),
      DI => Mrom_databus_mux000512,
      S => Mcompar_wait_time_cmp_ge0000_cy_3_rt_446,
      O => Mcompar_wait_time_cmp_ge0000_cy(3)
    );
  Mcompar_wait_time_cmp_ge0000_cy_4_Q : MUXCY
    port map (
      CI => Mcompar_wait_time_cmp_ge0000_cy(3),
      DI => Mrom_databus_mux0005,
      S => Mcompar_wait_time_cmp_ge0000_lut(4),
      O => Mcompar_wait_time_cmp_ge0000_cy(4)
    );
  Mcompar_wait_time_cmp_ge0000_cy_5_Q : MUXCY
    port map (
      CI => Mcompar_wait_time_cmp_ge0000_cy(4),
      DI => Mrom_databus_mux000512,
      S => Mcompar_wait_time_cmp_ge0000_cy_5_rt_456,
      O => Mcompar_wait_time_cmp_ge0000_cy(5)
    );
  Mcompar_wait_time_cmp_ge0000_cy_6_Q : MUXCY
    port map (
      CI => Mcompar_wait_time_cmp_ge0000_cy(5),
      DI => Mrom_databus_mux0005,
      S => Mcompar_wait_time_cmp_ge0000_lut(6),
      O => Mcompar_wait_time_cmp_ge0000_cy(6)
    );
  Mcompar_wait_time_cmp_ge0000_cy_7_Q : MUXCY
    port map (
      CI => Mcompar_wait_time_cmp_ge0000_cy(6),
      DI => Mrom_databus_mux000512,
      S => Mcompar_wait_time_cmp_ge0000_cy_7_rt_467,
      O => Mcompar_wait_time_cmp_ge0000_cy(7)
    );
  Mcompar_wait_time_cmp_ge0000_lut_8_Q : LUT4
    generic map(
      INIT => X"0001"
    )
    port map (
      I0 => count_us(15),
      I1 => count_us(16),
      I2 => count_us(17),
      I3 => count_us(18),
      O => Mcompar_wait_time_cmp_ge0000_lut(8)
    );
  Mcompar_wait_time_cmp_ge0000_cy_8_Q : MUXCY
    port map (
      CI => Mcompar_wait_time_cmp_ge0000_cy(7),
      DI => Mrom_databus_mux0005,
      S => Mcompar_wait_time_cmp_ge0000_lut(8),
      O => Mcompar_wait_time_cmp_ge0000_cy(8)
    );
  Mcompar_wait_time_cmp_ge0000_lut_9_Q : LUT4
    generic map(
      INIT => X"0001"
    )
    port map (
      I0 => count_us(19),
      I1 => count_us(20),
      I2 => count_us(21),
      I3 => count_us(22),
      O => Mcompar_wait_time_cmp_ge0000_lut(9)
    );
  Mcompar_wait_time_cmp_ge0000_cy_9_Q : MUXCY
    port map (
      CI => Mcompar_wait_time_cmp_ge0000_cy(8),
      DI => Mrom_databus_mux0005,
      S => Mcompar_wait_time_cmp_ge0000_lut(9),
      O => Mcompar_wait_time_cmp_ge0000_cy(9)
    );
  Mcompar_wait_time_cmp_ge0000_lut_10_Q : LUT4
    generic map(
      INIT => X"0001"
    )
    port map (
      I0 => count_us(23),
      I1 => count_us(24),
      I2 => count_us(25),
      I3 => count_us(26),
      O => Mcompar_wait_time_cmp_ge0000_lut(10)
    );
  Mcompar_wait_time_cmp_ge0000_cy_10_Q : MUXCY
    port map (
      CI => Mcompar_wait_time_cmp_ge0000_cy(9),
      DI => Mrom_databus_mux0005,
      S => Mcompar_wait_time_cmp_ge0000_lut(10),
      O => Mcompar_wait_time_cmp_ge0000_cy(10)
    );
  Mcompar_wait_time_cmp_ge0000_lut_11_Q : LUT4
    generic map(
      INIT => X"0001"
    )
    port map (
      I0 => count_us(27),
      I1 => count_us(28),
      I2 => count_us(29),
      I3 => count_us(30),
      O => Mcompar_wait_time_cmp_ge0000_lut(11)
    );
  Mcompar_wait_time_cmp_ge0000_cy_11_Q : MUXCY
    port map (
      CI => Mcompar_wait_time_cmp_ge0000_cy(10),
      DI => Mrom_databus_mux0005,
      S => Mcompar_wait_time_cmp_ge0000_lut(11),
      O => Mcompar_wait_time_cmp_ge0000_cy(11)
    );
  Mcompar_wait_time_cmp_ge0000_cy_12_Q : MUXCY
    port map (
      CI => Mcompar_wait_time_cmp_ge0000_cy(11),
      DI => Mrom_databus_mux000512,
      S => Mcompar_wait_time_cmp_ge0000_lut(12),
      O => wait_time_cmp_ge00001
    );
  Mcompar_wait_time_cmp_ge0000_cy_0_0 : MUXCY
    port map (
      CI => Mrom_databus_mux0005,
      DI => Mrom_databus_mux000512,
      S => Mcompar_wait_time_cmp_ge0000_cy_0_0_rt_425,
      O => Mcompar_wait_time_cmp_ge0000_cy_0_1_422
    );
  Mcompar_wait_time_cmp_ge0000_cy_1_0 : MUXCY
    port map (
      CI => Mcompar_wait_time_cmp_ge0000_cy_0_1_422,
      DI => Mrom_databus_mux0005,
      S => Mcompar_wait_time_cmp_ge0000_lut(1),
      O => Mcompar_wait_time_cmp_ge0000_cy_1_1_433
    );
  Mcompar_wait_time_cmp_ge0000_lut_2_1 : LUT3
    generic map(
      INIT => X"80"
    )
    port map (
      I0 => count_us(5),
      I1 => count_us(6),
      I2 => count_us(7),
      O => Mcompar_wait_time_cmp_ge0000_lut_2_1_487
    );
  Mcompar_wait_time_cmp_ge0000_cy_2_0 : MUXCY
    port map (
      CI => Mcompar_wait_time_cmp_ge0000_cy_1_1_433,
      DI => Mrom_databus_mux000512,
      S => Mcompar_wait_time_cmp_ge0000_lut_2_1_487,
      O => Mcompar_wait_time_cmp_ge0000_cy_2_1_438
    );
  Mcompar_wait_time_cmp_ge0000_cy_3_0 : MUXCY
    port map (
      CI => Mcompar_wait_time_cmp_ge0000_cy_2_1_438,
      DI => Mrom_databus_mux0005,
      S => Mcompar_wait_time_cmp_ge0000_lut(3),
      O => Mcompar_wait_time_cmp_ge0000_cy_3_1_443
    );
  Mcompar_wait_time_cmp_ge0000_lut_4_1 : LUT3
    generic map(
      INIT => X"80"
    )
    port map (
      I0 => count_us(9),
      I1 => count_us(10),
      I2 => count_us(11),
      O => Mcompar_wait_time_cmp_ge0000_lut_4_1_493
    );
  Mcompar_wait_time_cmp_ge0000_cy_4_0 : MUXCY
    port map (
      CI => Mcompar_wait_time_cmp_ge0000_cy_3_1_443,
      DI => Mrom_databus_mux000512,
      S => Mcompar_wait_time_cmp_ge0000_lut_4_1_493,
      O => Mcompar_wait_time_cmp_ge0000_cy_4_1_448
    );
  Mcompar_wait_time_cmp_ge0000_lut_5_Q : LUT2
    generic map(
      INIT => X"1"
    )
    port map (
      I0 => count_us(12),
      I1 => count_us(13),
      O => Mcompar_wait_time_cmp_ge0000_lut(5)
    );
  Mcompar_wait_time_cmp_ge0000_cy_5_0 : MUXCY
    port map (
      CI => Mcompar_wait_time_cmp_ge0000_cy_4_1_448,
      DI => Mrom_databus_mux0005,
      S => Mcompar_wait_time_cmp_ge0000_lut(5),
      O => Mcompar_wait_time_cmp_ge0000_cy_5_1_453
    );
  Mcompar_wait_time_cmp_ge0000_cy_6_0 : MUXCY
    port map (
      CI => Mcompar_wait_time_cmp_ge0000_cy_5_1_453,
      DI => Mrom_databus_mux000512,
      S => Mcompar_wait_time_cmp_ge0000_cy_6_0_rt_461,
      O => Mcompar_wait_time_cmp_ge0000_cy_6_1_458
    );
  Mcompar_wait_time_cmp_ge0000_lut_7_Q : LUT4
    generic map(
      INIT => X"0001"
    )
    port map (
      I0 => count_us(15),
      I1 => count_us(16),
      I2 => count_us(17),
      I3 => count_us(18),
      O => Mcompar_wait_time_cmp_ge0000_lut(7)
    );
  Mcompar_wait_time_cmp_ge0000_cy_7_0 : MUXCY
    port map (
      CI => Mcompar_wait_time_cmp_ge0000_cy_6_1_458,
      DI => Mrom_databus_mux0005,
      S => Mcompar_wait_time_cmp_ge0000_lut(7),
      O => Mcompar_wait_time_cmp_ge0000_cy_7_1_464
    );
  Mcompar_wait_time_cmp_ge0000_lut_8_1 : LUT4
    generic map(
      INIT => X"0001"
    )
    port map (
      I0 => count_us(19),
      I1 => count_us(20),
      I2 => count_us(21),
      I3 => count_us(22),
      O => Mcompar_wait_time_cmp_ge0000_lut_8_1_504
    );
  Mcompar_wait_time_cmp_ge0000_cy_8_0 : MUXCY
    port map (
      CI => Mcompar_wait_time_cmp_ge0000_cy_7_1_464,
      DI => Mrom_databus_mux0005,
      S => Mcompar_wait_time_cmp_ge0000_lut_8_1_504,
      O => Mcompar_wait_time_cmp_ge0000_cy_8_1_469
    );
  Mcompar_wait_time_cmp_ge0000_lut_9_1 : LUT4
    generic map(
      INIT => X"0001"
    )
    port map (
      I0 => count_us(23),
      I1 => count_us(24),
      I2 => count_us(25),
      I3 => count_us(26),
      O => Mcompar_wait_time_cmp_ge0000_lut_9_1_508
    );
  Mcompar_wait_time_cmp_ge0000_cy_9_0 : MUXCY
    port map (
      CI => Mcompar_wait_time_cmp_ge0000_cy_8_1_469,
      DI => Mrom_databus_mux0005,
      S => Mcompar_wait_time_cmp_ge0000_lut_9_1_508,
      O => Mcompar_wait_time_cmp_ge0000_cy_9_1_473
    );
  Mcompar_wait_time_cmp_ge0000_lut_10_1 : LUT4
    generic map(
      INIT => X"0001"
    )
    port map (
      I0 => count_us(27),
      I1 => count_us(28),
      I2 => count_us(29),
      I3 => count_us(30),
      O => Mcompar_wait_time_cmp_ge0000_lut_10_1_477
    );
  Mcompar_wait_time_cmp_ge0000_cy_10_0 : MUXCY
    port map (
      CI => Mcompar_wait_time_cmp_ge0000_cy_9_1_473,
      DI => Mrom_databus_mux0005,
      S => Mcompar_wait_time_cmp_ge0000_lut_10_1_477,
      O => Mcompar_wait_time_cmp_ge0000_cy_10_1_429
    );
  Mcompar_wait_time_cmp_ge0000_cy_11_0 : MUXCY
    port map (
      CI => Mcompar_wait_time_cmp_ge0000_cy_10_1_429,
      DI => Mrom_databus_mux000512,
      S => Mcompar_wait_time_cmp_ge0000_lut_11_1,
      O => databus_cmp_ge0000
    );
  Mcompar_wait_time_cmp_ge0000_cy_0_1 : MUXCY
    port map (
      CI => Mrom_databus_mux0005,
      DI => Mrom_databus_mux000512,
      S => Mcompar_wait_time_cmp_ge0000_cy_0_1_rt_426,
      O => Mcompar_wait_time_cmp_ge0000_cy_0_2_423
    );
  Mcompar_wait_time_cmp_ge0000_lut_1_1 : LUT4
    generic map(
      INIT => X"0001"
    )
    port map (
      I0 => count_us(3),
      I1 => count_us(4),
      I2 => count_us(5),
      I3 => count_us(6),
      O => Mcompar_wait_time_cmp_ge0000_lut_1_1_484
    );
  Mcompar_wait_time_cmp_ge0000_cy_1_1 : MUXCY
    port map (
      CI => Mcompar_wait_time_cmp_ge0000_cy_0_2_423,
      DI => Mrom_databus_mux0005,
      S => Mcompar_wait_time_cmp_ge0000_lut_1_1_484,
      O => Mcompar_wait_time_cmp_ge0000_cy_1_2_434
    );
  Mcompar_wait_time_cmp_ge0000_cy_2_1 : MUXCY
    port map (
      CI => Mcompar_wait_time_cmp_ge0000_cy_1_2_434,
      DI => Mrom_databus_mux000512,
      S => Mcompar_wait_time_cmp_ge0000_cy_2_1_rt_441,
      O => Mcompar_wait_time_cmp_ge0000_cy_2_2_439
    );
  Mcompar_wait_time_cmp_ge0000_cy_3_1 : MUXCY
    port map (
      CI => Mcompar_wait_time_cmp_ge0000_cy_2_2_439,
      DI => Mrom_databus_mux0005,
      S => Mcompar_wait_time_cmp_ge0000_lut_3_1,
      O => Mcompar_wait_time_cmp_ge0000_cy_3_2_444
    );
  Mcompar_wait_time_cmp_ge0000_lut_4_2 : LUT3
    generic map(
      INIT => X"80"
    )
    port map (
      I0 => count_us(9),
      I1 => count_us(10),
      I2 => count_us(11),
      O => Mcompar_wait_time_cmp_ge0000_lut_4_2_494
    );
  Mcompar_wait_time_cmp_ge0000_cy_4_1 : MUXCY
    port map (
      CI => Mcompar_wait_time_cmp_ge0000_cy_3_2_444,
      DI => Mrom_databus_mux000512,
      S => Mcompar_wait_time_cmp_ge0000_lut_4_2_494,
      O => Mcompar_wait_time_cmp_ge0000_cy_4_2_449
    );
  Mcompar_wait_time_cmp_ge0000_lut_5_1 : LUT2
    generic map(
      INIT => X"1"
    )
    port map (
      I0 => count_us(12),
      I1 => count_us(13),
      O => Mcompar_wait_time_cmp_ge0000_lut_5_1_496
    );
  Mcompar_wait_time_cmp_ge0000_cy_5_1 : MUXCY
    port map (
      CI => Mcompar_wait_time_cmp_ge0000_cy_4_2_449,
      DI => Mrom_databus_mux0005,
      S => Mcompar_wait_time_cmp_ge0000_lut_5_1_496,
      O => Mcompar_wait_time_cmp_ge0000_cy_5_2_454
    );
  Mcompar_wait_time_cmp_ge0000_cy_6_1 : MUXCY
    port map (
      CI => Mcompar_wait_time_cmp_ge0000_cy_5_2_454,
      DI => Mrom_databus_mux000512,
      S => Mcompar_wait_time_cmp_ge0000_cy_6_1_rt_462,
      O => Mcompar_wait_time_cmp_ge0000_cy_6_2_459
    );
  Mcompar_wait_time_cmp_ge0000_lut_7_1 : LUT4
    generic map(
      INIT => X"0001"
    )
    port map (
      I0 => count_us(15),
      I1 => count_us(16),
      I2 => count_us(17),
      I3 => count_us(18),
      O => Mcompar_wait_time_cmp_ge0000_lut_7_1_501
    );
  Mcompar_wait_time_cmp_ge0000_cy_7_1 : MUXCY
    port map (
      CI => Mcompar_wait_time_cmp_ge0000_cy_6_2_459,
      DI => Mrom_databus_mux0005,
      S => Mcompar_wait_time_cmp_ge0000_lut_7_1_501,
      O => Mcompar_wait_time_cmp_ge0000_cy_7_2_465
    );
  Mcompar_wait_time_cmp_ge0000_lut_8_2 : LUT4
    generic map(
      INIT => X"0001"
    )
    port map (
      I0 => count_us(19),
      I1 => count_us(20),
      I2 => count_us(21),
      I3 => count_us(22),
      O => Mcompar_wait_time_cmp_ge0000_lut_8_2_505
    );
  Mcompar_wait_time_cmp_ge0000_cy_8_1 : MUXCY
    port map (
      CI => Mcompar_wait_time_cmp_ge0000_cy_7_2_465,
      DI => Mrom_databus_mux0005,
      S => Mcompar_wait_time_cmp_ge0000_lut_8_2_505,
      O => Mcompar_wait_time_cmp_ge0000_cy_8_2_470
    );
  Mcompar_wait_time_cmp_ge0000_lut_9_2 : LUT4
    generic map(
      INIT => X"0001"
    )
    port map (
      I0 => count_us(23),
      I1 => count_us(24),
      I2 => count_us(25),
      I3 => count_us(26),
      O => Mcompar_wait_time_cmp_ge0000_lut_9_2_509
    );
  Mcompar_wait_time_cmp_ge0000_cy_9_1 : MUXCY
    port map (
      CI => Mcompar_wait_time_cmp_ge0000_cy_8_2_470,
      DI => Mrom_databus_mux0005,
      S => Mcompar_wait_time_cmp_ge0000_lut_9_2_509,
      O => Mcompar_wait_time_cmp_ge0000_cy_9_2_474
    );
  Mcompar_wait_time_cmp_ge0000_lut_10_2 : LUT4
    generic map(
      INIT => X"0001"
    )
    port map (
      I0 => count_us(27),
      I1 => count_us(28),
      I2 => count_us(29),
      I3 => count_us(30),
      O => Mcompar_wait_time_cmp_ge0000_lut_10_2_478
    );
  Mcompar_wait_time_cmp_ge0000_cy_10_1 : MUXCY
    port map (
      CI => Mcompar_wait_time_cmp_ge0000_cy_9_2_474,
      DI => Mrom_databus_mux0005,
      S => Mcompar_wait_time_cmp_ge0000_lut_10_2_478,
      O => Mcompar_wait_time_cmp_ge0000_cy_10_2
    );
  Mcompar_wait_time_cmp_ge0000_cy_11_1 : MUXCY
    port map (
      CI => Mcompar_wait_time_cmp_ge0000_cy_10_2,
      DI => Mrom_databus_mux000512,
      S => Mcompar_wait_time_cmp_ge0000_lut_11_2,
      O => databus_cmp_ge0001
    );
  Mcompar_wait_time_cmp_ge0000_cy_0_2 : MUXCY
    port map (
      CI => Mrom_databus_mux0005,
      DI => Mrom_databus_mux000512,
      S => Mcompar_wait_time_cmp_ge0000_cy_0_2_rt_427,
      O => Mcompar_wait_time_cmp_ge0000_cy_0_3
    );
  Mcompar_wait_time_cmp_ge0000_lut_1_2 : LUT3
    generic map(
      INIT => X"01"
    )
    port map (
      I0 => count_us(6),
      I1 => count_us(7),
      I2 => count_us(8),
      O => Mcompar_wait_time_cmp_ge0000_lut_1_2_485
    );
  Mcompar_wait_time_cmp_ge0000_cy_1_2 : MUXCY
    port map (
      CI => Mcompar_wait_time_cmp_ge0000_cy_0_3,
      DI => Mrom_databus_mux0005,
      S => Mcompar_wait_time_cmp_ge0000_lut_1_2_485,
      O => Mcompar_wait_time_cmp_ge0000_cy_1_3
    );
  Mcompar_wait_time_cmp_ge0000_lut_2_2 : LUT3
    generic map(
      INIT => X"80"
    )
    port map (
      I0 => count_us(9),
      I1 => count_us(10),
      I2 => count_us(11),
      O => Mcompar_wait_time_cmp_ge0000_lut_2_2_488
    );
  Mcompar_wait_time_cmp_ge0000_cy_2_2 : MUXCY
    port map (
      CI => Mcompar_wait_time_cmp_ge0000_cy_1_3,
      DI => Mrom_databus_mux000512,
      S => Mcompar_wait_time_cmp_ge0000_lut_2_2_488,
      O => Mcompar_wait_time_cmp_ge0000_cy_2_3
    );
  Mcompar_wait_time_cmp_ge0000_lut_3_2 : LUT2
    generic map(
      INIT => X"1"
    )
    port map (
      I0 => count_us(12),
      I1 => count_us(13),
      O => Mcompar_wait_time_cmp_ge0000_lut_3_2_491
    );
  Mcompar_wait_time_cmp_ge0000_cy_3_2 : MUXCY
    port map (
      CI => Mcompar_wait_time_cmp_ge0000_cy_2_3,
      DI => Mrom_databus_mux0005,
      S => Mcompar_wait_time_cmp_ge0000_lut_3_2_491,
      O => Mcompar_wait_time_cmp_ge0000_cy_3_3
    );
  Mcompar_wait_time_cmp_ge0000_cy_4_2 : MUXCY
    port map (
      CI => Mcompar_wait_time_cmp_ge0000_cy_3_3,
      DI => Mrom_databus_mux000512,
      S => Mcompar_wait_time_cmp_ge0000_cy_4_2_rt_451,
      O => Mcompar_wait_time_cmp_ge0000_cy_4_3
    );
  Mcompar_wait_time_cmp_ge0000_lut_5_2 : LUT4
    generic map(
      INIT => X"0001"
    )
    port map (
      I0 => count_us(15),
      I1 => count_us(16),
      I2 => count_us(17),
      I3 => count_us(18),
      O => Mcompar_wait_time_cmp_ge0000_lut_5_2_497
    );
  Mcompar_wait_time_cmp_ge0000_cy_5_2 : MUXCY
    port map (
      CI => Mcompar_wait_time_cmp_ge0000_cy_4_3,
      DI => Mrom_databus_mux0005,
      S => Mcompar_wait_time_cmp_ge0000_lut_5_2_497,
      O => Mcompar_wait_time_cmp_ge0000_cy_5_3
    );
  Mcompar_wait_time_cmp_ge0000_lut_6_1 : LUT4
    generic map(
      INIT => X"0001"
    )
    port map (
      I0 => count_us(19),
      I1 => count_us(20),
      I2 => count_us(21),
      I3 => count_us(22),
      O => Mcompar_wait_time_cmp_ge0000_lut_6_1_499
    );
  Mcompar_wait_time_cmp_ge0000_cy_6_2 : MUXCY
    port map (
      CI => Mcompar_wait_time_cmp_ge0000_cy_5_3,
      DI => Mrom_databus_mux0005,
      S => Mcompar_wait_time_cmp_ge0000_lut_6_1_499,
      O => Mcompar_wait_time_cmp_ge0000_cy_6_3
    );
  Mcompar_wait_time_cmp_ge0000_lut_7_2 : LUT4
    generic map(
      INIT => X"0001"
    )
    port map (
      I0 => count_us(23),
      I1 => count_us(24),
      I2 => count_us(25),
      I3 => count_us(26),
      O => Mcompar_wait_time_cmp_ge0000_lut_7_2_502
    );
  Mcompar_wait_time_cmp_ge0000_cy_7_2 : MUXCY
    port map (
      CI => Mcompar_wait_time_cmp_ge0000_cy_6_3,
      DI => Mrom_databus_mux0005,
      S => Mcompar_wait_time_cmp_ge0000_lut_7_2_502,
      O => Mcompar_wait_time_cmp_ge0000_cy_7_3
    );
  Mcompar_wait_time_cmp_ge0000_lut_8_3 : LUT4
    generic map(
      INIT => X"0001"
    )
    port map (
      I0 => count_us(27),
      I1 => count_us(28),
      I2 => count_us(29),
      I3 => count_us(30),
      O => Mcompar_wait_time_cmp_ge0000_lut_8_3_506
    );
  Mcompar_wait_time_cmp_ge0000_cy_8_2 : MUXCY
    port map (
      CI => Mcompar_wait_time_cmp_ge0000_cy_7_3,
      DI => Mrom_databus_mux0005,
      S => Mcompar_wait_time_cmp_ge0000_lut_8_3_506,
      O => Mcompar_wait_time_cmp_ge0000_cy_8_3
    );
  Mcompar_wait_time_cmp_ge0000_cy_9_2 : MUXCY
    port map (
      CI => Mcompar_wait_time_cmp_ge0000_cy_8_3,
      DI => Mrom_databus_mux000512,
      S => Mcompar_wait_time_cmp_ge0000_lut_9_3,
      O => databus_cmp_ge0002
    );
  G1_Madd_cnt_add0000_cy_0_Q : MUXCY
    port map (
      CI => Mrom_databus_mux000512,
      DI => Mrom_databus_mux0005,
      S => G1_Madd_cnt_add0000_lut(0),
      O => G1_Madd_cnt_add0000_cy(0)
    );
  G1_Madd_cnt_add0000_cy_1_Q : MUXCY
    port map (
      CI => G1_Madd_cnt_add0000_cy(0),
      DI => Mrom_databus_mux000512,
      S => G1_Madd_cnt_add0000_cy_1_rt_42,
      O => G1_Madd_cnt_add0000_cy(1)
    );
  G1_Madd_cnt_add0000_xor_1_Q : XORCY
    port map (
      CI => G1_Madd_cnt_add0000_cy(0),
      LI => G1_Madd_cnt_add0000_cy_1_rt_42,
      O => G1_cnt_add0000(1)
    );
  G1_Madd_cnt_add0000_cy_2_Q : MUXCY
    port map (
      CI => G1_Madd_cnt_add0000_cy(1),
      DI => Mrom_databus_mux000512,
      S => G1_Madd_cnt_add0000_cy_2_rt_64,
      O => G1_Madd_cnt_add0000_cy(2)
    );
  G1_Madd_cnt_add0000_xor_2_Q : XORCY
    port map (
      CI => G1_Madd_cnt_add0000_cy(1),
      LI => G1_Madd_cnt_add0000_cy_2_rt_64,
      O => G1_cnt_add0000(2)
    );
  G1_Madd_cnt_add0000_cy_3_Q : MUXCY
    port map (
      CI => G1_Madd_cnt_add0000_cy(2),
      DI => Mrom_databus_mux000512,
      S => G1_Madd_cnt_add0000_cy_3_rt_68,
      O => G1_Madd_cnt_add0000_cy(3)
    );
  G1_Madd_cnt_add0000_xor_3_Q : XORCY
    port map (
      CI => G1_Madd_cnt_add0000_cy(2),
      LI => G1_Madd_cnt_add0000_cy_3_rt_68,
      O => G1_cnt_add0000(3)
    );
  G1_Madd_cnt_add0000_cy_4_Q : MUXCY
    port map (
      CI => G1_Madd_cnt_add0000_cy(3),
      DI => Mrom_databus_mux000512,
      S => G1_Madd_cnt_add0000_cy_4_rt_70,
      O => G1_Madd_cnt_add0000_cy(4)
    );
  G1_Madd_cnt_add0000_xor_4_Q : XORCY
    port map (
      CI => G1_Madd_cnt_add0000_cy(3),
      LI => G1_Madd_cnt_add0000_cy_4_rt_70,
      O => G1_cnt_add0000(4)
    );
  G1_Madd_cnt_add0000_cy_5_Q : MUXCY
    port map (
      CI => G1_Madd_cnt_add0000_cy(4),
      DI => Mrom_databus_mux000512,
      S => G1_Madd_cnt_add0000_cy_5_rt_72,
      O => G1_Madd_cnt_add0000_cy(5)
    );
  G1_Madd_cnt_add0000_xor_5_Q : XORCY
    port map (
      CI => G1_Madd_cnt_add0000_cy(4),
      LI => G1_Madd_cnt_add0000_cy_5_rt_72,
      O => G1_cnt_add0000(5)
    );
  G1_Madd_cnt_add0000_cy_6_Q : MUXCY
    port map (
      CI => G1_Madd_cnt_add0000_cy(5),
      DI => Mrom_databus_mux000512,
      S => G1_Madd_cnt_add0000_cy_6_rt_74,
      O => G1_Madd_cnt_add0000_cy(6)
    );
  G1_Madd_cnt_add0000_xor_6_Q : XORCY
    port map (
      CI => G1_Madd_cnt_add0000_cy(5),
      LI => G1_Madd_cnt_add0000_cy_6_rt_74,
      O => G1_cnt_add0000(6)
    );
  G1_Madd_cnt_add0000_cy_7_Q : MUXCY
    port map (
      CI => G1_Madd_cnt_add0000_cy(6),
      DI => Mrom_databus_mux000512,
      S => G1_Madd_cnt_add0000_cy_7_rt_76,
      O => G1_Madd_cnt_add0000_cy(7)
    );
  G1_Madd_cnt_add0000_xor_7_Q : XORCY
    port map (
      CI => G1_Madd_cnt_add0000_cy(6),
      LI => G1_Madd_cnt_add0000_cy_7_rt_76,
      O => G1_cnt_add0000(7)
    );
  G1_Madd_cnt_add0000_cy_8_Q : MUXCY
    port map (
      CI => G1_Madd_cnt_add0000_cy(7),
      DI => Mrom_databus_mux000512,
      S => G1_Madd_cnt_add0000_cy_8_rt_78,
      O => G1_Madd_cnt_add0000_cy(8)
    );
  G1_Madd_cnt_add0000_xor_8_Q : XORCY
    port map (
      CI => G1_Madd_cnt_add0000_cy(7),
      LI => G1_Madd_cnt_add0000_cy_8_rt_78,
      O => G1_cnt_add0000(8)
    );
  G1_Madd_cnt_add0000_cy_9_Q : MUXCY
    port map (
      CI => G1_Madd_cnt_add0000_cy(8),
      DI => Mrom_databus_mux000512,
      S => G1_Madd_cnt_add0000_cy_9_rt_80,
      O => G1_Madd_cnt_add0000_cy(9)
    );
  G1_Madd_cnt_add0000_xor_9_Q : XORCY
    port map (
      CI => G1_Madd_cnt_add0000_cy(8),
      LI => G1_Madd_cnt_add0000_cy_9_rt_80,
      O => G1_cnt_add0000(9)
    );
  G1_Madd_cnt_add0000_cy_10_Q : MUXCY
    port map (
      CI => G1_Madd_cnt_add0000_cy(9),
      DI => Mrom_databus_mux000512,
      S => G1_Madd_cnt_add0000_cy_10_rt_22,
      O => G1_Madd_cnt_add0000_cy(10)
    );
  G1_Madd_cnt_add0000_xor_10_Q : XORCY
    port map (
      CI => G1_Madd_cnt_add0000_cy(9),
      LI => G1_Madd_cnt_add0000_cy_10_rt_22,
      O => G1_cnt_add0000(10)
    );
  G1_Madd_cnt_add0000_cy_11_Q : MUXCY
    port map (
      CI => G1_Madd_cnt_add0000_cy(10),
      DI => Mrom_databus_mux000512,
      S => G1_Madd_cnt_add0000_cy_11_rt_24,
      O => G1_Madd_cnt_add0000_cy(11)
    );
  G1_Madd_cnt_add0000_xor_11_Q : XORCY
    port map (
      CI => G1_Madd_cnt_add0000_cy(10),
      LI => G1_Madd_cnt_add0000_cy_11_rt_24,
      O => G1_cnt_add0000(11)
    );
  G1_Madd_cnt_add0000_cy_12_Q : MUXCY
    port map (
      CI => G1_Madd_cnt_add0000_cy(11),
      DI => Mrom_databus_mux000512,
      S => G1_Madd_cnt_add0000_cy_12_rt_26,
      O => G1_Madd_cnt_add0000_cy(12)
    );
  G1_Madd_cnt_add0000_xor_12_Q : XORCY
    port map (
      CI => G1_Madd_cnt_add0000_cy(11),
      LI => G1_Madd_cnt_add0000_cy_12_rt_26,
      O => G1_cnt_add0000(12)
    );
  G1_Madd_cnt_add0000_cy_13_Q : MUXCY
    port map (
      CI => G1_Madd_cnt_add0000_cy(12),
      DI => Mrom_databus_mux000512,
      S => G1_Madd_cnt_add0000_cy_13_rt_28,
      O => G1_Madd_cnt_add0000_cy(13)
    );
  G1_Madd_cnt_add0000_xor_13_Q : XORCY
    port map (
      CI => G1_Madd_cnt_add0000_cy(12),
      LI => G1_Madd_cnt_add0000_cy_13_rt_28,
      O => G1_cnt_add0000(13)
    );
  G1_Madd_cnt_add0000_cy_14_Q : MUXCY
    port map (
      CI => G1_Madd_cnt_add0000_cy(13),
      DI => Mrom_databus_mux000512,
      S => G1_Madd_cnt_add0000_cy_14_rt_30,
      O => G1_Madd_cnt_add0000_cy(14)
    );
  G1_Madd_cnt_add0000_xor_14_Q : XORCY
    port map (
      CI => G1_Madd_cnt_add0000_cy(13),
      LI => G1_Madd_cnt_add0000_cy_14_rt_30,
      O => G1_cnt_add0000(14)
    );
  G1_Madd_cnt_add0000_cy_15_Q : MUXCY
    port map (
      CI => G1_Madd_cnt_add0000_cy(14),
      DI => Mrom_databus_mux000512,
      S => G1_Madd_cnt_add0000_cy_15_rt_32,
      O => G1_Madd_cnt_add0000_cy(15)
    );
  G1_Madd_cnt_add0000_xor_15_Q : XORCY
    port map (
      CI => G1_Madd_cnt_add0000_cy(14),
      LI => G1_Madd_cnt_add0000_cy_15_rt_32,
      O => G1_cnt_add0000(15)
    );
  G1_Madd_cnt_add0000_cy_16_Q : MUXCY
    port map (
      CI => G1_Madd_cnt_add0000_cy(15),
      DI => Mrom_databus_mux000512,
      S => G1_Madd_cnt_add0000_cy_16_rt_34,
      O => G1_Madd_cnt_add0000_cy(16)
    );
  G1_Madd_cnt_add0000_xor_16_Q : XORCY
    port map (
      CI => G1_Madd_cnt_add0000_cy(15),
      LI => G1_Madd_cnt_add0000_cy_16_rt_34,
      O => G1_cnt_add0000(16)
    );
  G1_Madd_cnt_add0000_cy_17_Q : MUXCY
    port map (
      CI => G1_Madd_cnt_add0000_cy(16),
      DI => Mrom_databus_mux000512,
      S => G1_Madd_cnt_add0000_cy_17_rt_36,
      O => G1_Madd_cnt_add0000_cy(17)
    );
  G1_Madd_cnt_add0000_xor_17_Q : XORCY
    port map (
      CI => G1_Madd_cnt_add0000_cy(16),
      LI => G1_Madd_cnt_add0000_cy_17_rt_36,
      O => G1_cnt_add0000(17)
    );
  G1_Madd_cnt_add0000_cy_18_Q : MUXCY
    port map (
      CI => G1_Madd_cnt_add0000_cy(17),
      DI => Mrom_databus_mux000512,
      S => G1_Madd_cnt_add0000_cy_18_rt_38,
      O => G1_Madd_cnt_add0000_cy(18)
    );
  G1_Madd_cnt_add0000_xor_18_Q : XORCY
    port map (
      CI => G1_Madd_cnt_add0000_cy(17),
      LI => G1_Madd_cnt_add0000_cy_18_rt_38,
      O => G1_cnt_add0000(18)
    );
  G1_Madd_cnt_add0000_cy_19_Q : MUXCY
    port map (
      CI => G1_Madd_cnt_add0000_cy(18),
      DI => Mrom_databus_mux000512,
      S => G1_Madd_cnt_add0000_cy_19_rt_40,
      O => G1_Madd_cnt_add0000_cy(19)
    );
  G1_Madd_cnt_add0000_xor_19_Q : XORCY
    port map (
      CI => G1_Madd_cnt_add0000_cy(18),
      LI => G1_Madd_cnt_add0000_cy_19_rt_40,
      O => G1_cnt_add0000(19)
    );
  G1_Madd_cnt_add0000_cy_20_Q : MUXCY
    port map (
      CI => G1_Madd_cnt_add0000_cy(19),
      DI => Mrom_databus_mux000512,
      S => G1_Madd_cnt_add0000_cy_20_rt_44,
      O => G1_Madd_cnt_add0000_cy(20)
    );
  G1_Madd_cnt_add0000_xor_20_Q : XORCY
    port map (
      CI => G1_Madd_cnt_add0000_cy(19),
      LI => G1_Madd_cnt_add0000_cy_20_rt_44,
      O => G1_cnt_add0000(20)
    );
  G1_Madd_cnt_add0000_cy_21_Q : MUXCY
    port map (
      CI => G1_Madd_cnt_add0000_cy(20),
      DI => Mrom_databus_mux000512,
      S => G1_Madd_cnt_add0000_cy_21_rt_46,
      O => G1_Madd_cnt_add0000_cy(21)
    );
  G1_Madd_cnt_add0000_xor_21_Q : XORCY
    port map (
      CI => G1_Madd_cnt_add0000_cy(20),
      LI => G1_Madd_cnt_add0000_cy_21_rt_46,
      O => G1_cnt_add0000(21)
    );
  G1_Madd_cnt_add0000_cy_22_Q : MUXCY
    port map (
      CI => G1_Madd_cnt_add0000_cy(21),
      DI => Mrom_databus_mux000512,
      S => G1_Madd_cnt_add0000_cy_22_rt_48,
      O => G1_Madd_cnt_add0000_cy(22)
    );
  G1_Madd_cnt_add0000_xor_22_Q : XORCY
    port map (
      CI => G1_Madd_cnt_add0000_cy(21),
      LI => G1_Madd_cnt_add0000_cy_22_rt_48,
      O => G1_cnt_add0000(22)
    );
  G1_Madd_cnt_add0000_cy_23_Q : MUXCY
    port map (
      CI => G1_Madd_cnt_add0000_cy(22),
      DI => Mrom_databus_mux000512,
      S => G1_Madd_cnt_add0000_cy_23_rt_50,
      O => G1_Madd_cnt_add0000_cy(23)
    );
  G1_Madd_cnt_add0000_xor_23_Q : XORCY
    port map (
      CI => G1_Madd_cnt_add0000_cy(22),
      LI => G1_Madd_cnt_add0000_cy_23_rt_50,
      O => G1_cnt_add0000(23)
    );
  G1_Madd_cnt_add0000_cy_24_Q : MUXCY
    port map (
      CI => G1_Madd_cnt_add0000_cy(23),
      DI => Mrom_databus_mux000512,
      S => G1_Madd_cnt_add0000_cy_24_rt_52,
      O => G1_Madd_cnt_add0000_cy(24)
    );
  G1_Madd_cnt_add0000_xor_24_Q : XORCY
    port map (
      CI => G1_Madd_cnt_add0000_cy(23),
      LI => G1_Madd_cnt_add0000_cy_24_rt_52,
      O => G1_cnt_add0000(24)
    );
  G1_Madd_cnt_add0000_cy_25_Q : MUXCY
    port map (
      CI => G1_Madd_cnt_add0000_cy(24),
      DI => Mrom_databus_mux000512,
      S => G1_Madd_cnt_add0000_cy_25_rt_54,
      O => G1_Madd_cnt_add0000_cy(25)
    );
  G1_Madd_cnt_add0000_xor_25_Q : XORCY
    port map (
      CI => G1_Madd_cnt_add0000_cy(24),
      LI => G1_Madd_cnt_add0000_cy_25_rt_54,
      O => G1_cnt_add0000(25)
    );
  G1_Madd_cnt_add0000_cy_26_Q : MUXCY
    port map (
      CI => G1_Madd_cnt_add0000_cy(25),
      DI => Mrom_databus_mux000512,
      S => G1_Madd_cnt_add0000_cy_26_rt_56,
      O => G1_Madd_cnt_add0000_cy(26)
    );
  G1_Madd_cnt_add0000_xor_26_Q : XORCY
    port map (
      CI => G1_Madd_cnt_add0000_cy(25),
      LI => G1_Madd_cnt_add0000_cy_26_rt_56,
      O => G1_cnt_add0000(26)
    );
  G1_Madd_cnt_add0000_cy_27_Q : MUXCY
    port map (
      CI => G1_Madd_cnt_add0000_cy(26),
      DI => Mrom_databus_mux000512,
      S => G1_Madd_cnt_add0000_cy_27_rt_58,
      O => G1_Madd_cnt_add0000_cy(27)
    );
  G1_Madd_cnt_add0000_xor_27_Q : XORCY
    port map (
      CI => G1_Madd_cnt_add0000_cy(26),
      LI => G1_Madd_cnt_add0000_cy_27_rt_58,
      O => G1_cnt_add0000(27)
    );
  G1_Madd_cnt_add0000_cy_28_Q : MUXCY
    port map (
      CI => G1_Madd_cnt_add0000_cy(27),
      DI => Mrom_databus_mux000512,
      S => G1_Madd_cnt_add0000_cy_28_rt_60,
      O => G1_Madd_cnt_add0000_cy(28)
    );
  G1_Madd_cnt_add0000_xor_28_Q : XORCY
    port map (
      CI => G1_Madd_cnt_add0000_cy(27),
      LI => G1_Madd_cnt_add0000_cy_28_rt_60,
      O => G1_cnt_add0000(28)
    );
  G1_Madd_cnt_add0000_cy_29_Q : MUXCY
    port map (
      CI => G1_Madd_cnt_add0000_cy(28),
      DI => Mrom_databus_mux000512,
      S => G1_Madd_cnt_add0000_cy_29_rt_62,
      O => G1_Madd_cnt_add0000_cy(29)
    );
  G1_Madd_cnt_add0000_xor_29_Q : XORCY
    port map (
      CI => G1_Madd_cnt_add0000_cy(28),
      LI => G1_Madd_cnt_add0000_cy_29_rt_62,
      O => G1_cnt_add0000(29)
    );
  G1_Madd_cnt_add0000_cy_30_Q : MUXCY
    port map (
      CI => G1_Madd_cnt_add0000_cy(29),
      DI => Mrom_databus_mux000512,
      S => G1_Madd_cnt_add0000_cy_30_rt_66,
      O => G1_Madd_cnt_add0000_cy(30)
    );
  G1_Madd_cnt_add0000_xor_30_Q : XORCY
    port map (
      CI => G1_Madd_cnt_add0000_cy(29),
      LI => G1_Madd_cnt_add0000_cy_30_rt_66,
      O => G1_cnt_add0000(30)
    );
  G1_Madd_cnt_add0000_xor_31_Q : XORCY
    port map (
      CI => G1_Madd_cnt_add0000_cy(30),
      LI => G1_Madd_cnt_add0000_xor_31_rt_82,
      O => G1_cnt_add0000(31)
    );
  G1_Mcount_cnt_cy_0_Q : MUXCY
    port map (
      CI => Mrom_databus_mux000512,
      DI => Mrom_databus_mux0005,
      S => G1_Mcount_cnt_lut(0),
      O => G1_Mcount_cnt_cy(0)
    );
  G1_Mcount_cnt_cy_1_Q : MUXCY
    port map (
      CI => G1_Mcount_cnt_cy(0),
      DI => Mrom_databus_mux000512,
      S => G1_Mcount_cnt_cy_1_rt_105,
      O => G1_Mcount_cnt_cy(1)
    );
  G1_Mcount_cnt_xor_1_Q : XORCY
    port map (
      CI => G1_Mcount_cnt_cy(0),
      LI => G1_Mcount_cnt_cy_1_rt_105,
      O => Result_1_1
    );
  G1_Mcount_cnt_cy_2_Q : MUXCY
    port map (
      CI => G1_Mcount_cnt_cy(1),
      DI => Mrom_databus_mux000512,
      S => G1_Mcount_cnt_cy_2_rt_127,
      O => G1_Mcount_cnt_cy(2)
    );
  G1_Mcount_cnt_xor_2_Q : XORCY
    port map (
      CI => G1_Mcount_cnt_cy(1),
      LI => G1_Mcount_cnt_cy_2_rt_127,
      O => Result_2_1
    );
  G1_Mcount_cnt_cy_3_Q : MUXCY
    port map (
      CI => G1_Mcount_cnt_cy(2),
      DI => Mrom_databus_mux000512,
      S => G1_Mcount_cnt_cy_3_rt_131,
      O => G1_Mcount_cnt_cy(3)
    );
  G1_Mcount_cnt_xor_3_Q : XORCY
    port map (
      CI => G1_Mcount_cnt_cy(2),
      LI => G1_Mcount_cnt_cy_3_rt_131,
      O => Result_3_1
    );
  G1_Mcount_cnt_cy_4_Q : MUXCY
    port map (
      CI => G1_Mcount_cnt_cy(3),
      DI => Mrom_databus_mux000512,
      S => G1_Mcount_cnt_cy_4_rt_133,
      O => G1_Mcount_cnt_cy(4)
    );
  G1_Mcount_cnt_xor_4_Q : XORCY
    port map (
      CI => G1_Mcount_cnt_cy(3),
      LI => G1_Mcount_cnt_cy_4_rt_133,
      O => Result_4_1
    );
  G1_Mcount_cnt_cy_5_Q : MUXCY
    port map (
      CI => G1_Mcount_cnt_cy(4),
      DI => Mrom_databus_mux000512,
      S => G1_Mcount_cnt_cy_5_rt_135,
      O => G1_Mcount_cnt_cy(5)
    );
  G1_Mcount_cnt_xor_5_Q : XORCY
    port map (
      CI => G1_Mcount_cnt_cy(4),
      LI => G1_Mcount_cnt_cy_5_rt_135,
      O => Result_5_1
    );
  G1_Mcount_cnt_cy_6_Q : MUXCY
    port map (
      CI => G1_Mcount_cnt_cy(5),
      DI => Mrom_databus_mux000512,
      S => G1_Mcount_cnt_cy_6_rt_137,
      O => G1_Mcount_cnt_cy(6)
    );
  G1_Mcount_cnt_xor_6_Q : XORCY
    port map (
      CI => G1_Mcount_cnt_cy(5),
      LI => G1_Mcount_cnt_cy_6_rt_137,
      O => Result_6_1
    );
  G1_Mcount_cnt_cy_7_Q : MUXCY
    port map (
      CI => G1_Mcount_cnt_cy(6),
      DI => Mrom_databus_mux000512,
      S => G1_Mcount_cnt_cy_7_rt_139,
      O => G1_Mcount_cnt_cy(7)
    );
  G1_Mcount_cnt_xor_7_Q : XORCY
    port map (
      CI => G1_Mcount_cnt_cy(6),
      LI => G1_Mcount_cnt_cy_7_rt_139,
      O => Result_7_1
    );
  G1_Mcount_cnt_cy_8_Q : MUXCY
    port map (
      CI => G1_Mcount_cnt_cy(7),
      DI => Mrom_databus_mux000512,
      S => G1_Mcount_cnt_cy_8_rt_141,
      O => G1_Mcount_cnt_cy(8)
    );
  G1_Mcount_cnt_xor_8_Q : XORCY
    port map (
      CI => G1_Mcount_cnt_cy(7),
      LI => G1_Mcount_cnt_cy_8_rt_141,
      O => Result_8_1
    );
  G1_Mcount_cnt_cy_9_Q : MUXCY
    port map (
      CI => G1_Mcount_cnt_cy(8),
      DI => Mrom_databus_mux000512,
      S => G1_Mcount_cnt_cy_9_rt_143,
      O => G1_Mcount_cnt_cy(9)
    );
  G1_Mcount_cnt_xor_9_Q : XORCY
    port map (
      CI => G1_Mcount_cnt_cy(8),
      LI => G1_Mcount_cnt_cy_9_rt_143,
      O => Result_9_1
    );
  G1_Mcount_cnt_cy_10_Q : MUXCY
    port map (
      CI => G1_Mcount_cnt_cy(9),
      DI => Mrom_databus_mux000512,
      S => G1_Mcount_cnt_cy_10_rt_85,
      O => G1_Mcount_cnt_cy(10)
    );
  G1_Mcount_cnt_xor_10_Q : XORCY
    port map (
      CI => G1_Mcount_cnt_cy(9),
      LI => G1_Mcount_cnt_cy_10_rt_85,
      O => Result_10_1
    );
  G1_Mcount_cnt_cy_11_Q : MUXCY
    port map (
      CI => G1_Mcount_cnt_cy(10),
      DI => Mrom_databus_mux000512,
      S => G1_Mcount_cnt_cy_11_rt_87,
      O => G1_Mcount_cnt_cy(11)
    );
  G1_Mcount_cnt_xor_11_Q : XORCY
    port map (
      CI => G1_Mcount_cnt_cy(10),
      LI => G1_Mcount_cnt_cy_11_rt_87,
      O => Result_11_1
    );
  G1_Mcount_cnt_cy_12_Q : MUXCY
    port map (
      CI => G1_Mcount_cnt_cy(11),
      DI => Mrom_databus_mux000512,
      S => G1_Mcount_cnt_cy_12_rt_89,
      O => G1_Mcount_cnt_cy(12)
    );
  G1_Mcount_cnt_xor_12_Q : XORCY
    port map (
      CI => G1_Mcount_cnt_cy(11),
      LI => G1_Mcount_cnt_cy_12_rt_89,
      O => Result_12_1
    );
  G1_Mcount_cnt_cy_13_Q : MUXCY
    port map (
      CI => G1_Mcount_cnt_cy(12),
      DI => Mrom_databus_mux000512,
      S => G1_Mcount_cnt_cy_13_rt_91,
      O => G1_Mcount_cnt_cy(13)
    );
  G1_Mcount_cnt_xor_13_Q : XORCY
    port map (
      CI => G1_Mcount_cnt_cy(12),
      LI => G1_Mcount_cnt_cy_13_rt_91,
      O => Result_13_1
    );
  G1_Mcount_cnt_cy_14_Q : MUXCY
    port map (
      CI => G1_Mcount_cnt_cy(13),
      DI => Mrom_databus_mux000512,
      S => G1_Mcount_cnt_cy_14_rt_93,
      O => G1_Mcount_cnt_cy(14)
    );
  G1_Mcount_cnt_xor_14_Q : XORCY
    port map (
      CI => G1_Mcount_cnt_cy(13),
      LI => G1_Mcount_cnt_cy_14_rt_93,
      O => Result_14_1
    );
  G1_Mcount_cnt_cy_15_Q : MUXCY
    port map (
      CI => G1_Mcount_cnt_cy(14),
      DI => Mrom_databus_mux000512,
      S => G1_Mcount_cnt_cy_15_rt_95,
      O => G1_Mcount_cnt_cy(15)
    );
  G1_Mcount_cnt_xor_15_Q : XORCY
    port map (
      CI => G1_Mcount_cnt_cy(14),
      LI => G1_Mcount_cnt_cy_15_rt_95,
      O => Result_15_1
    );
  G1_Mcount_cnt_cy_16_Q : MUXCY
    port map (
      CI => G1_Mcount_cnt_cy(15),
      DI => Mrom_databus_mux000512,
      S => G1_Mcount_cnt_cy_16_rt_97,
      O => G1_Mcount_cnt_cy(16)
    );
  G1_Mcount_cnt_xor_16_Q : XORCY
    port map (
      CI => G1_Mcount_cnt_cy(15),
      LI => G1_Mcount_cnt_cy_16_rt_97,
      O => Result_16_1
    );
  G1_Mcount_cnt_cy_17_Q : MUXCY
    port map (
      CI => G1_Mcount_cnt_cy(16),
      DI => Mrom_databus_mux000512,
      S => G1_Mcount_cnt_cy_17_rt_99,
      O => G1_Mcount_cnt_cy(17)
    );
  G1_Mcount_cnt_xor_17_Q : XORCY
    port map (
      CI => G1_Mcount_cnt_cy(16),
      LI => G1_Mcount_cnt_cy_17_rt_99,
      O => Result_17_1
    );
  G1_Mcount_cnt_cy_18_Q : MUXCY
    port map (
      CI => G1_Mcount_cnt_cy(17),
      DI => Mrom_databus_mux000512,
      S => G1_Mcount_cnt_cy_18_rt_101,
      O => G1_Mcount_cnt_cy(18)
    );
  G1_Mcount_cnt_xor_18_Q : XORCY
    port map (
      CI => G1_Mcount_cnt_cy(17),
      LI => G1_Mcount_cnt_cy_18_rt_101,
      O => Result_18_1
    );
  G1_Mcount_cnt_cy_19_Q : MUXCY
    port map (
      CI => G1_Mcount_cnt_cy(18),
      DI => Mrom_databus_mux000512,
      S => G1_Mcount_cnt_cy_19_rt_103,
      O => G1_Mcount_cnt_cy(19)
    );
  G1_Mcount_cnt_xor_19_Q : XORCY
    port map (
      CI => G1_Mcount_cnt_cy(18),
      LI => G1_Mcount_cnt_cy_19_rt_103,
      O => Result_19_1
    );
  G1_Mcount_cnt_cy_20_Q : MUXCY
    port map (
      CI => G1_Mcount_cnt_cy(19),
      DI => Mrom_databus_mux000512,
      S => G1_Mcount_cnt_cy_20_rt_107,
      O => G1_Mcount_cnt_cy(20)
    );
  G1_Mcount_cnt_xor_20_Q : XORCY
    port map (
      CI => G1_Mcount_cnt_cy(19),
      LI => G1_Mcount_cnt_cy_20_rt_107,
      O => Result_20_1
    );
  G1_Mcount_cnt_cy_21_Q : MUXCY
    port map (
      CI => G1_Mcount_cnt_cy(20),
      DI => Mrom_databus_mux000512,
      S => G1_Mcount_cnt_cy_21_rt_109,
      O => G1_Mcount_cnt_cy(21)
    );
  G1_Mcount_cnt_xor_21_Q : XORCY
    port map (
      CI => G1_Mcount_cnt_cy(20),
      LI => G1_Mcount_cnt_cy_21_rt_109,
      O => Result_21_1
    );
  G1_Mcount_cnt_cy_22_Q : MUXCY
    port map (
      CI => G1_Mcount_cnt_cy(21),
      DI => Mrom_databus_mux000512,
      S => G1_Mcount_cnt_cy_22_rt_111,
      O => G1_Mcount_cnt_cy(22)
    );
  G1_Mcount_cnt_xor_22_Q : XORCY
    port map (
      CI => G1_Mcount_cnt_cy(21),
      LI => G1_Mcount_cnt_cy_22_rt_111,
      O => Result_22_1
    );
  G1_Mcount_cnt_cy_23_Q : MUXCY
    port map (
      CI => G1_Mcount_cnt_cy(22),
      DI => Mrom_databus_mux000512,
      S => G1_Mcount_cnt_cy_23_rt_113,
      O => G1_Mcount_cnt_cy(23)
    );
  G1_Mcount_cnt_xor_23_Q : XORCY
    port map (
      CI => G1_Mcount_cnt_cy(22),
      LI => G1_Mcount_cnt_cy_23_rt_113,
      O => Result_23_1
    );
  G1_Mcount_cnt_cy_24_Q : MUXCY
    port map (
      CI => G1_Mcount_cnt_cy(23),
      DI => Mrom_databus_mux000512,
      S => G1_Mcount_cnt_cy_24_rt_115,
      O => G1_Mcount_cnt_cy(24)
    );
  G1_Mcount_cnt_xor_24_Q : XORCY
    port map (
      CI => G1_Mcount_cnt_cy(23),
      LI => G1_Mcount_cnt_cy_24_rt_115,
      O => Result_24_1
    );
  G1_Mcount_cnt_cy_25_Q : MUXCY
    port map (
      CI => G1_Mcount_cnt_cy(24),
      DI => Mrom_databus_mux000512,
      S => G1_Mcount_cnt_cy_25_rt_117,
      O => G1_Mcount_cnt_cy(25)
    );
  G1_Mcount_cnt_xor_25_Q : XORCY
    port map (
      CI => G1_Mcount_cnt_cy(24),
      LI => G1_Mcount_cnt_cy_25_rt_117,
      O => Result_25_1
    );
  G1_Mcount_cnt_cy_26_Q : MUXCY
    port map (
      CI => G1_Mcount_cnt_cy(25),
      DI => Mrom_databus_mux000512,
      S => G1_Mcount_cnt_cy_26_rt_119,
      O => G1_Mcount_cnt_cy(26)
    );
  G1_Mcount_cnt_xor_26_Q : XORCY
    port map (
      CI => G1_Mcount_cnt_cy(25),
      LI => G1_Mcount_cnt_cy_26_rt_119,
      O => Result_26_1
    );
  G1_Mcount_cnt_cy_27_Q : MUXCY
    port map (
      CI => G1_Mcount_cnt_cy(26),
      DI => Mrom_databus_mux000512,
      S => G1_Mcount_cnt_cy_27_rt_121,
      O => G1_Mcount_cnt_cy(27)
    );
  G1_Mcount_cnt_xor_27_Q : XORCY
    port map (
      CI => G1_Mcount_cnt_cy(26),
      LI => G1_Mcount_cnt_cy_27_rt_121,
      O => Result_27_1
    );
  G1_Mcount_cnt_cy_28_Q : MUXCY
    port map (
      CI => G1_Mcount_cnt_cy(27),
      DI => Mrom_databus_mux000512,
      S => G1_Mcount_cnt_cy_28_rt_123,
      O => G1_Mcount_cnt_cy(28)
    );
  G1_Mcount_cnt_xor_28_Q : XORCY
    port map (
      CI => G1_Mcount_cnt_cy(27),
      LI => G1_Mcount_cnt_cy_28_rt_123,
      O => Result_28_1
    );
  G1_Mcount_cnt_cy_29_Q : MUXCY
    port map (
      CI => G1_Mcount_cnt_cy(28),
      DI => Mrom_databus_mux000512,
      S => G1_Mcount_cnt_cy_29_rt_125,
      O => G1_Mcount_cnt_cy(29)
    );
  G1_Mcount_cnt_xor_29_Q : XORCY
    port map (
      CI => G1_Mcount_cnt_cy(28),
      LI => G1_Mcount_cnt_cy_29_rt_125,
      O => Result_29_1
    );
  G1_Mcount_cnt_cy_30_Q : MUXCY
    port map (
      CI => G1_Mcount_cnt_cy(29),
      DI => Mrom_databus_mux000512,
      S => G1_Mcount_cnt_cy_30_rt_129,
      O => G1_Mcount_cnt_cy(30)
    );
  G1_Mcount_cnt_xor_30_Q : XORCY
    port map (
      CI => G1_Mcount_cnt_cy(29),
      LI => G1_Mcount_cnt_cy_30_rt_129,
      O => Result_30_1
    );
  G1_Mcount_cnt_xor_31_Q : XORCY
    port map (
      CI => G1_Mcount_cnt_cy(30),
      LI => G1_Mcount_cnt_xor_31_rt_145,
      O => Result_31_1
    );
  Mcount_count_us_cy_0_Q : MUXCY
    port map (
      CI => Mrom_databus_mux000512,
      DI => Mrom_databus_mux0005,
      S => Mcount_count_us_lut(0),
      O => Mcount_count_us_cy(0)
    );
  Mcount_count_us_cy_1_Q : MUXCY
    port map (
      CI => Mcount_count_us_cy(0),
      DI => Mrom_databus_mux000512,
      S => Mcount_count_us_cy_1_rt_614,
      O => Mcount_count_us_cy(1)
    );
  Mcount_count_us_xor_1_Q : XORCY
    port map (
      CI => Mcount_count_us_cy(0),
      LI => Mcount_count_us_cy_1_rt_614,
      O => Result(1)
    );
  Mcount_count_us_cy_2_Q : MUXCY
    port map (
      CI => Mcount_count_us_cy(1),
      DI => Mrom_databus_mux000512,
      S => Mcount_count_us_cy_2_rt_636,
      O => Mcount_count_us_cy(2)
    );
  Mcount_count_us_xor_2_Q : XORCY
    port map (
      CI => Mcount_count_us_cy(1),
      LI => Mcount_count_us_cy_2_rt_636,
      O => Result(2)
    );
  Mcount_count_us_cy_3_Q : MUXCY
    port map (
      CI => Mcount_count_us_cy(2),
      DI => Mrom_databus_mux000512,
      S => Mcount_count_us_cy_3_rt_640,
      O => Mcount_count_us_cy(3)
    );
  Mcount_count_us_xor_3_Q : XORCY
    port map (
      CI => Mcount_count_us_cy(2),
      LI => Mcount_count_us_cy_3_rt_640,
      O => Result(3)
    );
  Mcount_count_us_cy_4_Q : MUXCY
    port map (
      CI => Mcount_count_us_cy(3),
      DI => Mrom_databus_mux000512,
      S => Mcount_count_us_cy_4_rt_642,
      O => Mcount_count_us_cy(4)
    );
  Mcount_count_us_xor_4_Q : XORCY
    port map (
      CI => Mcount_count_us_cy(3),
      LI => Mcount_count_us_cy_4_rt_642,
      O => Result(4)
    );
  Mcount_count_us_cy_5_Q : MUXCY
    port map (
      CI => Mcount_count_us_cy(4),
      DI => Mrom_databus_mux000512,
      S => Mcount_count_us_cy_5_rt_644,
      O => Mcount_count_us_cy(5)
    );
  Mcount_count_us_xor_5_Q : XORCY
    port map (
      CI => Mcount_count_us_cy(4),
      LI => Mcount_count_us_cy_5_rt_644,
      O => Result(5)
    );
  Mcount_count_us_cy_6_Q : MUXCY
    port map (
      CI => Mcount_count_us_cy(5),
      DI => Mrom_databus_mux000512,
      S => Mcount_count_us_cy_6_rt_646,
      O => Mcount_count_us_cy(6)
    );
  Mcount_count_us_xor_6_Q : XORCY
    port map (
      CI => Mcount_count_us_cy(5),
      LI => Mcount_count_us_cy_6_rt_646,
      O => Result(6)
    );
  Mcount_count_us_cy_7_Q : MUXCY
    port map (
      CI => Mcount_count_us_cy(6),
      DI => Mrom_databus_mux000512,
      S => Mcount_count_us_cy_7_rt_648,
      O => Mcount_count_us_cy(7)
    );
  Mcount_count_us_xor_7_Q : XORCY
    port map (
      CI => Mcount_count_us_cy(6),
      LI => Mcount_count_us_cy_7_rt_648,
      O => Result(7)
    );
  Mcount_count_us_cy_8_Q : MUXCY
    port map (
      CI => Mcount_count_us_cy(7),
      DI => Mrom_databus_mux000512,
      S => Mcount_count_us_cy_8_rt_650,
      O => Mcount_count_us_cy(8)
    );
  Mcount_count_us_xor_8_Q : XORCY
    port map (
      CI => Mcount_count_us_cy(7),
      LI => Mcount_count_us_cy_8_rt_650,
      O => Result(8)
    );
  Mcount_count_us_cy_9_Q : MUXCY
    port map (
      CI => Mcount_count_us_cy(8),
      DI => Mrom_databus_mux000512,
      S => Mcount_count_us_cy_9_rt_652,
      O => Mcount_count_us_cy(9)
    );
  Mcount_count_us_xor_9_Q : XORCY
    port map (
      CI => Mcount_count_us_cy(8),
      LI => Mcount_count_us_cy_9_rt_652,
      O => Result(9)
    );
  Mcount_count_us_cy_10_Q : MUXCY
    port map (
      CI => Mcount_count_us_cy(9),
      DI => Mrom_databus_mux000512,
      S => Mcount_count_us_cy_10_rt_594,
      O => Mcount_count_us_cy(10)
    );
  Mcount_count_us_xor_10_Q : XORCY
    port map (
      CI => Mcount_count_us_cy(9),
      LI => Mcount_count_us_cy_10_rt_594,
      O => Result(10)
    );
  Mcount_count_us_cy_11_Q : MUXCY
    port map (
      CI => Mcount_count_us_cy(10),
      DI => Mrom_databus_mux000512,
      S => Mcount_count_us_cy_11_rt_596,
      O => Mcount_count_us_cy(11)
    );
  Mcount_count_us_xor_11_Q : XORCY
    port map (
      CI => Mcount_count_us_cy(10),
      LI => Mcount_count_us_cy_11_rt_596,
      O => Result(11)
    );
  Mcount_count_us_cy_12_Q : MUXCY
    port map (
      CI => Mcount_count_us_cy(11),
      DI => Mrom_databus_mux000512,
      S => Mcount_count_us_cy_12_rt_598,
      O => Mcount_count_us_cy(12)
    );
  Mcount_count_us_xor_12_Q : XORCY
    port map (
      CI => Mcount_count_us_cy(11),
      LI => Mcount_count_us_cy_12_rt_598,
      O => Result(12)
    );
  Mcount_count_us_cy_13_Q : MUXCY
    port map (
      CI => Mcount_count_us_cy(12),
      DI => Mrom_databus_mux000512,
      S => Mcount_count_us_cy_13_rt_600,
      O => Mcount_count_us_cy(13)
    );
  Mcount_count_us_xor_13_Q : XORCY
    port map (
      CI => Mcount_count_us_cy(12),
      LI => Mcount_count_us_cy_13_rt_600,
      O => Result(13)
    );
  Mcount_count_us_cy_14_Q : MUXCY
    port map (
      CI => Mcount_count_us_cy(13),
      DI => Mrom_databus_mux000512,
      S => Mcount_count_us_cy_14_rt_602,
      O => Mcount_count_us_cy(14)
    );
  Mcount_count_us_xor_14_Q : XORCY
    port map (
      CI => Mcount_count_us_cy(13),
      LI => Mcount_count_us_cy_14_rt_602,
      O => Result(14)
    );
  Mcount_count_us_cy_15_Q : MUXCY
    port map (
      CI => Mcount_count_us_cy(14),
      DI => Mrom_databus_mux000512,
      S => Mcount_count_us_cy_15_rt_604,
      O => Mcount_count_us_cy(15)
    );
  Mcount_count_us_xor_15_Q : XORCY
    port map (
      CI => Mcount_count_us_cy(14),
      LI => Mcount_count_us_cy_15_rt_604,
      O => Result(15)
    );
  Mcount_count_us_cy_16_Q : MUXCY
    port map (
      CI => Mcount_count_us_cy(15),
      DI => Mrom_databus_mux000512,
      S => Mcount_count_us_cy_16_rt_606,
      O => Mcount_count_us_cy(16)
    );
  Mcount_count_us_xor_16_Q : XORCY
    port map (
      CI => Mcount_count_us_cy(15),
      LI => Mcount_count_us_cy_16_rt_606,
      O => Result(16)
    );
  Mcount_count_us_cy_17_Q : MUXCY
    port map (
      CI => Mcount_count_us_cy(16),
      DI => Mrom_databus_mux000512,
      S => Mcount_count_us_cy_17_rt_608,
      O => Mcount_count_us_cy(17)
    );
  Mcount_count_us_xor_17_Q : XORCY
    port map (
      CI => Mcount_count_us_cy(16),
      LI => Mcount_count_us_cy_17_rt_608,
      O => Result(17)
    );
  Mcount_count_us_cy_18_Q : MUXCY
    port map (
      CI => Mcount_count_us_cy(17),
      DI => Mrom_databus_mux000512,
      S => Mcount_count_us_cy_18_rt_610,
      O => Mcount_count_us_cy(18)
    );
  Mcount_count_us_xor_18_Q : XORCY
    port map (
      CI => Mcount_count_us_cy(17),
      LI => Mcount_count_us_cy_18_rt_610,
      O => Result(18)
    );
  Mcount_count_us_cy_19_Q : MUXCY
    port map (
      CI => Mcount_count_us_cy(18),
      DI => Mrom_databus_mux000512,
      S => Mcount_count_us_cy_19_rt_612,
      O => Mcount_count_us_cy(19)
    );
  Mcount_count_us_xor_19_Q : XORCY
    port map (
      CI => Mcount_count_us_cy(18),
      LI => Mcount_count_us_cy_19_rt_612,
      O => Result(19)
    );
  Mcount_count_us_cy_20_Q : MUXCY
    port map (
      CI => Mcount_count_us_cy(19),
      DI => Mrom_databus_mux000512,
      S => Mcount_count_us_cy_20_rt_616,
      O => Mcount_count_us_cy(20)
    );
  Mcount_count_us_xor_20_Q : XORCY
    port map (
      CI => Mcount_count_us_cy(19),
      LI => Mcount_count_us_cy_20_rt_616,
      O => Result(20)
    );
  Mcount_count_us_cy_21_Q : MUXCY
    port map (
      CI => Mcount_count_us_cy(20),
      DI => Mrom_databus_mux000512,
      S => Mcount_count_us_cy_21_rt_618,
      O => Mcount_count_us_cy(21)
    );
  Mcount_count_us_xor_21_Q : XORCY
    port map (
      CI => Mcount_count_us_cy(20),
      LI => Mcount_count_us_cy_21_rt_618,
      O => Result(21)
    );
  Mcount_count_us_cy_22_Q : MUXCY
    port map (
      CI => Mcount_count_us_cy(21),
      DI => Mrom_databus_mux000512,
      S => Mcount_count_us_cy_22_rt_620,
      O => Mcount_count_us_cy(22)
    );
  Mcount_count_us_xor_22_Q : XORCY
    port map (
      CI => Mcount_count_us_cy(21),
      LI => Mcount_count_us_cy_22_rt_620,
      O => Result(22)
    );
  Mcount_count_us_cy_23_Q : MUXCY
    port map (
      CI => Mcount_count_us_cy(22),
      DI => Mrom_databus_mux000512,
      S => Mcount_count_us_cy_23_rt_622,
      O => Mcount_count_us_cy(23)
    );
  Mcount_count_us_xor_23_Q : XORCY
    port map (
      CI => Mcount_count_us_cy(22),
      LI => Mcount_count_us_cy_23_rt_622,
      O => Result(23)
    );
  Mcount_count_us_cy_24_Q : MUXCY
    port map (
      CI => Mcount_count_us_cy(23),
      DI => Mrom_databus_mux000512,
      S => Mcount_count_us_cy_24_rt_624,
      O => Mcount_count_us_cy(24)
    );
  Mcount_count_us_xor_24_Q : XORCY
    port map (
      CI => Mcount_count_us_cy(23),
      LI => Mcount_count_us_cy_24_rt_624,
      O => Result(24)
    );
  Mcount_count_us_cy_25_Q : MUXCY
    port map (
      CI => Mcount_count_us_cy(24),
      DI => Mrom_databus_mux000512,
      S => Mcount_count_us_cy_25_rt_626,
      O => Mcount_count_us_cy(25)
    );
  Mcount_count_us_xor_25_Q : XORCY
    port map (
      CI => Mcount_count_us_cy(24),
      LI => Mcount_count_us_cy_25_rt_626,
      O => Result(25)
    );
  Mcount_count_us_cy_26_Q : MUXCY
    port map (
      CI => Mcount_count_us_cy(25),
      DI => Mrom_databus_mux000512,
      S => Mcount_count_us_cy_26_rt_628,
      O => Mcount_count_us_cy(26)
    );
  Mcount_count_us_xor_26_Q : XORCY
    port map (
      CI => Mcount_count_us_cy(25),
      LI => Mcount_count_us_cy_26_rt_628,
      O => Result(26)
    );
  Mcount_count_us_cy_27_Q : MUXCY
    port map (
      CI => Mcount_count_us_cy(26),
      DI => Mrom_databus_mux000512,
      S => Mcount_count_us_cy_27_rt_630,
      O => Mcount_count_us_cy(27)
    );
  Mcount_count_us_xor_27_Q : XORCY
    port map (
      CI => Mcount_count_us_cy(26),
      LI => Mcount_count_us_cy_27_rt_630,
      O => Result(27)
    );
  Mcount_count_us_cy_28_Q : MUXCY
    port map (
      CI => Mcount_count_us_cy(27),
      DI => Mrom_databus_mux000512,
      S => Mcount_count_us_cy_28_rt_632,
      O => Mcount_count_us_cy(28)
    );
  Mcount_count_us_xor_28_Q : XORCY
    port map (
      CI => Mcount_count_us_cy(27),
      LI => Mcount_count_us_cy_28_rt_632,
      O => Result(28)
    );
  Mcount_count_us_cy_29_Q : MUXCY
    port map (
      CI => Mcount_count_us_cy(28),
      DI => Mrom_databus_mux000512,
      S => Mcount_count_us_cy_29_rt_634,
      O => Mcount_count_us_cy(29)
    );
  Mcount_count_us_xor_29_Q : XORCY
    port map (
      CI => Mcount_count_us_cy(28),
      LI => Mcount_count_us_cy_29_rt_634,
      O => Result(29)
    );
  Mcount_count_us_cy_30_Q : MUXCY
    port map (
      CI => Mcount_count_us_cy(29),
      DI => Mrom_databus_mux000512,
      S => Mcount_count_us_cy_30_rt_638,
      O => Mcount_count_us_cy(30)
    );
  Mcount_count_us_xor_30_Q : XORCY
    port map (
      CI => Mcount_count_us_cy(29),
      LI => Mcount_count_us_cy_30_rt_638,
      O => Result(30)
    );
  Mcount_count_us_xor_31_Q : XORCY
    port map (
      CI => Mcount_count_us_cy(30),
      LI => Mcount_count_us_xor_31_rt_654,
      O => Result(31)
    );
  Mcompar_wait_time_cmp_ge0001_cy_0_Q : MUXCY
    port map (
      CI => Mrom_databus_mux0005,
      DI => count_us(0),
      S => Mcompar_wait_time_cmp_ge0001_lut(0),
      O => Mcompar_wait_time_cmp_ge0001_cy(0)
    );
  Mcompar_wait_time_cmp_ge0001_lut_1_Q : LUT2
    generic map(
      INIT => X"9"
    )
    port map (
      I0 => count_us(1),
      I1 => wait_time(1),
      O => Mcompar_wait_time_cmp_ge0001_lut(1)
    );
  Mcompar_wait_time_cmp_ge0001_cy_1_Q : MUXCY
    port map (
      CI => Mcompar_wait_time_cmp_ge0001_cy(0),
      DI => count_us(1),
      S => Mcompar_wait_time_cmp_ge0001_lut(1),
      O => Mcompar_wait_time_cmp_ge0001_cy(1)
    );
  Mcompar_wait_time_cmp_ge0001_lut_2_Q : LUT2
    generic map(
      INIT => X"9"
    )
    port map (
      I0 => count_us(2),
      I1 => wait_time(2),
      O => Mcompar_wait_time_cmp_ge0001_lut(2)
    );
  Mcompar_wait_time_cmp_ge0001_cy_2_Q : MUXCY
    port map (
      CI => Mcompar_wait_time_cmp_ge0001_cy(1),
      DI => count_us(2),
      S => Mcompar_wait_time_cmp_ge0001_lut(2),
      O => Mcompar_wait_time_cmp_ge0001_cy(2)
    );
  Mcompar_wait_time_cmp_ge0001_lut_3_Q : LUT2
    generic map(
      INIT => X"9"
    )
    port map (
      I0 => count_us(3),
      I1 => wait_time(3),
      O => Mcompar_wait_time_cmp_ge0001_lut(3)
    );
  Mcompar_wait_time_cmp_ge0001_cy_3_Q : MUXCY
    port map (
      CI => Mcompar_wait_time_cmp_ge0001_cy(2),
      DI => count_us(3),
      S => Mcompar_wait_time_cmp_ge0001_lut(3),
      O => Mcompar_wait_time_cmp_ge0001_cy(3)
    );
  Mcompar_wait_time_cmp_ge0001_cy_4_Q : MUXCY
    port map (
      CI => Mcompar_wait_time_cmp_ge0001_cy(3),
      DI => count_us(4),
      S => Mcompar_wait_time_cmp_ge0001_lut(4),
      O => Mcompar_wait_time_cmp_ge0001_cy(4)
    );
  Mcompar_wait_time_cmp_ge0001_lut_5_Q : LUT2
    generic map(
      INIT => X"9"
    )
    port map (
      I0 => count_us(5),
      I1 => databus_add0000(5),
      O => Mcompar_wait_time_cmp_ge0001_lut(5)
    );
  Mcompar_wait_time_cmp_ge0001_cy_5_Q : MUXCY
    port map (
      CI => Mcompar_wait_time_cmp_ge0001_cy(4),
      DI => count_us(5),
      S => Mcompar_wait_time_cmp_ge0001_lut(5),
      O => Mcompar_wait_time_cmp_ge0001_cy(5)
    );
  Mcompar_wait_time_cmp_ge0001_lut_6_Q : LUT2
    generic map(
      INIT => X"9"
    )
    port map (
      I0 => count_us(6),
      I1 => databus_add0000(6),
      O => Mcompar_wait_time_cmp_ge0001_lut(6)
    );
  Mcompar_wait_time_cmp_ge0001_cy_6_Q : MUXCY
    port map (
      CI => Mcompar_wait_time_cmp_ge0001_cy(5),
      DI => count_us(6),
      S => Mcompar_wait_time_cmp_ge0001_lut(6),
      O => Mcompar_wait_time_cmp_ge0001_cy(6)
    );
  Mcompar_wait_time_cmp_ge0001_lut_7_Q : LUT2
    generic map(
      INIT => X"9"
    )
    port map (
      I0 => count_us(7),
      I1 => databus_add0000(7),
      O => Mcompar_wait_time_cmp_ge0001_lut(7)
    );
  Mcompar_wait_time_cmp_ge0001_cy_7_Q : MUXCY
    port map (
      CI => Mcompar_wait_time_cmp_ge0001_cy(6),
      DI => count_us(7),
      S => Mcompar_wait_time_cmp_ge0001_lut(7),
      O => Mcompar_wait_time_cmp_ge0001_cy(7)
    );
  Mcompar_wait_time_cmp_ge0001_lut_8_Q : LUT2
    generic map(
      INIT => X"9"
    )
    port map (
      I0 => count_us(8),
      I1 => databus_add0000(8),
      O => Mcompar_wait_time_cmp_ge0001_lut(8)
    );
  Mcompar_wait_time_cmp_ge0001_cy_8_Q : MUXCY
    port map (
      CI => Mcompar_wait_time_cmp_ge0001_cy(7),
      DI => count_us(8),
      S => Mcompar_wait_time_cmp_ge0001_lut(8),
      O => Mcompar_wait_time_cmp_ge0001_cy(8)
    );
  Mcompar_wait_time_cmp_ge0001_lut_9_Q : LUT2
    generic map(
      INIT => X"9"
    )
    port map (
      I0 => count_us(9),
      I1 => databus_add0000(9),
      O => Mcompar_wait_time_cmp_ge0001_lut(9)
    );
  Mcompar_wait_time_cmp_ge0001_cy_9_Q : MUXCY
    port map (
      CI => Mcompar_wait_time_cmp_ge0001_cy(8),
      DI => count_us(9),
      S => Mcompar_wait_time_cmp_ge0001_lut(9),
      O => Mcompar_wait_time_cmp_ge0001_cy(9)
    );
  Mcompar_wait_time_cmp_ge0001_lut_10_Q : LUT2
    generic map(
      INIT => X"9"
    )
    port map (
      I0 => count_us(10),
      I1 => databus_add0000(10),
      O => Mcompar_wait_time_cmp_ge0001_lut(10)
    );
  Mcompar_wait_time_cmp_ge0001_cy_10_Q : MUXCY
    port map (
      CI => Mcompar_wait_time_cmp_ge0001_cy(9),
      DI => count_us(10),
      S => Mcompar_wait_time_cmp_ge0001_lut(10),
      O => Mcompar_wait_time_cmp_ge0001_cy(10)
    );
  Mcompar_wait_time_cmp_ge0001_lut_11_Q : LUT2
    generic map(
      INIT => X"9"
    )
    port map (
      I0 => count_us(11),
      I1 => databus_add0000(11),
      O => Mcompar_wait_time_cmp_ge0001_lut(11)
    );
  Mcompar_wait_time_cmp_ge0001_cy_11_Q : MUXCY
    port map (
      CI => Mcompar_wait_time_cmp_ge0001_cy(10),
      DI => count_us(11),
      S => Mcompar_wait_time_cmp_ge0001_lut(11),
      O => Mcompar_wait_time_cmp_ge0001_cy(11)
    );
  Mcompar_wait_time_cmp_ge0001_lut_12_Q : LUT2
    generic map(
      INIT => X"9"
    )
    port map (
      I0 => count_us(12),
      I1 => databus_add0000(12),
      O => Mcompar_wait_time_cmp_ge0001_lut(12)
    );
  Mcompar_wait_time_cmp_ge0001_cy_12_Q : MUXCY
    port map (
      CI => Mcompar_wait_time_cmp_ge0001_cy(11),
      DI => count_us(12),
      S => Mcompar_wait_time_cmp_ge0001_lut(12),
      O => Mcompar_wait_time_cmp_ge0001_cy(12)
    );
  Mcompar_wait_time_cmp_ge0001_lut_13_Q : LUT2
    generic map(
      INIT => X"9"
    )
    port map (
      I0 => count_us(13),
      I1 => databus_add0000(13),
      O => Mcompar_wait_time_cmp_ge0001_lut(13)
    );
  Mcompar_wait_time_cmp_ge0001_cy_13_Q : MUXCY
    port map (
      CI => Mcompar_wait_time_cmp_ge0001_cy(12),
      DI => count_us(13),
      S => Mcompar_wait_time_cmp_ge0001_lut(13),
      O => Mcompar_wait_time_cmp_ge0001_cy(13)
    );
  Mcompar_wait_time_cmp_ge0001_lut_14_Q : LUT2
    generic map(
      INIT => X"9"
    )
    port map (
      I0 => count_us(14),
      I1 => databus_add0000(14),
      O => Mcompar_wait_time_cmp_ge0001_lut(14)
    );
  Mcompar_wait_time_cmp_ge0001_cy_14_Q : MUXCY
    port map (
      CI => Mcompar_wait_time_cmp_ge0001_cy(13),
      DI => count_us(14),
      S => Mcompar_wait_time_cmp_ge0001_lut(14),
      O => Mcompar_wait_time_cmp_ge0001_cy(14)
    );
  Mcompar_wait_time_cmp_ge0001_lut_15_Q : LUT2
    generic map(
      INIT => X"9"
    )
    port map (
      I0 => count_us(15),
      I1 => databus_add0000(15),
      O => Mcompar_wait_time_cmp_ge0001_lut(15)
    );
  Mcompar_wait_time_cmp_ge0001_cy_15_Q : MUXCY
    port map (
      CI => Mcompar_wait_time_cmp_ge0001_cy(14),
      DI => count_us(15),
      S => Mcompar_wait_time_cmp_ge0001_lut(15),
      O => Mcompar_wait_time_cmp_ge0001_cy(15)
    );
  Mcompar_wait_time_cmp_ge0001_lut_16_Q : LUT2
    generic map(
      INIT => X"9"
    )
    port map (
      I0 => count_us(16),
      I1 => databus_add0000(16),
      O => Mcompar_wait_time_cmp_ge0001_lut(16)
    );
  Mcompar_wait_time_cmp_ge0001_cy_16_Q : MUXCY
    port map (
      CI => Mcompar_wait_time_cmp_ge0001_cy(15),
      DI => count_us(16),
      S => Mcompar_wait_time_cmp_ge0001_lut(16),
      O => Mcompar_wait_time_cmp_ge0001_cy(16)
    );
  Mcompar_wait_time_cmp_ge0001_lut_17_Q : LUT2
    generic map(
      INIT => X"9"
    )
    port map (
      I0 => count_us(17),
      I1 => databus_add0000(17),
      O => Mcompar_wait_time_cmp_ge0001_lut(17)
    );
  Mcompar_wait_time_cmp_ge0001_cy_17_Q : MUXCY
    port map (
      CI => Mcompar_wait_time_cmp_ge0001_cy(16),
      DI => count_us(17),
      S => Mcompar_wait_time_cmp_ge0001_lut(17),
      O => Mcompar_wait_time_cmp_ge0001_cy(17)
    );
  Mcompar_wait_time_cmp_ge0001_lut_18_Q : LUT2
    generic map(
      INIT => X"9"
    )
    port map (
      I0 => count_us(18),
      I1 => databus_add0000(18),
      O => Mcompar_wait_time_cmp_ge0001_lut(18)
    );
  Mcompar_wait_time_cmp_ge0001_cy_18_Q : MUXCY
    port map (
      CI => Mcompar_wait_time_cmp_ge0001_cy(17),
      DI => count_us(18),
      S => Mcompar_wait_time_cmp_ge0001_lut(18),
      O => Mcompar_wait_time_cmp_ge0001_cy(18)
    );
  Mcompar_wait_time_cmp_ge0001_lut_19_Q : LUT2
    generic map(
      INIT => X"9"
    )
    port map (
      I0 => count_us(19),
      I1 => databus_add0000(19),
      O => Mcompar_wait_time_cmp_ge0001_lut(19)
    );
  Mcompar_wait_time_cmp_ge0001_cy_19_Q : MUXCY
    port map (
      CI => Mcompar_wait_time_cmp_ge0001_cy(18),
      DI => count_us(19),
      S => Mcompar_wait_time_cmp_ge0001_lut(19),
      O => Mcompar_wait_time_cmp_ge0001_cy(19)
    );
  Mcompar_wait_time_cmp_ge0001_lut_20_Q : LUT2
    generic map(
      INIT => X"9"
    )
    port map (
      I0 => count_us(20),
      I1 => databus_add0000(20),
      O => Mcompar_wait_time_cmp_ge0001_lut(20)
    );
  Mcompar_wait_time_cmp_ge0001_cy_20_Q : MUXCY
    port map (
      CI => Mcompar_wait_time_cmp_ge0001_cy(19),
      DI => count_us(20),
      S => Mcompar_wait_time_cmp_ge0001_lut(20),
      O => Mcompar_wait_time_cmp_ge0001_cy(20)
    );
  Mcompar_wait_time_cmp_ge0001_lut_21_Q : LUT2
    generic map(
      INIT => X"9"
    )
    port map (
      I0 => count_us(21),
      I1 => databus_add0000(21),
      O => Mcompar_wait_time_cmp_ge0001_lut(21)
    );
  Mcompar_wait_time_cmp_ge0001_cy_21_Q : MUXCY
    port map (
      CI => Mcompar_wait_time_cmp_ge0001_cy(20),
      DI => count_us(21),
      S => Mcompar_wait_time_cmp_ge0001_lut(21),
      O => Mcompar_wait_time_cmp_ge0001_cy(21)
    );
  Mcompar_wait_time_cmp_ge0001_lut_22_Q : LUT2
    generic map(
      INIT => X"9"
    )
    port map (
      I0 => count_us(22),
      I1 => databus_add0000(22),
      O => Mcompar_wait_time_cmp_ge0001_lut(22)
    );
  Mcompar_wait_time_cmp_ge0001_cy_22_Q : MUXCY
    port map (
      CI => Mcompar_wait_time_cmp_ge0001_cy(21),
      DI => count_us(22),
      S => Mcompar_wait_time_cmp_ge0001_lut(22),
      O => Mcompar_wait_time_cmp_ge0001_cy(22)
    );
  Mcompar_wait_time_cmp_ge0001_lut_23_Q : LUT2
    generic map(
      INIT => X"9"
    )
    port map (
      I0 => count_us(23),
      I1 => databus_add0000(23),
      O => Mcompar_wait_time_cmp_ge0001_lut(23)
    );
  Mcompar_wait_time_cmp_ge0001_cy_23_Q : MUXCY
    port map (
      CI => Mcompar_wait_time_cmp_ge0001_cy(22),
      DI => count_us(23),
      S => Mcompar_wait_time_cmp_ge0001_lut(23),
      O => Mcompar_wait_time_cmp_ge0001_cy(23)
    );
  Mcompar_wait_time_cmp_ge0001_lut_24_Q : LUT2
    generic map(
      INIT => X"9"
    )
    port map (
      I0 => count_us(24),
      I1 => databus_add0000(24),
      O => Mcompar_wait_time_cmp_ge0001_lut(24)
    );
  Mcompar_wait_time_cmp_ge0001_cy_24_Q : MUXCY
    port map (
      CI => Mcompar_wait_time_cmp_ge0001_cy(23),
      DI => count_us(24),
      S => Mcompar_wait_time_cmp_ge0001_lut(24),
      O => Mcompar_wait_time_cmp_ge0001_cy(24)
    );
  Mcompar_wait_time_cmp_ge0001_lut_25_Q : LUT2
    generic map(
      INIT => X"9"
    )
    port map (
      I0 => count_us(25),
      I1 => databus_add0000(25),
      O => Mcompar_wait_time_cmp_ge0001_lut(25)
    );
  Mcompar_wait_time_cmp_ge0001_cy_25_Q : MUXCY
    port map (
      CI => Mcompar_wait_time_cmp_ge0001_cy(24),
      DI => count_us(25),
      S => Mcompar_wait_time_cmp_ge0001_lut(25),
      O => Mcompar_wait_time_cmp_ge0001_cy(25)
    );
  Mcompar_wait_time_cmp_ge0001_lut_26_Q : LUT2
    generic map(
      INIT => X"9"
    )
    port map (
      I0 => count_us(26),
      I1 => databus_add0000(26),
      O => Mcompar_wait_time_cmp_ge0001_lut(26)
    );
  Mcompar_wait_time_cmp_ge0001_cy_26_Q : MUXCY
    port map (
      CI => Mcompar_wait_time_cmp_ge0001_cy(25),
      DI => count_us(26),
      S => Mcompar_wait_time_cmp_ge0001_lut(26),
      O => Mcompar_wait_time_cmp_ge0001_cy(26)
    );
  Mcompar_wait_time_cmp_ge0001_lut_27_Q : LUT2
    generic map(
      INIT => X"9"
    )
    port map (
      I0 => count_us(27),
      I1 => databus_add0000(27),
      O => Mcompar_wait_time_cmp_ge0001_lut(27)
    );
  Mcompar_wait_time_cmp_ge0001_cy_27_Q : MUXCY
    port map (
      CI => Mcompar_wait_time_cmp_ge0001_cy(26),
      DI => count_us(27),
      S => Mcompar_wait_time_cmp_ge0001_lut(27),
      O => Mcompar_wait_time_cmp_ge0001_cy(27)
    );
  Mcompar_wait_time_cmp_ge0001_lut_28_Q : LUT2
    generic map(
      INIT => X"9"
    )
    port map (
      I0 => count_us(28),
      I1 => databus_add0000(28),
      O => Mcompar_wait_time_cmp_ge0001_lut(28)
    );
  Mcompar_wait_time_cmp_ge0001_cy_28_Q : MUXCY
    port map (
      CI => Mcompar_wait_time_cmp_ge0001_cy(27),
      DI => count_us(28),
      S => Mcompar_wait_time_cmp_ge0001_lut(28),
      O => Mcompar_wait_time_cmp_ge0001_cy(28)
    );
  Mcompar_wait_time_cmp_ge0001_lut_29_Q : LUT2
    generic map(
      INIT => X"9"
    )
    port map (
      I0 => count_us(29),
      I1 => databus_add0000(29),
      O => Mcompar_wait_time_cmp_ge0001_lut(29)
    );
  Mcompar_wait_time_cmp_ge0001_cy_29_Q : MUXCY
    port map (
      CI => Mcompar_wait_time_cmp_ge0001_cy(28),
      DI => count_us(29),
      S => Mcompar_wait_time_cmp_ge0001_lut(29),
      O => Mcompar_wait_time_cmp_ge0001_cy(29)
    );
  Mcompar_wait_time_cmp_ge0001_lut_30_Q : LUT2
    generic map(
      INIT => X"9"
    )
    port map (
      I0 => count_us(30),
      I1 => databus_add0000(30),
      O => Mcompar_wait_time_cmp_ge0001_lut(30)
    );
  Mcompar_wait_time_cmp_ge0001_cy_30_Q : MUXCY
    port map (
      CI => Mcompar_wait_time_cmp_ge0001_cy(29),
      DI => count_us(30),
      S => Mcompar_wait_time_cmp_ge0001_lut(30),
      O => Mcompar_wait_time_cmp_ge0001_cy(30)
    );
  Mcompar_wait_time_cmp_ge0001_lut_31_Q : LUT2
    generic map(
      INIT => X"9"
    )
    port map (
      I0 => count_us(31),
      I1 => databus_add0000(31),
      O => Mcompar_wait_time_cmp_ge0001_lut(31)
    );
  Mcompar_wait_time_cmp_ge0001_cy_31_Q : MUXCY
    port map (
      CI => Mcompar_wait_time_cmp_ge0001_cy(30),
      DI => databus_add0000(31),
      S => Mcompar_wait_time_cmp_ge0001_lut(31),
      O => wait_time_cmp_ge0001
    );
  Mcompar_wait_time_cmp_eq0000_lut_0_Q : LUT4
    generic map(
      INIT => X"9009"
    )
    port map (
      I0 => count_us(0),
      I1 => Mrom_databus_mux000512,
      I2 => count_us(1),
      I3 => wait_time(1),
      O => Mcompar_wait_time_cmp_eq0000_lut(0)
    );
  Mcompar_wait_time_cmp_eq0000_cy_0_Q : MUXCY
    port map (
      CI => Mrom_databus_mux0005,
      DI => Mrom_databus_mux000512,
      S => Mcompar_wait_time_cmp_eq0000_lut(0),
      O => Mcompar_wait_time_cmp_eq0000_cy(0)
    );
  Mcompar_wait_time_cmp_eq0000_lut_1_Q : LUT4
    generic map(
      INIT => X"9009"
    )
    port map (
      I0 => count_us(2),
      I1 => wait_time(2),
      I2 => count_us(3),
      I3 => wait_time(3),
      O => Mcompar_wait_time_cmp_eq0000_lut(1)
    );
  Mcompar_wait_time_cmp_eq0000_cy_1_Q : MUXCY
    port map (
      CI => Mcompar_wait_time_cmp_eq0000_cy(0),
      DI => Mrom_databus_mux000512,
      S => Mcompar_wait_time_cmp_eq0000_lut(1),
      O => Mcompar_wait_time_cmp_eq0000_cy(1)
    );
  Mcompar_wait_time_cmp_eq0000_cy_2_Q : MUXCY
    port map (
      CI => Mcompar_wait_time_cmp_eq0000_cy(1),
      DI => Mrom_databus_mux000512,
      S => Mcompar_wait_time_cmp_eq0000_lut(2),
      O => Mcompar_wait_time_cmp_eq0000_cy(2)
    );
  Mcompar_wait_time_cmp_eq0000_lut_3_Q : LUT4
    generic map(
      INIT => X"8241"
    )
    port map (
      I0 => count_us(7),
      I1 => count_us(6),
      I2 => databus_add0000(6),
      I3 => databus_add0000(7),
      O => Mcompar_wait_time_cmp_eq0000_lut(3)
    );
  Mcompar_wait_time_cmp_eq0000_cy_3_Q : MUXCY
    port map (
      CI => Mcompar_wait_time_cmp_eq0000_cy(2),
      DI => Mrom_databus_mux000512,
      S => Mcompar_wait_time_cmp_eq0000_lut(3),
      O => Mcompar_wait_time_cmp_eq0000_cy(3)
    );
  Mcompar_wait_time_cmp_eq0000_lut_4_Q : LUT4
    generic map(
      INIT => X"8241"
    )
    port map (
      I0 => count_us(9),
      I1 => count_us(8),
      I2 => databus_add0000(8),
      I3 => databus_add0000(9),
      O => Mcompar_wait_time_cmp_eq0000_lut(4)
    );
  Mcompar_wait_time_cmp_eq0000_cy_4_Q : MUXCY
    port map (
      CI => Mcompar_wait_time_cmp_eq0000_cy(3),
      DI => Mrom_databus_mux000512,
      S => Mcompar_wait_time_cmp_eq0000_lut(4),
      O => Mcompar_wait_time_cmp_eq0000_cy(4)
    );
  Mcompar_wait_time_cmp_eq0000_lut_5_Q : LUT4
    generic map(
      INIT => X"8241"
    )
    port map (
      I0 => count_us(11),
      I1 => count_us(10),
      I2 => databus_add0000(10),
      I3 => databus_add0000(11),
      O => Mcompar_wait_time_cmp_eq0000_lut(5)
    );
  Mcompar_wait_time_cmp_eq0000_cy_5_Q : MUXCY
    port map (
      CI => Mcompar_wait_time_cmp_eq0000_cy(4),
      DI => Mrom_databus_mux000512,
      S => Mcompar_wait_time_cmp_eq0000_lut(5),
      O => Mcompar_wait_time_cmp_eq0000_cy(5)
    );
  Mcompar_wait_time_cmp_eq0000_lut_6_Q : LUT4
    generic map(
      INIT => X"8241"
    )
    port map (
      I0 => count_us(13),
      I1 => count_us(12),
      I2 => databus_add0000(12),
      I3 => databus_add0000(13),
      O => Mcompar_wait_time_cmp_eq0000_lut(6)
    );
  Mcompar_wait_time_cmp_eq0000_cy_6_Q : MUXCY
    port map (
      CI => Mcompar_wait_time_cmp_eq0000_cy(5),
      DI => Mrom_databus_mux000512,
      S => Mcompar_wait_time_cmp_eq0000_lut(6),
      O => Mcompar_wait_time_cmp_eq0000_cy(6)
    );
  Mcompar_wait_time_cmp_eq0000_lut_7_Q : LUT4
    generic map(
      INIT => X"8241"
    )
    port map (
      I0 => count_us(15),
      I1 => count_us(14),
      I2 => databus_add0000(14),
      I3 => databus_add0000(15),
      O => Mcompar_wait_time_cmp_eq0000_lut(7)
    );
  Mcompar_wait_time_cmp_eq0000_cy_7_Q : MUXCY
    port map (
      CI => Mcompar_wait_time_cmp_eq0000_cy(6),
      DI => Mrom_databus_mux000512,
      S => Mcompar_wait_time_cmp_eq0000_lut(7),
      O => Mcompar_wait_time_cmp_eq0000_cy(7)
    );
  Mcompar_wait_time_cmp_eq0000_lut_8_Q : LUT4
    generic map(
      INIT => X"8241"
    )
    port map (
      I0 => count_us(17),
      I1 => count_us(16),
      I2 => databus_add0000(16),
      I3 => databus_add0000(17),
      O => Mcompar_wait_time_cmp_eq0000_lut(8)
    );
  Mcompar_wait_time_cmp_eq0000_cy_8_Q : MUXCY
    port map (
      CI => Mcompar_wait_time_cmp_eq0000_cy(7),
      DI => Mrom_databus_mux000512,
      S => Mcompar_wait_time_cmp_eq0000_lut(8),
      O => Mcompar_wait_time_cmp_eq0000_cy(8)
    );
  Mcompar_wait_time_cmp_eq0000_lut_9_Q : LUT4
    generic map(
      INIT => X"8241"
    )
    port map (
      I0 => count_us(19),
      I1 => count_us(18),
      I2 => databus_add0000(18),
      I3 => databus_add0000(19),
      O => Mcompar_wait_time_cmp_eq0000_lut(9)
    );
  Mcompar_wait_time_cmp_eq0000_cy_9_Q : MUXCY
    port map (
      CI => Mcompar_wait_time_cmp_eq0000_cy(8),
      DI => Mrom_databus_mux000512,
      S => Mcompar_wait_time_cmp_eq0000_lut(9),
      O => Mcompar_wait_time_cmp_eq0000_cy(9)
    );
  Mcompar_wait_time_cmp_eq0000_lut_10_Q : LUT4
    generic map(
      INIT => X"8241"
    )
    port map (
      I0 => count_us(21),
      I1 => count_us(20),
      I2 => databus_add0000(20),
      I3 => databus_add0000(21),
      O => Mcompar_wait_time_cmp_eq0000_lut(10)
    );
  Mcompar_wait_time_cmp_eq0000_cy_10_Q : MUXCY
    port map (
      CI => Mcompar_wait_time_cmp_eq0000_cy(9),
      DI => Mrom_databus_mux000512,
      S => Mcompar_wait_time_cmp_eq0000_lut(10),
      O => Mcompar_wait_time_cmp_eq0000_cy(10)
    );
  Mcompar_wait_time_cmp_eq0000_lut_11_Q : LUT4
    generic map(
      INIT => X"8241"
    )
    port map (
      I0 => count_us(23),
      I1 => count_us(22),
      I2 => databus_add0000(22),
      I3 => databus_add0000(23),
      O => Mcompar_wait_time_cmp_eq0000_lut(11)
    );
  Mcompar_wait_time_cmp_eq0000_cy_11_Q : MUXCY
    port map (
      CI => Mcompar_wait_time_cmp_eq0000_cy(10),
      DI => Mrom_databus_mux000512,
      S => Mcompar_wait_time_cmp_eq0000_lut(11),
      O => Mcompar_wait_time_cmp_eq0000_cy(11)
    );
  Mcompar_wait_time_cmp_eq0000_lut_12_Q : LUT4
    generic map(
      INIT => X"8241"
    )
    port map (
      I0 => count_us(25),
      I1 => count_us(24),
      I2 => databus_add0000(24),
      I3 => databus_add0000(25),
      O => Mcompar_wait_time_cmp_eq0000_lut(12)
    );
  Mcompar_wait_time_cmp_eq0000_cy_12_Q : MUXCY
    port map (
      CI => Mcompar_wait_time_cmp_eq0000_cy(11),
      DI => Mrom_databus_mux000512,
      S => Mcompar_wait_time_cmp_eq0000_lut(12),
      O => Mcompar_wait_time_cmp_eq0000_cy(12)
    );
  Mcompar_wait_time_cmp_eq0000_lut_13_Q : LUT4
    generic map(
      INIT => X"8241"
    )
    port map (
      I0 => count_us(27),
      I1 => count_us(26),
      I2 => databus_add0000(26),
      I3 => databus_add0000(27),
      O => Mcompar_wait_time_cmp_eq0000_lut(13)
    );
  Mcompar_wait_time_cmp_eq0000_cy_13_Q : MUXCY
    port map (
      CI => Mcompar_wait_time_cmp_eq0000_cy(12),
      DI => Mrom_databus_mux000512,
      S => Mcompar_wait_time_cmp_eq0000_lut(13),
      O => Mcompar_wait_time_cmp_eq0000_cy(13)
    );
  Mcompar_wait_time_cmp_eq0000_lut_14_Q : LUT4
    generic map(
      INIT => X"8241"
    )
    port map (
      I0 => count_us(29),
      I1 => count_us(28),
      I2 => databus_add0000(28),
      I3 => databus_add0000(29),
      O => Mcompar_wait_time_cmp_eq0000_lut(14)
    );
  Mcompar_wait_time_cmp_eq0000_cy_14_Q : MUXCY
    port map (
      CI => Mcompar_wait_time_cmp_eq0000_cy(13),
      DI => Mrom_databus_mux000512,
      S => Mcompar_wait_time_cmp_eq0000_lut(14),
      O => Mcompar_wait_time_cmp_eq0000_cy(14)
    );
  Mcompar_wait_time_cmp_eq0000_lut_15_Q : LUT4
    generic map(
      INIT => X"8241"
    )
    port map (
      I0 => count_us(31),
      I1 => count_us(30),
      I2 => databus_add0000(30),
      I3 => databus_add0000(31),
      O => Mcompar_wait_time_cmp_eq0000_lut(15)
    );
  Mcompar_wait_time_cmp_eq0000_cy_15_Q : MUXCY
    port map (
      CI => Mcompar_wait_time_cmp_eq0000_cy(14),
      DI => Mrom_databus_mux000512,
      S => Mcompar_wait_time_cmp_eq0000_lut(15),
      O => Mcompar_wait_time_cmp_eq0000_cy(15)
    );
  Mcompar_wait_time_cmp_lt0000_lut_0_Q : LUT2
    generic map(
      INIT => X"8"
    )
    port map (
      I0 => index(2),
      I1 => index(3),
      O => Mcompar_wait_time_cmp_lt0000_lut(0)
    );
  Mcompar_wait_time_cmp_lt0000_cy_0_Q : MUXCY
    port map (
      CI => Mrom_databus_mux0005,
      DI => Mrom_databus_mux000512,
      S => Mcompar_wait_time_cmp_lt0000_lut(0),
      O => Mcompar_wait_time_cmp_lt0000_cy(0)
    );
  Mcompar_wait_time_cmp_lt0000_lut_1_Q : LUT4
    generic map(
      INIT => X"0001"
    )
    port map (
      I0 => index(4),
      I1 => index(5),
      I2 => index(6),
      I3 => index(7),
      O => Mcompar_wait_time_cmp_lt0000_lut(1)
    );
  Mcompar_wait_time_cmp_lt0000_cy_1_Q : MUXCY
    port map (
      CI => Mcompar_wait_time_cmp_lt0000_cy(0),
      DI => Mrom_databus_mux0005,
      S => Mcompar_wait_time_cmp_lt0000_lut(1),
      O => Mcompar_wait_time_cmp_lt0000_cy(1)
    );
  Mcompar_wait_time_cmp_lt0000_lut_2_Q : LUT4
    generic map(
      INIT => X"0001"
    )
    port map (
      I0 => index(8),
      I1 => index(9),
      I2 => index(10),
      I3 => index(11),
      O => Mcompar_wait_time_cmp_lt0000_lut(2)
    );
  Mcompar_wait_time_cmp_lt0000_cy_2_Q : MUXCY
    port map (
      CI => Mcompar_wait_time_cmp_lt0000_cy(1),
      DI => Mrom_databus_mux0005,
      S => Mcompar_wait_time_cmp_lt0000_lut(2),
      O => Mcompar_wait_time_cmp_lt0000_cy(2)
    );
  Mcompar_wait_time_cmp_lt0000_lut_3_Q : LUT4
    generic map(
      INIT => X"0001"
    )
    port map (
      I0 => index(12),
      I1 => index(13),
      I2 => index(14),
      I3 => index(15),
      O => Mcompar_wait_time_cmp_lt0000_lut(3)
    );
  Mcompar_wait_time_cmp_lt0000_cy_3_Q : MUXCY
    port map (
      CI => Mcompar_wait_time_cmp_lt0000_cy(2),
      DI => Mrom_databus_mux0005,
      S => Mcompar_wait_time_cmp_lt0000_lut(3),
      O => Mcompar_wait_time_cmp_lt0000_cy(3)
    );
  Mcompar_wait_time_cmp_lt0000_lut_4_Q : LUT4
    generic map(
      INIT => X"0001"
    )
    port map (
      I0 => index(16),
      I1 => index(17),
      I2 => index(18),
      I3 => index(19),
      O => Mcompar_wait_time_cmp_lt0000_lut(4)
    );
  Mcompar_wait_time_cmp_lt0000_cy_4_Q : MUXCY
    port map (
      CI => Mcompar_wait_time_cmp_lt0000_cy(3),
      DI => Mrom_databus_mux0005,
      S => Mcompar_wait_time_cmp_lt0000_lut(4),
      O => Mcompar_wait_time_cmp_lt0000_cy(4)
    );
  Mcompar_wait_time_cmp_lt0000_lut_5_Q : LUT4
    generic map(
      INIT => X"0001"
    )
    port map (
      I0 => index(20),
      I1 => index(21),
      I2 => index(22),
      I3 => index(23),
      O => Mcompar_wait_time_cmp_lt0000_lut(5)
    );
  Mcompar_wait_time_cmp_lt0000_cy_5_Q : MUXCY
    port map (
      CI => Mcompar_wait_time_cmp_lt0000_cy(4),
      DI => Mrom_databus_mux0005,
      S => Mcompar_wait_time_cmp_lt0000_lut(5),
      O => Mcompar_wait_time_cmp_lt0000_cy(5)
    );
  Mcompar_wait_time_cmp_lt0000_lut_6_Q : LUT4
    generic map(
      INIT => X"0001"
    )
    port map (
      I0 => index(24),
      I1 => index(25),
      I2 => index(26),
      I3 => index(27),
      O => Mcompar_wait_time_cmp_lt0000_lut(6)
    );
  Mcompar_wait_time_cmp_lt0000_cy_6_Q : MUXCY
    port map (
      CI => Mcompar_wait_time_cmp_lt0000_cy(5),
      DI => Mrom_databus_mux0005,
      S => Mcompar_wait_time_cmp_lt0000_lut(6),
      O => Mcompar_wait_time_cmp_lt0000_cy(6)
    );
  Mcompar_wait_time_cmp_lt0000_lut_7_Q : LUT3
    generic map(
      INIT => X"01"
    )
    port map (
      I0 => index(28),
      I1 => index(29),
      I2 => index(30),
      O => Mcompar_wait_time_cmp_lt0000_lut(7)
    );
  Mcompar_wait_time_cmp_lt0000_cy_7_Q : MUXCY
    port map (
      CI => Mcompar_wait_time_cmp_lt0000_cy(6),
      DI => Mrom_databus_mux0005,
      S => Mcompar_wait_time_cmp_lt0000_lut(7),
      O => Mcompar_wait_time_cmp_lt0000_cy(7)
    );
  Mcompar_wait_time_cmp_lt0000_cy_8_Q : MUXCY
    port map (
      CI => Mcompar_wait_time_cmp_lt0000_cy(7),
      DI => Mrom_databus_mux000512,
      S => Mcompar_wait_time_cmp_lt0000_lut(8),
      O => Mcompar_wait_time_cmp_lt0000_cy(8)
    );
  BUFG_BufSysCLK : BUFG
    port map (
      I => SysCLK_IBUFG_741,
      O => Buf_SysCLK
    );
  BUFG_BufCLK1MHz : BUFG
    port map (
      I => G1_CLK1MHz_4,
      O => Buf_CLK1MHz
    );
  BUFG_BufE : BUFG
    port map (
      I => Unbuf_E_742,
      O => E_OBUF_3
    );
  index_0 : LDE
    generic map(
      INIT => '1'
    )
    port map (
      D => index_mux0003(0),
      G => wait_time_cmp_ge0000,
      GE => wait_time_cmp_lt0000,
      Q => index(0)
    );
  index_1 : LDE
    generic map(
      INIT => '0'
    )
    port map (
      D => index_mux0003(1),
      G => wait_time_cmp_ge0000,
      GE => wait_time_cmp_lt0000,
      Q => index(1)
    );
  index_2 : LDE
    generic map(
      INIT => '0'
    )
    port map (
      D => index_mux0003(2),
      G => wait_time_cmp_ge0000,
      GE => wait_time_cmp_lt0000,
      Q => index(2)
    );
  index_3 : LDE
    generic map(
      INIT => '0'
    )
    port map (
      D => index_mux0003(3),
      G => wait_time_cmp_ge0000,
      GE => wait_time_cmp_lt0000,
      Q => index(3)
    );
  index_4 : LDE
    generic map(
      INIT => '0'
    )
    port map (
      D => index_mux0003(4),
      G => wait_time_cmp_ge0000,
      GE => wait_time_cmp_lt0000,
      Q => index(4)
    );
  index_5 : LDE
    generic map(
      INIT => '0'
    )
    port map (
      D => index_mux0003(5),
      G => wait_time_cmp_ge0000,
      GE => wait_time_cmp_lt0000,
      Q => index(5)
    );
  index_6 : LDE
    generic map(
      INIT => '0'
    )
    port map (
      D => index_mux0003(6),
      G => wait_time_cmp_ge0000,
      GE => wait_time_cmp_lt0000,
      Q => index(6)
    );
  index_7 : LDE
    generic map(
      INIT => '0'
    )
    port map (
      D => index_mux0003(7),
      G => wait_time_cmp_ge0000,
      GE => wait_time_cmp_lt0000,
      Q => index(7)
    );
  index_8 : LDE
    generic map(
      INIT => '0'
    )
    port map (
      D => index_mux0003(8),
      G => wait_time_cmp_ge0000,
      GE => wait_time_cmp_lt0000,
      Q => index(8)
    );
  index_9 : LDE
    generic map(
      INIT => '0'
    )
    port map (
      D => index_mux0003(9),
      G => wait_time_cmp_ge0000,
      GE => wait_time_cmp_lt0000,
      Q => index(9)
    );
  index_10 : LDE
    generic map(
      INIT => '0'
    )
    port map (
      D => index_mux0003(10),
      G => wait_time_cmp_ge0000,
      GE => wait_time_cmp_lt0000,
      Q => index(10)
    );
  index_11 : LDE
    generic map(
      INIT => '0'
    )
    port map (
      D => index_mux0003(11),
      G => wait_time_cmp_ge0000,
      GE => wait_time_cmp_lt0000,
      Q => index(11)
    );
  index_12 : LDE
    generic map(
      INIT => '0'
    )
    port map (
      D => index_mux0003(12),
      G => wait_time_cmp_ge0000,
      GE => wait_time_cmp_lt0000,
      Q => index(12)
    );
  index_13 : LDE
    generic map(
      INIT => '0'
    )
    port map (
      D => index_mux0003(13),
      G => wait_time_cmp_ge0000,
      GE => wait_time_cmp_lt0000,
      Q => index(13)
    );
  index_14 : LDE
    generic map(
      INIT => '0'
    )
    port map (
      D => index_mux0003(14),
      G => wait_time_cmp_ge0000,
      GE => wait_time_cmp_lt0000,
      Q => index(14)
    );
  index_15 : LDE
    generic map(
      INIT => '0'
    )
    port map (
      D => index_mux0003(15),
      G => wait_time_cmp_ge0000,
      GE => wait_time_cmp_lt0000,
      Q => index(15)
    );
  index_16 : LDE
    generic map(
      INIT => '0'
    )
    port map (
      D => index_mux0003(16),
      G => wait_time_cmp_ge0000,
      GE => wait_time_cmp_lt0000,
      Q => index(16)
    );
  index_17 : LDE
    generic map(
      INIT => '0'
    )
    port map (
      D => index_mux0003(17),
      G => wait_time_cmp_ge0000,
      GE => wait_time_cmp_lt0000,
      Q => index(17)
    );
  index_18 : LDE
    generic map(
      INIT => '0'
    )
    port map (
      D => index_mux0003(18),
      G => wait_time_cmp_ge0000,
      GE => wait_time_cmp_lt0000,
      Q => index(18)
    );
  index_19 : LDE
    generic map(
      INIT => '0'
    )
    port map (
      D => index_mux0003(19),
      G => wait_time_cmp_ge0000,
      GE => wait_time_cmp_lt0000,
      Q => index(19)
    );
  index_20 : LDE
    generic map(
      INIT => '0'
    )
    port map (
      D => index_mux0003(20),
      G => wait_time_cmp_ge0000,
      GE => wait_time_cmp_lt0000,
      Q => index(20)
    );
  index_21 : LDE
    generic map(
      INIT => '0'
    )
    port map (
      D => index_mux0003(21),
      G => wait_time_cmp_ge0000,
      GE => wait_time_cmp_lt0000,
      Q => index(21)
    );
  index_22 : LDE
    generic map(
      INIT => '0'
    )
    port map (
      D => index_mux0003(22),
      G => wait_time_cmp_ge0000,
      GE => wait_time_cmp_lt0000,
      Q => index(22)
    );
  index_23 : LDE
    generic map(
      INIT => '0'
    )
    port map (
      D => index_mux0003(23),
      G => wait_time_cmp_ge0000,
      GE => wait_time_cmp_lt0000,
      Q => index(23)
    );
  index_24 : LDE
    generic map(
      INIT => '0'
    )
    port map (
      D => index_mux0003(24),
      G => wait_time_cmp_ge0000,
      GE => wait_time_cmp_lt0000,
      Q => index(24)
    );
  index_25 : LDE
    generic map(
      INIT => '0'
    )
    port map (
      D => index_mux0003(25),
      G => wait_time_cmp_ge0000,
      GE => wait_time_cmp_lt0000,
      Q => index(25)
    );
  index_26 : LDE
    generic map(
      INIT => '0'
    )
    port map (
      D => index_mux0003(26),
      G => wait_time_cmp_ge0000,
      GE => wait_time_cmp_lt0000,
      Q => index(26)
    );
  index_27 : LDE
    generic map(
      INIT => '0'
    )
    port map (
      D => index_mux0003(27),
      G => wait_time_cmp_ge0000,
      GE => wait_time_cmp_lt0000,
      Q => index(27)
    );
  index_28 : LDE
    generic map(
      INIT => '0'
    )
    port map (
      D => index_mux0003(28),
      G => wait_time_cmp_ge0000,
      GE => wait_time_cmp_lt0000,
      Q => index(28)
    );
  index_29 : LDE
    generic map(
      INIT => '0'
    )
    port map (
      D => index_mux0003(29),
      G => wait_time_cmp_ge0000,
      GE => wait_time_cmp_lt0000,
      Q => index(29)
    );
  index_30 : LDE
    generic map(
      INIT => '0'
    )
    port map (
      D => index_mux0003(30),
      G => wait_time_cmp_ge0000,
      GE => wait_time_cmp_lt0000,
      Q => index(30)
    );
  index_31 : LDE
    generic map(
      INIT => '0'
    )
    port map (
      D => index_mux0003(31),
      G => wait_time_cmp_ge0000,
      GE => wait_time_cmp_lt0000,
      Q => index(31)
    );
  wait_time_1 : LDE
    generic map(
      INIT => '1'
    )
    port map (
      D => wait_time_mux0003(1),
      G => wait_time_cmp_ge0000,
      GE => wait_time_cmp_lt0000,
      Q => wait_time(1)
    );
  wait_time_2 : LDE
    generic map(
      INIT => '0'
    )
    port map (
      D => wait_time_mux0003(2),
      G => wait_time_cmp_ge0000,
      GE => wait_time_cmp_lt0000,
      Q => wait_time(2)
    );
  wait_time_3 : LDE
    generic map(
      INIT => '0'
    )
    port map (
      D => wait_time_mux0003(3),
      G => wait_time_cmp_ge0000,
      GE => wait_time_cmp_lt0000,
      Q => wait_time(3)
    );
  wait_time_4 : LDE
    generic map(
      INIT => '1'
    )
    port map (
      D => wait_time_mux0003(4),
      G => wait_time_cmp_ge0000,
      GE => wait_time_cmp_lt0000,
      Q => wait_time(4)
    );
  wait_time_5 : LDE
    generic map(
      INIT => '1'
    )
    port map (
      D => wait_time_mux0003(5),
      G => wait_time_cmp_ge0000,
      GE => wait_time_cmp_lt0000,
      Q => wait_time(5)
    );
  wait_time_6 : LDE
    generic map(
      INIT => '0'
    )
    port map (
      D => wait_time_mux0003(6),
      G => wait_time_cmp_ge0000,
      GE => wait_time_cmp_lt0000,
      Q => wait_time(6)
    );
  wait_time_7 : LDE
    generic map(
      INIT => '0'
    )
    port map (
      D => wait_time_mux0003(7),
      G => wait_time_cmp_ge0000,
      GE => wait_time_cmp_lt0000,
      Q => wait_time(7)
    );
  wait_time_8 : LDE
    generic map(
      INIT => '0'
    )
    port map (
      D => wait_time_mux0003(8),
      G => wait_time_cmp_ge0000,
      GE => wait_time_cmp_lt0000,
      Q => wait_time(8)
    );
  wait_time_9 : LDE
    generic map(
      INIT => '0'
    )
    port map (
      D => wait_time_mux0003(9),
      G => wait_time_cmp_ge0000,
      GE => wait_time_cmp_lt0000,
      Q => wait_time(9)
    );
  wait_time_10 : LDE
    generic map(
      INIT => '0'
    )
    port map (
      D => wait_time_mux0003(10),
      G => wait_time_cmp_ge0000,
      GE => wait_time_cmp_lt0000,
      Q => wait_time(10)
    );
  wait_time_11 : LDE
    generic map(
      INIT => '0'
    )
    port map (
      D => wait_time_mux0003(11),
      G => wait_time_cmp_ge0000,
      GE => wait_time_cmp_lt0000,
      Q => wait_time(11)
    );
  wait_time_12 : LDE
    generic map(
      INIT => '0'
    )
    port map (
      D => wait_time_mux0003(12),
      G => wait_time_cmp_ge0000,
      GE => wait_time_cmp_lt0000,
      Q => wait_time(12)
    );
  wait_time_13 : LDE
    generic map(
      INIT => '0'
    )
    port map (
      D => wait_time_mux0003(13),
      G => wait_time_cmp_ge0000,
      GE => wait_time_cmp_lt0000,
      Q => wait_time(13)
    );
  wait_time_14 : LDE
    generic map(
      INIT => '0'
    )
    port map (
      D => wait_time_mux0003(14),
      G => wait_time_cmp_ge0000,
      GE => wait_time_cmp_lt0000,
      Q => wait_time(14)
    );
  wait_time_15 : LDE
    generic map(
      INIT => '0'
    )
    port map (
      D => wait_time_mux0003(15),
      G => wait_time_cmp_ge0000,
      GE => wait_time_cmp_lt0000,
      Q => wait_time(15)
    );
  wait_time_16 : LDE
    generic map(
      INIT => '0'
    )
    port map (
      D => wait_time_mux0003(16),
      G => wait_time_cmp_ge0000,
      GE => wait_time_cmp_lt0000,
      Q => wait_time(16)
    );
  wait_time_17 : LDE
    generic map(
      INIT => '0'
    )
    port map (
      D => wait_time_mux0003(17),
      G => wait_time_cmp_ge0000,
      GE => wait_time_cmp_lt0000,
      Q => wait_time(17)
    );
  wait_time_18 : LDE
    generic map(
      INIT => '0'
    )
    port map (
      D => wait_time_mux0003(18),
      G => wait_time_cmp_ge0000,
      GE => wait_time_cmp_lt0000,
      Q => wait_time(18)
    );
  wait_time_19 : LDE
    generic map(
      INIT => '0'
    )
    port map (
      D => wait_time_mux0003(19),
      G => wait_time_cmp_ge0000,
      GE => wait_time_cmp_lt0000,
      Q => wait_time(19)
    );
  wait_time_20 : LDE
    generic map(
      INIT => '0'
    )
    port map (
      D => wait_time_mux0003(20),
      G => wait_time_cmp_ge0000,
      GE => wait_time_cmp_lt0000,
      Q => wait_time(20)
    );
  wait_time_21 : LDE
    generic map(
      INIT => '0'
    )
    port map (
      D => wait_time_mux0003(21),
      G => wait_time_cmp_ge0000,
      GE => wait_time_cmp_lt0000,
      Q => wait_time(21)
    );
  wait_time_22 : LDE
    generic map(
      INIT => '0'
    )
    port map (
      D => wait_time_mux0003(22),
      G => wait_time_cmp_ge0000,
      GE => wait_time_cmp_lt0000,
      Q => wait_time(22)
    );
  wait_time_23 : LDE
    generic map(
      INIT => '0'
    )
    port map (
      D => wait_time_mux0003(23),
      G => wait_time_cmp_ge0000,
      GE => wait_time_cmp_lt0000,
      Q => wait_time(23)
    );
  wait_time_24 : LDE
    generic map(
      INIT => '0'
    )
    port map (
      D => wait_time_mux0003(24),
      G => wait_time_cmp_ge0000,
      GE => wait_time_cmp_lt0000,
      Q => wait_time(24)
    );
  wait_time_25 : LDE
    generic map(
      INIT => '0'
    )
    port map (
      D => wait_time_mux0003(25),
      G => wait_time_cmp_ge0000,
      GE => wait_time_cmp_lt0000,
      Q => wait_time(25)
    );
  wait_time_26 : LDE
    generic map(
      INIT => '0'
    )
    port map (
      D => wait_time_mux0003(26),
      G => wait_time_cmp_ge0000,
      GE => wait_time_cmp_lt0000,
      Q => wait_time(26)
    );
  wait_time_27 : LDE
    generic map(
      INIT => '0'
    )
    port map (
      D => wait_time_mux0003(27),
      G => wait_time_cmp_ge0000,
      GE => wait_time_cmp_lt0000,
      Q => wait_time(27)
    );
  wait_time_28 : LDE
    generic map(
      INIT => '0'
    )
    port map (
      D => wait_time_mux0003(28),
      G => wait_time_cmp_ge0000,
      GE => wait_time_cmp_lt0000,
      Q => wait_time(28)
    );
  wait_time_29 : LDE
    generic map(
      INIT => '0'
    )
    port map (
      D => wait_time_mux0003(29),
      G => wait_time_cmp_ge0000,
      GE => wait_time_cmp_lt0000,
      Q => wait_time(29)
    );
  wait_time_30 : LDE
    generic map(
      INIT => '0'
    )
    port map (
      D => wait_time_mux0003(30),
      G => wait_time_cmp_ge0000,
      GE => wait_time_cmp_lt0000,
      Q => wait_time(30)
    );
  wait_time_31 : LDE
    generic map(
      INIT => '0'
    )
    port map (
      D => wait_time_mux0003(31),
      G => wait_time_cmp_ge0000,
      GE => wait_time_cmp_lt0000,
      Q => wait_time(31)
    );
  Unbuf_E_mux00092_wg_lut_0_Q : LUT2
    generic map(
      INIT => X"1"
    )
    port map (
      I0 => count_us(19),
      I1 => count_us(23),
      O => Unbuf_E_mux00092_wg_lut(0)
    );
  Unbuf_E_mux00092_wg_cy_0_Q : MUXCY
    port map (
      CI => Mrom_databus_mux000512,
      DI => Mrom_databus_mux0005,
      S => Unbuf_E_mux00092_wg_lut(0),
      O => Unbuf_E_mux00092_wg_cy(0)
    );
  Unbuf_E_mux00092_wg_lut_1_Q : LUT4
    generic map(
      INIT => X"0001"
    )
    port map (
      I0 => count_us(21),
      I1 => count_us(22),
      I2 => count_us(18),
      I3 => count_us(26),
      O => Unbuf_E_mux00092_wg_lut(1)
    );
  Unbuf_E_mux00092_wg_cy_1_Q : MUXCY
    port map (
      CI => Unbuf_E_mux00092_wg_cy(0),
      DI => Mrom_databus_mux0005,
      S => Unbuf_E_mux00092_wg_lut(1),
      O => Unbuf_E_mux00092_wg_cy(1)
    );
  Unbuf_E_mux00092_wg_lut_2_Q : LUT4
    generic map(
      INIT => X"0001"
    )
    port map (
      I0 => count_us(24),
      I1 => count_us(25),
      I2 => count_us(20),
      I3 => count_us(27),
      O => Unbuf_E_mux00092_wg_lut(2)
    );
  Unbuf_E_mux00092_wg_cy_2_Q : MUXCY
    port map (
      CI => Unbuf_E_mux00092_wg_cy(1),
      DI => Mrom_databus_mux0005,
      S => Unbuf_E_mux00092_wg_lut(2),
      O => Unbuf_E_mux00092_wg_cy(2)
    );
  Unbuf_E_mux00092_wg_lut_3_Q : LUT4
    generic map(
      INIT => X"0001"
    )
    port map (
      I0 => count_us(28),
      I1 => count_us(29),
      I2 => count_us(17),
      I3 => count_us(30),
      O => Unbuf_E_mux00092_wg_lut(3)
    );
  Unbuf_E_mux00092_wg_cy_3_Q : MUXCY
    port map (
      CI => Unbuf_E_mux00092_wg_cy(2),
      DI => Mrom_databus_mux0005,
      S => Unbuf_E_mux00092_wg_lut(3),
      O => Unbuf_E_mux00092_wg_cy(3)
    );
  Unbuf_E_mux00092_wg_lut_4_Q : LUT4
    generic map(
      INIT => X"0200"
    )
    port map (
      I0 => count_us(11),
      I1 => count_us(31),
      I2 => count_us(16),
      I3 => count_us(10),
      O => Unbuf_E_mux00092_wg_lut(4)
    );
  Unbuf_E_mux00092_wg_cy_4_Q : MUXCY
    port map (
      CI => Unbuf_E_mux00092_wg_cy(3),
      DI => Mrom_databus_mux0005,
      S => Unbuf_E_mux00092_wg_lut(4),
      O => Unbuf_E_mux00092_wg_cy(4)
    );
  Unbuf_E_mux00092_wg_lut_5_Q : LUT4
    generic map(
      INIT => X"0800"
    )
    port map (
      I0 => count_us(4),
      I1 => count_us(14),
      I2 => count_us(15),
      I3 => count_us(1),
      O => Unbuf_E_mux00092_wg_lut(5)
    );
  Unbuf_E_mux00092_wg_cy_5_Q : MUXCY
    port map (
      CI => Unbuf_E_mux00092_wg_cy(4),
      DI => Mrom_databus_mux0005,
      S => Unbuf_E_mux00092_wg_lut(5),
      O => Unbuf_E_mux00092_wg_cy(5)
    );
  Unbuf_E_mux00092_wg_lut_6_Q : LUT4
    generic map(
      INIT => X"0004"
    )
    port map (
      I0 => count_us(12),
      I1 => count_us(9),
      I2 => count_us(13),
      I3 => count_us(0),
      O => Unbuf_E_mux00092_wg_lut(6)
    );
  Unbuf_E_mux00092_wg_cy_6_Q : MUXCY
    port map (
      CI => Unbuf_E_mux00092_wg_cy(5),
      DI => Mrom_databus_mux0005,
      S => Unbuf_E_mux00092_wg_lut(6),
      O => N41
    );
  G1_CLK1MHz_cmp_eq00001_wg_lut_0_Q : LUT4
    generic map(
      INIT => X"0001"
    )
    port map (
      I0 => G1_cnt_add0000(22),
      I1 => G1_cnt_add0000(23),
      I2 => G1_cnt_add0000(24),
      I3 => G1_cnt_add0000(25),
      O => G1_CLK1MHz_cmp_eq00001_wg_lut(0)
    );
  G1_CLK1MHz_cmp_eq00001_wg_cy_0_Q : MUXCY
    port map (
      CI => Mrom_databus_mux0005,
      DI => Mrom_databus_mux000512,
      S => G1_CLK1MHz_cmp_eq00001_wg_lut(0),
      O => G1_CLK1MHz_cmp_eq00001_wg_cy(0)
    );
  G1_CLK1MHz_cmp_eq00001_wg_lut_1_Q : LUT4
    generic map(
      INIT => X"0001"
    )
    port map (
      I0 => G1_cnt_add0000(19),
      I1 => G1_cnt_add0000(20),
      I2 => G1_cnt_add0000(21),
      I3 => G1_cnt_add0000(26),
      O => G1_CLK1MHz_cmp_eq00001_wg_lut(1)
    );
  G1_CLK1MHz_cmp_eq00001_wg_cy_1_Q : MUXCY
    port map (
      CI => G1_CLK1MHz_cmp_eq00001_wg_cy(0),
      DI => Mrom_databus_mux000512,
      S => G1_CLK1MHz_cmp_eq00001_wg_lut(1),
      O => G1_CLK1MHz_cmp_eq00001_wg_cy(1)
    );
  G1_CLK1MHz_cmp_eq00001_wg_lut_2_Q : LUT4
    generic map(
      INIT => X"0001"
    )
    port map (
      I0 => G1_cnt_add0000(16),
      I1 => G1_cnt_add0000(17),
      I2 => G1_cnt_add0000(18),
      I3 => G1_cnt_add0000(27),
      O => G1_CLK1MHz_cmp_eq00001_wg_lut(2)
    );
  G1_CLK1MHz_cmp_eq00001_wg_cy_2_Q : MUXCY
    port map (
      CI => G1_CLK1MHz_cmp_eq00001_wg_cy(1),
      DI => Mrom_databus_mux000512,
      S => G1_CLK1MHz_cmp_eq00001_wg_lut(2),
      O => G1_CLK1MHz_cmp_eq00001_wg_cy(2)
    );
  G1_CLK1MHz_cmp_eq00001_wg_lut_3_Q : LUT4
    generic map(
      INIT => X"0001"
    )
    port map (
      I0 => G1_cnt_add0000(13),
      I1 => G1_cnt_add0000(14),
      I2 => G1_cnt_add0000(15),
      I3 => G1_cnt_add0000(28),
      O => G1_CLK1MHz_cmp_eq00001_wg_lut(3)
    );
  G1_CLK1MHz_cmp_eq00001_wg_cy_3_Q : MUXCY
    port map (
      CI => G1_CLK1MHz_cmp_eq00001_wg_cy(2),
      DI => Mrom_databus_mux000512,
      S => G1_CLK1MHz_cmp_eq00001_wg_lut(3),
      O => G1_CLK1MHz_cmp_eq00001_wg_cy(3)
    );
  G1_CLK1MHz_cmp_eq00001_wg_lut_4_Q : LUT4
    generic map(
      INIT => X"0001"
    )
    port map (
      I0 => G1_cnt_add0000(10),
      I1 => G1_cnt_add0000(11),
      I2 => G1_cnt_add0000(12),
      I3 => G1_cnt_add0000(29),
      O => G1_CLK1MHz_cmp_eq00001_wg_lut(4)
    );
  G1_CLK1MHz_cmp_eq00001_wg_cy_4_Q : MUXCY
    port map (
      CI => G1_CLK1MHz_cmp_eq00001_wg_cy(3),
      DI => Mrom_databus_mux000512,
      S => G1_CLK1MHz_cmp_eq00001_wg_lut(4),
      O => G1_CLK1MHz_cmp_eq00001_wg_cy(4)
    );
  G1_CLK1MHz_cmp_eq00001_wg_lut_5_Q : LUT4
    generic map(
      INIT => X"0001"
    )
    port map (
      I0 => G1_cnt_add0000(7),
      I1 => G1_cnt_add0000(8),
      I2 => G1_cnt_add0000(9),
      I3 => G1_cnt_add0000(30),
      O => G1_CLK1MHz_cmp_eq00001_wg_lut(5)
    );
  G1_CLK1MHz_cmp_eq00001_wg_cy_5_Q : MUXCY
    port map (
      CI => G1_CLK1MHz_cmp_eq00001_wg_cy(4),
      DI => Mrom_databus_mux000512,
      S => G1_CLK1MHz_cmp_eq00001_wg_lut(5),
      O => G1_CLK1MHz_cmp_eq00001_wg_cy(5)
    );
  G1_CLK1MHz_cmp_eq00001_wg_lut_6_Q : LUT4
    generic map(
      INIT => X"0004"
    )
    port map (
      I0 => G1_cnt_add0000(2),
      I1 => G1_cnt_add0000(4),
      I2 => G1_cnt_add0000(6),
      I3 => G1_cnt_add0000(31),
      O => G1_CLK1MHz_cmp_eq00001_wg_lut(6)
    );
  G1_CLK1MHz_cmp_eq00001_wg_cy_6_Q : MUXCY
    port map (
      CI => G1_CLK1MHz_cmp_eq00001_wg_cy(5),
      DI => Mrom_databus_mux000512,
      S => G1_CLK1MHz_cmp_eq00001_wg_lut(6),
      O => G1_CLK1MHz_cmp_eq00001_wg_cy(6)
    );
  databus_mux0006_3_11 : LUT2
    generic map(
      INIT => X"1"
    )
    port map (
      I0 => wait_time_cmp_ge00001,
      I1 => databus_cmp_ge0000,
      O => N25
    );
  Unbuf_E_mux0009321 : LUT2
    generic map(
      INIT => X"E"
    )
    port map (
      I0 => databus_cmp_ge0001,
      I1 => databus_cmp_ge0002,
      O => N81
    );
  databus_not00011 : LUT4
    generic map(
      INIT => X"FFFE"
    )
    port map (
      I0 => databus_cmp_ge0000,
      I1 => wait_time_cmp_ge00001,
      I2 => databus_cmp_ge0002,
      I3 => databus_cmp_ge0001,
      O => databus_not0001
    );
  databus_mux0006_5_SW0 : LUT3
    generic map(
      INIT => X"F6"
    )
    port map (
      I0 => index(1),
      I1 => index(2),
      I2 => index(3),
      O => N4
    );
  databus_mux0006_5_Q : LUT4
    generic map(
      INIT => X"FF8A"
    )
    port map (
      I0 => RS_mux0005,
      I1 => N4,
      I2 => index(0),
      I3 => N23,
      O => databus_mux0006(5)
    );
  databus_mux0006_3_39 : LUT4
    generic map(
      INIT => X"141E"
    )
    port map (
      I0 => index(2),
      I1 => index(0),
      I2 => index(3),
      I3 => index(1),
      O => databus_mux0006_3_39_848
    );
  databus_mux0006_3_55 : LUT4
    generic map(
      INIT => X"F888"
    )
    port map (
      I0 => N25,
      I1 => N81,
      I2 => RS_mux0005,
      I3 => databus_mux0006_3_39_848,
      O => databus_mux0006(3)
    );
  databus_mux0006_1_27 : LUT4
    generic map(
      INIT => X"BA91"
    )
    port map (
      I0 => index(2),
      I1 => index(1),
      I2 => index(3),
      I3 => index(0),
      O => databus_mux0006_1_27_844
    );
  databus_mux0006_1_40 : LUT4
    generic map(
      INIT => X"F888"
    )
    port map (
      I0 => databus_cmp_ge0001,
      I1 => N25,
      I2 => RS_mux0005,
      I3 => databus_mux0006_1_27_844,
      O => databus_mux0006(1)
    );
  databus_mux0006_2_50 : LUT4
    generic map(
      INIT => X"0DBA"
    )
    port map (
      I0 => index(1),
      I1 => index(0),
      I2 => index(3),
      I3 => index(2),
      O => databus_mux0006_2_50_846
    );
  databus_mux0006_2_68 : LUT4
    generic map(
      INIT => X"F888"
    )
    port map (
      I0 => databus_cmp_ge0001,
      I1 => N25,
      I2 => RS_mux0005,
      I3 => databus_mux0006_2_50_846,
      O => databus_mux0006(2)
    );
  Unbuf_E_mux000919 : LUT3
    generic map(
      INIT => X"7F"
    )
    port map (
      I0 => count_us(7),
      I1 => count_us(5),
      I2 => count_us(2),
      O => Unbuf_E_mux000919_745
    );
  Unbuf_E_mux000968 : LUT3
    generic map(
      INIT => X"AE"
    )
    port map (
      I0 => databus_cmp_ge0000,
      I1 => databus_cmp_ge0002,
      I2 => databus_cmp_ge0001,
      O => Unbuf_E_mux000968_760
    );
  Unbuf_E_mux000971 : LUT4
    generic map(
      INIT => X"CCC8"
    )
    port map (
      I0 => count_us(7),
      I1 => Unbuf_E_mux000968_760,
      I2 => count_us(5),
      I3 => count_us(2),
      O => Unbuf_E_mux000971_761
    );
  G1_CLK1MHz_cmp_eq0000 : LUT4
    generic map(
      INIT => X"0200"
    )
    port map (
      I0 => G1_cnt_add0000(3),
      I1 => G1_cnt_add0000(5),
      I2 => N9,
      I3 => G1_CLK1MHz_cmp_eq00001_wg_cy(6),
      O => G1_CLK1MHz_cmp_eq0000_5
    );
  G1_cnt_cmp_eq0000 : LUT4
    generic map(
      INIT => X"0400"
    )
    port map (
      I0 => G1_cnt_add0000(3),
      I1 => G1_cnt_add0000(5),
      I2 => N11,
      I3 => G1_CLK1MHz_cmp_eq00001_wg_cy(6),
      O => G1_cnt_cmp_eq0000_209
    );
  SysCLK_IBUFG : IBUFG
    port map (
      I => SysCLK,
      O => SysCLK_IBUFG_741
    );
  E_OBUF : OBUF
    port map (
      I => E_OBUF_3,
      O => E
    );
  RS_OBUF : OBUF
    port map (
      I => RS_OBUF_675,
      O => RS
    );
  RW_OBUF : OBUF
    port map (
      I => Mrom_databus_mux000512,
      O => RW
    );
  databus_7_OBUF : OBUF
    port map (
      I => databus_7_809,
      O => databus(7)
    );
  databus_6_OBUF : OBUF
    port map (
      I => databus_6_808,
      O => databus(6)
    );
  databus_5_OBUF : OBUF
    port map (
      I => databus_5_807,
      O => databus(5)
    );
  databus_4_OBUF : OBUF
    port map (
      I => databus_4_806,
      O => databus(4)
    );
  databus_3_OBUF : OBUF
    port map (
      I => databus_3_805,
      O => databus(3)
    );
  databus_2_OBUF : OBUF
    port map (
      I => databus_2_804,
      O => databus(2)
    );
  databus_1_OBUF : OBUF
    port map (
      I => databus_1_803,
      O => databus(1)
    );
  databus_0_OBUF : OBUF
    port map (
      I => databus_0_802,
      O => databus(0)
    );
  Madd_wait_time_share0000_cy_2_rt : LUT1
    generic map(
      INIT => X"2"
    )
    port map (
      I0 => wait_time(2),
      O => Madd_wait_time_share0000_cy_2_rt_370
    );
  Madd_wait_time_share0000_cy_3_rt : LUT1
    generic map(
      INIT => X"2"
    )
    port map (
      I0 => wait_time(3),
      O => Madd_wait_time_share0000_cy_3_rt_374
    );
  Madd_wait_time_share0000_cy_6_rt : LUT1
    generic map(
      INIT => X"2"
    )
    port map (
      I0 => wait_time(6),
      O => Madd_wait_time_share0000_cy_6_rt_378
    );
  Madd_wait_time_share0000_cy_7_rt : LUT1
    generic map(
      INIT => X"2"
    )
    port map (
      I0 => wait_time(7),
      O => Madd_wait_time_share0000_cy_7_rt_380
    );
  Madd_wait_time_share0000_cy_8_rt : LUT1
    generic map(
      INIT => X"2"
    )
    port map (
      I0 => wait_time(8),
      O => Madd_wait_time_share0000_cy_8_rt_382
    );
  Madd_wait_time_share0000_cy_9_rt : LUT1
    generic map(
      INIT => X"2"
    )
    port map (
      I0 => wait_time(9),
      O => Madd_wait_time_share0000_cy_9_rt_384
    );
  Madd_wait_time_share0000_cy_10_rt : LUT1
    generic map(
      INIT => X"2"
    )
    port map (
      I0 => wait_time(10),
      O => Madd_wait_time_share0000_cy_10_rt_329
    );
  Madd_wait_time_share0000_cy_11_rt : LUT1
    generic map(
      INIT => X"2"
    )
    port map (
      I0 => wait_time(11),
      O => Madd_wait_time_share0000_cy_11_rt_331
    );
  Madd_wait_time_share0000_cy_12_rt : LUT1
    generic map(
      INIT => X"2"
    )
    port map (
      I0 => wait_time(12),
      O => Madd_wait_time_share0000_cy_12_rt_333
    );
  Madd_wait_time_share0000_cy_13_rt : LUT1
    generic map(
      INIT => X"2"
    )
    port map (
      I0 => wait_time(13),
      O => Madd_wait_time_share0000_cy_13_rt_335
    );
  Madd_wait_time_share0000_cy_14_rt : LUT1
    generic map(
      INIT => X"2"
    )
    port map (
      I0 => wait_time(14),
      O => Madd_wait_time_share0000_cy_14_rt_337
    );
  Madd_wait_time_share0000_cy_15_rt : LUT1
    generic map(
      INIT => X"2"
    )
    port map (
      I0 => wait_time(15),
      O => Madd_wait_time_share0000_cy_15_rt_339
    );
  Madd_wait_time_share0000_cy_16_rt : LUT1
    generic map(
      INIT => X"2"
    )
    port map (
      I0 => wait_time(16),
      O => Madd_wait_time_share0000_cy_16_rt_341
    );
  Madd_wait_time_share0000_cy_17_rt : LUT1
    generic map(
      INIT => X"2"
    )
    port map (
      I0 => wait_time(17),
      O => Madd_wait_time_share0000_cy_17_rt_343
    );
  Madd_wait_time_share0000_cy_18_rt : LUT1
    generic map(
      INIT => X"2"
    )
    port map (
      I0 => wait_time(18),
      O => Madd_wait_time_share0000_cy_18_rt_345
    );
  Madd_wait_time_share0000_cy_19_rt : LUT1
    generic map(
      INIT => X"2"
    )
    port map (
      I0 => wait_time(19),
      O => Madd_wait_time_share0000_cy_19_rt_347
    );
  Madd_wait_time_share0000_cy_20_rt : LUT1
    generic map(
      INIT => X"2"
    )
    port map (
      I0 => wait_time(20),
      O => Madd_wait_time_share0000_cy_20_rt_350
    );
  Madd_wait_time_share0000_cy_21_rt : LUT1
    generic map(
      INIT => X"2"
    )
    port map (
      I0 => wait_time(21),
      O => Madd_wait_time_share0000_cy_21_rt_352
    );
  Madd_wait_time_share0000_cy_22_rt : LUT1
    generic map(
      INIT => X"2"
    )
    port map (
      I0 => wait_time(22),
      O => Madd_wait_time_share0000_cy_22_rt_354
    );
  Madd_wait_time_share0000_cy_23_rt : LUT1
    generic map(
      INIT => X"2"
    )
    port map (
      I0 => wait_time(23),
      O => Madd_wait_time_share0000_cy_23_rt_356
    );
  Madd_wait_time_share0000_cy_24_rt : LUT1
    generic map(
      INIT => X"2"
    )
    port map (
      I0 => wait_time(24),
      O => Madd_wait_time_share0000_cy_24_rt_358
    );
  Madd_wait_time_share0000_cy_25_rt : LUT1
    generic map(
      INIT => X"2"
    )
    port map (
      I0 => wait_time(25),
      O => Madd_wait_time_share0000_cy_25_rt_360
    );
  Madd_wait_time_share0000_cy_26_rt : LUT1
    generic map(
      INIT => X"2"
    )
    port map (
      I0 => wait_time(26),
      O => Madd_wait_time_share0000_cy_26_rt_362
    );
  Madd_wait_time_share0000_cy_27_rt : LUT1
    generic map(
      INIT => X"2"
    )
    port map (
      I0 => wait_time(27),
      O => Madd_wait_time_share0000_cy_27_rt_364
    );
  Madd_wait_time_share0000_cy_28_rt : LUT1
    generic map(
      INIT => X"2"
    )
    port map (
      I0 => wait_time(28),
      O => Madd_wait_time_share0000_cy_28_rt_366
    );
  Madd_wait_time_share0000_cy_29_rt : LUT1
    generic map(
      INIT => X"2"
    )
    port map (
      I0 => wait_time(29),
      O => Madd_wait_time_share0000_cy_29_rt_368
    );
  Madd_wait_time_share0000_cy_30_rt : LUT1
    generic map(
      INIT => X"2"
    )
    port map (
      I0 => wait_time(30),
      O => Madd_wait_time_share0000_cy_30_rt_372
    );
  Madd_databus_add0000_cy_9_rt : LUT1
    generic map(
      INIT => X"2"
    )
    port map (
      I0 => wait_time(9),
      O => Madd_databus_add0000_cy_9_rt_255
    );
  Madd_databus_add0000_cy_11_rt : LUT1
    generic map(
      INIT => X"2"
    )
    port map (
      I0 => wait_time(11),
      O => Madd_databus_add0000_cy_11_rt_212
    );
  Madd_databus_add0000_cy_13_rt : LUT1
    generic map(
      INIT => X"2"
    )
    port map (
      I0 => wait_time(13),
      O => Madd_databus_add0000_cy_13_rt_215
    );
  Madd_databus_add0000_cy_15_rt : LUT1
    generic map(
      INIT => X"2"
    )
    port map (
      I0 => wait_time(15),
      O => Madd_databus_add0000_cy_15_rt_218
    );
  Madd_databus_add0000_cy_16_rt : LUT1
    generic map(
      INIT => X"2"
    )
    port map (
      I0 => wait_time(16),
      O => Madd_databus_add0000_cy_16_rt_220
    );
  Madd_databus_add0000_cy_17_rt : LUT1
    generic map(
      INIT => X"2"
    )
    port map (
      I0 => wait_time(17),
      O => Madd_databus_add0000_cy_17_rt_222
    );
  Madd_databus_add0000_cy_18_rt : LUT1
    generic map(
      INIT => X"2"
    )
    port map (
      I0 => wait_time(18),
      O => Madd_databus_add0000_cy_18_rt_224
    );
  Madd_databus_add0000_cy_19_rt : LUT1
    generic map(
      INIT => X"2"
    )
    port map (
      I0 => wait_time(19),
      O => Madd_databus_add0000_cy_19_rt_226
    );
  Madd_databus_add0000_cy_20_rt : LUT1
    generic map(
      INIT => X"2"
    )
    port map (
      I0 => wait_time(20),
      O => Madd_databus_add0000_cy_20_rt_228
    );
  Madd_databus_add0000_cy_21_rt : LUT1
    generic map(
      INIT => X"2"
    )
    port map (
      I0 => wait_time(21),
      O => Madd_databus_add0000_cy_21_rt_230
    );
  Madd_databus_add0000_cy_22_rt : LUT1
    generic map(
      INIT => X"2"
    )
    port map (
      I0 => wait_time(22),
      O => Madd_databus_add0000_cy_22_rt_232
    );
  Madd_databus_add0000_cy_23_rt : LUT1
    generic map(
      INIT => X"2"
    )
    port map (
      I0 => wait_time(23),
      O => Madd_databus_add0000_cy_23_rt_234
    );
  Madd_databus_add0000_cy_24_rt : LUT1
    generic map(
      INIT => X"2"
    )
    port map (
      I0 => wait_time(24),
      O => Madd_databus_add0000_cy_24_rt_236
    );
  Madd_databus_add0000_cy_25_rt : LUT1
    generic map(
      INIT => X"2"
    )
    port map (
      I0 => wait_time(25),
      O => Madd_databus_add0000_cy_25_rt_238
    );
  Madd_databus_add0000_cy_26_rt : LUT1
    generic map(
      INIT => X"2"
    )
    port map (
      I0 => wait_time(26),
      O => Madd_databus_add0000_cy_26_rt_240
    );
  Madd_databus_add0000_cy_27_rt : LUT1
    generic map(
      INIT => X"2"
    )
    port map (
      I0 => wait_time(27),
      O => Madd_databus_add0000_cy_27_rt_242
    );
  Madd_databus_add0000_cy_28_rt : LUT1
    generic map(
      INIT => X"2"
    )
    port map (
      I0 => wait_time(28),
      O => Madd_databus_add0000_cy_28_rt_244
    );
  Madd_databus_add0000_cy_29_rt : LUT1
    generic map(
      INIT => X"2"
    )
    port map (
      I0 => wait_time(29),
      O => Madd_databus_add0000_cy_29_rt_246
    );
  Madd_databus_add0000_cy_30_rt : LUT1
    generic map(
      INIT => X"2"
    )
    port map (
      I0 => wait_time(30),
      O => Madd_databus_add0000_cy_30_rt_248
    );
  Madd_index_addsub0000_cy_1_rt : LUT1
    generic map(
      INIT => X"2"
    )
    port map (
      I0 => index(1),
      O => Madd_index_addsub0000_cy_1_rt_287
    );
  Madd_index_addsub0000_cy_2_rt : LUT1
    generic map(
      INIT => X"2"
    )
    port map (
      I0 => index(2),
      O => Madd_index_addsub0000_cy_2_rt_309
    );
  Madd_index_addsub0000_cy_3_rt : LUT1
    generic map(
      INIT => X"2"
    )
    port map (
      I0 => index(3),
      O => Madd_index_addsub0000_cy_3_rt_313
    );
  Madd_index_addsub0000_cy_4_rt : LUT1
    generic map(
      INIT => X"2"
    )
    port map (
      I0 => index(4),
      O => Madd_index_addsub0000_cy_4_rt_315
    );
  Madd_index_addsub0000_cy_5_rt : LUT1
    generic map(
      INIT => X"2"
    )
    port map (
      I0 => index(5),
      O => Madd_index_addsub0000_cy_5_rt_317
    );
  Madd_index_addsub0000_cy_6_rt : LUT1
    generic map(
      INIT => X"2"
    )
    port map (
      I0 => index(6),
      O => Madd_index_addsub0000_cy_6_rt_319
    );
  Madd_index_addsub0000_cy_7_rt : LUT1
    generic map(
      INIT => X"2"
    )
    port map (
      I0 => index(7),
      O => Madd_index_addsub0000_cy_7_rt_321
    );
  Madd_index_addsub0000_cy_8_rt : LUT1
    generic map(
      INIT => X"2"
    )
    port map (
      I0 => index(8),
      O => Madd_index_addsub0000_cy_8_rt_323
    );
  Madd_index_addsub0000_cy_9_rt : LUT1
    generic map(
      INIT => X"2"
    )
    port map (
      I0 => index(9),
      O => Madd_index_addsub0000_cy_9_rt_325
    );
  Madd_index_addsub0000_cy_10_rt : LUT1
    generic map(
      INIT => X"2"
    )
    port map (
      I0 => index(10),
      O => Madd_index_addsub0000_cy_10_rt_267
    );
  Madd_index_addsub0000_cy_11_rt : LUT1
    generic map(
      INIT => X"2"
    )
    port map (
      I0 => index(11),
      O => Madd_index_addsub0000_cy_11_rt_269
    );
  Madd_index_addsub0000_cy_12_rt : LUT1
    generic map(
      INIT => X"2"
    )
    port map (
      I0 => index(12),
      O => Madd_index_addsub0000_cy_12_rt_271
    );
  Madd_index_addsub0000_cy_13_rt : LUT1
    generic map(
      INIT => X"2"
    )
    port map (
      I0 => index(13),
      O => Madd_index_addsub0000_cy_13_rt_273
    );
  Madd_index_addsub0000_cy_14_rt : LUT1
    generic map(
      INIT => X"2"
    )
    port map (
      I0 => index(14),
      O => Madd_index_addsub0000_cy_14_rt_275
    );
  Madd_index_addsub0000_cy_15_rt : LUT1
    generic map(
      INIT => X"2"
    )
    port map (
      I0 => index(15),
      O => Madd_index_addsub0000_cy_15_rt_277
    );
  Madd_index_addsub0000_cy_16_rt : LUT1
    generic map(
      INIT => X"2"
    )
    port map (
      I0 => index(16),
      O => Madd_index_addsub0000_cy_16_rt_279
    );
  Madd_index_addsub0000_cy_17_rt : LUT1
    generic map(
      INIT => X"2"
    )
    port map (
      I0 => index(17),
      O => Madd_index_addsub0000_cy_17_rt_281
    );
  Madd_index_addsub0000_cy_18_rt : LUT1
    generic map(
      INIT => X"2"
    )
    port map (
      I0 => index(18),
      O => Madd_index_addsub0000_cy_18_rt_283
    );
  Madd_index_addsub0000_cy_19_rt : LUT1
    generic map(
      INIT => X"2"
    )
    port map (
      I0 => index(19),
      O => Madd_index_addsub0000_cy_19_rt_285
    );
  Madd_index_addsub0000_cy_20_rt : LUT1
    generic map(
      INIT => X"2"
    )
    port map (
      I0 => index(20),
      O => Madd_index_addsub0000_cy_20_rt_289
    );
  Madd_index_addsub0000_cy_21_rt : LUT1
    generic map(
      INIT => X"2"
    )
    port map (
      I0 => index(21),
      O => Madd_index_addsub0000_cy_21_rt_291
    );
  Madd_index_addsub0000_cy_22_rt : LUT1
    generic map(
      INIT => X"2"
    )
    port map (
      I0 => index(22),
      O => Madd_index_addsub0000_cy_22_rt_293
    );
  Madd_index_addsub0000_cy_23_rt : LUT1
    generic map(
      INIT => X"2"
    )
    port map (
      I0 => index(23),
      O => Madd_index_addsub0000_cy_23_rt_295
    );
  Madd_index_addsub0000_cy_24_rt : LUT1
    generic map(
      INIT => X"2"
    )
    port map (
      I0 => index(24),
      O => Madd_index_addsub0000_cy_24_rt_297
    );
  Madd_index_addsub0000_cy_25_rt : LUT1
    generic map(
      INIT => X"2"
    )
    port map (
      I0 => index(25),
      O => Madd_index_addsub0000_cy_25_rt_299
    );
  Madd_index_addsub0000_cy_26_rt : LUT1
    generic map(
      INIT => X"2"
    )
    port map (
      I0 => index(26),
      O => Madd_index_addsub0000_cy_26_rt_301
    );
  Madd_index_addsub0000_cy_27_rt : LUT1
    generic map(
      INIT => X"2"
    )
    port map (
      I0 => index(27),
      O => Madd_index_addsub0000_cy_27_rt_303
    );
  Madd_index_addsub0000_cy_28_rt : LUT1
    generic map(
      INIT => X"2"
    )
    port map (
      I0 => index(28),
      O => Madd_index_addsub0000_cy_28_rt_305
    );
  Madd_index_addsub0000_cy_29_rt : LUT1
    generic map(
      INIT => X"2"
    )
    port map (
      I0 => index(29),
      O => Madd_index_addsub0000_cy_29_rt_307
    );
  Madd_index_addsub0000_cy_30_rt : LUT1
    generic map(
      INIT => X"2"
    )
    port map (
      I0 => index(30),
      O => Madd_index_addsub0000_cy_30_rt_311
    );
  Mcompar_wait_time_cmp_ge0000_cy_1_rt : LUT1
    generic map(
      INIT => X"2"
    )
    port map (
      I0 => count_us(8),
      O => Mcompar_wait_time_cmp_ge0000_cy_1_rt_436
    );
  Mcompar_wait_time_cmp_ge0000_cy_3_rt : LUT1
    generic map(
      INIT => X"2"
    )
    port map (
      I0 => count_us(10),
      O => Mcompar_wait_time_cmp_ge0000_cy_3_rt_446
    );
  Mcompar_wait_time_cmp_ge0000_cy_5_rt : LUT1
    generic map(
      INIT => X"2"
    )
    port map (
      I0 => count_us(12),
      O => Mcompar_wait_time_cmp_ge0000_cy_5_rt_456
    );
  Mcompar_wait_time_cmp_ge0000_cy_7_rt : LUT1
    generic map(
      INIT => X"2"
    )
    port map (
      I0 => count_us(14),
      O => Mcompar_wait_time_cmp_ge0000_cy_7_rt_467
    );
  Mcompar_wait_time_cmp_ge0000_cy_0_0_rt : LUT1
    generic map(
      INIT => X"2"
    )
    port map (
      I0 => count_us(3),
      O => Mcompar_wait_time_cmp_ge0000_cy_0_0_rt_425
    );
  Mcompar_wait_time_cmp_ge0000_cy_6_0_rt : LUT1
    generic map(
      INIT => X"2"
    )
    port map (
      I0 => count_us(14),
      O => Mcompar_wait_time_cmp_ge0000_cy_6_0_rt_461
    );
  Mcompar_wait_time_cmp_ge0000_cy_0_1_rt : LUT1
    generic map(
      INIT => X"2"
    )
    port map (
      I0 => count_us(2),
      O => Mcompar_wait_time_cmp_ge0000_cy_0_1_rt_426
    );
  Mcompar_wait_time_cmp_ge0000_cy_2_1_rt : LUT1
    generic map(
      INIT => X"2"
    )
    port map (
      I0 => count_us(7),
      O => Mcompar_wait_time_cmp_ge0000_cy_2_1_rt_441
    );
  Mcompar_wait_time_cmp_ge0000_cy_6_1_rt : LUT1
    generic map(
      INIT => X"2"
    )
    port map (
      I0 => count_us(14),
      O => Mcompar_wait_time_cmp_ge0000_cy_6_1_rt_462
    );
  Mcompar_wait_time_cmp_ge0000_cy_0_2_rt : LUT1
    generic map(
      INIT => X"2"
    )
    port map (
      I0 => count_us(5),
      O => Mcompar_wait_time_cmp_ge0000_cy_0_2_rt_427
    );
  Mcompar_wait_time_cmp_ge0000_cy_4_2_rt : LUT1
    generic map(
      INIT => X"2"
    )
    port map (
      I0 => count_us(14),
      O => Mcompar_wait_time_cmp_ge0000_cy_4_2_rt_451
    );
  G1_Madd_cnt_add0000_cy_1_rt : LUT1
    generic map(
      INIT => X"2"
    )
    port map (
      I0 => G1_cnt(1),
      O => G1_Madd_cnt_add0000_cy_1_rt_42
    );
  G1_Madd_cnt_add0000_cy_2_rt : LUT1
    generic map(
      INIT => X"2"
    )
    port map (
      I0 => G1_cnt(2),
      O => G1_Madd_cnt_add0000_cy_2_rt_64
    );
  G1_Madd_cnt_add0000_cy_3_rt : LUT1
    generic map(
      INIT => X"2"
    )
    port map (
      I0 => G1_cnt(3),
      O => G1_Madd_cnt_add0000_cy_3_rt_68
    );
  G1_Madd_cnt_add0000_cy_4_rt : LUT1
    generic map(
      INIT => X"2"
    )
    port map (
      I0 => G1_cnt(4),
      O => G1_Madd_cnt_add0000_cy_4_rt_70
    );
  G1_Madd_cnt_add0000_cy_5_rt : LUT1
    generic map(
      INIT => X"2"
    )
    port map (
      I0 => G1_cnt(5),
      O => G1_Madd_cnt_add0000_cy_5_rt_72
    );
  G1_Madd_cnt_add0000_cy_6_rt : LUT1
    generic map(
      INIT => X"2"
    )
    port map (
      I0 => G1_cnt(6),
      O => G1_Madd_cnt_add0000_cy_6_rt_74
    );
  G1_Madd_cnt_add0000_cy_7_rt : LUT1
    generic map(
      INIT => X"2"
    )
    port map (
      I0 => G1_cnt(7),
      O => G1_Madd_cnt_add0000_cy_7_rt_76
    );
  G1_Madd_cnt_add0000_cy_8_rt : LUT1
    generic map(
      INIT => X"2"
    )
    port map (
      I0 => G1_cnt(8),
      O => G1_Madd_cnt_add0000_cy_8_rt_78
    );
  G1_Madd_cnt_add0000_cy_9_rt : LUT1
    generic map(
      INIT => X"2"
    )
    port map (
      I0 => G1_cnt(9),
      O => G1_Madd_cnt_add0000_cy_9_rt_80
    );
  G1_Madd_cnt_add0000_cy_10_rt : LUT1
    generic map(
      INIT => X"2"
    )
    port map (
      I0 => G1_cnt(10),
      O => G1_Madd_cnt_add0000_cy_10_rt_22
    );
  G1_Madd_cnt_add0000_cy_11_rt : LUT1
    generic map(
      INIT => X"2"
    )
    port map (
      I0 => G1_cnt(11),
      O => G1_Madd_cnt_add0000_cy_11_rt_24
    );
  G1_Madd_cnt_add0000_cy_12_rt : LUT1
    generic map(
      INIT => X"2"
    )
    port map (
      I0 => G1_cnt(12),
      O => G1_Madd_cnt_add0000_cy_12_rt_26
    );
  G1_Madd_cnt_add0000_cy_13_rt : LUT1
    generic map(
      INIT => X"2"
    )
    port map (
      I0 => G1_cnt(13),
      O => G1_Madd_cnt_add0000_cy_13_rt_28
    );
  G1_Madd_cnt_add0000_cy_14_rt : LUT1
    generic map(
      INIT => X"2"
    )
    port map (
      I0 => G1_cnt(14),
      O => G1_Madd_cnt_add0000_cy_14_rt_30
    );
  G1_Madd_cnt_add0000_cy_15_rt : LUT1
    generic map(
      INIT => X"2"
    )
    port map (
      I0 => G1_cnt(15),
      O => G1_Madd_cnt_add0000_cy_15_rt_32
    );
  G1_Madd_cnt_add0000_cy_16_rt : LUT1
    generic map(
      INIT => X"2"
    )
    port map (
      I0 => G1_cnt(16),
      O => G1_Madd_cnt_add0000_cy_16_rt_34
    );
  G1_Madd_cnt_add0000_cy_17_rt : LUT1
    generic map(
      INIT => X"2"
    )
    port map (
      I0 => G1_cnt(17),
      O => G1_Madd_cnt_add0000_cy_17_rt_36
    );
  G1_Madd_cnt_add0000_cy_18_rt : LUT1
    generic map(
      INIT => X"2"
    )
    port map (
      I0 => G1_cnt(18),
      O => G1_Madd_cnt_add0000_cy_18_rt_38
    );
  G1_Madd_cnt_add0000_cy_19_rt : LUT1
    generic map(
      INIT => X"2"
    )
    port map (
      I0 => G1_cnt(19),
      O => G1_Madd_cnt_add0000_cy_19_rt_40
    );
  G1_Madd_cnt_add0000_cy_20_rt : LUT1
    generic map(
      INIT => X"2"
    )
    port map (
      I0 => G1_cnt(20),
      O => G1_Madd_cnt_add0000_cy_20_rt_44
    );
  G1_Madd_cnt_add0000_cy_21_rt : LUT1
    generic map(
      INIT => X"2"
    )
    port map (
      I0 => G1_cnt(21),
      O => G1_Madd_cnt_add0000_cy_21_rt_46
    );
  G1_Madd_cnt_add0000_cy_22_rt : LUT1
    generic map(
      INIT => X"2"
    )
    port map (
      I0 => G1_cnt(22),
      O => G1_Madd_cnt_add0000_cy_22_rt_48
    );
  G1_Madd_cnt_add0000_cy_23_rt : LUT1
    generic map(
      INIT => X"2"
    )
    port map (
      I0 => G1_cnt(23),
      O => G1_Madd_cnt_add0000_cy_23_rt_50
    );
  G1_Madd_cnt_add0000_cy_24_rt : LUT1
    generic map(
      INIT => X"2"
    )
    port map (
      I0 => G1_cnt(24),
      O => G1_Madd_cnt_add0000_cy_24_rt_52
    );
  G1_Madd_cnt_add0000_cy_25_rt : LUT1
    generic map(
      INIT => X"2"
    )
    port map (
      I0 => G1_cnt(25),
      O => G1_Madd_cnt_add0000_cy_25_rt_54
    );
  G1_Madd_cnt_add0000_cy_26_rt : LUT1
    generic map(
      INIT => X"2"
    )
    port map (
      I0 => G1_cnt(26),
      O => G1_Madd_cnt_add0000_cy_26_rt_56
    );
  G1_Madd_cnt_add0000_cy_27_rt : LUT1
    generic map(
      INIT => X"2"
    )
    port map (
      I0 => G1_cnt(27),
      O => G1_Madd_cnt_add0000_cy_27_rt_58
    );
  G1_Madd_cnt_add0000_cy_28_rt : LUT1
    generic map(
      INIT => X"2"
    )
    port map (
      I0 => G1_cnt(28),
      O => G1_Madd_cnt_add0000_cy_28_rt_60
    );
  G1_Madd_cnt_add0000_cy_29_rt : LUT1
    generic map(
      INIT => X"2"
    )
    port map (
      I0 => G1_cnt(29),
      O => G1_Madd_cnt_add0000_cy_29_rt_62
    );
  G1_Madd_cnt_add0000_cy_30_rt : LUT1
    generic map(
      INIT => X"2"
    )
    port map (
      I0 => G1_cnt(30),
      O => G1_Madd_cnt_add0000_cy_30_rt_66
    );
  G1_Mcount_cnt_cy_1_rt : LUT1
    generic map(
      INIT => X"2"
    )
    port map (
      I0 => G1_cnt(1),
      O => G1_Mcount_cnt_cy_1_rt_105
    );
  G1_Mcount_cnt_cy_2_rt : LUT1
    generic map(
      INIT => X"2"
    )
    port map (
      I0 => G1_cnt(2),
      O => G1_Mcount_cnt_cy_2_rt_127
    );
  G1_Mcount_cnt_cy_3_rt : LUT1
    generic map(
      INIT => X"2"
    )
    port map (
      I0 => G1_cnt(3),
      O => G1_Mcount_cnt_cy_3_rt_131
    );
  G1_Mcount_cnt_cy_4_rt : LUT1
    generic map(
      INIT => X"2"
    )
    port map (
      I0 => G1_cnt(4),
      O => G1_Mcount_cnt_cy_4_rt_133
    );
  G1_Mcount_cnt_cy_5_rt : LUT1
    generic map(
      INIT => X"2"
    )
    port map (
      I0 => G1_cnt(5),
      O => G1_Mcount_cnt_cy_5_rt_135
    );
  G1_Mcount_cnt_cy_6_rt : LUT1
    generic map(
      INIT => X"2"
    )
    port map (
      I0 => G1_cnt(6),
      O => G1_Mcount_cnt_cy_6_rt_137
    );
  G1_Mcount_cnt_cy_7_rt : LUT1
    generic map(
      INIT => X"2"
    )
    port map (
      I0 => G1_cnt(7),
      O => G1_Mcount_cnt_cy_7_rt_139
    );
  G1_Mcount_cnt_cy_8_rt : LUT1
    generic map(
      INIT => X"2"
    )
    port map (
      I0 => G1_cnt(8),
      O => G1_Mcount_cnt_cy_8_rt_141
    );
  G1_Mcount_cnt_cy_9_rt : LUT1
    generic map(
      INIT => X"2"
    )
    port map (
      I0 => G1_cnt(9),
      O => G1_Mcount_cnt_cy_9_rt_143
    );
  G1_Mcount_cnt_cy_10_rt : LUT1
    generic map(
      INIT => X"2"
    )
    port map (
      I0 => G1_cnt(10),
      O => G1_Mcount_cnt_cy_10_rt_85
    );
  G1_Mcount_cnt_cy_11_rt : LUT1
    generic map(
      INIT => X"2"
    )
    port map (
      I0 => G1_cnt(11),
      O => G1_Mcount_cnt_cy_11_rt_87
    );
  G1_Mcount_cnt_cy_12_rt : LUT1
    generic map(
      INIT => X"2"
    )
    port map (
      I0 => G1_cnt(12),
      O => G1_Mcount_cnt_cy_12_rt_89
    );
  G1_Mcount_cnt_cy_13_rt : LUT1
    generic map(
      INIT => X"2"
    )
    port map (
      I0 => G1_cnt(13),
      O => G1_Mcount_cnt_cy_13_rt_91
    );
  G1_Mcount_cnt_cy_14_rt : LUT1
    generic map(
      INIT => X"2"
    )
    port map (
      I0 => G1_cnt(14),
      O => G1_Mcount_cnt_cy_14_rt_93
    );
  G1_Mcount_cnt_cy_15_rt : LUT1
    generic map(
      INIT => X"2"
    )
    port map (
      I0 => G1_cnt(15),
      O => G1_Mcount_cnt_cy_15_rt_95
    );
  G1_Mcount_cnt_cy_16_rt : LUT1
    generic map(
      INIT => X"2"
    )
    port map (
      I0 => G1_cnt(16),
      O => G1_Mcount_cnt_cy_16_rt_97
    );
  G1_Mcount_cnt_cy_17_rt : LUT1
    generic map(
      INIT => X"2"
    )
    port map (
      I0 => G1_cnt(17),
      O => G1_Mcount_cnt_cy_17_rt_99
    );
  G1_Mcount_cnt_cy_18_rt : LUT1
    generic map(
      INIT => X"2"
    )
    port map (
      I0 => G1_cnt(18),
      O => G1_Mcount_cnt_cy_18_rt_101
    );
  G1_Mcount_cnt_cy_19_rt : LUT1
    generic map(
      INIT => X"2"
    )
    port map (
      I0 => G1_cnt(19),
      O => G1_Mcount_cnt_cy_19_rt_103
    );
  G1_Mcount_cnt_cy_20_rt : LUT1
    generic map(
      INIT => X"2"
    )
    port map (
      I0 => G1_cnt(20),
      O => G1_Mcount_cnt_cy_20_rt_107
    );
  G1_Mcount_cnt_cy_21_rt : LUT1
    generic map(
      INIT => X"2"
    )
    port map (
      I0 => G1_cnt(21),
      O => G1_Mcount_cnt_cy_21_rt_109
    );
  G1_Mcount_cnt_cy_22_rt : LUT1
    generic map(
      INIT => X"2"
    )
    port map (
      I0 => G1_cnt(22),
      O => G1_Mcount_cnt_cy_22_rt_111
    );
  G1_Mcount_cnt_cy_23_rt : LUT1
    generic map(
      INIT => X"2"
    )
    port map (
      I0 => G1_cnt(23),
      O => G1_Mcount_cnt_cy_23_rt_113
    );
  G1_Mcount_cnt_cy_24_rt : LUT1
    generic map(
      INIT => X"2"
    )
    port map (
      I0 => G1_cnt(24),
      O => G1_Mcount_cnt_cy_24_rt_115
    );
  G1_Mcount_cnt_cy_25_rt : LUT1
    generic map(
      INIT => X"2"
    )
    port map (
      I0 => G1_cnt(25),
      O => G1_Mcount_cnt_cy_25_rt_117
    );
  G1_Mcount_cnt_cy_26_rt : LUT1
    generic map(
      INIT => X"2"
    )
    port map (
      I0 => G1_cnt(26),
      O => G1_Mcount_cnt_cy_26_rt_119
    );
  G1_Mcount_cnt_cy_27_rt : LUT1
    generic map(
      INIT => X"2"
    )
    port map (
      I0 => G1_cnt(27),
      O => G1_Mcount_cnt_cy_27_rt_121
    );
  G1_Mcount_cnt_cy_28_rt : LUT1
    generic map(
      INIT => X"2"
    )
    port map (
      I0 => G1_cnt(28),
      O => G1_Mcount_cnt_cy_28_rt_123
    );
  G1_Mcount_cnt_cy_29_rt : LUT1
    generic map(
      INIT => X"2"
    )
    port map (
      I0 => G1_cnt(29),
      O => G1_Mcount_cnt_cy_29_rt_125
    );
  G1_Mcount_cnt_cy_30_rt : LUT1
    generic map(
      INIT => X"2"
    )
    port map (
      I0 => G1_cnt(30),
      O => G1_Mcount_cnt_cy_30_rt_129
    );
  Mcount_count_us_cy_1_rt : LUT1
    generic map(
      INIT => X"2"
    )
    port map (
      I0 => count_us(1),
      O => Mcount_count_us_cy_1_rt_614
    );
  Mcount_count_us_cy_2_rt : LUT1
    generic map(
      INIT => X"2"
    )
    port map (
      I0 => count_us(2),
      O => Mcount_count_us_cy_2_rt_636
    );
  Mcount_count_us_cy_3_rt : LUT1
    generic map(
      INIT => X"2"
    )
    port map (
      I0 => count_us(3),
      O => Mcount_count_us_cy_3_rt_640
    );
  Mcount_count_us_cy_4_rt : LUT1
    generic map(
      INIT => X"2"
    )
    port map (
      I0 => count_us(4),
      O => Mcount_count_us_cy_4_rt_642
    );
  Mcount_count_us_cy_5_rt : LUT1
    generic map(
      INIT => X"2"
    )
    port map (
      I0 => count_us(5),
      O => Mcount_count_us_cy_5_rt_644
    );
  Mcount_count_us_cy_6_rt : LUT1
    generic map(
      INIT => X"2"
    )
    port map (
      I0 => count_us(6),
      O => Mcount_count_us_cy_6_rt_646
    );
  Mcount_count_us_cy_7_rt : LUT1
    generic map(
      INIT => X"2"
    )
    port map (
      I0 => count_us(7),
      O => Mcount_count_us_cy_7_rt_648
    );
  Mcount_count_us_cy_8_rt : LUT1
    generic map(
      INIT => X"2"
    )
    port map (
      I0 => count_us(8),
      O => Mcount_count_us_cy_8_rt_650
    );
  Mcount_count_us_cy_9_rt : LUT1
    generic map(
      INIT => X"2"
    )
    port map (
      I0 => count_us(9),
      O => Mcount_count_us_cy_9_rt_652
    );
  Mcount_count_us_cy_10_rt : LUT1
    generic map(
      INIT => X"2"
    )
    port map (
      I0 => count_us(10),
      O => Mcount_count_us_cy_10_rt_594
    );
  Mcount_count_us_cy_11_rt : LUT1
    generic map(
      INIT => X"2"
    )
    port map (
      I0 => count_us(11),
      O => Mcount_count_us_cy_11_rt_596
    );
  Mcount_count_us_cy_12_rt : LUT1
    generic map(
      INIT => X"2"
    )
    port map (
      I0 => count_us(12),
      O => Mcount_count_us_cy_12_rt_598
    );
  Mcount_count_us_cy_13_rt : LUT1
    generic map(
      INIT => X"2"
    )
    port map (
      I0 => count_us(13),
      O => Mcount_count_us_cy_13_rt_600
    );
  Mcount_count_us_cy_14_rt : LUT1
    generic map(
      INIT => X"2"
    )
    port map (
      I0 => count_us(14),
      O => Mcount_count_us_cy_14_rt_602
    );
  Mcount_count_us_cy_15_rt : LUT1
    generic map(
      INIT => X"2"
    )
    port map (
      I0 => count_us(15),
      O => Mcount_count_us_cy_15_rt_604
    );
  Mcount_count_us_cy_16_rt : LUT1
    generic map(
      INIT => X"2"
    )
    port map (
      I0 => count_us(16),
      O => Mcount_count_us_cy_16_rt_606
    );
  Mcount_count_us_cy_17_rt : LUT1
    generic map(
      INIT => X"2"
    )
    port map (
      I0 => count_us(17),
      O => Mcount_count_us_cy_17_rt_608
    );
  Mcount_count_us_cy_18_rt : LUT1
    generic map(
      INIT => X"2"
    )
    port map (
      I0 => count_us(18),
      O => Mcount_count_us_cy_18_rt_610
    );
  Mcount_count_us_cy_19_rt : LUT1
    generic map(
      INIT => X"2"
    )
    port map (
      I0 => count_us(19),
      O => Mcount_count_us_cy_19_rt_612
    );
  Mcount_count_us_cy_20_rt : LUT1
    generic map(
      INIT => X"2"
    )
    port map (
      I0 => count_us(20),
      O => Mcount_count_us_cy_20_rt_616
    );
  Mcount_count_us_cy_21_rt : LUT1
    generic map(
      INIT => X"2"
    )
    port map (
      I0 => count_us(21),
      O => Mcount_count_us_cy_21_rt_618
    );
  Mcount_count_us_cy_22_rt : LUT1
    generic map(
      INIT => X"2"
    )
    port map (
      I0 => count_us(22),
      O => Mcount_count_us_cy_22_rt_620
    );
  Mcount_count_us_cy_23_rt : LUT1
    generic map(
      INIT => X"2"
    )
    port map (
      I0 => count_us(23),
      O => Mcount_count_us_cy_23_rt_622
    );
  Mcount_count_us_cy_24_rt : LUT1
    generic map(
      INIT => X"2"
    )
    port map (
      I0 => count_us(24),
      O => Mcount_count_us_cy_24_rt_624
    );
  Mcount_count_us_cy_25_rt : LUT1
    generic map(
      INIT => X"2"
    )
    port map (
      I0 => count_us(25),
      O => Mcount_count_us_cy_25_rt_626
    );
  Mcount_count_us_cy_26_rt : LUT1
    generic map(
      INIT => X"2"
    )
    port map (
      I0 => count_us(26),
      O => Mcount_count_us_cy_26_rt_628
    );
  Mcount_count_us_cy_27_rt : LUT1
    generic map(
      INIT => X"2"
    )
    port map (
      I0 => count_us(27),
      O => Mcount_count_us_cy_27_rt_630
    );
  Mcount_count_us_cy_28_rt : LUT1
    generic map(
      INIT => X"2"
    )
    port map (
      I0 => count_us(28),
      O => Mcount_count_us_cy_28_rt_632
    );
  Mcount_count_us_cy_29_rt : LUT1
    generic map(
      INIT => X"2"
    )
    port map (
      I0 => count_us(29),
      O => Mcount_count_us_cy_29_rt_634
    );
  Mcount_count_us_cy_30_rt : LUT1
    generic map(
      INIT => X"2"
    )
    port map (
      I0 => count_us(30),
      O => Mcount_count_us_cy_30_rt_638
    );
  Madd_wait_time_share0000_xor_31_rt : LUT1
    generic map(
      INIT => X"2"
    )
    port map (
      I0 => wait_time(31),
      O => Madd_wait_time_share0000_xor_31_rt_388
    );
  Madd_databus_add0000_xor_31_rt : LUT1
    generic map(
      INIT => X"2"
    )
    port map (
      I0 => wait_time(31),
      O => Madd_databus_add0000_xor_31_rt_264
    );
  Madd_index_addsub0000_xor_31_rt : LUT1
    generic map(
      INIT => X"2"
    )
    port map (
      I0 => index(31),
      O => Madd_index_addsub0000_xor_31_rt_327
    );
  G1_Madd_cnt_add0000_xor_31_rt : LUT1
    generic map(
      INIT => X"2"
    )
    port map (
      I0 => G1_cnt(31),
      O => G1_Madd_cnt_add0000_xor_31_rt_82
    );
  G1_Mcount_cnt_xor_31_rt : LUT1
    generic map(
      INIT => X"2"
    )
    port map (
      I0 => G1_cnt(31),
      O => G1_Mcount_cnt_xor_31_rt_145
    );
  Mcount_count_us_xor_31_rt : LUT1
    generic map(
      INIT => X"2"
    )
    port map (
      I0 => count_us(31),
      O => Mcount_count_us_xor_31_rt_654
    );
  Mmux_index_mux0003251 : LUT4
    generic map(
      INIT => X"ACAA"
    )
    port map (
      I0 => index(31),
      I1 => index_addsub0000(31),
      I2 => Mcompar_wait_time_cmp_eq0000_cy(15),
      I3 => wait_time_cmp_ge0001,
      O => index_mux0003(31)
    );
  Mmux_index_mux0003241 : LUT4
    generic map(
      INIT => X"ACAA"
    )
    port map (
      I0 => index(30),
      I1 => index_addsub0000(30),
      I2 => Mcompar_wait_time_cmp_eq0000_cy(15),
      I3 => wait_time_cmp_ge0001,
      O => index_mux0003(30)
    );
  Mmux_index_mux0003221 : LUT4
    generic map(
      INIT => X"ACAA"
    )
    port map (
      I0 => index(29),
      I1 => index_addsub0000(29),
      I2 => Mcompar_wait_time_cmp_eq0000_cy(15),
      I3 => wait_time_cmp_ge0001,
      O => index_mux0003(29)
    );
  Mmux_index_mux0003211 : LUT4
    generic map(
      INIT => X"ACAA"
    )
    port map (
      I0 => index(28),
      I1 => index_addsub0000(28),
      I2 => Mcompar_wait_time_cmp_eq0000_cy(15),
      I3 => wait_time_cmp_ge0001,
      O => index_mux0003(28)
    );
  Mmux_index_mux0003201 : LUT4
    generic map(
      INIT => X"ACAA"
    )
    port map (
      I0 => index(27),
      I1 => index_addsub0000(27),
      I2 => Mcompar_wait_time_cmp_eq0000_cy(15),
      I3 => wait_time_cmp_ge0001,
      O => index_mux0003(27)
    );
  Mmux_index_mux0003191 : LUT4
    generic map(
      INIT => X"ACAA"
    )
    port map (
      I0 => index(26),
      I1 => index_addsub0000(26),
      I2 => Mcompar_wait_time_cmp_eq0000_cy(15),
      I3 => wait_time_cmp_ge0001,
      O => index_mux0003(26)
    );
  Mmux_index_mux0003181 : LUT4
    generic map(
      INIT => X"ACAA"
    )
    port map (
      I0 => index(25),
      I1 => index_addsub0000(25),
      I2 => Mcompar_wait_time_cmp_eq0000_cy(15),
      I3 => wait_time_cmp_ge0001,
      O => index_mux0003(25)
    );
  Mmux_index_mux0003171 : LUT4
    generic map(
      INIT => X"ACAA"
    )
    port map (
      I0 => index(24),
      I1 => index_addsub0000(24),
      I2 => Mcompar_wait_time_cmp_eq0000_cy(15),
      I3 => wait_time_cmp_ge0001,
      O => index_mux0003(24)
    );
  Mmux_index_mux0003161 : LUT4
    generic map(
      INIT => X"ACAA"
    )
    port map (
      I0 => index(23),
      I1 => index_addsub0000(23),
      I2 => Mcompar_wait_time_cmp_eq0000_cy(15),
      I3 => wait_time_cmp_ge0001,
      O => index_mux0003(23)
    );
  Mmux_index_mux0003151 : LUT4
    generic map(
      INIT => X"ACAA"
    )
    port map (
      I0 => index(22),
      I1 => index_addsub0000(22),
      I2 => Mcompar_wait_time_cmp_eq0000_cy(15),
      I3 => wait_time_cmp_ge0001,
      O => index_mux0003(22)
    );
  Mmux_index_mux0003141 : LUT4
    generic map(
      INIT => X"ACAA"
    )
    port map (
      I0 => index(21),
      I1 => index_addsub0000(21),
      I2 => Mcompar_wait_time_cmp_eq0000_cy(15),
      I3 => wait_time_cmp_ge0001,
      O => index_mux0003(21)
    );
  Mmux_index_mux0003131 : LUT4
    generic map(
      INIT => X"ACAA"
    )
    port map (
      I0 => index(20),
      I1 => index_addsub0000(20),
      I2 => Mcompar_wait_time_cmp_eq0000_cy(15),
      I3 => wait_time_cmp_ge0001,
      O => index_mux0003(20)
    );
  Mmux_index_mux0003111 : LUT4
    generic map(
      INIT => X"ACAA"
    )
    port map (
      I0 => index(19),
      I1 => index_addsub0000(19),
      I2 => Mcompar_wait_time_cmp_eq0000_cy(15),
      I3 => wait_time_cmp_ge0001,
      O => index_mux0003(19)
    );
  Mmux_index_mux0003101 : LUT4
    generic map(
      INIT => X"ACAA"
    )
    port map (
      I0 => index(18),
      I1 => index_addsub0000(18),
      I2 => Mcompar_wait_time_cmp_eq0000_cy(15),
      I3 => wait_time_cmp_ge0001,
      O => index_mux0003(18)
    );
  Mmux_index_mux000391 : LUT4
    generic map(
      INIT => X"ACAA"
    )
    port map (
      I0 => index(17),
      I1 => index_addsub0000(17),
      I2 => Mcompar_wait_time_cmp_eq0000_cy(15),
      I3 => wait_time_cmp_ge0001,
      O => index_mux0003(17)
    );
  Mmux_index_mux000381 : LUT4
    generic map(
      INIT => X"ACAA"
    )
    port map (
      I0 => index(16),
      I1 => index_addsub0000(16),
      I2 => Mcompar_wait_time_cmp_eq0000_cy(15),
      I3 => wait_time_cmp_ge0001,
      O => index_mux0003(16)
    );
  Mmux_index_mux000371 : LUT4
    generic map(
      INIT => X"ACAA"
    )
    port map (
      I0 => index(15),
      I1 => index_addsub0000(15),
      I2 => Mcompar_wait_time_cmp_eq0000_cy(15),
      I3 => wait_time_cmp_ge0001,
      O => index_mux0003(15)
    );
  Mmux_index_mux000361 : LUT4
    generic map(
      INIT => X"ACAA"
    )
    port map (
      I0 => index(14),
      I1 => index_addsub0000(14),
      I2 => Mcompar_wait_time_cmp_eq0000_cy(15),
      I3 => wait_time_cmp_ge0001,
      O => index_mux0003(14)
    );
  Mmux_index_mux000351 : LUT4
    generic map(
      INIT => X"ACAA"
    )
    port map (
      I0 => index(13),
      I1 => index_addsub0000(13),
      I2 => Mcompar_wait_time_cmp_eq0000_cy(15),
      I3 => wait_time_cmp_ge0001,
      O => index_mux0003(13)
    );
  Mmux_index_mux000341 : LUT4
    generic map(
      INIT => X"ACAA"
    )
    port map (
      I0 => index(12),
      I1 => index_addsub0000(12),
      I2 => Mcompar_wait_time_cmp_eq0000_cy(15),
      I3 => wait_time_cmp_ge0001,
      O => index_mux0003(12)
    );
  Mmux_index_mux000331 : LUT4
    generic map(
      INIT => X"ACAA"
    )
    port map (
      I0 => index(11),
      I1 => index_addsub0000(11),
      I2 => Mcompar_wait_time_cmp_eq0000_cy(15),
      I3 => wait_time_cmp_ge0001,
      O => index_mux0003(11)
    );
  Mmux_index_mux000321 : LUT4
    generic map(
      INIT => X"ACAA"
    )
    port map (
      I0 => index(10),
      I1 => index_addsub0000(10),
      I2 => Mcompar_wait_time_cmp_eq0000_cy(15),
      I3 => wait_time_cmp_ge0001,
      O => index_mux0003(10)
    );
  Mmux_index_mux0003321 : LUT4
    generic map(
      INIT => X"ACAA"
    )
    port map (
      I0 => index(9),
      I1 => index_addsub0000(9),
      I2 => Mcompar_wait_time_cmp_eq0000_cy(15),
      I3 => wait_time_cmp_ge0001,
      O => index_mux0003(9)
    );
  Mmux_index_mux0003311 : LUT4
    generic map(
      INIT => X"ACAA"
    )
    port map (
      I0 => index(8),
      I1 => index_addsub0000(8),
      I2 => Mcompar_wait_time_cmp_eq0000_cy(15),
      I3 => wait_time_cmp_ge0001,
      O => index_mux0003(8)
    );
  Mmux_index_mux0003301 : LUT4
    generic map(
      INIT => X"ACAA"
    )
    port map (
      I0 => index(7),
      I1 => index_addsub0000(7),
      I2 => Mcompar_wait_time_cmp_eq0000_cy(15),
      I3 => wait_time_cmp_ge0001,
      O => index_mux0003(7)
    );
  Mmux_index_mux0003291 : LUT4
    generic map(
      INIT => X"ACAA"
    )
    port map (
      I0 => index(6),
      I1 => index_addsub0000(6),
      I2 => Mcompar_wait_time_cmp_eq0000_cy(15),
      I3 => wait_time_cmp_ge0001,
      O => index_mux0003(6)
    );
  Mmux_index_mux0003281 : LUT4
    generic map(
      INIT => X"ACAA"
    )
    port map (
      I0 => index(5),
      I1 => index_addsub0000(5),
      I2 => Mcompar_wait_time_cmp_eq0000_cy(15),
      I3 => wait_time_cmp_ge0001,
      O => index_mux0003(5)
    );
  Mmux_index_mux0003271 : LUT4
    generic map(
      INIT => X"ACAA"
    )
    port map (
      I0 => index(4),
      I1 => index_addsub0000(4),
      I2 => Mcompar_wait_time_cmp_eq0000_cy(15),
      I3 => wait_time_cmp_ge0001,
      O => index_mux0003(4)
    );
  Mmux_index_mux0003261 : LUT4
    generic map(
      INIT => X"ACAA"
    )
    port map (
      I0 => index(3),
      I1 => index_addsub0000(3),
      I2 => Mcompar_wait_time_cmp_eq0000_cy(15),
      I3 => wait_time_cmp_ge0001,
      O => index_mux0003(3)
    );
  Mmux_index_mux0003231 : LUT4
    generic map(
      INIT => X"ACAA"
    )
    port map (
      I0 => index(2),
      I1 => index_addsub0000(2),
      I2 => Mcompar_wait_time_cmp_eq0000_cy(15),
      I3 => wait_time_cmp_ge0001,
      O => index_mux0003(2)
    );
  Mmux_wait_time_mux0003251 : LUT4
    generic map(
      INIT => X"CCCA"
    )
    port map (
      I0 => wait_time(31),
      I1 => wait_time_share0000(31),
      I2 => Mcompar_wait_time_cmp_eq0000_cy(15),
      I3 => wait_time_cmp_ge0001,
      O => wait_time_mux0003(31)
    );
  Mmux_wait_time_mux0003241 : LUT4
    generic map(
      INIT => X"CCCA"
    )
    port map (
      I0 => wait_time(30),
      I1 => wait_time_share0000(30),
      I2 => Mcompar_wait_time_cmp_eq0000_cy(15),
      I3 => wait_time_cmp_ge0001,
      O => wait_time_mux0003(30)
    );
  Mmux_index_mux0003121 : LUT4
    generic map(
      INIT => X"ACAA"
    )
    port map (
      I0 => index(1),
      I1 => index_addsub0000(1),
      I2 => Mcompar_wait_time_cmp_eq0000_cy(15),
      I3 => wait_time_cmp_ge0001,
      O => index_mux0003(1)
    );
  Mmux_wait_time_mux0003221 : LUT4
    generic map(
      INIT => X"CCCA"
    )
    port map (
      I0 => wait_time(29),
      I1 => wait_time_share0000(29),
      I2 => Mcompar_wait_time_cmp_eq0000_cy(15),
      I3 => wait_time_cmp_ge0001,
      O => wait_time_mux0003(29)
    );
  Mmux_wait_time_mux0003211 : LUT4
    generic map(
      INIT => X"CCCA"
    )
    port map (
      I0 => wait_time(28),
      I1 => wait_time_share0000(28),
      I2 => Mcompar_wait_time_cmp_eq0000_cy(15),
      I3 => wait_time_cmp_ge0001,
      O => wait_time_mux0003(28)
    );
  Mmux_wait_time_mux0003201 : LUT4
    generic map(
      INIT => X"CCCA"
    )
    port map (
      I0 => wait_time(27),
      I1 => wait_time_share0000(27),
      I2 => Mcompar_wait_time_cmp_eq0000_cy(15),
      I3 => wait_time_cmp_ge0001,
      O => wait_time_mux0003(27)
    );
  Mmux_wait_time_mux0003191 : LUT4
    generic map(
      INIT => X"CCCA"
    )
    port map (
      I0 => wait_time(26),
      I1 => wait_time_share0000(26),
      I2 => Mcompar_wait_time_cmp_eq0000_cy(15),
      I3 => wait_time_cmp_ge0001,
      O => wait_time_mux0003(26)
    );
  Mmux_wait_time_mux0003181 : LUT4
    generic map(
      INIT => X"CCCA"
    )
    port map (
      I0 => wait_time(25),
      I1 => wait_time_share0000(25),
      I2 => Mcompar_wait_time_cmp_eq0000_cy(15),
      I3 => wait_time_cmp_ge0001,
      O => wait_time_mux0003(25)
    );
  Mmux_wait_time_mux0003171 : LUT4
    generic map(
      INIT => X"CCCA"
    )
    port map (
      I0 => wait_time(24),
      I1 => wait_time_share0000(24),
      I2 => Mcompar_wait_time_cmp_eq0000_cy(15),
      I3 => wait_time_cmp_ge0001,
      O => wait_time_mux0003(24)
    );
  Mmux_wait_time_mux0003161 : LUT4
    generic map(
      INIT => X"CCCA"
    )
    port map (
      I0 => wait_time(23),
      I1 => wait_time_share0000(23),
      I2 => Mcompar_wait_time_cmp_eq0000_cy(15),
      I3 => wait_time_cmp_ge0001,
      O => wait_time_mux0003(23)
    );
  Mmux_wait_time_mux0003151 : LUT4
    generic map(
      INIT => X"CCCA"
    )
    port map (
      I0 => wait_time(22),
      I1 => wait_time_share0000(22),
      I2 => Mcompar_wait_time_cmp_eq0000_cy(15),
      I3 => wait_time_cmp_ge0001,
      O => wait_time_mux0003(22)
    );
  Mmux_wait_time_mux0003141 : LUT4
    generic map(
      INIT => X"CCCA"
    )
    port map (
      I0 => wait_time(21),
      I1 => wait_time_share0000(21),
      I2 => Mcompar_wait_time_cmp_eq0000_cy(15),
      I3 => wait_time_cmp_ge0001,
      O => wait_time_mux0003(21)
    );
  Mmux_wait_time_mux0003131 : LUT4
    generic map(
      INIT => X"CCCA"
    )
    port map (
      I0 => wait_time(20),
      I1 => wait_time_share0000(20),
      I2 => Mcompar_wait_time_cmp_eq0000_cy(15),
      I3 => wait_time_cmp_ge0001,
      O => wait_time_mux0003(20)
    );
  Mmux_wait_time_mux0003111 : LUT4
    generic map(
      INIT => X"CCCA"
    )
    port map (
      I0 => wait_time(19),
      I1 => wait_time_share0000(19),
      I2 => Mcompar_wait_time_cmp_eq0000_cy(15),
      I3 => wait_time_cmp_ge0001,
      O => wait_time_mux0003(19)
    );
  Mmux_wait_time_mux0003101 : LUT4
    generic map(
      INIT => X"CCCA"
    )
    port map (
      I0 => wait_time(18),
      I1 => wait_time_share0000(18),
      I2 => Mcompar_wait_time_cmp_eq0000_cy(15),
      I3 => wait_time_cmp_ge0001,
      O => wait_time_mux0003(18)
    );
  Mmux_wait_time_mux000391 : LUT4
    generic map(
      INIT => X"CCCA"
    )
    port map (
      I0 => wait_time(17),
      I1 => wait_time_share0000(17),
      I2 => Mcompar_wait_time_cmp_eq0000_cy(15),
      I3 => wait_time_cmp_ge0001,
      O => wait_time_mux0003(17)
    );
  Mmux_wait_time_mux000381 : LUT4
    generic map(
      INIT => X"CCCA"
    )
    port map (
      I0 => wait_time(16),
      I1 => wait_time_share0000(16),
      I2 => Mcompar_wait_time_cmp_eq0000_cy(15),
      I3 => wait_time_cmp_ge0001,
      O => wait_time_mux0003(16)
    );
  Mmux_wait_time_mux000371 : LUT4
    generic map(
      INIT => X"CCCA"
    )
    port map (
      I0 => wait_time(15),
      I1 => wait_time_share0000(15),
      I2 => Mcompar_wait_time_cmp_eq0000_cy(15),
      I3 => wait_time_cmp_ge0001,
      O => wait_time_mux0003(15)
    );
  Mmux_wait_time_mux000361 : LUT4
    generic map(
      INIT => X"CCCA"
    )
    port map (
      I0 => wait_time(14),
      I1 => wait_time_share0000(14),
      I2 => Mcompar_wait_time_cmp_eq0000_cy(15),
      I3 => wait_time_cmp_ge0001,
      O => wait_time_mux0003(14)
    );
  Mmux_wait_time_mux000351 : LUT4
    generic map(
      INIT => X"CCCA"
    )
    port map (
      I0 => wait_time(13),
      I1 => wait_time_share0000(13),
      I2 => Mcompar_wait_time_cmp_eq0000_cy(15),
      I3 => wait_time_cmp_ge0001,
      O => wait_time_mux0003(13)
    );
  Mmux_wait_time_mux000341 : LUT4
    generic map(
      INIT => X"CCCA"
    )
    port map (
      I0 => wait_time(12),
      I1 => wait_time_share0000(12),
      I2 => Mcompar_wait_time_cmp_eq0000_cy(15),
      I3 => wait_time_cmp_ge0001,
      O => wait_time_mux0003(12)
    );
  Mmux_wait_time_mux000331 : LUT4
    generic map(
      INIT => X"CCCA"
    )
    port map (
      I0 => wait_time(11),
      I1 => wait_time_share0000(11),
      I2 => Mcompar_wait_time_cmp_eq0000_cy(15),
      I3 => wait_time_cmp_ge0001,
      O => wait_time_mux0003(11)
    );
  Mmux_wait_time_mux000321 : LUT4
    generic map(
      INIT => X"CCCA"
    )
    port map (
      I0 => wait_time(10),
      I1 => wait_time_share0000(10),
      I2 => Mcompar_wait_time_cmp_eq0000_cy(15),
      I3 => wait_time_cmp_ge0001,
      O => wait_time_mux0003(10)
    );
  Mmux_wait_time_mux0003321 : LUT4
    generic map(
      INIT => X"CCCA"
    )
    port map (
      I0 => wait_time(9),
      I1 => wait_time_share0000(9),
      I2 => Mcompar_wait_time_cmp_eq0000_cy(15),
      I3 => wait_time_cmp_ge0001,
      O => wait_time_mux0003(9)
    );
  Mmux_wait_time_mux0003311 : LUT4
    generic map(
      INIT => X"CCCA"
    )
    port map (
      I0 => wait_time(8),
      I1 => wait_time_share0000(8),
      I2 => Mcompar_wait_time_cmp_eq0000_cy(15),
      I3 => wait_time_cmp_ge0001,
      O => wait_time_mux0003(8)
    );
  Mmux_wait_time_mux0003301 : LUT4
    generic map(
      INIT => X"CCCA"
    )
    port map (
      I0 => wait_time(7),
      I1 => wait_time_share0000(7),
      I2 => Mcompar_wait_time_cmp_eq0000_cy(15),
      I3 => wait_time_cmp_ge0001,
      O => wait_time_mux0003(7)
    );
  Mmux_wait_time_mux0003291 : LUT4
    generic map(
      INIT => X"CCCA"
    )
    port map (
      I0 => wait_time(6),
      I1 => wait_time_share0000(6),
      I2 => Mcompar_wait_time_cmp_eq0000_cy(15),
      I3 => wait_time_cmp_ge0001,
      O => wait_time_mux0003(6)
    );
  Mmux_wait_time_mux0003281 : LUT4
    generic map(
      INIT => X"CCCA"
    )
    port map (
      I0 => wait_time(5),
      I1 => wait_time_share0000(5),
      I2 => Mcompar_wait_time_cmp_eq0000_cy(15),
      I3 => wait_time_cmp_ge0001,
      O => wait_time_mux0003(5)
    );
  Mmux_wait_time_mux0003271 : LUT4
    generic map(
      INIT => X"CCCA"
    )
    port map (
      I0 => wait_time(4),
      I1 => wait_time_share0000(4),
      I2 => Mcompar_wait_time_cmp_eq0000_cy(15),
      I3 => wait_time_cmp_ge0001,
      O => wait_time_mux0003(4)
    );
  Mmux_wait_time_mux0003261 : LUT4
    generic map(
      INIT => X"CCCA"
    )
    port map (
      I0 => wait_time(3),
      I1 => wait_time_share0000(3),
      I2 => Mcompar_wait_time_cmp_eq0000_cy(15),
      I3 => wait_time_cmp_ge0001,
      O => wait_time_mux0003(3)
    );
  Mmux_wait_time_mux0003231 : LUT4
    generic map(
      INIT => X"CCCA"
    )
    port map (
      I0 => wait_time(2),
      I1 => wait_time_share0000(2),
      I2 => Mcompar_wait_time_cmp_eq0000_cy(15),
      I3 => wait_time_cmp_ge0001,
      O => wait_time_mux0003(2)
    );
  Mmux_index_mux000311 : LUT4
    generic map(
      INIT => X"ACAA"
    )
    port map (
      I0 => index(0),
      I1 => Madd_index_addsub0000_lut(0),
      I2 => Mcompar_wait_time_cmp_eq0000_cy(15),
      I3 => wait_time_cmp_ge0001,
      O => index_mux0003(0)
    );
  Mmux_wait_time_mux0003121 : LUT4
    generic map(
      INIT => X"CCCA"
    )
    port map (
      I0 => wait_time(1),
      I1 => Madd_wait_time_share0000_lut_1_Q,
      I2 => Mcompar_wait_time_cmp_eq0000_cy(15),
      I3 => wait_time_cmp_ge0001,
      O => wait_time_mux0003(1)
    );
  Mcompar_wait_time_cmp_eq0000_lut_2_Q : LUT4
    generic map(
      INIT => X"6006"
    )
    port map (
      I0 => count_us(4),
      I1 => wait_time(4),
      I2 => count_us(5),
      I3 => databus_add0000(5),
      O => Mcompar_wait_time_cmp_eq0000_lut(2)
    );
  databus_mux0006_4_SW2 : LUT4
    generic map(
      INIT => X"C881"
    )
    port map (
      I0 => index(0),
      I1 => index(2),
      I2 => index(1),
      I3 => index(3),
      O => N13
    );
  databus_mux0006_4_Q : LUT3
    generic map(
      INIT => X"EA"
    )
    port map (
      I0 => N23,
      I1 => RS_mux0005,
      I2 => N13,
      O => databus_mux0006(4)
    );
  Mcompar_wait_time_cmp_ge0001_lut_4_Q : LUT2
    generic map(
      INIT => X"6"
    )
    port map (
      I0 => count_us(4),
      I1 => wait_time(4),
      O => Mcompar_wait_time_cmp_ge0001_lut(4)
    );
  databus_mux0006_4_21 : LUT4
    generic map(
      INIT => X"0004"
    )
    port map (
      I0 => wait_time_cmp_ge00001,
      I1 => databus_cmp_ge0002,
      I2 => databus_cmp_ge0000,
      I3 => databus_cmp_ge0001,
      O => N23
    );
  databus_mux0006_4_11 : LUT3
    generic map(
      INIT => X"08"
    )
    port map (
      I0 => Mcompar_wait_time_cmp_eq0000_cy(15),
      I1 => wait_time_cmp_ge00001,
      I2 => Mcompar_wait_time_cmp_lt0000_cy(8),
      O => RS_mux0005
    );
  databus_mux0006_6_SW1 : LUT4
    generic map(
      INIT => X"FF9F"
    )
    port map (
      I0 => index(3),
      I1 => index(1),
      I2 => index(2),
      I3 => index(0),
      O => N20
    );
  databus_mux0006_6_Q : LUT4
    generic map(
      INIT => X"0800"
    )
    port map (
      I0 => wait_time_cmp_ge00001,
      I1 => Mcompar_wait_time_cmp_eq0000_cy(15),
      I2 => Mcompar_wait_time_cmp_lt0000_cy(8),
      I3 => N20,
      O => databus_mux0006(6)
    );
  databus_mux0006_7_SW1 : LUT4
    generic map(
      INIT => X"8881"
    )
    port map (
      I0 => index(3),
      I1 => index(2),
      I2 => index(0),
      I3 => index(1),
      O => N22
    );
  databus_mux0006_7_Q : LUT4
    generic map(
      INIT => X"0800"
    )
    port map (
      I0 => wait_time_cmp_ge00001,
      I1 => Mcompar_wait_time_cmp_eq0000_cy(15),
      I2 => Mcompar_wait_time_cmp_lt0000_cy(8),
      I3 => N22,
      O => databus_mux0006(7)
    );
  databus_mux0006_0_84_SW0_SW1 : LUT4
    generic map(
      INIT => X"A9AD"
    )
    port map (
      I0 => index(2),
      I1 => index(3),
      I2 => index(0),
      I3 => index(1),
      O => N26
    );
  Unbuf_E_mux0009166 : MUXF5
    port map (
      I0 => N28,
      I1 => N29,
      S => wait_time_cmp_ge00001,
      O => Unbuf_E_mux0009
    );
  Unbuf_E_mux0009166_F : LUT4
    generic map(
      INIT => X"EFEE"
    )
    port map (
      I0 => Unbuf_E_mux000971_761,
      I1 => Unbuf_E_mux0009115_744,
      I2 => databus_cmp_ge0000,
      I3 => Unbuf_E_mux000936_759,
      O => N28
    );
  Unbuf_E_mux0009166_G : LUT3
    generic map(
      INIT => X"DF"
    )
    port map (
      I0 => wait_time_cmp_lt0000,
      I1 => Mcompar_wait_time_cmp_eq0000_cy(15),
      I2 => wait_time_cmp_ge0001,
      O => N29
    );
  Unbuf_E_mux000936 : MUXF5
    port map (
      I0 => N30,
      I1 => N31,
      S => databus_cmp_ge0001,
      O => Unbuf_E_mux000936_759
    );
  Unbuf_E_mux000936_F : LUT4
    generic map(
      INIT => X"AA8A"
    )
    port map (
      I0 => databus_cmp_ge0002,
      I1 => count_us(3),
      I2 => count_us(6),
      I3 => count_us(8),
      O => N30
    );
  Unbuf_E_mux000936_G : LUT3
    generic map(
      INIT => X"FE"
    )
    port map (
      I0 => count_us(3),
      I1 => Unbuf_E_mux000919_745,
      I2 => count_us(8),
      O => N31
    );
  Unbuf_E_mux0009115 : MUXF5
    port map (
      I0 => N32,
      I1 => N33,
      S => databus_cmp_ge0000,
      O => Unbuf_E_mux0009115_744
    );
  Unbuf_E_mux0009115_F : LUT4
    generic map(
      INIT => X"F888"
    )
    port map (
      I0 => N41,
      I1 => N81,
      I2 => databus_cmp_ge0001,
      I3 => count_us(6),
      O => N32
    );
  Unbuf_E_mux0009115_G : LUT4
    generic map(
      INIT => X"FFBF"
    )
    port map (
      I0 => count_us(6),
      I1 => count_us(3),
      I2 => count_us(8),
      I3 => N41,
      O => N33
    );
  wait_time_cmp_ge0000_BUFG : BUFG
    port map (
      I => wait_time_cmp_ge00001,
      O => wait_time_cmp_ge0000
    );
  Madd_wait_time_share0000_lut_1_INV_0 : INV
    port map (
      I => wait_time(1),
      O => Madd_wait_time_share0000_lut_1_Q
    );
  Madd_wait_time_share0000_lut_4_INV_0 : INV
    port map (
      I => wait_time(4),
      O => Madd_wait_time_share0000_lut_4_Q
    );
  Madd_wait_time_share0000_lut_5_INV_0 : INV
    port map (
      I => wait_time(5),
      O => Madd_wait_time_share0000_lut_5_Q
    );
  Madd_databus_add0000_lut_4_INV_0 : INV
    port map (
      I => wait_time(4),
      O => Madd_databus_add0000_lut_4_Q
    );
  Madd_databus_add0000_lut_5_INV_0 : INV
    port map (
      I => wait_time(5),
      O => Madd_databus_add0000_lut_5_Q
    );
  Madd_databus_add0000_lut_6_INV_0 : INV
    port map (
      I => wait_time(6),
      O => Madd_databus_add0000_lut_6_Q
    );
  Madd_databus_add0000_lut_7_INV_0 : INV
    port map (
      I => wait_time(7),
      O => Madd_databus_add0000_lut_7_Q
    );
  Madd_databus_add0000_lut_8_INV_0 : INV
    port map (
      I => wait_time(8),
      O => Madd_databus_add0000_lut_8_Q
    );
  Madd_databus_add0000_lut_10_INV_0 : INV
    port map (
      I => wait_time(10),
      O => Madd_databus_add0000_lut_10_Q
    );
  Madd_databus_add0000_lut_12_INV_0 : INV
    port map (
      I => wait_time(12),
      O => Madd_databus_add0000_lut_12_Q
    );
  Madd_databus_add0000_lut_14_INV_0 : INV
    port map (
      I => wait_time(14),
      O => Madd_databus_add0000_lut_14_Q
    );
  Madd_index_addsub0000_lut_0_INV_0 : INV
    port map (
      I => index(0),
      O => Madd_index_addsub0000_lut(0)
    );
  Mcompar_wait_time_cmp_ge0000_lut_2_INV_0 : INV
    port map (
      I => count_us(9),
      O => Mcompar_wait_time_cmp_ge0000_lut(2)
    );
  Mcompar_wait_time_cmp_ge0000_lut_4_INV_0 : INV
    port map (
      I => count_us(11),
      O => Mcompar_wait_time_cmp_ge0000_lut(4)
    );
  Mcompar_wait_time_cmp_ge0000_lut_6_INV_0 : INV
    port map (
      I => count_us(13),
      O => Mcompar_wait_time_cmp_ge0000_lut(6)
    );
  Mcompar_wait_time_cmp_ge0000_lut_1_INV_0 : INV
    port map (
      I => count_us(4),
      O => Mcompar_wait_time_cmp_ge0000_lut(1)
    );
  Mcompar_wait_time_cmp_ge0000_lut_3_INV_0 : INV
    port map (
      I => count_us(8),
      O => Mcompar_wait_time_cmp_ge0000_lut(3)
    );
  Mcompar_wait_time_cmp_ge0000_lut_3_1_INV_0 : INV
    port map (
      I => count_us(8),
      O => Mcompar_wait_time_cmp_ge0000_lut_3_1
    );
  G1_Madd_cnt_add0000_lut_0_INV_0 : INV
    port map (
      I => G1_cnt(0),
      O => G1_Madd_cnt_add0000_lut(0)
    );
  G1_Mcount_cnt_lut_0_INV_0 : INV
    port map (
      I => G1_cnt(0),
      O => G1_Mcount_cnt_lut(0)
    );
  Mcount_count_us_lut_0_INV_0 : INV
    port map (
      I => count_us(0),
      O => Mcount_count_us_lut(0)
    );
  Mcompar_wait_time_cmp_lt0000_cy_8_inv_INV_0 : INV
    port map (
      I => Mcompar_wait_time_cmp_lt0000_cy(8),
      O => wait_time_cmp_lt0000
    );
  Mcompar_wait_time_cmp_ge0000_lut_11_11_INV_0 : INV
    port map (
      I => count_us(31),
      O => Mcompar_wait_time_cmp_ge0000_lut_11_1
    );
  Mcompar_wait_time_cmp_ge0000_lut_11_21_INV_0 : INV
    port map (
      I => count_us(31),
      O => Mcompar_wait_time_cmp_ge0000_lut_11_2
    );
  Mcompar_wait_time_cmp_ge0000_lut_12_1_INV_0 : INV
    port map (
      I => count_us(31),
      O => Mcompar_wait_time_cmp_ge0000_lut(12)
    );
  Mcompar_wait_time_cmp_ge0000_lut_9_31_INV_0 : INV
    port map (
      I => count_us(31),
      O => Mcompar_wait_time_cmp_ge0000_lut_9_3
    );
  Mcompar_wait_time_cmp_ge0001_lut_0_1_INV_0 : INV
    port map (
      I => count_us(0),
      O => Mcompar_wait_time_cmp_ge0001_lut(0)
    );
  Mcompar_wait_time_cmp_lt0000_lut_8_1_INV_0 : INV
    port map (
      I => index(31),
      O => Mcompar_wait_time_cmp_lt0000_lut(8)
    );
  databus_mux0006_0_841 : LUT3
    generic map(
      INIT => X"EF"
    )
    port map (
      I0 => N26,
      I1 => Mcompar_wait_time_cmp_lt0000_cy(8),
      I2 => Mcompar_wait_time_cmp_eq0000_cy(15),
      O => databus_mux0006_0_84
    );
  databus_mux0006_0_842 : LUT2
    generic map(
      INIT => X"E"
    )
    port map (
      I0 => databus_cmp_ge0001,
      I1 => databus_cmp_ge0000,
      O => databus_mux0006_0_841_842
    );
  databus_mux0006_0_84_f5 : MUXF5
    port map (
      I0 => databus_mux0006_0_841_842,
      I1 => databus_mux0006_0_84,
      S => wait_time_cmp_ge00001,
      O => databus_mux0006(0)
    );
  G1_CLK1MHz_cmp_eq0000_SW0 : LUT2_L
    generic map(
      INIT => X"E"
    )
    port map (
      I0 => G1_cnt(0),
      I1 => G1_cnt_add0000(1),
      LO => N9
    );
  G1_cnt_cmp_eq0000_SW0 : LUT2_L
    generic map(
      INIT => X"7"
    )
    port map (
      I0 => G1_cnt_add0000(1),
      I1 => G1_cnt(0),
      LO => N11
    );

end Structure;

