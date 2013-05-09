--
-- VHDL Architecture ece411.OR8.untitled
--
-- Created:
--          by - baker30.ews (gelib-057-02.ews.illinois.edu)
--          at - 01:30:20 04/05/13
--
-- using Mentor Graphics HDL Designer(TM) 2012.1 (Build 6)
--
LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.NUMERIC_STD.all;

LIBRARY ece411;
USE ece411.LC3b_types.all;

ENTITY OR8 IS
   PORT( 
      A      : IN     std_logic;
      B      : IN     std_logic;
      C      : IN     std_logic;
      D      : IN     std_logic;
      E      : IN     std_logic;
      F      : IN     std_logic;
      G      : IN     std_logic;
      H      : IN     std_logic;
      Output : OUT    std_logic
   );

-- Declarations

END OR8 ;

--
ARCHITECTURE untitled OF OR8 IS
BEGIN
  Output <= (A OR B OR C OR D OR E OR F OR G OR H) AFTER (DELAY_LOGIC4+DELAY_LOGIC2);
END ARCHITECTURE untitled;

