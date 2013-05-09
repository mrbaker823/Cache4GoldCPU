--
-- VHDL Architecture ece411.D_Latch_R.untitled
--
-- Created:
--          by - lachman1.ews (siebl-0220-09.ews.illinois.edu)
--          at - 02:41:28 04/12/13
--
-- using Mentor Graphics HDL Designer(TM) 2012.1 (Build 6)
--
LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.NUMERIC_STD.all;
LIBRARY ece411;
USE ece411.LC3b_types.all;

ENTITY D_Latch_R IS
   PORT (
      Data_In  : IN     lc3b_word;
      data_out : OUT    lc3b_word;
      RESET_L  : IN     std_logic;
      Enable   : IN     std_logic
   );
END D_Latch_R;

--
ARCHITECTURE untitled OF D_Latch_R IS
BEGIN
    process(data_in, enable, reset_l)
    begin
      if(reset_l = '0') then
        data_out <= x"0000";
      else
        if (enable='1') then
	    	  data_out <= data_in;  
		    end if;
		  end if;
    end process;
END ARCHITECTURE untitled;

