# Simple STA script
read_liberty /home/araj_7/OpenROAD-flow-scripts/flow/platforms/nangate45/lib/NangateOpenCellLibrary_typical.lib
read_verilog memory_bank.v
read_verilog decoder.v
read_verilog mux.v
read_verilog banked_memory.v
link_design banked_memory
create_clock -name clk -period 10 [get_ports clk]
report_checks
report_power
exit
