--
-- VHDL Architecture ece411.resetDel.untitled
--
-- Created:
--          by - baker30.ews (dcl-l440-22.ews.illinois.edu)
--          at - 19:47:25 03/13/13
--
-- using Mentor Graphics HDL Designer(TM) 2012.1 (Build 6)
--
LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.NUMERIC_STD.all;

LIBRARY ece411;
USE ece411.LC3b_types.all;

ENTITY resetDel IS
   PORT( 
      CLK      : IN     STD_LOGIC;
      RESET_L  : IN     STD_LOGIC;
      RESET_L1 : OUT    STD_LOGIC
   );

-- Declarations

END resetDel ;

--
ARCHITECTURE untitled OF resetDel IS
BEGIN
  RESET_L1 <= RESET_L AFTER HALF_CLOCK_PERIOD;
END ARCHITECTURE untitled;

