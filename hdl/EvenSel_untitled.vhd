--
-- VHDL Architecture ece411.EvenSel.untitled
--
-- Created:
--          by - mcasano2.ews (evrt-252-28.ews.illinois.edu)
--          at - 21:57:41 04/11/13
--
-- using Mentor Graphics HDL Designer(TM) 2012.1 (Build 6)
--
LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.NUMERIC_STD.all;

LIBRARY ece411;
USE ece411.LC3b_types.all;

ENTITY EvenSel IS
   PORT( 
      CLK       : IN     STD_LOGIC;
      alumuxsel : IN     LC3B_4MUX_SEL;
      Sel       : OUT    std_logic
   );

-- Declarations

END EvenSel ;

--
ARCHITECTURE untitled OF EvenSel IS
BEGIN
  process(alumuxsel)
  begin
  if (alumuxsel = "11") then
    sel <= '1';
  else
    sel <= '0';
  end if;
  end process;
END ARCHITECTURE untitled;

