if [file exists work] {vdel -all}
vlib work
vlog -f files.f
onbreak {resume}
