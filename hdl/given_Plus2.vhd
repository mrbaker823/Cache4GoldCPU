LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.NUMERIC_STD.all;

LIBRARY ece411;
USE ece411.LC3b_types.all;

ENTITY PLUS2 IS
  PORT( 
    PCout       : IN  LC3b_word;
    clk         : IN  std_logic;
    RESET_DELAYED     : IN  std_logic;
    PCPlus2out  : OUT LC3b_word
);

-- Declarations

END PLUS2 ;

ARCHITECTURE UNTITLED OF PLUS2 IS
BEGIN
	VHDL_ADD_2 : PROCESS (PCOUT, RESET_DELAYED)
	BEGIN  -- PROCESS
	  IF (RESET_DELAYED = '1') THEN
		  PCPLUS2OUT <= STD_LOGIC_VECTOR(UNSIGNED(PCOUT) + 2 ) AFTER DELAY_ADDER;
		ELSE
		  PCPLUS2OUT <= (OTHERS => '0');
		END IF; 
	END PROCESS;
END UNTITLED;