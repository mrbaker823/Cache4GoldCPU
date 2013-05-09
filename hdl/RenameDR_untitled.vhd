--
-- VHDL Architecture ece411.RenameDR.untitled
--
-- Created:
--          by - baker30.ews (gelib-057-04.ews.illinois.edu)
--          at - 02:13:00 03/14/13
--
-- using Mentor Graphics HDL Designer(TM) 2012.1 (Build 6)
--
LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.NUMERIC_STD.all;

LIBRARY ece411;
USE ece411.LC3b_types.all;

ENTITY RenameDR IS
   PORT( 
      CLK       : IN     STD_LOGIC;
      DR        : IN     lc3b_reg;
      id_DR_out : OUT    LC3B_REG
   );

-- Declarations

END RenameDR ;

--
ARCHITECTURE untitled OF RenameDR IS
BEGIN
  id_dr_out <= DR;
END ARCHITECTURE untitled;

