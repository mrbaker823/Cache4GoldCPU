--
-- VHDL Architecture ece411.PCSplit.untitled
--
-- Created:
--          by - mcasano2.ews (evrt-252-35.ews.illinois.edu)
--          at - 18:54:49 04/18/13
--
-- using Mentor Graphics HDL Designer(TM) 2012.1 (Build 6)
--
LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.NUMERIC_STD.all;

LIBRARY ece411;
USE ece411.LC3b_types.all;

ENTITY PCSplitter IS
   PORT( 
      PC : IN     LC3b_word;
      Tag     : OUT    LC3B_BR_TAG;
      INDEX   : OUT    LC3B_C_INDEX
   );

-- Declarations

END PCSplitter ;

--
ARCHITECTURE untitled OF PCSplitter IS
BEGIN
  Tag <= PC(15 DOWNTO 3);
  INDEX <= PC(3 DOWNTO 1);
  
END ARCHITECTURE untitled;