--
-- VHDL Architecture ece411.DataArray.untitled
--
-- Created:
--          by - ravi7.ews (linux-a3.ews.illinois.edu)
--          at - 08:18:58 02/14/14
--
-- using Mentor Graphics HDL Designer(TM) 2012.1 (Build 6)
--
LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.NUMERIC_STD.all;

LIBRARY ece411;
USE ece411.LC3b_types.all;

ENTITY DataArray IS
   PORT( 
      DatInput  : IN     LC3b_oword;
      RESET_L   : IN     std_logic;
      index_in  : IN     LC3b_c_index;
      setData   : IN     std_logic;
      tag_in    : IN     LC3b_c_tag;
      DatOutput : OUT    LC3b_oword;
      TagOut    : OUT    LC3b_c_tag;
      ValidOut  : OUT    std_logic
   );


END DataArray ;

--
ARCHITECTURE untitled OF DataArray IS

	TYPE DArray IS	array (7 downto 0) of LC3b_oword;
	TYPE TagArray IS	array (7 downto 0) of LC3b_C_tag;
	TYPE ValidArray IS array (7 downto 0) of std_logic;
	SIGNAL DataArr : DArray;
	SIGNAL TagArr : TagArray;
	SIGNAL ValidArr : ValidArray;

	BEGIN
		--------------------------------------------------------------
		ReadFromArrays : PROCESS (DataArr,TagArr, ValidArr, Index_in)
		--------------------------------------------------------------
    
			VARIABLE DataInd : integer;
			BEGIN
				DataInd := to_integer(unsigned(Index_in));
				DatOutput <= DataArr(DataInd) after 20 ns;
				TagOut <= TagArr(DataInd) after 20 ns;
				ValidOut <= ValidArr(DataInd) after 20 ns;
		
		END PROCESS ReadFromArrays;
	
		--------------------------------------------------------------
		Write2DataArray : PROCESS (RESET_L, Index_in,SetData, DatInput, tag_in)
		-------------------------------------------------------	------	
			VARIABLE DataInd : integer;
			BEGIN
				DataInd := to_integer(unsigned(Index_in));
			IF RESET_L = '0' THEN
				DataArr(0) <= (OTHERS => 'X');
				DataArr(1) <= (OTHERS => 'X');
				DataArr(2) <= (OTHERS => 'X');
				DataArr(3) <= (OTHERS => 'X');
				DataArr(4) <= (OTHERS => 'X');
				DataArr(5) <= (OTHERS => 'X');
				DataArr(6) <= (OTHERS => 'X');
				DataArr(7) <= (OTHERS => 'X');
				TagArr(0) <= (OTHERS => 'X');
				TagArr(1) <= (OTHERS => 'X');
				TagArr(2) <= (OTHERS => 'X');
				TagArr(3) <= (OTHERS => 'X');
				TagArr(4) <= (OTHERS => 'X');
				TagArr(5) <= (OTHERS => 'X');
				TagArr(6) <= (OTHERS => 'X');
				TagArr(7) <= (OTHERS => 'X');
				ValidArr(0) <= '0';
				ValidArr(1) <= '0';
				ValidArr(2) <= '0';
				ValidArr(3) <= '0';
				ValidArr(4) <= '0';
				ValidArr(5) <= '0';
				ValidArr(6) <= '0';
				ValidArr(7) <= '0';
			END IF;

			IF (SetData = '1') THEN
				DataArr(DataInd) <= DatInput;
				TagArr(DataInd) <= Tag_in;
				ValidArr(DataInd) <= '1';
			END IF;
			
		
		END PROCESS Write2DataArray;

END ARCHITECTURE untitled;

