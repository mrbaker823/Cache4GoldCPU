--
-- VHDL Architecture ece411.ByteBusIn.untitled
--
-- Created:
--          by - baker30.ews (gelib-057-27.ews.illinois.edu)
--          at - 22:43:40 04/10/13
--
-- using Mentor Graphics HDL Designer(TM) 2012.1 (Build 6)
--
LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.NUMERIC_STD.all;

LIBRARY ece411;
USE ece411.LC3b_types.all;

ENTITY ByteBusIn IS
   PORT( 
      ByteIn : IN     LC3B_BYTE;
      sig0   : OUT    std_logic;
      sig1   : OUT    std_logic;
      sig2   : OUT    std_logic;
      sig3   : OUT    std_logic;
      sig4   : OUT    std_logic;
      sig5   : OUT    std_logic;
      sig6   : OUT    std_logic;
      sig7   : OUT    std_logic
   );

-- Declarations

END ByteBusIn ;

--
ARCHITECTURE untitled OF ByteBusIn IS
BEGIN
  sig0 <= ByteIn(0);
  sig1 <= ByteIn(1);
  sig2 <= ByteIn(2);
  sig3 <= ByteIn(3);
  sig4 <= ByteIn(4);
  sig5 <= ByteIn(5);
  sig6 <= ByteIn(6);
  sig7 <= ByteIn(7);
END ARCHITECTURE untitled;

