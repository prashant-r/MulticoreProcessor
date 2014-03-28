-- VHDL Entity ece411.Arbiter.interface
--
-- Created:
--          by - ravi7.ews (linux-a1.ews.illinois.edu)
--          at - 01:24:42 03/28/14
--
-- Generated by Mentor Graphics' HDL Designer(TM) 2012.1 (Build 6)
--
LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.NUMERIC_STD.all;

LIBRARY ece411;
USE ece411.LC3b_types.all;

ENTITY Arbiter IS
   PORT( 
      D_PMADDRESS : IN     LC3b_word;
      D_PMDATAOUT : IN     LC3b_oword;
      D_PMREAD_L  : IN     std_logic;
      D_PMWRITE_L : IN     std_logic;
      I_PMADDRESS : IN     LC3b_word;
      I_PMDATAOUT : IN     LC3b_oword;
      I_PMREAD_L  : IN     std_logic;
      I_PMWRITE_L : IN     std_logic;
      PMRESP_H    : IN     std_logic;
      clk         : IN     std_logic;
      reset_l     : IN     std_logic;
      D_PMRESP_H  : OUT    STD_LOGIC;
      I_PMRESP_H  : OUT    STD_LOGIC;
      PMADDRESS   : OUT    LC3b_word;
      PMDATAOUT   : OUT    LC3b_oword;
      PMREAD_L    : OUT    STD_LOGIC;
      PMWRITE_L   : OUT    STD_LOGIC
   );

-- Declarations

END Arbiter ;

--
-- VHDL Architecture ece411.Arbiter.struct
--
-- Created:
--          by - ravi7.ews (linux-a1.ews.illinois.edu)
--          at - 01:24:42 03/28/14
--
-- Generated by Mentor Graphics' HDL Designer(TM) 2012.1 (Build 6)
--
LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.NUMERIC_STD.all;

LIBRARY ece411;
USE ece411.LC3b_types.all;

LIBRARY mp3lib;

ARCHITECTURE struct OF Arbiter IS

   -- Architecture declarations

   -- Internal signal declarations
   SIGNAL D_request : STD_LOGIC;
   SIGNAL F         : STD_LOGIC;
   SIGNAL F1        : STD_LOGIC;
   SIGNAL F2        : STD_LOGIC;
   SIGNAL I_request : STD_LOGIC;
   SIGNAL Sel       : std_logic;


   -- Component Declarations
   COMPONENT AND2
   PORT (
      A : IN     STD_LOGIC;
      B : IN     STD_LOGIC;
      F : OUT    STD_LOGIC
   );
   END COMPONENT;
   COMPONENT ArbiterStateMachine
   PORT (
      D_request : IN     STD_LOGIC ;
      I_request : IN     STD_LOGIC ;
      clk       : IN     std_logic ;
      reset_l   : IN     std_logic ;
      Sel       : OUT    std_logic 
   );
   END COMPONENT;
   COMPONENT MUX2_1
   PORT (
      A   : IN     STD_LOGIC;
      B   : IN     STD_LOGIC;
      SEL : IN     STD_LOGIC;
      F   : OUT    STD_LOGIC
   );
   END COMPONENT;
   COMPONENT NOT1
   PORT (
      A : IN     STD_LOGIC;
      F : OUT    STD_LOGIC
   );
   END COMPONENT;
   COMPONENT OR2
   PORT (
      A : IN     STD_LOGIC;
      B : IN     STD_LOGIC;
      F : OUT    STD_LOGIC
   );
   END COMPONENT;
   COMPONENT WordMux2
   PORT (
      A   : IN     LC3b_word ;
      B   : IN     LC3b_word ;
      Sel : IN     std_logic ;
      F   : OUT    LC3b_word 
   );
   END COMPONENT;
   COMPONENT o_wordMux2
   PORT (
      A    : IN     lc3b_oword ;
      B    : IN     lc3b_oword ;
      Sel  : IN     std_logic ;
      Fmux : OUT    lc3b_oword 
   );
   END COMPONENT;
   COMPONENT NAND2
   PORT (
      A : IN     STD_LOGIC ;
      B : IN     STD_LOGIC ;
      F : OUT    STD_LOGIC 
   );
   END COMPONENT;

   -- Optional embedded configurations
   -- pragma synthesis_off
   FOR ALL : AND2 USE ENTITY ece411.AND2;
   FOR ALL : ArbiterStateMachine USE ENTITY ece411.ArbiterStateMachine;
   FOR ALL : MUX2_1 USE ENTITY ece411.MUX2_1;
   FOR ALL : NAND2 USE ENTITY mp3lib.NAND2;
   FOR ALL : NOT1 USE ENTITY ece411.NOT1;
   FOR ALL : OR2 USE ENTITY ece411.OR2;
   FOR ALL : WordMux2 USE ENTITY ece411.WordMux2;
   FOR ALL : o_wordMux2 USE ENTITY ece411.o_wordMux2;
   -- pragma synthesis_on


BEGIN

   -- Instance port mappings.
   U_7 : AND2
      PORT MAP (
         A => F,
         B => D_PMWRITE_L,
         F => F1
      );
   U_9 : AND2
      PORT MAP (
         A => Sel,
         B => PMRESP_H,
         F => I_PMRESP_H
      );
   U_10 : AND2
      PORT MAP (
         A => F2,
         B => PMRESP_H,
         F => D_PMRESP_H
      );
   U_2 : ArbiterStateMachine
      PORT MAP (
         D_request => D_request,
         I_request => I_request,
         clk       => clk,
         reset_l   => reset_l,
         Sel       => Sel
      );
   U_3 : MUX2_1
      PORT MAP (
         A   => D_PMREAD_L,
         B   => I_PMREAD_L,
         SEL => Sel,
         F   => PMREAD_L
      );
   U_6 : NOT1
      PORT MAP (
         A => Sel,
         F => F
      );
   U_11 : NOT1
      PORT MAP (
         A => Sel,
         F => F2
      );
   U_8 : OR2
      PORT MAP (
         A => Sel,
         B => F1,
         F => PMWRITE_L
      );
   U_5 : WordMux2
      PORT MAP (
         A   => D_PMADDRESS,
         B   => I_PMADDRESS,
         Sel => Sel,
         F   => PMADDRESS
      );
   U_4 : o_wordMux2
      PORT MAP (
         A    => D_PMDATAOUT,
         B    => I_PMDATAOUT,
         Sel  => Sel,
         Fmux => PMDATAOUT
      );
   U_0 : NAND2
      PORT MAP (
         A => D_PMREAD_L,
         B => D_PMWRITE_L,
         F => D_request
      );
   U_1 : NAND2
      PORT MAP (
         A => I_PMREAD_L,
         B => I_PMREAD_L,
         F => I_request
      );

END struct;
