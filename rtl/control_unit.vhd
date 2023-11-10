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

entity control_unit is
    generic (WIDTH: POSITIVE:= 4);
    port (
        clk: std_logic;
        rst: std_logic;
        inst: std_logic_vector(1 downto 0);
        status : in std_logic_vector(3 downto 0);
        op_arith: out std_logic_vector(1 downto 0);
        op_logic: out std_logic_vector(1 downto 0);
        op_mux:out std_logic
    );

end entity;


architecture arch of control_unit is

    type states_t is (ST_IDLE, ST_ARITH, ST_SEL, ST_LOGIC);
    
    signal state: states_t;

begin
    
    process (clk)
    begin
        if rising_edge(clk) then
            if rst = '1' then
                state <= ST_IDLE;
            else
                if state = ST_IDLE then
                    if inst = "00" then
                        state <= ST_IDLE;
                    elsif inst = "01" then 
                        state <= ST_ARITH;
                    elsif inst = "01" then
                        state <= ST_SEL;
                    else
                        state <= ST_LOGIC;
                    end if;
                elsif state = ST_LOGIC then
                    case status(1 downto 0) is
                        when "00" =>
                            state <= ST_IDLE;
                        when "01" =>
                            state <= ST_LOGIC;
                        when "10" =>
                            state <= ST_SEL;
                        when others =>
                            state <= ST_ARITH;
                    end case;
                elsif state = ST_SEL then
                    state <= ST_LOGIC;
                else
                    if status = "11" then
                        state <= ST_SEL;
                    else
                        state <= state;
                    end if;

                end if;
            end if;
        end if;



    end process;
    
    process(state)
    begin
        op_arith <= "00";
        op_logic <= "00";
        op_mux <= '0';
        if state = ST_IDLE then
           op_arith <= status(3 downto 2);
           op_logic <= status(1 downto 0);
           op_mux <= '0';
        elsif state = ST_ARITH then
            op_arith <= inst;
            op_logic <= status(1 downto 0);
            op_mux <= '1';
        elsif state = ST_SEL then
            op_arith <= inst;
            op_logic <= status(1 downto 0);
            op_mux <= inst(0);
        elsif state = ST_LOGIC then
            op_arith <= status(3 downto 2);
            op_logic <= inst;
            op_mux <= inst(1);
        end if;
    end process;
end;
