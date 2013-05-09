--
-- VHDL Architecture ece411.IRStrip.untitled
--
-- Created:
--          by - mcasano2.ews (gelib-057-12.ews.illinois.edu)
--          at - 20:57:58 04/21/13
--
-- using Mentor Graphics HDL Designer(TM) 2012.1 (Build 6)
--
LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.NUMERIC_STD.all;

LIBRARY ece411;
USE ece411.LC3b_types.all;

ENTITY IRStrip IS
   PORT( 
      CLK       : IN     STD_LOGIC;
      mem_IR_in : IN     LC3B_WORD;
      mem_Opcode_out : OUT LC3b_OPCODE
   );

-- Declarations

END IRStrip ;

--
ARCHITECTURE untitled OF IRStrip IS
BEGIN
  mem_Opcode_out <= mem_IR_in(15 DOWNTO 12);
END ARCHITECTURE untitled;

