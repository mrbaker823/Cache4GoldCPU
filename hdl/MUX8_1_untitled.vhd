--
-- VHDL Architecture ece411.MUX8_1.untitled
--
-- Created:
--          by - lachman1.ews (evrt-252-38.ews.illinois.edu)
--          at - 16:48:03 04/18/13
--
-- using Mentor Graphics HDL Designer(TM) 2012.1 (Build 6)
--
LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.NUMERIC_STD.all;
LIBRARY ece411;
USE ece411.LC3b_types.all;

ENTITY MUX8_1 IS
   PORT( 
      A   : IN     std_logic;
      B   : IN     std_logic;
      C   : IN     std_logic;
      D   : IN     std_logic;
      E   : IN     std_logic;
      F   : IN     std_logic;
      G   : IN     std_logic;
      H   : IN     std_logic;
      Sel : IN     LC3B_8MUX_SEL;
      O   : OUT    std_logic
   );

-- Declarations

END MUX8_1 ;

--
ARCHITECTURE untitled OF MUX8_1 IS
BEGIN
  PROCESS (A, B, C, D, E, F, G, H, Sel)
    variable state : std_logic;
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
        state := 'X';
    end case;
    O <= state after delay_MUX8;
  END PROCESS;
END ARCHITECTURE untitled;

