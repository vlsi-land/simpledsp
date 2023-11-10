---------------------------------------
-- TinyCore for ASIC Evaluation
-- Amirkabir University of Technology
-- Computer Engineering Department
-- VLSI-CAD Research Lab
-- Ali Mohammadpour
---------------------------------------
--
-- Generic Arithmetic Logic Unit
-- Parameters:
--    WIDTH: Inputs and Outputs Width
---------------------------------------

library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_signed.all;

entity generic_mux2x1 is
 
    generic (WIDTH: POSITIVE:= 4);
    port (
        ix: in std_logic_vector(WIDTH-1 downto 0);
        iy: in std_logic_vector(WIDTH-1 downto 0);
        sel: in std_logic;
        outp: out std_logic_vector(WIDTH-1 downto 0)
    );

end entity;

architecture arch of arith_unit is 

begin
    
    outp <= ix when sel = '0' else iy;
    
end;
