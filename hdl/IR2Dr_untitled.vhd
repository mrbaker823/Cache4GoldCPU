--
-- VHDL Architecture ece411.IR2Dr.untitled
--
-- Created:
--          by - baker30.ews (gelib-057-15.ews.illinois.edu)
--          at - 02:49:42 03/13/13
--
-- using Mentor Graphics HDL Designer(TM) 2012.1 (Build 6)
--
LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.NUMERIC_STD.all;

LIBRARY ece411;
USE ece411.LC3b_types.all;

ENTITY IR2Dr IS
   PORT( 
      wb_IR_in : IN     LC3B_WORD;
      wb_DR    : OUT    LC3B_REG
   );

-- Declarations

END IR2Dr ;

--
ARCHITECTURE untitled OF IR2Dr IS
BEGIN
  wb_dr <= wb_ir_in(11 downto 9);
END ARCHITECTURE untitled;

