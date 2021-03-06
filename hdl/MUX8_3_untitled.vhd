--
-- VHDL Architecture ece411.MUX8_3.untitled
--
-- Created:
--          by - baker30.ews (evrt-252-37.ews.illinois.edu)
--          at - 21:11:05 04/18/13
--
-- using Mentor Graphics HDL Designer(TM) 2012.1 (Build 6)
--
LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.NUMERIC_STD.all;

LIBRARY ece411;
USE ece411.LC3b_types.all;

ENTITY MUX8_3 IS
   PORT( 
      A    : IN     LC3b_8MUX_SEL;
      B    : IN     LC3b_8MUX_SEL;
      C    : IN     LC3b_8MUX_SEL;
      D    : IN     LC3b_8MUX_SEL;
      E    : IN     LC3b_8MUX_SEL;
      F    : IN     LC3b_8MUX_SEL;
      G    : IN     LC3b_8MUX_SEL;
      H    : IN     LC3b_8MUX_SEL;
      Sel  : IN     LC3b_C_INDEX;
      mOUT : OUT    LC3b_8MUX_SEL
   );

-- Declarations

END MUX8_3 ;

--
ARCHITECTURE untitled OF MUX8_3 IS
BEGIN
  PROCESS (A, B, C, D, E, F, G, H, Sel)
    variable state : LC3b_8MUX_SEL;
  BEGIN
    case Sel is
      when "000" =>
        state := A;
      when "001" =>
        state := B;
      when "010" =>
        state := C;
      when "011" =>
        state := D;
      when "100" =>
        state := E;
      when "101" =>
        state := F;
      when "110" =>
        state := G;
      when "111" =>
        state := H;
      when others =>
        state := "XXX";
    end case;
    mOUT <= state after delay_MUX8;
  END PROCESS;
END ARCHITECTURE untitled;

