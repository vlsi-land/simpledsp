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

entity generic_reg is
    
    generic (WIDTH: POSITIVE:= 4);
    port (
        clk: in std_logic;
        rst: in std_logic;
        enb: in std_logic;
        din: in std_logic_vector(WIDTH-1 downto 0);
        dout: out std_logic_vector(WIDTH-1 downto 0)
    );

end entity;

architecture arch of generic_reg is 

    signal data: std_logic_vector(WIDTH-1 downto 0);

begin
    
    process(clk)
    begin
        if rising_edge(clk) then
            if rst = '1' then
                data <= (others => '0');
            elsif enb = '1' then
                data <= din;
            else
                data <= data;
            end if;
        end if;
    end process;
    
    dout <= data;
    
end;
