--
-- VHDL Architecture ece411.BHT_Combiner.untitled
--
-- Created:
--          by - baker30.ews (gelib-057-30.ews.illinois.edu)
--          at - 18:15:16 04/21/13
--
-- using Mentor Graphics HDL Designer(TM) 2012.1 (Build 6)
--
LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.NUMERIC_STD.all;

LIBRARY ece411;
USE ece411.LC3b_types.all;

ENTITY BHT_Combiner IS
   PORT( 
      CLK      : IN     STD_LOGIC;
      NZP_eval : IN     STD_LOGIC;
      newBHT1  : IN     STD_LOGIC;
      newBHT   : OUT    LC3B_BR_BHT
   );

-- Declarations

END BHT_Combiner ;

--
ARCHITECTURE untitled OF BHT_Combiner IS
BEGIN
  newBHT <= newBHT1 & NZP_eval;
END ARCHITECTURE untitled;

