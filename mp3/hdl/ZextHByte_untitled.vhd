--
-- VHDL Architecture ece411.ZextHByte.untitled
--
-- Created:
--          by - ravi7.ews (linux-a1.ews.illinois.edu)
--          at - 03:30:43 02/06/14
--
-- using Mentor Graphics HDL Designer(TM) 2012.1 (Build 6)
--
LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.NUMERIC_STD.all;

LIBRARY ece411;
USE ece411.LC3b_types.all;

ENTITY ZextHByte IS
   PORT( 
      MDRout : IN     LC3b_word;
      clk    : IN     std_logic;
      zHout  : OUT    LC3b_word
   );

-- Declarations

END ZextHByte ;

--
ARCHITECTURE untitled OF ZextHByte IS
BEGIN
  
  ZHout <= x"00" & MDRout(15 downto 8);
END ARCHITECTURE untitled;

