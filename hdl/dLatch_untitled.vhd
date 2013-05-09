--
-- VHDL Architecture ece411.dLatch.untitled
--
-- Created:
--          by - baker30.ews (gelib-057-18.ews.illinois.edu)
--          at - 02:21:44 02/28/13
--
-- using Mentor Graphics HDL Designer(TM) 2012.1 (Build 6)
--
LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.NUMERIC_STD.all;

LIBRARY ece411;
USE ece411.LC3b_types.all;
USE ieee.std_logic_arith.all;

ENTITY dLatch IS
   PORT( 
      C   : IN     std_logic;
      D     : IN     std_logic;
      Q     : OUT    std_logic
   );

-- Declarations

END dLatch ;

--
ARCHITECTURE untitled OF dLatch IS
BEGIN
  PROCESS( c, d)
  BEGIN
      if C='1' then
        Q <= D;
    end if;
  end process;
  
END ARCHITECTURE untitled;

