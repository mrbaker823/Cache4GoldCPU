--
-- VHDL Architecture ece411.Plus1.untitled
--
-- Created:
--          by - lachman1.ews (siebl-0220-04.ews.illinois.edu)
--          at - 02:59:32 04/26/13
--
-- using Mentor Graphics HDL Designer(TM) 2012.1 (Build 6)
--
LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.NUMERIC_STD.all;

LIBRARY ece411;
USE ece411.LC3b_types.all;

ENTITY Plus1 IS
   PORT( 
      CLK     : IN     STD_LOGIC;
      DataIn  : IN     LC3B_Word;
      DataOut : OUT    LC3B_Word
   );

-- Declarations

END Plus1 ;

--
ARCHITECTURE untitled OF Plus1 IS
BEGIN
  DataOut <= STD_LOGIC_VECTOR(UNSIGNED(DataIn) + 1 ) AFTER DELAY_ADDER;
END ARCHITECTURE untitled;

