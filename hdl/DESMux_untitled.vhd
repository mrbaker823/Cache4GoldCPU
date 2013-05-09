--
-- VHDL Architecture ece411.DESMux.untitled
--
-- Created:
--          by - baker30.ews (gelib-057-11.ews.illinois.edu)
--          at - 19:28:24 02/05/13
--
-- using Mentor Graphics HDL Designer(TM) 2012.1 (Build 6)
--
LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.NUMERIC_STD.all;

LIBRARY ece411;
USE ece411.LC3b_types.all;
USE ieee.std_logic_arith.all;

ENTITY DESMux IS
   PORT( 
      clk     : IN     std_logic;
      dest    : IN     LC3b_reg;
      desmuxsel : IN   std_logic;
      destout : OUT    LC3b_reg
   );

-- Declarations

END DESMux ;

--
ARCHITECTURE untitled OF DESMux IS
BEGIN
  	PROCESS (Dest, desmuxsel)
	VARIABLE STATE : LC3B_reg;
	BEGIN
		CASE desmuxsel IS
			WHEN '0' =>
				STATE := Dest;
			WHEN '1' =>
				STATE := "111";
			WHEN OTHERS =>
				STATE := (OTHERS => 'X');
		END CASE;
	destout <= STATE AFTER DELAY_MUX2;
	END PROCESS;
END ARCHITECTURE untitled;

