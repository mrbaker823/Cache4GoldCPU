--
-- VHDL Architecture ece411.BHT_Splitter.untitled
--
-- Created:
--          by - baker30.ews (gelib-057-30.ews.illinois.edu)
--          at - 18:09:30 04/21/13
--
-- using Mentor Graphics HDL Designer(TM) 2012.1 (Build 6)
--
LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.NUMERIC_STD.all;

LIBRARY ece411;
USE ece411.LC3b_types.all;

ENTITY BHT_Splitter IS
   PORT( 
      CLK        : IN     STD_LOGIC;
      mem_BHT_in : IN     LC3b_BR_BHT;
      BHT0       : OUT    std_logic;
      BHT1       : OUT    std_logic
   );

-- Declarations

END BHT_Splitter ;

--
ARCHITECTURE untitled OF BHT_Splitter IS
BEGIN
  BHT0 <= mem_BHT_in(0);
  BHT1 <= mem_BHT_in(1);
END ARCHITECTURE untitled;

