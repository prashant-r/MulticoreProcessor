--
-- VHDL Architecture ece411.Plus2.untitled
--
-- Created:
--          by - ravi7.ews (linux-a2.ews.illinois.edu)
--          at - 04:06:10 12/31/13
--
-- using Mentor Graphics HDL Designer(TM) 2012.1 (Build 6)
--
LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.NUMERIC_STD.all;

LIBRARY ece411;
USE ece411.LC3b_types.all;

ENTITY Add2 IS
   PORT( 
      PCout      : IN     LC3b_word;
      clk        : IN     std_logic;
      PCPlus2out : OUT    LC3b_word
   );

-- Declarations

END Add2 ;

ARCHITECTURE UNTITLED OF Add2 IS
BEGIN
	VHDL_ADD_2 : PROCESS (PCOUT)
	BEGIN  -- PROCESS
		PCPLUS2OUT <= STD_LOGIC_VECTOR(UNSIGNED(PCOUT) + 2 ) AFTER DELAY_ADDER;
	END PROCESS;
END ARCHITECTURE UNTITLED;
