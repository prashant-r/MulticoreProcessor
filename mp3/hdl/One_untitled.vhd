--
-- VHDL Architecture ece411.One.untitled
--
-- Created:
--          by - ravi7.ews (linux-a1.ews.illinois.edu)
--          at - 14:03:29 02/23/14
--
-- using Mentor Graphics HDL Designer(TM) 2012.1 (Build 6)
--
LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.NUMERIC_STD.all;

LIBRARY ece411;
USE ece411.LC3b_types.all;

ENTITY One IS
   PORT( 
      is1 : OUT    std_logic_vector (3 DOWNTO 0)
   );

-- Declarations

END One ;

--
ARCHITECTURE untitled OF One IS
BEGIN
  is1 <= "0010";
END ARCHITECTURE untitled;

