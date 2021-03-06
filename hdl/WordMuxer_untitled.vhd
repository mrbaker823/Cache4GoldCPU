--
-- VHDL Architecture ece411.WordMuxer.untitled
--
-- Created:
--          by - baker30.ews (gelib-057-20.ews.illinois.edu)
--          at - 18:28:33 02/24/13
--
-- using Mentor Graphics HDL Designer(TM) 2012.1 (Build 6)
--
LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.NUMERIC_STD.all;

LIBRARY ece411;
USE ece411.LC3b_types.all;
USE ieee.std_logic_arith.all;

ENTITY WordMuxer IS
     PORT( 
      Dec       : IN    std_logic;
      Offset    : IN    LC3B_C_OFFSET;
      WriteH_L  : IN    std_logic;      
      OldByteH  : IN    LC3B_BYTE;
      OldByteL  : IN    LC3B_BYTE;
      NewByteH  : IN    LC3B_BYTE;
      NewByteL  : IN    LC3B_BYTE;
      OutByte   : OUT   LC3B_BYTE
      
   );

-- Declarations

END WordMuxer ;

--
ARCHITECTURE untitled OF WordMuxer IS
BEGIN
END ARCHITECTURE untitled;

