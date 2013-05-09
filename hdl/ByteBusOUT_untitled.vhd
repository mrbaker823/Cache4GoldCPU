--
-- VHDL Architecture ece411.ByteBusOUT.untitled
--
-- Created:
--          by - baker30.ews (gelib-057-27.ews.illinois.edu)
--          at - 22:07:23 04/10/13
--
-- using Mentor Graphics HDL Designer(TM) 2012.1 (Build 6)
--
LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.NUMERIC_STD.all;

LIBRARY ece411;
USE ece411.LC3b_types.all;

ENTITY ByteBusOUT IS
   PORT( 
      In0  : IN     std_logic;
      In1  : IN     std_logic;
      In2  : IN     std_logic;
      In3  : IN     std_logic;
      In4  : IN     std_logic;
      In5  : IN     std_logic;
      In6  : IN     std_logic;
      In7  : IN     std_logic;
      Out0 : OUT    std_logic_vector (7 DOWNTO 0)
   );

-- Declarations

END ByteBusOUT ;

--
ARCHITECTURE untitled OF ByteBusOUT IS
BEGIN
  Out0 <= In7 & In6 & In5 & In4 & In3 & In2 & In1 & In0;
END ARCHITECTURE untitled;

