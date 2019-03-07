if [file exists work] {vdel -all}

vlib work

vlog -f "files.f"

onbreak {resume}

set NoQuitOnFinish 1

vsim -voptargs=+acc work.TB_blinking_machine

do wave.do

run 1300ms