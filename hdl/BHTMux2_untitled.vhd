--
-- VHDL Architecture ece411.BHTMux2.untitled
--
-- Created:
--          by - mcasano2.ews (evrt-252-14.ews.illinois.edu)
--          at - 22:09:41 04/24/13
--
-- using Mentor Graphics HDL Designer(TM) 2012.1 (Build 6)
--
LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.NUMERIC_STD.all;

LIBRARY ece411;
USE ece411.LC3b_types.all;
ENTITY BHTMux2 IS
   PORT (
      A   : IN     LC3b_BR_BHT;
      B   : IN     LC3b_BR_BHT;
      F   : OUT    LC3b_BR_BHT;
      Sel : IN     std_logic
   );
END BHTMux2;

--
ARCHITECTURE untitled OF BHTMux2 IS
BEGIN
  PROCESS (A, B, Sel)
    variable state : LC3b_BR_BHT;
  BEGIN
    case Sel is
      when '0' =>
        state := A;
      when '1' =>
        state := B;
      when others =>
        state := (OTHERS => 'X');
    end case;
    F <= state after delay_MUX2;
  END PROCESS;
END ARCHITECTURE untitled;

