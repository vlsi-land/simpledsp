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

entity arith_unit is
    generic (WIDTH: POSITIVE:= 4);
    port (
        ix: in std_logic_vector(WIDTH-1 downto 0);
        iy: in std_logic_vector(WIDTH-1 downto 0);
        opc: in std_logic_vector(1 downto 0);
        outp: out std_logic_vector(WIDTH-1 downto 0);
        sign: out std_logic;
        zero: out std_logic
    );

end entity;


architecture arch of arith_unit is 
    signal res: std_logic_vector(WIDTH downto 0);    
    constant ONES: std_logic_vector(WIDTH downto 0):= (others => '1');
    constant ZEROS: std_logic_vector(WIDTH downto 0):= (others => '0');
begin

    with opc select
        res <= 
            ('0' & ix) + ('0' & iy) when "00",
            ('0' & ix) - ('0' & iy) when "01",
            (ix(WIDTH-1) & ix) + (iy(WIDTH-1) & iy) when "10",
            (ix(WIDTH-1) & ix) + (iy(WIDTH-1) & iy) when "11",
            ONES when others;

    outp <= res(WIDTH-1 downto 0);
    
    zero <= '1' when res = ZEROS else '0';
    sign <= res(WIDTH-1);
            
end;
