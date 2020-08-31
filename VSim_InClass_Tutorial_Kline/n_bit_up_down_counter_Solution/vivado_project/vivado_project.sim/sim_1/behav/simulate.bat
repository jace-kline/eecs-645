@echo off
set xv_path=C:\\Xilinx\\Vivado\\2017.2\\bin
call %xv_path%/xsim n_bit_up_down_counter_tb_behav -key {Behavioral:sim_1:Functional:n_bit_up_down_counter_tb} -tclbatch n_bit_up_down_counter_tb.tcl -view C:/Users/e190a104/Desktop/HW01_VSim_Tutorial_Solution/n_bit_up_down_counter_Solution/simulation_sources/n_bit_up_down_counter_wave.wcfg -log simulate.log
if "%errorlevel%"=="0" goto SUCCESS
if "%errorlevel%"=="1" goto END
:END
exit 1
:SUCCESS
exit 0
