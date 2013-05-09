--
-- VHDL Architecture ece411.RWTwoBitArray.untitled
--
-- Created:
--          by - mcasano2.ews (evrt-252-14.ews.illinois.edu)
--          at - 17:21:21 04/24/13
--
-- using Mentor Graphics HDL Designer(TM) 2012.1 (Build 6)
--
LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.NUMERIC_STD.all;

LIBRARY ece411;
USE ece411.LC3b_types.all;
ENTITY RWTwoBitArray IS
   PORT (
      DataIn  : IN     LC3B_BR_BHT;
      DataOut : OUT    LC3B_BR_BHT;
      RIndex   : IN     LC3B_C_INDEX;
      WIndex   : IN     LC3B_C_INDEX;
      Reset_L : IN     std_logic;
      Write   : IN     std_logic
   );
END RWTwoBitArray;

--
ARCHITECTURE untitled OF RWTwoBitArray IS
	TYPE WordArray IS array (7 downto 0) of LC3B_BR_BHT;
	SIGNAL Tag : WordArray;
	BEGIN
		--------------------------------------------------------------
		ReadFromWordArray : PROCESS (Tag, RIndex)
		--------------------------------------------------------------
    
			VARIABLE TagIndex : integer;
			BEGIN
				TagIndex := to_integer(unsigned(RIndex));
				DataOut <= Tag(TagIndex) after 12 ns;
		
		END PROCESS ReadFromWordArray;
	
		--------------------------------------------------------------
		WriteToWordArray : PROCESS (RESET_L, WIndex, Write, DataIn)
		-------------------------------------------------------	------	
			VARIABLE TagIndex : integer;
			BEGIN
				TagIndex := to_integer(unsigned(WIndex));
			IF RESET_L = '0' THEN
				Tag(0) <= "01";
				Tag(1) <= "01";
				Tag(2) <= "01";
				Tag(3) <= "01";
				Tag(4) <= "01";
				Tag(5) <= "01";
				Tag(6) <= "01";
				Tag(7) <= "01";
				
			END IF;

			IF (Write = '1') THEN
				Tag(TagIndex) <= DataIn;
			END IF;
		
		END PROCESS WriteToWordArray;
END ARCHITECTURE untitled;

