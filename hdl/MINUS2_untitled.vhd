--
-- VHDL Architecture ece411.MINUS2.untitled
--
-- Created:
--          by - mcasano2.ews (evrt-252-29.ews.illinois.edu)
--          at - 13:55:20 04/25/13
--
-- using Mentor Graphics HDL Designer(TM) 2012.1 (Build 6)
--
LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.NUMERIC_STD.all;

LIBRARY ece411;
USE ece411.LC3b_types.all;
ENTITY MINUS2 IS
   PORT (
      clk           : IN     std_logic;
      PCout         : IN     LC3b_word;
      PCPlus2out    : OUT    LC3b_word;
      RESET_DELAYED : IN     std_logic
   );
END MINUS2;

--
ARCHITECTURE untitled OF MINUS2 IS
BEGIN
	VHDL_ADD_2 : PROCESS (PCOUT, RESET_DELAYED)
	BEGIN  -- PROCESS
	  IF (RESET_DELAYED = '1') THEN
		  PCPLUS2OUT <= STD_LOGIC_VECTOR(UNSIGNED(PCOUT) - 2 ) AFTER DELAY_ADDER;
		ELSE
		  PCPLUS2OUT <= (OTHERS => '0');
		END IF; 
	END PROCESS;
END ARCHITECTURE untitled;

