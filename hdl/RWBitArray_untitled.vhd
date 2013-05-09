--
-- VHDL Architecture ece411.RWBitArray.untitled
--
-- Created:
--          by - mcasano2.ews (evrt-252-14.ews.illinois.edu)
--          at - 17:15:53 04/24/13
--
-- using Mentor Graphics HDL Designer(TM) 2012.1 (Build 6)
--
LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.NUMERIC_STD.all;

LIBRARY ece411;
USE ece411.LC3b_types.all;
ENTITY RWBitArray IS
   PORT (
      BitIn    : IN     std_logic;
      BitOut   : OUT    std_logic;
      BitWrite : IN     std_logic;
      RIndex    : IN     LC3B_C_INDEX;
      WIndex    : IN     LC3B_C_INDEX;      
      Reset_L  : IN     std_logic
   );
END RWBitArray;

--
ARCHITECTURE untitled OF RWBitArray IS
	TYPE BitArray IS array (7 downto 0) of std_logic;
	SIGNAL Bit : BitArray;
	BEGIN
		--------------------------------------------------------------
		ReadFromBitArray : PROCESS (Bit, RIndex)
		--------------------------------------------------------------
    
			VARIABLE BitIndex : integer;
			BEGIN
				BitIndex := to_integer(unsigned(RIndex));
				BitOut <= Bit(BitIndex) after 12 ns;
		
		END PROCESS ReadFromBitArray;
	
		--------------------------------------------------------------
		WriteToBitArray : PROCESS (RESET_L, WIndex, BitWrite, BitIn)
		-------------------------------------------------------	------	
			VARIABLE BitIndex : integer;
			BEGIN
				BitIndex := to_integer(unsigned(WIndex));
			IF RESET_L = '0' THEN
				Bit(0) <= '0';--(OTHERS => 'X');
				Bit(1) <= '0';--(OTHERS => 'X');
				Bit(2) <= '0';--(OTHERS => 'X');
				Bit(3) <= '0';--(OTHERS => 'X');
				Bit(4) <= '0';--(OTHERS => 'X');
				Bit(5) <= '0';--(OTHERS => 'X');
				Bit(6) <= '0';--(OTHERS => 'X');
				Bit(7) <= '0';--(OTHERS => 'X');
			END IF;

			IF (BitWrite = '1') THEN
				Bit(BitIndex) <= BitIn;
			END IF;
		
		END PROCESS WriteToBitArray;
END ARCHITECTURE untitled;

