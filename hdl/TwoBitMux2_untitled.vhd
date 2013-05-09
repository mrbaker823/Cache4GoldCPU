--
-- VHDL Architecture ece411.TwoBitMux2.untitled
--
-- Created:
--          by - mcasano2.ews (evrt-252-35.ews.illinois.edu)
--          at - 20:08:54 04/18/13
--
-- using Mentor Graphics HDL Designer(TM) 2012.1 (Build 6)
--
LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.NUMERIC_STD.all;

LIBRARY ece411;
USE ece411.LC3b_types.all;

ENTITY TwoBitMux2 IS
   PORT( 
      A   : IN     LC3b_BR_BHT;
      B   : IN     LC3b_BR_BHT;
      Sel : IN     std_logic;
      F   : OUT    LC3b_BR_BHT
   );

-- Declarations

END TwoBitMux2 ;

--
ARCHITECTURE untitled OF TwoBitMux2 IS
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
