--
-- VHDL Architecture ece411.ALUN.untitled
--
-- Created:
--          by - lachman1.ews (evrt-252-13.ews.illinois.edu)
--          at - 18:17:53 04/24/13
--
-- using Mentor Graphics HDL Designer(TM) 2012.1 (Build 6)
--
LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.NUMERIC_STD.all;

LIBRARY ece411;
USE ece411.LC3b_types.all;

ENTITY ALUN IS
   PORT( 
      A       : IN     LC3b_WORD;
      ALUop   : IN     LC3B_ALUOP;
      B       : IN     LC3b_WORD;
      ALUnOut : OUT    LC3b_WORD
   );

-- Declarations

END ALUN ;

--
ARCHITECTURE untitled OF ALUN IS
BEGIN  
	----------------------------------------
	VHDL_ALUN : PROCESS (A, B, ALUOP)
	----------------------------------------
	VARIABLE TEMP_ALUOUT : LC3B_WORD;
	BEGIN
		-- CHECK FOR ALU OPERATION TYPE, AND EXECUTE
		CASE ALUOP IS
			WHEN ALUN_NEG =>
				TEMP_ALUOUT := std_logic_vector(-signed(A));
			WHEN ALUN_BSWAP =>
				TEMP_ALUOUT := A(7 DOWNTO 0) & A(15 DOWNTO 8);
			WHEN ALUN_BADD =>
				TEMP_ALUOUT := x"00" & std_logic_vector(unsigned((A( 7 DOWNTO 0))) + unsigned((B( 7 DOWNTO 0))));
			WHEN ALUN_SXB =>
				TEMP_ALUOUT := A(8) & A(8) & A(8) & A(8) & A(8) & A(8) & A(8) & A(8) & A(7 DOWNTO 0);
			WHEN ALUN_ZXB =>
				TEMP_ALUOUT := x"00" & A(7 DOWNTO 0);
			WHEN ALUN_MAX =>
			  if( signed(A) > signed(B)) then
			    TEMP_ALUOUT := A;
			  else
			    TEMP_ALUOUT := B;
			  end if;
			WHEN ALUN_MIN =>
			  if( signed(A) < signed(B)) then
			    TEMP_ALUOUT := A;
			  else
			    TEMP_ALUOUT := B;
			  end if;
			WHEN OTHERS =>
		END CASE;
	--SET OUTPUT VALUE ALUOUT TO BE THE TEMPORARY VALUE CALCULATED WITHIN THE PROCESS AFTER A DELAY
	ALUnOUT <= TEMP_ALUOUT AFTER DELAY_ALU;
	END PROCESS VHDL_ALUN;
END ARCHITECTURE untitled;

