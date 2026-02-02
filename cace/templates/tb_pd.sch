v {xschem version=3.4.8RC file_version=1.3}
G {}
K {}
V {}
S {}
F {}
E {}
N 0 -60 0 0 {lab=GND}
N 220 -60 220 0 {lab=GND}
N 480 -60 480 0 {lab=GND}
N 0 -160 0 -120 {lab=VDD}
N 220 -160 220 -120 {lab=CK_REF}
N 480 -160 480 -120 {lab=CK_IN}
C {devices/vsource.sym} 0 -90 0 0 {name=Vdd value=CACE\{vdd\} save=all}
C {devices/vsource.sym} 220 -90 0 0 {name=Vref value="PULSE(0 CACE\{vdd\} 0 10p 10p 1n 2n)" save=all}
C {devices/vsource.sym} 480 -90 0 0 {name=Vin value="PULSE(0 CACE\{vdd\} 0.5n 10p 10p 1n 2n)" save=all}
C {devices/gnd.sym} 0 0 0 0 {name=l1 lab=GND}
C {devices/gnd.sym} 220 0 0 0 {name=l2 lab=GND}
C {devices/gnd.sym} 480 0 0 0 {name=l3 lab=GND}
C {devices/lab_pin.sym} 0 -160 0 0 {name=p1 lab=VDD}
C {devices/lab_pin.sym} 220 -160 0 0 {name=p2 lab=CK_REF}
C {devices/lab_pin.sym} 480 -160 0 0 {name=p3 lab=CK_IN}
C {devices/lab_wire.sym} 260 150 0 0 {name=p4 lab=CK_IN}
C {devices/lab_wire.sym} 260 190 0 0 {name=p5 lab=CK_REF}
C {Cells/PD.sym} 360 170 0 0 {name=x1}
C {devices/lab_pin.sym} 360 90 0 0 {name=p6 lab=VDD}
C {devices/gnd.sym} 360 250 0 0 {name=l4 lab=GND}
C {netlist_not_shown.sym} 20 220 0 0 {name=s2 only_toplevel=false value=".param vdd_val=1.2

.param vdd_val = CACE\{vdd\}
.param temp_val = CACE\{temperature\}

** Include PDK models
.lib CACE\{PDK_ROOT\}/CACE\{PDK\}/libs.tech/ngspice/models/cornerMOSlv.lib mos_CACE\{corner\}
.lib CACE\{PDK_ROOT\}/CACE\{PDK\}/libs.tech/ngspice/models/cornerRES.lib res_typ
.lib CACE\{PDK_ROOT\}/CACE\{PDK\}/libs.tech/ngspice/models/cornerCAP.lib cap_typ
.include CACE\{PDK_ROOT\}/CACE\{PDK\}/libs.ref/sg13g2_stdcell/spice/sg13g2_stdcell.spice

** Include DUT (Phase Detector subcircuit)
.include "CACE\{DUT_path\}"

** Temperature
.temp CACE\{temperature\}

** Analysis
.tran 1p 20n

** Measure average voltages to calculate gain
.meas tran vup_avg AVG v(UP) FROM=10n TO=20n
.meas tran vdn_avg AVG v(DN) FROM=10n TO=20n
.meas tran pd_gain PARAM='(vup_avg-vdn_avg)/0.785'

** Output results
.control
run
set filetype=ascii
echo $&pd_gain > CACE\{simpath\}/CACE\{filename\}_CACE\{N\}.data
.endc

.end"}
