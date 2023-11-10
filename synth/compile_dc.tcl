#/*-----------------------------------------------------------
#/*--  SimpleDSP for ASIC Evaluation
#/*-----------------------------------------------------------
#/*-- Amirkabir University of Technology (Tehran Polytechnic)
#/*-- Computer Engineering Department
#/*-- VLSI-CAD Research Lab
#/*-- Designed by Ali Mohammadpour
#/*-- 
#/*-- All rights reserved, /AUT/CEVLSICAD
#/*-- https://github.com/vlsiland/simpledsp
#/*-----------------------------------------------------------
#/**************************************************/
#/* Compile Script for Synopsys                    */
#/*                                                */
#/* dc_shell-t -f compile_dc.tcl                   */
#/**************************************************/

#/* All verilog files, separated by spaces         */

set my_vhd_files [list \
                ../rtl/arith_unit.vhd \
                ../rtl/generic_mux2x1.vhd \
                ../rtl/generic_reg.vhd \
                ../rtl/logic_unit.vhd \
                ../rtl/control_unit.vhd\
                ../rtl/datapath_unit.vhd \
                ../rtl/simpledsp.vhd ]


# /* Top-level Module                               */
set my_toplevel simpledsp

#/* The name of the clock pin. If no clock-pin     */
#/* exists, pick anything                          */
set my_clock_pin clk

#/* Target frequency in MHz for optimization       */
set my_clk_freq_MHz 1000

#/* Delay of input signals (Clock-to-Q, Package etc.)  */
set my_input_delay_ns 0.1

#/* Reserved time for output signals (Holdtime etc.)   */
set my_output_delay_ns 0.1


# #/**************************************************/
# #/* No modifications needed below                  */
# #/**************************************************/
set OSU_FREEPDK [format "%s" "/mnt/hgfs/WDIR/FPDK45S/osu_soc/lib/files"]
set search_path [concat  $search_path $OSU_FREEPDK]
set alib_library_analysis_path $OSU_FREEPDK

set link_library [set target_library [concat  [list gscl45nm.db] [list dw_foundation.sldb]]]
set target_library "gscl45nm.db"
define_design_lib WORK -path ./WORK
set verilogout_show_unconnected_pins "true"
set_ultra_optimization true
set_ultra_optimization -force

analyze -f vhdl $my_vhd_files

elaborate $my_toplevel

current_design $my_toplevel

link
uniquify

set my_period [expr 1000 / $my_clk_freq_MHz]

set find_clock [ find port [list $my_clock_pin] ]
if {  $find_clock != [list] } {
   set clk_name $my_clock_pin
   create_clock -period $my_period $clk_name
} else {
   set clk_name vclk
   create_clock -period $my_period -name $clk_name
}

set_driving_cell  -lib_cell INVX1  [all_inputs]
set_input_delay $my_input_delay_ns -clock $clk_name [remove_from_collection [all_inputs] $my_clock_pin]
set_output_delay $my_output_delay_ns -clock $clk_name [all_outputs]

compile -ungroup_all -map_effort medium

compile -incremental_mapping -map_effort medium

check_design
report_constraint -all_violators

set filename [format "out/%s%s"  $my_toplevel ".v"]
write -f verilog -output $filename

set filename [format "out/%s%s"  $my_toplevel ".vhd"]
write -f vhd -output $filename

set filename [format "out/%s%s"  $my_toplevel ".sdc"]
write_sdc $filename

set filename [format "out/%s%s"  $my_toplevel ".db"]
write -f db -hier -output $filename -xg_force_db

redirect rpt/report_timing.txt { report_timing }
redirect rpt/report_cell.txt { report_cell }
redirect rpt/repott_power.txt { report_power }
redirect rpt/report_area.txt { report_area }
# write -f ddc -hier -o "out/simpledsp.ddc"
# write_milkyway -output "out/simpledsp.mw"
# quit
