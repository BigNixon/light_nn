# 
# Synthesis run script generated by Vivado
# 

proc create_report { reportName command } {
  set status "."
  append status $reportName ".fail"
  if { [file exists $status] } {
    eval file delete [glob $status]
  }
  send_msg_id runtcl-4 info "Executing : $command"
  set retval [eval catch { $command } msg]
  if { $retval != 0 } {
    set fp [open $status w]
    close $fp
    send_msg_id runtcl-5 warning "$msg"
  }
}
create_project -in_memory -part xc7k70tfbv676-1

set_param project.singleFileAddWarning.threshold 0
set_param project.compositeFile.enableAutoGeneration 0
set_param synth.vivado.isSynthRun true
set_msg_config -source 4 -id {IP_Flow 19-2162} -severity warning -new_severity info
set_property webtalk.parent_dir C:/Users/Nixon/Desktop/projects/neural_networks/light_neural_network/neuron_unit/vivado_project/vivado_project.cache/wt [current_project]
set_property parent.project_path C:/Users/Nixon/Desktop/projects/neural_networks/light_neural_network/neuron_unit/vivado_project/vivado_project.xpr [current_project]
set_property default_lib xil_defaultlib [current_project]
set_property target_language Verilog [current_project]
set_property ip_output_repo c:/Users/Nixon/Desktop/projects/neural_networks/light_neural_network/neuron_unit/vivado_project/vivado_project.cache/ip [current_project]
set_property ip_cache_permissions {read write} [current_project]
read_mem C:/Users/Nixon/Desktop/projects/neural_networks/light_neural_network/neuron_unit/sigmoid_12_bit.mif
read_verilog -library xil_defaultlib -sv {
  C:/Users/Nixon/Desktop/projects/neural_networks/light_neural_network/neuron_unit/config.sv
  C:/Users/Nixon/Desktop/projects/neural_networks/light_neural_network/neuron_unit/multiplier.sv
  C:/Users/Nixon/Desktop/projects/neural_networks/light_neural_network/neuron_unit/neuron_input37.sv
  C:/Users/Nixon/Desktop/projects/neural_networks/light_neural_network/neuron_unit/neuron_input49.sv
  C:/Users/Nixon/Desktop/projects/neural_networks/light_neural_network/neuron_unit/neuron_unit.sv
}
read_ip -quiet c:/Users/Nixon/Desktop/projects/neural_networks/light_neural_network/neuron_unit/vivado_project/vivado_project.srcs/sources_1/ip/sigmoid_IP_2/sigmoid_IP.xci
set_property used_in_implementation false [get_files -all c:/Users/Nixon/Desktop/projects/neural_networks/light_neural_network/neuron_unit/vivado_project/vivado_project.srcs/sources_1/ip/sigmoid_IP_2/sigmoid_IP_ooc.xdc]

# Mark all dcp files as not used in implementation to prevent them from being
# stitched into the results of this synthesis run. Any black boxes in the
# design are intentionally left as such for best results. Dcp files will be
# stitched into the design at a later time, either when this synthesis run is
# opened, or when it is stitched into a dependent implementation run.
foreach dcp [get_files -quiet -all -filter file_type=="Design\ Checkpoint"] {
  set_property used_in_implementation false $dcp
}
read_xdc dont_touch.xdc
set_property used_in_implementation false [get_files dont_touch.xdc]
set_param ips.enableIPCacheLiteLoad 0
close [open __synthesis_is_running__ w]

synth_design -top neuron_unit -part xc7k70tfbv676-1


# disable binary constraint mode for synth run checkpoints
set_param constraints.enableBinaryConstraints false
write_checkpoint -force -noxdef neuron_unit.dcp
create_report "synth_1_synth_report_utilization_0" "report_utilization -file neuron_unit_utilization_synth.rpt -pb neuron_unit_utilization_synth.pb"
file delete __synthesis_is_running__
close [open __synthesis_is_complete__ w]
