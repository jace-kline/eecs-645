@echo off
REM ****************************************************************************
REM Vivado (TM) v2019.2 (64-bit)
REM
REM Filename    : elaborate.bat
REM Simulator   : Xilinx Vivado Simulator
REM Description : Script for elaborating the compiled design
REM
REM Generated by Vivado on Wed Sep 02 17:20:07 -0500 2020
REM SW Build 2708876 on Wed Nov  6 21:40:23 MST 2019
REM
REM Copyright 1986-2019 Xilinx, Inc. All Rights Reserved.
REM
REM usage: elaborate.bat
REM
REM ****************************************************************************
echo "xelab -wto 1702ea8a0b67437b9cf2061df1ac2252 --incr --debug typical --relax --mt 2 -L xil_defaultlib -L secureip --snapshot mod_m_up_dn_count_tb_behav xil_defaultlib.mod_m_up_dn_count_tb -log elaborate.log"
call xelab  -wto 1702ea8a0b67437b9cf2061df1ac2252 --incr --debug typical --relax --mt 2 -L xil_defaultlib -L secureip --snapshot mod_m_up_dn_count_tb_behav xil_defaultlib.mod_m_up_dn_count_tb -log elaborate.log
if "%errorlevel%"=="0" goto SUCCESS
if "%errorlevel%"=="1" goto END
:END
exit 1
:SUCCESS
exit 0
