--
-- VHDL Architecture ece411.OWordMux8.untitled
--
-- Created:
--          by - baker30.ews (gelib-057-02.ews.illinois.edu)
--          at - 23:30:08 04/04/13
--
-- using Mentor Graphics HDL Designer(TM) 2012.1 (Build 6)
--
LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.NUMERIC_STD.all;

LIBRARY ece411;
USE ece411.LC3b_types.all;

ENTITY OWordMux8 IS
   PORT( 
      A      : IN     LC3B_OWORD;
      B      : IN     LC3B_OWORD;
      C      : IN     LC3B_OWORD;
      D      : IN     LC3B_OWORD;
      E      : IN     LC3B_OWORD;
      F      : IN     LC3B_OWORD;
      G      : IN     LC3B_OWORD;
      H      : IN     LC3B_OWORD;
      Sel    : IN     LC3B_8MUX_SEL;
      Output : OUT    LC3B_OWORD
   );

-- Declarations

END OWordMux8 ;

--
ARCHITECTURE untitled OF OWordMux8 IS
BEGIN
  PROCESS (A, B, C, D, E, F, G, H, Sel)
    variable state : LC3b_oword;
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
        state := (OTHERS => 'X');
    end case;
    Output <= state after delay_MUX8;
  END PROCESS;
END ARCHITECTURE untitled;

