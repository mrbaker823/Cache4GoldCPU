--
-- VHDL Architecture ece411.Reg3bit.untitled
--
-- Created:
--          by - baker30.ews (evrt-252-37.ews.illinois.edu)
--          at - 19:10:39 04/18/13
--
-- using Mentor Graphics HDL Designer(TM) 2012.1 (Build 6)
--
LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.NUMERIC_STD.all;

LIBRARY ece411;
USE ece411.LC3b_types.all;

ENTITY Reg3bit IS
   PORT( 
      RESET_L : IN     std_logic;
      WRITE_H : IN     std_logic;
      bit3in  : IN     LC3B_8MUX_SEL;
      bit3out : OUT    LC3B_8MUX_SEL;
      rCon    : IN     LC3B_8MUX_SEL;
      CLK     : IN     std_logic
   );

-- Declarations

END Reg3bit ;

--
ARCHITECTURE untitled OF Reg3bit IS
BEGIN
    process(bit3in, write_H, reset_l, CLK)
    begin
      if(reset_l = '0') then
        bit3out <= rCon;
      elsif CLK'EVENT and CLK = '1' THEN
        if (write_h='1') then
	    	  bit3out <= bit3in;  
		    end if;
		  end if;
    end process;
END ARCHITECTURE untitled;

