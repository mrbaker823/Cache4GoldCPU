--
-- VHDL Architecture ece411.BRTagArray.untitled
--
-- Created:
--          by - mcasano2.ews (evrt-252-35.ews.illinois.edu)
--          at - 18:22:49 04/18/13
--
-- using Mentor Graphics HDL Designer(TM) 2012.1 (Build 6)
--
LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.NUMERIC_STD.all;
LIBRARY ece411;
USE ece411.LC3b_types.all;

ENTITY BRTagArray IS
   PORT( 
      Reset_L   : IN     std_logic;
      Write : IN     std_logic;
      Index     : IN     LC3B_C_INDEX;
      DataIn    : IN     LC3B_BR_TAG;
      DataOut   : OUT    LC3B_BR_TAG
   );
-- Declarations
END BRTagArray ;

--
ARCHITECTURE untitled OF BRTagArray IS
	TYPE BRTagArray IS array (7 downto 0) of LC3B_BR_TAG;
	SIGNAL Tag : BRTagArray;
	BEGIN
		--------------------------------------------------------------
		ReadFromBRTagArray : PROCESS (Tag, Index)
		--------------------------------------------------------------
    
			VARIABLE TagIndex : integer;
			BEGIN
				TagIndex := to_integer(unsigned(Index));
				DataOut <= Tag(TagIndex) after 20 ns;
		
		END PROCESS ReadFromBRTagArray;
	
		--------------------------------------------------------------
		WriteToBRTagArray : PROCESS (RESET_L, Index, Write, DataIn)
		-------------------------------------------------------	------	
			VARIABLE TagIndex : integer;
			BEGIN
				TagIndex := to_integer(unsigned(Index));
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
