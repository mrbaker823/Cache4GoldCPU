--
-- VHDL Architecture ece411.compare3bit.untitled
--
-- Created:
--          by - baker30.ews (evrt-252-37.ews.illinois.edu)
--          at - 20:08:18 04/18/13
--
-- using Mentor Graphics HDL Designer(TM) 2012.1 (Build 6)
--
LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.NUMERIC_STD.all;

LIBRARY ece411;
USE ece411.LC3b_types.all;

ENTITY compare3bit IS
   PORT( 
      Hit    : IN     LC3B_8MUX_Sel;
      LRUval : IN     LC3B_8MUX_Sel;
      Shift  : OUT    std_logic
   );

-- Declarations

END compare3bit ;

--
ARCHITECTURE untitled OF compare3bit IS
BEGIN
    Shift <= '1' when (Hit=LRUval) else '0' after DELAY_COMPARE8;
END ARCHITECTURE untitled;

