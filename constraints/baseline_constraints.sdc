#set sdc_version 2.1
reset_design
set PERIOD 0.67
set INPUT_DELAY 0.5
set OUTPUT_DELAY 0.5
set CLOCK_LATENCY 0.25
set SOURCE_LATENCY 0.25
set UNCERTAINTY 0.1
set MAX_TRANSITION 0.2
set MIN_CLOCK_LATENCY 0.05
set MIN_SOURCE_LATENCY 0.05
set MIN_IO_DELAY 0.1

create_clock -name "clk_aon" -period $PERIOD [get_ports clk_aon]
set_clock_latency $CLOCK_LATENCY [get_clocks clk_aon]
set_clock_latency -min $MIN_CLOCK_LATENCY [get_clocks clk_aon]
set_clock_latency -source $SOURCE_LATENCY [get_clocks clk_aon]
set_clock_latency -source -min $MIN_SOURCE_LATENCY [get_clocks clk_aon]
set_clock_uncertainty -setup $UNCERTAINTY [get_clocks clk_aon]
set_clock_uncertainty -hold $UNCERTAINTY [get_clocks clk_aon]
set_clock_transition 0.05 [get_clocks clk_aon]

group_path -name CLOCK\
           -to [get_clocks clk_aon]\
           -weight 1
group_path -name INPUTS\
           -from [all_inputs]\
           -weight 1
group_path -name OUTPUTS\
           -to [all_outputs]\
           -weight 1
group_path -name COMBO\
           -from [all_inputs]\
           -to [all_outputs]\
           -weight 1
set_false_path -from [get_ports rst_n]

set INPUTPORTS [remove_from_collection [all_inputs] [get_ports clk_aon]]
set OUTPUTPORTS [all_outputs]
set_input_delay -clock "clk_aon" -max $INPUT_DELAY $INPUTPORTS
set_output_delay -clock "clk_aon" -max $OUTPUT_DELAY $OUTPUTPORTS
set_input_delay -clock "clk_aon" -min $MIN_IO_DELAY $INPUTPORTS
set_output_delay -clock "clk_aon" -min $MIN_IO_DELAY $OUTPUTPORTS
set_max_transition $MAX_TRANSITION [current_design]
set_max_fanout 20 [current_design]
set_max_capacitance 80 [current_design]
