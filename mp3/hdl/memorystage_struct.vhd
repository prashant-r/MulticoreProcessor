-- VHDL Entity ece411.MemoryStage.interface
--
-- Created:
--          by - ravi7.ews (linux-a1.ews.illinois.edu)
--          at - 21:21:19 03/27/14
--
-- Generated by Mentor Graphics' HDL Designer(TM) 2012.1 (Build 6)
--
LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.NUMERIC_STD.all;

LIBRARY ece411;
USE ece411.LC3b_types.all;

ENTITY MemoryStage IS
   PORT( 
      DATA_DATAIN     : IN     LC3b_word;
      DATA_MRESP_H    : IN     std_logic;
      MEM_ALUout      : IN     LC3b_word;
      MEM_Control     : IN     CONTROL_WORD;
      MEM_SRCA        : IN     STD_LOGIC_VECTOR (15 DOWNTO 0);
      Mem_CC          : IN     LC3b_reg;
      Mem_IR          : IN     LC3b_word;
      Mem_SrcB        : IN     std_logic_vector (15 DOWNTO 0);
      Mem_nextPC      : IN     LC3b_word;
      RESET_L         : IN     STD_LOGIC;
      clk             : IN     std_logic;
      DATA_ADDRESS    : OUT    LC3b_word;
      DATA_DATAOUT    : OUT    LC3b_word;
      DATA_MREAD_L    : OUT    std_logic;
      DATA_MWRITEH_L  : OUT    std_logic;
      DATA_MWRITEL_L  : OUT    std_logic;
      MEM_NEXTPC_OUT  : OUT    LC3b_word;
      Mem_ALU_Out     : OUT    LC3b_word;
      Mem_Address     : OUT    LC3b_word;
      Mem_CC_out      : OUT    LC3b_cc;
      Mem_Control_out : OUT    CONTROL_WORD;
      Mem_IR_Out      : OUT    LC3b_word;
      Mem_dataout     : OUT    LC3b_word;
      PCMuxSelect_Mem : OUT    std_logic;
      TARGET_PC       : OUT    LC3b_word
   );

-- Declarations

END MemoryStage ;

--
-- VHDL Architecture ece411.MemoryStage.struct
--
-- Created:
--          by - ravi7.ews (linux-a1.ews.illinois.edu)
--          at - 21:21:19 03/27/14
--
-- Generated by Mentor Graphics' HDL Designer(TM) 2012.1 (Build 6)
--
LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.NUMERIC_STD.all;

LIBRARY ece411;
USE ece411.LC3b_types.all;


ARCHITECTURE struct OF MemoryStage IS

   -- Architecture declarations

   -- Internal signal declarations
   SIGNAL ADJ6out         : LC3b_word;
   SIGNAL DATA_MREAD_L1   : std_logic;
   SIGNAL DATA_MWRITEH_L1 : std_logic;
   SIGNAL DATA_MWRITEL_L1 : std_logic;
   SIGNAL adj9out         : LC3b_word;
   SIGNAL index6          : LC3b_index6;
   SIGNAL offset9         : LC3b_offset9;


   -- Component Declarations
   COMPONENT ADj66
   PORT (
      RESET_L : IN     STD_LOGIC;
      clk     : IN     std_logic;
      index6  : IN     LC3b_index6;
      ADJ6out : OUT    LC3b_word
   );
   END COMPONENT;
   COMPONENT ADj99
   PORT (
      RESET_L : IN     STD_LOGIC;
      clk     : IN     std_logic;
      offset9 : IN     LC3b_offset9;
      adj9out : OUT    LC3b_word
   );
   END COMPONENT;
   COMPONENT BitSelector
   PORT (
      clk           : IN     std_logic;
      regA_inst_out : IN     LC3b_word;
      Imm5          : OUT    lc3b_imm5;
      NZP           : OUT    LC3b_cc;
      Opcode        : OUT    LC3b_opcode;
      SRCB          : OUT    LC3b_reg;
      SrcA          : OUT    LC3b_reg;
      bit5          : OUT    std_logic;
      dest          : OUT    LC3b_reg;
      index6        : OUT    LC3b_index6;
      offset6       : OUT    LC3b_index6;
      offset9       : OUT    LC3b_offset9
   );
   END COMPONENT;
   COMPONENT Control_slice
   PORT (
      Control_ID  : IN     CONTROL_WORD;
      RESET_L     : IN     STD_LOGIC;
      clk         : IN     std_logic;
      ALUop_ID    : OUT    LC3b_aluop;
      LD_reg_h    : OUT    std_logic;
      PCMuxSel    : OUT    STd_logic;
      Set_cc_h    : OUT    std_logic;
      dataMuXsel  : OUT    std_logic_vector (1 DOWNTO 0);
      mread_l     : OUT    std_logic;
      mwriteh_l   : OUT    std_logic;
      mwritel_l   : OUT    std_logic;
      srcb_select : OUT    std_logic
   );
   END COMPONENT;
   COMPONENT Delayer
   PORT (
      A : IN     STD_LOGIC;
      F : OUT    STD_LOGIC
   );
   END COMPONENT;
   COMPONENT Delayer_16
   PORT (
      A : IN     std_logic_vector (15 DOWNTO 0);
      F : OUT    std_logic_vector (15 DOWNTO 0)
   );
   END COMPONENT;
   COMPONENT Plus4
   PORT (
      Mem_nextPC : IN     LC3b_word;
      RESET_L    : IN     STD_LOGIC;
      adj9out    : IN     LC3b_word;
      clk        : IN     std_logic;
      TARGET_PC  : OUT    LC3b_word
   );
   END COMPONENT;

   -- Optional embedded configurations
   -- pragma synthesis_off
   FOR ALL : ADj66 USE ENTITY ece411.ADj66;
   FOR ALL : ADj99 USE ENTITY ece411.ADj99;
   FOR ALL : BitSelector USE ENTITY ece411.BitSelector;
   FOR ALL : Control_slice USE ENTITY ece411.Control_slice;
   FOR ALL : Delayer USE ENTITY ece411.Delayer;
   FOR ALL : Delayer_16 USE ENTITY ece411.Delayer_16;
   FOR ALL : Plus4 USE ENTITY ece411.Plus4;
   -- pragma synthesis_on


BEGIN
   -- Architecture concurrent statements
   -- HDL Embedded Text Block 1 eb1
   -- eb1 1
   Mem_Control_out <= MEM_Control;
   Mem_IR_Out <= Mem_IR;
   Mem_NextPC_Out <= Mem_NextPC;
   Mem_ALU_Out <= Mem_ALUout;
   Mem_CC_out <= Mem_cc; 
   Mem_dataout <= DATA_DATAIN ;                                


   -- Instance port mappings.
   U_4 : ADj66
      PORT MAP (
         RESET_L => RESET_L,
         clk     => clk,
         index6  => index6,
         ADJ6out => ADJ6out
      );
   U_2 : ADj99
      PORT MAP (
         RESET_L => RESET_L,
         clk     => clk,
         adj9out => adj9out,
         offset9 => offset9
      );
   U_3 : BitSelector
      PORT MAP (
         clk           => clk,
         regA_inst_out => Mem_IR,
         Imm5          => OPEN,
         NZP           => OPEN,
         Opcode        => OPEN,
         SRCB          => OPEN,
         SrcA          => OPEN,
         bit5          => OPEN,
         dest          => OPEN,
         index6        => OPEN,
         offset9       => offset9,
         offset6       => index6
      );
   U_0 : Control_slice
      PORT MAP (
         Control_ID  => MEM_Control,
         RESET_L     => RESET_L,
         clk         => clk,
         ALUop_ID    => OPEN,
         dataMuXsel  => OPEN,
         LD_reg_h    => OPEN,
         Set_cc_h    => OPEN,
         PCMuxSel    => PCMuxSelect_Mem,
         mread_l     => DATA_MREAD_L1,
         mwritel_l   => DATA_MWRITEL_L1,
         mwriteh_l   => DATA_MWRITEH_L1,
         srcb_select => OPEN
      );
   U_7 : Delayer
      PORT MAP (
         A => DATA_MWRITEH_L1,
         F => DATA_MWRITEH_L
      );
   U_8 : Delayer
      PORT MAP (
         A => DATA_MWRITEL_L1,
         F => DATA_MWRITEL_L
      );
   U_9 : Delayer
      PORT MAP (
         A => DATA_MREAD_L1,
         F => DATA_MREAD_L
      );
   U_10 : Delayer_16
      PORT MAP (
         A => Mem_SrcB,
         F => DATA_DATAOUT
      );
   U_1 : Plus4
      PORT MAP (
         Mem_nextPC => Mem_nextPC,
         RESET_L    => RESET_L,
         clk        => clk,
         TARGET_PC  => TARGET_PC,
         adj9out    => adj9out
      );
   U_5 : Plus4
      PORT MAP (
         Mem_nextPC => MEM_SRCA,
         RESET_L    => RESET_L,
         clk        => clk,
         TARGET_PC  => DATA_ADDRESS,
         adj9out    => ADJ6out
      );

END struct;