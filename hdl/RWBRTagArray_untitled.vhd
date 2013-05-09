--
-- VHDL Architecture ece411.RWBRTagArray.untitled
--
-- Created:
--          by - mcasano2.ews (evrt-252-14.ews.illinois.edu)
--          at - 17:18:41 04/24/13
--
-- using Mentor Graphics HDL Designer(TM) 2012.1 (Build 6)
--
LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.NUMERIC_STD.all;

LIBRARY ece411;
USE ece411.LC3b_types.all;
ENTITY RWBRTagArray IS
   PORT (
      DataIn  : IN     LC3B_BR_TAG;
      RDataOut : OUT    LC3B_BR_TAG;
      WDataOut : OUT    LC3B_BR_TAG;      
      RIndex   : IN     LC3B_C_INDEX;
      WIndex   : IN     LC3B_C_INDEX;      
      Reset_L : IN     std_logic;
      Write   : IN     std_logic
   );
END RWBRTagArray;

--
ARCHITECTURE untitled OF RWBRTagArray IS
	TYPE BRTagArray IS array (7 downto 0) of LC3B_BR_TAG;
	SIGNAL Tag : BRTagArray;
	BEGIN
		--------------------------------------------------------------
		ReadFromBRTagArray : PROCESS (Tag, RIndex, WIndex)
		--------------------------------------------------------------
    
			VARIABLE RTagIndex : integer;
			VARIABLE WTagIndex : integer;			
			BEGIN
				RTagIndex := to_integer(unsigned(RIndex));
				RDataOut <= Tag(RTagIndex) after 12 ns;

				WTagIndex := to_integer(unsigned(WIndex));
				WDataOut <= Tag(WTagIndex) after 12 ns;
		
		END PROCESS ReadFromBRTagArray;
	
		--------------------------------------------------------------
		WriteToBRTagArray : PROCESS (RESET_L, WIndex, Write, DataIn)
		-------------------------------------------------------	------	
			VARIABLE TagIndex : integer;
			BEGIN
				TagIndex := to_integer(unsigned(WIndex));
			IF RESET_L = '0' THEN
				Tag(0) <= (OTHERS => 'X');
				Tag(1) <= (OTHERS => 'X');
				Tag(2) <= (OTHERS => 'X');
				Tag(3) <= (OTHERS => 'X');
				Tag(4) <= (OTHERS => 'X');
				Tag(5) <= (OTHERS => 'X');
				Tag(6) <= (OTHERS => 'X');
				Tag(7) <= (OTHERS => 'X');
						
			END IF;

			IF (Write = '1') THEN
				Tag(TagIndex) <= DataIn;
			END IF;
		
		END PROCESS WriteToBRTagArray;
END ARCHITECTURE untitled;

