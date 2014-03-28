--
-- VHDL Architecture ece411.asext11.untitled
--
-- Created:
--          by - ravi7.ews (linux-a1.ews.illinois.edu)
--          at - 02:11:35 02/02/14
--
-- using Mentor Graphics HDL Designer(TM) 2012.1 (Build 6)
--
LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.NUMERIC_STD.all;

LIBRARY ece411;
USE ece411.LC3b_types.all;

ENTITY asext11 IS
   PORT( 
      clk      : IN     std_logic;
      offset11 : IN     LC3b_offset11;
      ADJ11    : OUT    LC3b_word
   );

-- Declarations

END asext11 ;

--
ARCHITECTURE untitled OF asext11 IS
BEGIN
  ADJ11 <= offset11(10) & offset11(10) & offset11(10) & offset11(10) & offset11 & '0' AFTER DELAY_MUX2;

END ARCHITECTURE untitled;