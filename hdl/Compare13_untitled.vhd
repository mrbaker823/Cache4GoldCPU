--
-- VHDL Architecture ece411.Compare13.untitled
--
-- Created:
--          by - mcasano2.ews (evrt-252-35.ews.illinois.edu)
--          at - 18:51:28 04/18/13
--
-- using Mentor Graphics HDL Designer(TM) 2012.1 (Build 6)
--
LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.NUMERIC_STD.all;

LIBRARY ece411;
USE ece411.LC3b_types.all;

ENTITY Compare13 IS
   PORT( 
      A : IN     lc3b_BR_TAG;
      B : IN     lc3b_BR_TAG;
      F : OUT    std_logic
   );

-- Declarations

END Compare13 ;

--
ARCHITECTURE untitled OF Compare13 IS
BEGIN
  F <= '1' when (A=B) else '0' after DELAY_COMPARE16;
END ARCHITECTURE untitled;

