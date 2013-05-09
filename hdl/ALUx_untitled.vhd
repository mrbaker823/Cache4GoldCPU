--
-- VHDL Architecture ece411.ALUx.untitled
--
-- Created:
--          by - baker30.ews (gelib-057-14.ews.illinois.edu)
--          at - 20:40:01 04/21/13
--
-- using Mentor Graphics HDL Designer(TM) 2012.1 (Build 6)
--
LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.NUMERIC_STD.all;

LIBRARY ece411;
USE ece411.LC3b_types.all;

ENTITY ALUx IS
   PORT( 
      A       : IN     LC3b_WORD;
      ALUop   : IN     LC3B_ALUOP;
      B       : IN     LC3b_WORD;
      ALUxOut : OUT    LC3b_WORD
   );

-- Declarations

END ALUx ;

--
ARCHITECTURE untitled OF ALUx IS
BEGIN
  
	----------------------------------------
	VHDL_ALUX : PROCESS (A, B, ALUOP)
	----------------------------------------
	VARIABLE TEMP_ALUOUT : LC3B_WORD;
	BEGIN
		-- CHECK FOR ALU OPERATION TYPE, AND EXECUTE
		CASE ALUOP IS
			WHEN ALUX_SUB =>
				TEMP_ALUOUT := std_logic_vector(signed(A) - signed(B));
			WHEN ALUX_OR =>
				TEMP_ALUOUT := (A OR B);
			WHEN ALUX_XOR =>
				TEMP_ALUOUT := (A XOR B);
			WHEN ALUX_NAND =>
				TEMP_ALUOUT := (A NAND B);
			WHEN ALUX_NOR =>
				TEMP_ALUOUT := (A NOR B);
			WHEN OTHERS =>
		END CASE;
	--SET OUTPUT VALUE ALUOUT TO BE THE TEMPORARY VALUE CALCULATED WITHIN THE PROCESS AFTER A DELAY
	ALUxOUT <= TEMP_ALUOUT AFTER DELAY_ALU;
	END PROCESS VHDL_ALUX;
END ARCHITECTURE untitled;

