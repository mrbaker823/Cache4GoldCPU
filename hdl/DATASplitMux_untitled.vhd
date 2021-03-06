--
-- VHDL Architecture ece411.DATASplitMux.untitled
--
-- Created:
--          by - baker30.ews (evrt-252-34.ews.illinois.edu)
--          at - 22:56:36 02/14/13
--
-- using Mentor Graphics HDL Designer(TM) 2012.1 (Build 6)
--
LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.NUMERIC_STD.all;

LIBRARY ece411;
USE ece411.LC3b_types.all;
USE ieee.std_logic_arith.all;

ENTITY DATASplitMux IS
   PORT( 
      DATAOUTBIG : IN     LC3B_OWORD;
      Offset3    : IN     LC3B_8MUX_SEL;
      DATAINe     : OUT    LC3b_word
   );

-- Declarations

END DATASplitMux ;

--
ARCHITECTURE untitled OF DATASplitMux IS
BEGIN
  PROCESS (DATAOUTBIG, Offset3)
    variable state : LC3b_word;
  BEGIN
    case Offset3 is
      when "000" =>
        state := DATAOUTBIG(15 DOWNTO 0);
      when "001" =>
        state := DATAOUTBIG(31 DOWNTO 16);
      when "010" =>
        state := DATAOUTBIG(47 DOWNTO 32);
      when "011" =>
        state := DATAOUTBIG(63 DOWNTO 48);
      when "100" =>
        state := DATAOUTBIG(79 DOWNTO 64);
      when "101" =>
        state := DATAOUTBIG(95 DOWNTO 80);
      when "110" =>
        state := DATAOUTBIG(111 DOWNTO 96);
      when "111" =>
        state := DATAOUTBIG(127 DOWNTO 112);
      when others =>
        state := (OTHERS => 'X');
    end case;
    DATAINe <= state after delay_MUX8;
  END PROCESS;
END ARCHITECTURE untitled;

