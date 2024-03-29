--
-- VHDL Architecture ece411.ZeroOne.untitled
--
-- Created:
--          by - ravi7.ews (linux-a1.ews.illinois.edu)
--          at - 13:06:27 03/23/14
--
-- using Mentor Graphics HDL Designer(TM) 2012.1 (Build 6)
--
LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.NUMERIC_STD.all;

LIBRARY ece411;
USE ece411.LC3b_types.all;

ENTITY ZeroOne IS
   PORT( 
      RESET_L  : IN     STD_LOGIC;
      clk      : IN     std_logic;
      zeroOne1 : OUT    std_logic_vector (1 DOWNTO 0)
   );

-- Declarations

END ZeroOne ;

--
ARCHITECTURE untitled OF ZeroOne IS
BEGIN
  zeroOne1 <= "01";
END ARCHITECTURE untitled;

