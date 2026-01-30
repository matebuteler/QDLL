v {xschem version=3.4.8RC file_version=1.2}
G {}
K {}
V {}
S {}
F {}
E {}
N 310 -1280 370 -1280 {
lab=GND}
N 430 -1280 470 -1280 {lab=VDD}
N 160 -1130 160 -1120 {
lab=vin1}
N 340 -1130 410 -1130 {
lab=vin1}
N 490 -1080 490 -1020 {lab=vc}
N 970 -1050 970 -1030 {lab=VSS}
N 970 -1130 970 -1110 {lab=vin2}
N 808.75 -1280 808.75 -1170 {lab=VDD}
N 930 -1130 970 -1130 {lab=vin2}
N 582.5 -1195 582.5 -1130 {lab=va}
N 450 -1080 450 -1055 {lab=VSS}
N 160 -1060 160 -1020 {lab=GND}
N 582.5 -1130 630 -1130 {lab=va}
N 470 -1280 808.75 -1280 {lab=VDD}
N 490 -1020 610 -1020 {lab=vc}
N 1120 -1130 1120 -550 {lab=vin2}
N 470 -1280 470 -1180 {lab=VDD}
N 530 -1130 582.5 -1130 {lab=va}
N 135 -777.5 135 -717.5 {
lab=GND}
N 135 -877.5 135 -837.5 {lab=VSS}
N 510 -550 1120 -550 {lab=vin2}
N 340 -550 480 -550 {lab=vin1}
N 462.5 -817.5 480 -817.5 {lab=vup}
N 510 -777.5 546.25 -777.5 {lab=vdn}
N 340 -1130 340 -550 {lab=vin1}
N 160 -1130 340 -1130 {
lab=vin1}
N 480 -817.5 480 -758.75 {lab=vup}
N 510 -777.5 510 -757.5 {lab=vdn}
N 510 -863.75 510 -777.5 {lab=vdn}
N 490 -1020 490 -980 {lab=vc}
N 810 -1090 810 -1070 {lab=VSS}
N 1030 -1030 1030 -1010 {lab=VSS}
N 970 -1030 1030 -1030 {lab=VSS}
N 1030 -1130 1120 -1130 {lab=vin2}
N 1030 -1050 1030 -1030 {lab=VSS}
N 1030 -1130 1030 -1110 {lab=vin2}
N 970 -1130 1030 -1130 {lab=vin2}
N 480 -863.75 480 -817.5 {lab=vup}
N 480 -580 480 -550 {lab=vin1}
N 510 -580 510 -550 {lab=vin2}
N 510 -580 540 -580 {lab=vin2}
N 510 -600 510 -580 {lab=vin2}
N 450 -580 480 -580 {lab=vin1}
N 480 -600 480 -580 {lab=vin1}
C {devices/code_shown.sym} 1215 -1077.5 0 0 {name=s1 only_toplevel=false 
value="
.save v(vin1) v(vin2)  v(vc) v(vdn) v(vup)



.tran 10p 20n
.save all
*.ic v(vout) = 0
.control
run
plot v(vin1) v(vin2)
plot v(vc)
plot v(vup) v(vdn)
plot v(va)

*plot v(vin2) 

*plot v(vout)
*meas tran teval WHEN v(vout) = 0.63
*let res_val = 1000
*let cap_val = teval/res_val
*print cap_val
.endc
"}
C {devices/vsource.sym} 400 -1280 1 0 {name=Vdd1 value=1.2}
C {devices/gnd.sym} 310 -1280 1 0 {name=Vdd2 lab=GND
value=1.2}
C {devices/lab_pin.sym} 470 -1280 1 0 {name=Vdd3 sig_type=std_logic lab=VDD
value=1.2}
C {devices/lab_pin.sym} 610 -1020 1 0 {name=p4 sig_type=std_logic lab=vc}
C {devices/capa.sym} 970 -1080 0 0 {name=C4
m=1
value=400f
footprint=1206
device="ceramic capacitor"
}
C {devices/launcher.sym} 848.125 -828.75 0 0 {name=h1
descr="Simulate" 
tclcommand="xschem save; xschem netlist; xschem simulate"
}
C {devices/vsource.sym} 160 -1090 0 0 {name=VIN3 value="PULSE(0 1.2 0 5p 5p 1n 2n)"}
C {devices/gnd.sym} 160 -1020 0 0 {name=l7 lab=GND}
C {devices/lab_pin.sym} 582.5 -1195 1 0 {name=p10 sig_type=std_logic lab=va}
C {devices/vsource.sym} 135 -807.5 0 0 {name=Vss1 value=0}
C {devices/gnd.sym} 135 -717.5 0 0 {name=l34 lab=GND}
C {devices/lab_pin.sym} 135 -877.5 0 0 {name=p26 sig_type=std_logic lab=VSS}
C {devices/lab_pin.sym} 472.5 -817.5 0 0 {name=p7 sig_type=std_logic lab=vup}
C {devices/lab_pin.sym} 546.25 -777.5 2 0 {name=p8 sig_type=std_logic lab=vdn}
C {/foss/designs/UNIC-CASS-Aug25/sch/large_delay_vto1p1/large_delay_vto1p1.sym} 750 -1130 0 0 {name=x4}
C {/foss/designs/UNIC-CASS-Aug25/sch/delay_variable/delay_variable.sym} 470 -1130 0 0 {name=x1}
C {/foss/designs/UNIC-CASS-Aug25/sch/push_pull/push_pull.sym} 490 -960 3 0 {name=x3}
C {/foss/designs/UNIC-CASS-Aug25/sch/phase_detector/phase_detector.sym} 490 -680 3 0 {name=x2}
C {lab_pin.sym} 450 -1060 3 0 {name=p1 sig_type=std_logic lab=VSS}
C {lab_pin.sym} 810 -1070 3 0 {name=p2 sig_type=std_logic lab=VSS}
C {lab_pin.sym} 1030 -1010 3 0 {name=p3 sig_type=std_logic lab=VSS}
C {vsource.sym} 1030 -1080 0 0 {name=V2 value=3 savecurrent=false
spice_ignore=true}
C {devices/code_shown.sym} 1120 -1360 0 0 {name=MODEL1 only_toplevel=true
format="tcleval( @value )"
value="

.param corner=0

.if (corner==0)
.lib $::SG13G2_MODELS/cornerMOSlv.lib mos_tt
.lib $::SG13G2_MODELS/cornerMOSlv.lib mos_tt
.lib $::SG13G2_MODELS/cornerRES.lib res_typ
.lib $::SG13G2_MODELS/cornerCAP.lib cap_typ
.endif

.include /foss/pdks/ihp-sg13g2/libs.ref/sg13g2_stdcell/spice/sg13g2_stdcell.spice
"}
C {lab_pin.sym} 450 -580 0 0 {name=p5 sig_type=std_logic lab=vin1}
C {lab_pin.sym} 540 -580 2 0 {name=p6 sig_type=std_logic lab=vin2
}
