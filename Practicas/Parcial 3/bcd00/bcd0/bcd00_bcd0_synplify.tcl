#-- Lattice Semiconductor Corporation Ltd.
#-- Synplify OEM project file

#device options
set_option -technology MACHXO2
set_option -part LCMXO2_7000HE
set_option -package TG144C
set_option -speed_grade -5

#compilation/mapping options
set_option -symbolic_fsm_compiler true
set_option -resource_sharing true

#use verilog 2001 standard option
set_option -vlog_std v2001

#map options
set_option -frequency 100
set_option -maxfan 1000
set_option -auto_constrain_io 0
set_option -disable_io_insertion false
set_option -retiming false; set_option -pipe true
set_option -force_gsr false
set_option -compiler_compatible 0
set_option -dup false

set_option -default_enum_encoding default

#simulation options


#timing analysis options



#automatic place and route (vendor) options
set_option -write_apr_constraint 1

#synplifyPro options
set_option -fix_gated_and_generated_clocks 1
set_option -update_models_cp 0
set_option -resolve_multiple_driver 0


set_option -seqshift_no_replicate 0

#-- add_file options
add_file -vhdl {C:/lscc/diamond/3.12/cae_library/synthesis/vhdl/machxo2.vhd}
add_file -vhdl -lib "work" {C:/Users/crist/Desktop/Semestre20212/Arquitectura de computadoras/Parcial 3/Practicas/bcd00/bcd0/source/oscint00.vhdl}
add_file -vhdl -lib "work" {C:/Users/crist/Desktop/Semestre20212/Arquitectura de computadoras/Parcial 3/Practicas/bcd00/bcd0/source/div00.vhdl}
add_file -vhdl -lib "work" {C:/Users/crist/Desktop/Semestre20212/Arquitectura de computadoras/Parcial 3/Practicas/bcd00/div01.vhdl}
add_file -vhdl -lib "work" {C:/Users/crist/Desktop/Semestre20212/Arquitectura de computadoras/Parcial 3/Practicas/bcd00/bcd0/source/packageosc00.vhdl}
add_file -vhdl -lib "work" {C:/Users/crist/Desktop/Semestre20212/Arquitectura de computadoras/Parcial 3/Practicas/bcd00/bcd0/source/osc00.vhdl}
add_file -vhdl -lib "work" {C:/Users/crist/Desktop/Semestre20212/Arquitectura de computadoras/Parcial 3/Practicas/bcd00/bcd0/source/ac800.vhdl}
add_file -vhdl -lib "work" {C:/Users/crist/Desktop/Semestre20212/Arquitectura de computadoras/Parcial 3/Practicas/bcd00/bcd0/source/ac1200.vhdl}
add_file -vhdl -lib "work" {C:/Users/crist/Desktop/Semestre20212/Arquitectura de computadoras/Parcial 3/Practicas/bcd00/bcd0/source/checkCode00.vhdl}
add_file -vhdl -lib "work" {C:/Users/crist/Desktop/Semestre20212/Arquitectura de computadoras/Parcial 3/Practicas/bcd00/bcd0/source/coderNibbles00.vhdl}
add_file -vhdl -lib "work" {C:/Users/crist/Desktop/Semestre20212/Arquitectura de computadoras/Parcial 3/Practicas/bcd00/bcd0/source/compadd00.vhdl}
add_file -vhdl -lib "work" {C:/Users/crist/Desktop/Semestre20212/Arquitectura de computadoras/Parcial 3/Practicas/bcd00/bcd0/source/contIter00.vhdl}
add_file -vhdl -lib "work" {C:/Users/crist/Desktop/Semestre20212/Arquitectura de computadoras/Parcial 3/Practicas/bcd00/bcd0/source/contring00.vhdl}
add_file -vhdl -lib "work" {C:/Users/crist/Desktop/Semestre20212/Arquitectura de computadoras/Parcial 3/Practicas/bcd00/bcd0/source/init00.vhdl}
add_file -vhdl -lib "work" {C:/Users/crist/Desktop/Semestre20212/Arquitectura de computadoras/Parcial 3/Practicas/bcd00/bcd0/source/loadData00.vhdl}
add_file -vhdl -lib "work" {C:/Users/crist/Desktop/Semestre20212/Arquitectura de computadoras/Parcial 3/Practicas/bcd00/bcd0/source/mux00.vhdl}
add_file -vhdl -lib "work" {C:/Users/crist/Desktop/Semestre20212/Arquitectura de computadoras/Parcial 3/Practicas/bcd00/bcd0/source/pc00.vhdl}
add_file -vhdl -lib "work" {C:/Users/crist/Desktop/Semestre20212/Arquitectura de computadoras/Parcial 3/Practicas/bcd00/bcd0/source/progMem00.vhdl}
add_file -vhdl -lib "work" {C:/Users/crist/Desktop/Semestre20212/Arquitectura de computadoras/Parcial 3/Practicas/bcd00/bcd0/source/shift800.vhdl}
add_file -vhdl -lib "work" {C:/Users/crist/Desktop/Semestre20212/Arquitectura de computadoras/Parcial 3/Practicas/bcd00/bcd0/source/shift1200.vhdl}
add_file -vhdl -lib "work" {C:/Users/crist/Desktop/Semestre20212/Arquitectura de computadoras/Parcial 3/Practicas/bcd00/bcd0/source/sust00.vhdl}
add_file -vhdl -lib "work" {C:/Users/crist/Desktop/Semestre20212/Arquitectura de computadoras/Parcial 3/Practicas/bcd00/bcd0/source/uc00.vhdl}
add_file -vhdl -lib "work" {C:/Users/crist/Desktop/Semestre20212/Arquitectura de computadoras/Parcial 3/Practicas/bcd00/bcd0/source/packagebcd00.vhdl}
add_file -vhdl -lib "work" {C:/Users/crist/Desktop/Semestre20212/Arquitectura de computadoras/Parcial 3/Practicas/bcd00/bcd0/source/bcd00.vhdl}

#-- top module name
set_option -top_module bcd00

#-- set result format/file last
project -result_file {C:/Users/crist/Desktop/Semestre20212/Arquitectura de computadoras/Parcial 3/Practicas/bcd00/bcd0/bcd00_bcd0.edi}

#-- error message log file
project -log_file {bcd00_bcd0.srf}

#-- set any command lines input by customer


#-- run Synplify with 'arrange HDL file'
project -run hdl_info_gen -fileorder
project -run