@echo off
set xv_path=C:\\Xilinx\\Vivado\\2017.2\\bin
call %xv_path%/xelab  -wto c0e9c0c0e58d4a91986eb8ca26d29413 -m64 --debug typical --relax --mt 2 -L xil_defaultlib -L secureip --snapshot n_bit_up_down_counter_tb_behav xil_defaultlib.n_bit_up_down_counter_tb -log elaborate.log
if "%errorlevel%"=="0" goto SUCCESS
if "%errorlevel%"=="1" goto END
:END
exit 1
:SUCCESS
exit 0
