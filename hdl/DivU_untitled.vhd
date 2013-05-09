--
-- VHDL Architecture ece411.DivU.untitled
--
-- Created:
--          by - baker30.ews (gelib-057-14.ews.illinois.edu)
--          at - 21:05:44 04/21/13
--
-- using Mentor Graphics HDL Designer(TM) 2012.1 (Build 6)
--
LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.NUMERIC_STD.all;

LIBRARY ece411;
USE ece411.LC3b_types.all;

ENTITY DivU IS
   PORT( 
      clk     : IN     std_logic;
      A       : IN     LC3B_WORD;
      ALUOP   : IN     LC3B_ALUOP;
      B       : IN     LC3B_WORD;
      DivDone : OUT    STD_LOGIC;
      DIVOUT  : OUT    LC3B_WORD
   );

-- Declarations

END DivU ;

--
ARCHITECTURE untitled OF DivU IS
SIGNAL TEMP_DD   : STD_LOGIC;
BEGIN		  
	----------------------------------------
	VHDL_ALUX : PROCESS (A, B, ALUOP)
	----------------------------------------
	VARIABLE TEMP_ALUOUT : LC3B_WORD;
	BEGIN
		-- CHECK FOR ALU OPERATION TYPE, AND EXECUTE
		CASE ALUOP IS
  			WHEN ALUX_DIV =>
  			  TEMP_DD  <= '0' AFTER 0 NS, '1' AFTER 340 ns;
			  if (B = x"0000") then
  			    TEMP_ALUOUT := x"DB00";
			  else
			    TEMP_ALUOUT := std_logic_vector( signed(A) / signed(B) );
			  end if;
			WHEN OTHERS =>
			  TEMP_DD  <= '1' AFTER 0 NS;
		END CASE;
	--SET OUTPUT VALUE ALUOUT TO BE THE TEMPORARY VALUE CALCULATED WITHIN THE PROCESS AFTER A DELAY
	DIVOUT <= TEMP_ALUOUT AFTER 340 ns;
	END PROCESS VHDL_ALUX;
  DivDone <= TEMP_DD;
END ARCHITECTURE untitled;

