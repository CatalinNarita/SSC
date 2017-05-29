@echo off
set xv_path=C:\\Xilinx\\Vivado\\2016.4\\bin
call %xv_path%/xelab  -wto b69dab129d714d529dcbb7f19266528c -m64 --debug typical --relax --mt 2 -L xil_defaultlib -L secureip --snapshot add_sim_behav xil_defaultlib.add_sim -log elaborate.log
if "%errorlevel%"=="0" goto SUCCESS
if "%errorlevel%"=="1" goto END
:END
exit 1
:SUCCESS
exit 0
