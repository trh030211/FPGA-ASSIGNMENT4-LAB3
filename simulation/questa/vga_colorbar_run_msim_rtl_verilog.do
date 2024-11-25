transcript on
if {[file exists rtl_work]} {
	vdel -lib rtl_work -all
}
vlib rtl_work
vmap work rtl_work

vlog -vlog01compat -work work +incdir+D:/FPGA/AS4/LAB2/QUARTUS_PRJ/ip_core/clk_gen {D:/FPGA/AS4/LAB2/QUARTUS_PRJ/ip_core/clk_gen/clk_gen.v}
vlog -vlog01compat -work work +incdir+D:/FPGA/AS4/LAB2/RTL {D:/FPGA/AS4/LAB2/RTL/vga_ctrl.v}
vlog -vlog01compat -work work +incdir+D:/FPGA/AS4/LAB2/RTL {D:/FPGA/AS4/LAB2/RTL/vga_pic.v}
vlog -vlog01compat -work work +incdir+D:/FPGA/AS4/LAB2/RTL {D:/FPGA/AS4/LAB2/RTL/vga_char.v}
vlog -vlog01compat -work work +incdir+D:/FPGA/AS4/LAB2/QUARTUS_PRJ/db {D:/FPGA/AS4/LAB2/QUARTUS_PRJ/db/clk_gen_altpll.v}

vlog -vlog01compat -work work +incdir+D:/FPGA/AS4/LAB2/QUARTUS_PRJ/../SIM {D:/FPGA/AS4/LAB2/QUARTUS_PRJ/../SIM/tb_vga_ctrl.v}
vlog -vlog01compat -work work +incdir+D:/FPGA/AS4/LAB2/QUARTUS_PRJ/ip_core/clk_gen {D:/FPGA/AS4/LAB2/QUARTUS_PRJ/ip_core/clk_gen/clk_gen.v}
vlog -vlog01compat -work work +incdir+D:/FPGA/AS4/LAB2/QUARTUS_PRJ/../RTL {D:/FPGA/AS4/LAB2/QUARTUS_PRJ/../RTL/vga_ctrl.v}
vlog -vlog01compat -work work +incdir+D:/FPGA/AS4/LAB2/QUARTUS_PRJ/../RTL {D:/FPGA/AS4/LAB2/QUARTUS_PRJ/../RTL/vga_pic.v}

vsim -t 1ps -L altera_ver -L lpm_ver -L sgate_ver -L altera_mf_ver -L altera_lnsim_ver -L cycloneive_ver -L rtl_work -L work -voptargs="+acc"  tb_vga_ctrl

add wave *
view structure
view signals
run 1 us
