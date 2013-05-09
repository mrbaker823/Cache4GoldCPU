--
-- VHDL Architecture ece411.Evener.untitled
--
-- Created:
--          by - mcasano2.ews (evrt-252-28.ews.illinois.edu)
--          at - 21:55:56 04/11/13
--
-- using Mentor Graphics HDL Designer(TM) 2012.1 (Build 6)
--
LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.NUMERIC_STD.all;

LIBRARY ece411;
USE ece411.LC3b_types.all;

ENTITY Evener IS
   PORT( 
      CLK        : IN     STD_LOGIC;
      alumuxsel  : IN     LC3B_4MUX_SEL;
      mem_ALU_in : IN     LC3B_WORD;
      A          : OUT    LC3b_word
   );

-- Declarations

END Evener ;

--
ARCHITECTURE untitled OF Evener IS
BEGIN
  A <= mem_alu_in(15 downto 1) & (mem_alu_in(0) AND alumuxsel(1)) after DELAY_LOGIC2;
END ARCHITECTURE untitled;

