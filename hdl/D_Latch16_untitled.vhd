--
-- VHDL Architecture ece411.D_Latch16.untitled
--
-- Created:
--          by - lachman1.ews (siebl-0220-04.ews.illinois.edu)
--          at - 02:55:41 04/26/13
--
-- using Mentor Graphics HDL Designer(TM) 2012.1 (Build 6)
--
LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.NUMERIC_STD.all;
LIBRARY ece411;
USE ece411.LC3b_types.all;

ENTITY D_Latch16 IS
   PORT (
      Data_In  : IN     lc3b_word;
      data_out : OUT    lc3b_word;
      Enable   : IN     std_logic
   );
END D_Latch16;

--
ARCHITECTURE untitled OF D_Latch16 IS
BEGIN
END ARCHITECTURE untitled;

