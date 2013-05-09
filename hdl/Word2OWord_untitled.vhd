--
-- VHDL Architecture ece411.Word2OWord.untitled
--
-- Created:
--          by - baker30.ews (gelib-057-20.ews.illinois.edu)
--          at - 19:45:32 02/24/13
--
-- using Mentor Graphics HDL Designer(TM) 2012.1 (Build 6)
--
LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.NUMERIC_STD.all;

LIBRARY ece411;
USE ece411.LC3b_types.all;
USE ieee.std_logic_arith.all;

ENTITY Word2OWord IS
   PORT( 
      OutWord0    : IN     LC3B_WORD;
      OutWord1    : IN     LC3B_WORD;
      OutWord2    : IN     LC3B_WORD;
      OutWord3    : IN     LC3B_WORD;
      OutWord4    : IN     LC3B_WORD;
      OutWord5    : IN     LC3B_WORD;
      OutWord6    : IN     LC3B_WORD;
      OutWord7    : IN     LC3B_WORD;
      NewDataArrayIn : OUT    LC3B_OWORD
   );

-- Declarations

END Word2OWord ;

--
ARCHITECTURE untitled OF Word2OWord IS
BEGIN
  
  NewDataArrayIn <= OutWord7 & OutWord6 & OutWord5 & OutWord4 & OutWord3 & OutWord2 &OutWord1 & OutWord0;
END ARCHITECTURE untitled;

