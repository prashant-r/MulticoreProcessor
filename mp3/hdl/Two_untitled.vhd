--
-- VHDL Architecture ece411.Two.untitled
--
-- Created:
--          by - ravi7.ews (linux-a1.ews.illinois.edu)
--          at - 14:04:13 02/23/14
--
-- using Mentor Graphics HDL Designer(TM) 2012.1 (Build 6)
--
LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.NUMERIC_STD.all;

LIBRARY ece411;
USE ece411.LC3b_types.all;

ENTITY Two IS
   PORT( 
      is2 : OUT    std_logic_vector (3 DOWNTO 0)
   );

-- Declarations

END Two ;

--
ARCHITECTURE untitled OF Two IS
BEGIN
  is2 <= "0100";
END ARCHITECTURE untitled;
