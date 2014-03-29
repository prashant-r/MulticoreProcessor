-- VHDL Entity ece411.CacheMoney.interface
--
-- Created:
--          by - ravi7.ews (linux-a1.ews.illinois.edu)
--          at - 01:25:40 03/28/14
--
-- Generated by Mentor Graphics' HDL Designer(TM) 2012.1 (Build 6)
--
LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.NUMERIC_STD.all;

LIBRARY ece411;
USE ece411.LC3b_types.all;

ENTITY CacheMoney IS
   PORT( 
      D_ADDRESS   : IN     LC3b_word;
      D_DataOut   : IN     LC3b_word;
      D_MREAD_L   : IN     std_logic;
      D_MWRITEH_L : IN     std_logic;
      D_MWRITEL_L : IN     std_logic;
      I_ADDRESS   : IN     LC3b_word;
      I_MREAD_L   : IN     std_logic;
      clk         : IN     std_logic;
      reset_l     : IN     std_logic;
      D_DATAIN    : OUT    LC3B_WORD;
      D_MRESP_H   : OUT    std_logic;
      I_DataIn    : OUT    LC3b_word;
      I_MRESP_H   : OUT    std_logic
   );

-- Declarations

END CacheMoney ;

--
-- VHDL Architecture ece411.CacheMoney.struct
--
-- Created:
--          by - ravi7.ews (linux-a1.ews.illinois.edu)
--          at - 01:25:41 03/28/14
--
-- Generated by Mentor Graphics' HDL Designer(TM) 2012.1 (Build 6)
--
LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.NUMERIC_STD.all;

LIBRARY ece411;
USE ece411.LC3b_types.all;


ARCHITECTURE struct OF CacheMoney IS

   -- Architecture declarations

   -- Internal signal declarations
   SIGNAL D_PMADDRESS : LC3b_word;
   SIGNAL D_PMDATAOUT : LC3b_oword;
   SIGNAL D_PMREAD_L  : std_logic;
   SIGNAL D_PMRESP_H  : STD_LOGIC;
   SIGNAL D_PMWRITE_L : std_logic;
   SIGNAL DataOut     : LC3b_word;
   SIGNAL I_PMADDRESS : LC3b_word;
   SIGNAL I_PMDATAOUT : LC3b_oword;
   SIGNAL I_PMREAD_L  : std_logic;
   SIGNAL I_PMRESP_H  : STD_LOGIC;
   SIGNAL I_PMWRITE_L : std_logic;
   SIGNAL MWRITEH_L   : std_logic;
   SIGNAL PMADDRESS   : LC3b_word;
   SIGNAL PMDATAIN    : LC3b_oWORD;
   SIGNAL PMDATAOUT   : LC3b_oword;
   SIGNAL PMREAD_L    : STD_LOGIC;
   SIGNAL PMRESP_H    : std_logic;
   SIGNAL PMWRITE_L   : STD_LOGIC;
   SIGNAL mwritel_l   : std_logic;


   -- Component Declarations
   COMPONENT Arbiter
   PORT (
      D_PMADDRESS : IN     LC3b_word ;
      D_PMDATAOUT : IN     LC3b_oword ;
      D_PMREAD_L  : IN     std_logic ;
      D_PMWRITE_L : IN     std_logic ;
      I_PMADDRESS : IN     LC3b_word ;
      I_PMDATAOUT : IN     LC3b_oword ;
      I_PMREAD_L  : IN     std_logic ;
      I_PMWRITE_L : IN     std_logic ;
      PMRESP_H    : IN     std_logic ;
      clk         : IN     std_logic ;
      reset_l     : IN     std_logic ;
      D_PMRESP_H  : OUT    STD_LOGIC ;
      I_PMRESP_H  : OUT    STD_LOGIC ;
      PMADDRESS   : OUT    LC3b_word ;
      PMDATAOUT   : OUT    LC3b_oword ;
      PMREAD_L    : OUT    STD_LOGIC ;
      PMWRITE_L   : OUT    STD_LOGIC 
   );
   END COMPONENT;
   COMPONENT L1CacheSet
   PORT (
      clk       : IN     std_logic ;
      ADDRESS   : IN     LC3b_word ;
      MWRITEH_L : IN     std_logic ;
      DataOut   : IN     LC3b_word ;
      MREAD_L   : IN     std_logic ;
      mwritel_l : IN     std_logic ;
      RESET_L   : IN     std_logic ;
      DataIn    : OUT    LC3b_word ;
      PMADDRESS : OUT    LC3B_WORD ;
      PMDATAOUT : OUT    LC3b_oword ;
      PMDATAIN  : IN     lc3b_oword ;
      PMWRITE_L : OUT    STD_LOGIC ;
      PMREAD_L  : OUT    STD_LOGIC ;
      PMRESP_H  : IN     STD_LOGIC ;
      mresp_h   : OUT    STD_LOGIC 
   );
   END COMPONENT;
   COMPONENT Main_PM
   PORT (
      PMADDRESS : IN     LC3b_word ;
      PMDATAOUT : IN     LC3b_oword ;
      PMREAD_L  : IN     STD_LOGIC ;
      PMWRITE_L : IN     STD_LOGIC ;
      reset_l   : IN     std_logic ;
      clk       : IN     std_logic ;
      PMDATAIN  : OUT    LC3b_oWORD ;
      PMRESP_H  : OUT    std_logic 
   );
   END COMPONENT;

   -- Optional embedded configurations
   -- pragma synthesis_off
   FOR ALL : Arbiter USE ENTITY ece411.Arbiter;
   FOR ALL : L1CacheSet USE ENTITY ece411.L1CacheSet;
   FOR ALL : Main_PM USE ENTITY ece411.Main_PM;
   -- pragma synthesis_on


BEGIN

   -- Instance port mappings.
   CacheSetArbiter : Arbiter
      PORT MAP (
         D_PMADDRESS => D_PMADDRESS,
         D_PMDATAOUT => D_PMDATAOUT,
         D_PMREAD_L  => D_PMREAD_L,
         D_PMWRITE_L => D_PMWRITE_L,
         I_PMADDRESS => I_PMADDRESS,
         I_PMDATAOUT => I_PMDATAOUT,
         I_PMREAD_L  => I_PMREAD_L,
         I_PMWRITE_L => I_PMWRITE_L,
         PMRESP_H    => PMRESP_H,
         clk         => clk,
         reset_l     => reset_l,
         D_PMRESP_H  => D_PMRESP_H,
         I_PMRESP_H  => I_PMRESP_H,
         PMADDRESS   => PMADDRESS,
         PMDATAOUT   => PMDATAOUT,
         PMREAD_L    => PMREAD_L,
         PMWRITE_L   => PMWRITE_L
      );
   U_0 : L1CacheSet
      PORT MAP (
         clk       => clk,
         ADDRESS   => I_ADDRESS,
         MWRITEH_L => MWRITEH_L,
         DataOut   => DataOut,
         MREAD_L   => I_MREAD_L,
         mwritel_l => mwritel_l,
         RESET_L   => reset_l,
         DataIn    => I_DataIn,
         PMADDRESS => I_PMADDRESS,
         PMDATAOUT => I_PMDATAOUT,
         PMDATAIN  => PMDATAIN,
         PMWRITE_L => I_PMWRITE_L,
         PMREAD_L  => I_PMREAD_L,
         PMRESP_H  => I_PMRESP_H,
         mresp_h   => I_MRESP_H
      );
   U_1 : L1CacheSet
      PORT MAP (
         clk       => clk,
         ADDRESS   => D_ADDRESS,
         MWRITEH_L => D_MWRITEH_L,
         DataOut   => D_DataOut,
         MREAD_L   => D_MREAD_L,
         mwritel_l => D_MWRITEL_L,
         RESET_L   => reset_l,
         DataIn    => D_DATAIN,
         PMADDRESS => D_PMADDRESS,
         PMDATAOUT => D_PMDATAOUT,
         PMDATAIN  => PMDATAIN,
         PMWRITE_L => D_PMWRITE_L,
         PMREAD_L  => D_PMREAD_L,
         PMRESP_H  => D_PMRESP_H,
         mresp_h   => D_MRESP_H
      );
   DRAM_init : Main_PM
      PORT MAP (
         PMADDRESS => PMADDRESS,
         PMDATAOUT => PMDATAOUT,
         PMREAD_L  => PMREAD_L,
         PMWRITE_L => PMWRITE_L,
         reset_l   => reset_l,
         clk       => clk,
         PMDATAIN  => PMDATAIN,
         PMRESP_H  => PMRESP_H
      );

END struct;