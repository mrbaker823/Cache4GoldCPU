--
-- VHDL Architecture ece411.BWdelay.untitled
--
-- Created:
--          by - baker30.ews (evrt-252-17.ews.illinois.edu)
--          at - 14:55:31 02/22/13
--
-- using Mentor Graphics HDL Designer(TM) 2012.1 (Build 6)
--
LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.NUMERIC_STD.all;

LIBRARY ece411;
USE ece411.LC3b_types.all;
USE ieee.std_logic_arith.all;

ENTITY BWdelay IS
   PORT( 
      F5       : IN     std_logic;
      BitWrite : OUT    std_logic
   );

-- Declarations

END BWdelay ;

--
ARCHITECTURE untitled OF BWdelay IS
BEGIN
  BitWrite <= F5;-- after 26 ns;
END ARCHITECTURE untitled;

