--
-- VHDL Architecture ece411.R7sel.untitled
--
-- Created:
--          by - baker30.ews (gelib-057-11.ews.illinois.edu)
--          at - 19:25:51 02/05/13
--
-- using Mentor Graphics HDL Designer(TM) 2012.1 (Build 6)
--
LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.NUMERIC_STD.all;

LIBRARY ece411;
USE ece411.LC3b_types.all;
USE ieee.std_logic_arith.all;

ENTITY R7sel IS
   PORT( 
      clk : IN     std_logic;
      R7out : OUT  lc3b_reg
   );

-- Declarations

END R7sel ;

--
ARCHITECTURE untitled OF R7sel IS
BEGIN
  R7out <= "111";
  
END ARCHITECTURE untitled;

