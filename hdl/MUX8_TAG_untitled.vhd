--
-- VHDL Architecture ece411.MUX8_TAG.untitled
--
-- Created:
--          by - baker30.ews (gelib-057-01.ews.illinois.edu)
--          at - 16:26:38 04/20/13
--
-- using Mentor Graphics HDL Designer(TM) 2012.1 (Build 6)
--
LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.NUMERIC_STD.all;

LIBRARY ece411;
USE ece411.LC3b_types.all;

ENTITY MUX8_TAG IS
   PORT( 
      A    : IN     LC3B_C_TAG;
      B    : IN     LC3B_C_TAG;
      C    : IN     LC3B_C_TAG;
      D    : IN     LC3B_C_TAG;
      E    : IN     LC3B_C_TAG;
      F    : IN     LC3B_C_TAG;
      G    : IN     LC3B_C_TAG;
      H    : IN     LC3B_C_TAG;
      Sel  : IN     LC3B_8Mux_SEL;
      mOUT : OUT    LC3B_C_TAG
   );

-- Declarations

END MUX8_TAG ;

--
ARCHITECTURE untitled OF MUX8_TAG IS
BEGIN
  PROCESS (A, B, C, D, E, F, G, H, Sel)
    variable state : LC3B_C_TAG;
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
        state := "XXXXXXXXX";
    end case;
    mOUT <= state after delay_MUX8;
  END PROCESS;
END ARCHITECTURE untitled;

