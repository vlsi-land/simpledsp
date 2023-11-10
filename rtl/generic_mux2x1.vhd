-----------------------------------------------------------
--  SimpleDSP for ASIC Evaluation
-----------------------------------------------------------
-- Amirkabir University of Technology (Tehran Polytechnic)
-- Computer Engineering Department
-- VLSI-CAD Research Lab
-- Designed by Ali Mohammadpour
-- 
-- All rights reserved, /AUT/CEVLSICAD
-- https://github.com/vlsiland/simpledsp
-----------------------------------------------------------

library ieee;
use ieee.std_logic_1164.all;

entity generic_mux2x1 is
 
    generic (WIDTH: POSITIVE:= 4);
    port (
        ix: in std_logic_vector(WIDTH-1 downto 0);
        iy: in std_logic_vector(WIDTH-1 downto 0);
        sel: in std_logic;
        outp: out std_logic_vector(WIDTH-1 downto 0)
    );

end entity;

architecture arch of generic_mux2x1 is 

begin
    
    outp <= ix when sel = '0' else iy;
    
end;
