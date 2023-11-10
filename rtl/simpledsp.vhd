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

library work;
use work.all;

entity simpledsp is
    generic (WIDTH: POSITIVE:= 4);
    port (
        clk: std_logic;
        rst: std_logic;
        inst: std_logic_vector(1 downto 0);
        dpu_x: in std_logic_vector(WIDTH-1 downto 0);
        dpu_y: in std_logic_vector(WIDTH-1 downto 0);
        dpu_w: in std_logic_vector(WIDTH-1 downto 0);
        dpu_z: in std_logic_vector(WIDTH-1 downto 0);


        dpu_output: out std_logic_vector(WIDTH-1 downto 0);

        dpu_status : out std_logic_vector(3 downto 0)
    );

end entity;


architecture arch of simpledsp is

    signal op_arith:  std_logic_vector(1 downto 0);
    signal op_logic:  std_logic_vector(1 downto 0);
    signal op_mux: std_logic;
    signal status : std_logic_vector(3 downto 0);
begin

    dp: entity work.datapath_unit(arch)
        generic map (WIDTH => WIDTH)
        port map(
            clk => clk,
            rst => rst,
            dpu_x => dpu_x,
            dpu_y => dpu_y,
            dpu_w => dpu_w,
            dpu_z => dpu_z,
            op_arith => op_arith,
            op_logic => op_logic,
            op_mux => op_mux,
            dpu_output => dpu_output,
            status => status
        );
    
    cp: entity work.control_unit(arch)
        generic map (WIDTH => WIDTH)
        port map(
            clk => clk,
            rst => rst,
            inst => inst,
            status => status,
            op_arith => op_arith,
            op_logic => op_logic,
            op_mux => op_mux
        );

    dpu_status <= status;
    

end;
