--
-- VHDL Architecture ece411.MultU.untitled
--
-- Created:
--          by - baker30.ews (gelib-057-14.ews.illinois.edu)
--          at - 21:00:10 04/21/13
--
-- using Mentor Graphics HDL Designer(TM) 2012.1 (Build 6)
--
LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.NUMERIC_STD.all;

LIBRARY ece411;
USE ece411.LC3b_types.all;

ENTITY MultU IS
   PORT( 
      clk      : IN     std_logic;
      A        : IN     LC3B_WORD;
      ALUop    : IN     LC3B_ALUOP;
      B        : IN     LC3B_WORD;
      MultOut  : OUT    LC3B_WORD;
      MultDone : OUT    STD_LOGIC
   );

-- Declarations

END MultU ;

--
ARCHITECTURE untitled OF MultU IS
SIGNAL TEMP_MD : STD_LOGIC;
BEGIN
	----------------------------------------
	VHDL_ALUX : PROCESS (A, B, ALUOP)
	----------------------------------------
	VARIABLE TEMP_ALUOUT : STD_LOGIC_VECTOR(31 DOWNTO 0);
	BEGIN
		-- CHECK FOR ALU OPERATION TYPE, AND EXECUTE
		CASE ALUOP IS
  			WHEN ALUX_MULT =>
  			  TEMP_MD  <= '0' AFTER 0 NS, '1' AFTER 90 ns;
				TEMP_ALUOUT := std_logic_vector(signed(A) * signed(B));
			WHEN OTHERS =>
			  TEMP_MD  <= '1' AFTER 0 NS;
		END CASE;
	--SET OUTPUT VALUE ALUOUT TO BE THE TEMPORARY VALUE CALCULATED WITHIN THE PROCESS AFTER A DELAY
	MULTOUT <= TEMP_ALUOUT(15 DOWNTO 0) AFTER 90 ns;
	END PROCESS VHDL_ALUX;
  MultDone <= TEMP_MD;
END ARCHITECTURE untitled;

