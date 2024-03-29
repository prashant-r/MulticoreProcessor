--
-- VHDL Architecture ece411.clock_delay.untitled
--
-- Created:
--          by - ravi7.ews (siebl-0220-20.ews.illinois.edu)
--          at - 13:00:17 02/28/14
--
-- using Mentor Graphics HDL Designer(TM) 2012.1 (Build 6)
--
LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.NUMERIC_STD.all;

LIBRARY ece411;
USE ece411.LC3b_types.all;

ENTITY clock_delay IS
   PORT( 
      clk : IN     std_logic;
      B   : OUT    STD_LOGIC
   );

-- Declarations

END clock_delay ;

--
ARCHITECTURE untitled OF clock_delay IS
BEGIN
  	B <= clk'delayed(24 ns) AND (NOT clk);
END ARCHITECTURE untitled;

