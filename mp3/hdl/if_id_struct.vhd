-- VHDL Entity ece411.IF_ID.interface
--
-- Created:
--          by - ravi7.ews (linux-a1.ews.illinois.edu)
--          at - 22:12:08 03/22/14
--
-- Generated by Mentor Graphics' HDL Designer(TM) 2012.1 (Build 6)
--
LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.NUMERIC_STD.all;

LIBRARY ece411;
USE ece411.LC3b_types.all;

ENTITY IF_ID IS
   PORT( 
      PCPlus2out   : IN     LC3b_word;
      RESET_L      : IN     STD_LOGIC;
      clk          : IN     std_logic;
      ifetch_out   : IN     LC3b_word;
      ifetch_ready : IN     std_logic;
      set_regA     : IN     std_logic;
      IR           : OUT    LC3b_word;
      regA_pc_out  : OUT    LC3b_word
   );

-- Declarations

END IF_ID ;

--
-- VHDL Architecture ece411.IF_ID.struct
--
-- Created:
--          by - ravi7.ews (linux-a1.ews.illinois.edu)
--          at - 22:12:08 03/22/14
--
-- Generated by Mentor Graphics' HDL Designer(TM) 2012.1 (Build 6)
--
LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.NUMERIC_STD.all;

LIBRARY ece411;
USE ece411.LC3b_types.all;

LIBRARY mp3lib;

ARCHITECTURE struct OF IF_ID IS

   -- Architecture declarations

   -- Internal signal declarations
   SIGNAL A : LC3b_word;
   SIGNAL F : LC3b_word;


   -- Component Declarations
   COMPONENT WordMux2
   PORT (
      A   : IN     LC3b_word ;
      B   : IN     LC3b_word ;
      Sel : IN     std_logic ;
      F   : OUT    LC3b_word 
   );
   END COMPONENT;
   COMPONENT doesNothing
   PORT (
      clk : IN     std_logic ;
      A   : OUT    LC3b_word 
   );
   END COMPONENT;
   COMPONENT REG16
   PORT (
      RESET_L : IN     STD_LOGIC ;
      A       : IN     STD_LOGIC_VECTOR (15 DOWNTO 0);
      EN      : IN     STD_LOGIC ;
      CLK     : IN     STD_LOGIC ;
      F       : OUT    STD_LOGIC_VECTOR (15 DOWNTO 0)
   );
   END COMPONENT;

   -- Optional embedded configurations
   -- pragma synthesis_off
   FOR ALL : REG16 USE ENTITY mp3lib.REG16;
   FOR ALL : WordMux2 USE ENTITY ece411.WordMux2;
   FOR ALL : doesNothing USE ENTITY ece411.doesNothing;
   -- pragma synthesis_on


BEGIN

   -- Instance port mappings.
   U_2 : WordMux2
      PORT MAP (
         A   => A,
         B   => ifetch_out,
         Sel => ifetch_ready,
         F   => F
      );
   U_3 : doesNothing
      PORT MAP (
         clk => clk,
         A   => A
      );
   U_0 : REG16
      PORT MAP (
         RESET_L => RESET_L,
         A       => PCPlus2out,
         EN      => set_regA,
         CLK     => clk,
         F       => regA_pc_out
      );
   U_1 : REG16
      PORT MAP (
         RESET_L => RESET_L,
         A       => F,
         EN      => set_regA,
         CLK     => clk,
         F       => IR
      );

END struct;