
# PlanAhead Launch Script for Post-Synthesis floorplanning, created by Project Navigator

create_project -name ProcessorDesign_8_9 -dir "D:/Xilinx/ProcessorDesign_8_9/planAhead_run_4" -part xc6slx45csg324-3
set_property design_mode GateLvl [get_property srcset [current_run -impl]]
set_property edif_top_file "D:/Xilinx/ProcessorDesign_8_9/system_top.ngc" [ get_property srcset [ current_run ] ]
add_files -norecurse { {D:/Xilinx/ProcessorDesign_8_9} {ipcore_dir} }
add_files [list {ipcore_dir/data_ram.ncf}] -fileset [get_property constrset [current_run]]
add_files [list {ipcore_dir/instruction_ram.ncf}] -fileset [get_property constrset [current_run]]
set_property target_constrs_file "system_top.ucf" [current_fileset -constrset]
add_files [list {system_top.ucf}] -fileset [get_property constrset [current_run]]
link_design
