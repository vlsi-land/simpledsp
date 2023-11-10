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

entity datapath_unit is
    generic (WIDTH: POSITIVE:= 4);
    port (
        clk: std_logic;
        rst: std_logic;
        dpu_x: in std_logic_vector(WIDTH-1 downto 0);
        dpu_y: in std_logic_vector(WIDTH-1 downto 0);
        dpu_w: in std_logic_vector(WIDTH-1 downto 0);
        dpu_z: in std_logic_vector(WIDTH-1 downto 0);
        op_arith: in std_logic_vector(1 downto 0);
        op_logic: in std_logic_vector(1 downto 0);
        op_mux:in std_logic;

        dpu_output: out std_logic_vector(WIDTH-1 downto 0);

        status : out std_logic_vector(3 downto 0)
    );

end entity;


architecture arch of datapath_unit is

    constant active: std_logic := '1';
    
    signal arith_res   : std_logic_vector(WIDTH-1 downto 0); 
    signal arith_regout: std_logic_vector(WIDTH-1 downto 0); 
    signal dpuw_regout: std_logic_vector(WIDTH-1 downto 0); 
    signal dpuz_regout: std_logic_vector(WIDTH-1 downto 0); 
    signal dpuz_regnext: std_logic_vector(WIDTH-1 downto 0); 
    signal mux_out: std_logic_vector(WIDTH-1 downto 0); 
    signal mux_regout: std_logic_vector(WIDTH-1 downto 0); 
    signal logic_res: std_logic_vector(WIDTH-1 downto 0); 
    
    signal arith_sign: std_logic;
    signal arith_zero: std_logic;
    signal logic_full: std_logic;
    signal logic_zero: std_logic;
    
begin
    
    
    -------------------------------------
    ----- DATA PATH Pipeline STAGE 1 ----
    arith: entity work.arith_unit(arch)
        generic map (WIDTH => WIDTH)
        port map (
            ix => dpu_x,
            iy => dpu_y,
            opc => op_arith,
            sign => arith_sign,
            zero => arith_zero,
            outp => arith_res   
        );
        
        
    arith_reg: entity work.generic_reg(arch)
        generic map (WIDTH => WIDTH)
        port map(
            clk => clk,
            rst => rst,
            enb => active,
            din => arith_res,
            dout => arith_regout
        );
    dpuw_reg: entity work.generic_reg(arch)
        generic map (WIDTH => WIDTH)
        port map(
            clk => clk,
            rst => rst,
            enb => active,
            din => dpu_w,
            dout => dpuw_regout
        );
        
    dpuz_reg: entity work.generic_reg(arch)
        generic map (WIDTH => WIDTH)
        port map(
            clk => clk,
            rst => rst,
            enb => active,
            din => dpu_z,
            dout => dpuz_regout
        );
    -------------------------------------
    ----- DATA PATH Pipeline STAGE 2 ----
    mux_unit: entity work.generic_mux2x1(arch)
        generic map (WIDTH => WIDTH)
        port map(
            ix => arith_regout,
            iy => dpuw_regout,
            sel => op_mux,
            outp => mux_out
        );
    mux_reg: entity work.generic_reg(arch)
        generic map (WIDTH => WIDTH)
        port map(
            clk => clk,
            rst => rst,
            enb => active,
            din => mux_out,
            dout => mux_regout
        );
    
    dpuz_regreg: entity work.generic_reg(arch)
        generic map (WIDTH => WIDTH)
        port map(
            clk => clk,
            rst => rst,
            enb => active,
            din => dpuz_regout,
            dout => dpuz_regnext
        );
    -------------------------------------
    ----- DATA PATH Pipeline STAGE 3 ----     
    logic: entity work.logic_unit(arch)
        generic map (WIDTH => WIDTH)
        port map (
            ix => mux_regout,
            iy => dpuz_regnext,
            opc => op_logic,
            full => logic_full,
            zero => logic_zero,
            outp => logic_res   
        );
    outreg: entity work.generic_reg(arch)
        generic map (WIDTH => WIDTH)
        port map(
            clk => clk,
            rst => rst,
            enb => active,
            din => logic_res,
            dout => dpu_output
        );
        
    status <= arith_sign & arith_zero & logic_full & logic_zero;


end;
