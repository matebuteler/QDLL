v {xschem version=3.4.8RC file_version=1.2}
G {}
K {}
V {}
S {}
F {}
E {}
N -1890 -1250 -1890 -1240 {
lab=vin1}
N -1250 -1170 -1250 -1130 {lab=VSS}
N -1250 -1250 -1250 -1230 {lab=vin2}
N -1890 -1180 -1890 -1140 {lab=GND}
N -2005 -1147.5 -2005 -1087.5 {
lab=GND}
N -2005 -1247.5 -2005 -1207.5 {lab=VSS}
N -1472.5 -1077.5 -1472.5 -1060 {lab=vup}
N -1512.5 -1030 -1512.5 -993.75 {lab=vdn}
N -1531.25 -1060 -1472.5 -1060 {lab=vup}
N -1532.5 -1030 -1512.5 -1030 {lab=vdn}
N -1512.5 -1030 -1426.25 -1030 {lab=vdn}
N -1250 -1250 -1110 -1250 {lab=vin2}
N -1472.5 -1060 -1426.25 -1060 {lab=vup}
N -1740 -1060 -1710 -1060 {lab=vin1}
N -1740 -1030 -1710 -1030 {lab=vin2}
N -1710 -1030 -1710 -1000 {lab=vin2}
N -1710 -1030 -1690 -1030 {lab=vin2}
N -1710 -1090 -1710 -1060 {lab=vin1}
N -1710 -1060 -1690 -1060 {lab=vin1}
N -1490 -1140 -1310 -1140 {lab=#net1}
N -1310 -1140 -1310 -1050 {lab=#net1}
N -1740 -1030 -1740 -940 {lab=vin2}
N -1740 -940 -1110 -940 {lab=vin2}
N -1110 -1250 -1110 -940 {lab=vin2}
N -1740 -1250 -1740 -1060 {lab=vin1}
N -1890 -1250 -1740 -1250 {
lab=vin1}
N -1740 -1250 -1610 -1250 {lab=vin1}
N -1490 -1210 -1490 -1140 {lab=#net1}
N -1320 -1050 -1310 -1050 {lab=#net1}
N -1580 -1210 -1580 -1175 {lab=VSS}
N -1370 -1250 -1250 -1250 {lab=vin2}
N -2090 -1150 -2090 -1090 {
lab=GND}
N -2090 -1220 -2090 -1210 {lab=VDD}
N -1580 -1330 -1580 -1300 {lab=VDD}
C {devices/code_shown.sym} -925 -1217.5 0 0 {name=s2 only_toplevel=false 
value="
.save v(vin1) v(vin2)  v(vc) v(vdn) v(vup)



.tran 10p 10n
.save all
*.ic v(vout) = 0
.control
set color0 = white
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
C {devices/lab_pin.sym} -1580 -1330 1 0 {name=Vdd11 sig_type=std_logic lab=VDD
value=1.2}
C {devices/capa.sym} -1250 -1200 0 0 {name=C1
m=1
value=100f
footprint=1206
device="ceramic capacitor"
}
C {devices/launcher.sym} -1331.875 -1438.75 0 0 {name=h2
descr="Simulate" 
tclcommand="xschem save; xschem netlist; xschem simulate"
}
C {devices/vsource.sym} -1890 -1210 0 0 {name=VIN1 value="PULSE(0 1.2 0 5p 5p 1n 2n)"}
C {devices/gnd.sym} -1890 -1140 0 0 {name=l1 lab=GND}
C {devices/vsource.sym} -2005 -1177.5 0 0 {name=Vss1 value=0}
C {devices/gnd.sym} -2005 -1087.5 0 0 {name=l34 lab=GND}
C {devices/lab_pin.sym} -2005 -1247.5 0 0 {name=p26 sig_type=std_logic lab=VSS}
C {devices/lab_pin.sym} -1472.5 -1067.5 1 0 {name=p5 sig_type=std_logic lab=vup}
C {devices/lab_pin.sym} -1512.5 -993.75 3 0 {name=p9 sig_type=std_logic lab=vdn}
C {/foss/designs/UNIC-CASS-Aug25/sch/phase_detector/phase_detector.sym} -1610 -1050 0 0 {name=x7}
C {lab_pin.sym} -1580 -1180 3 0 {name=p11 sig_type=std_logic lab=VSS}
C {lab_pin.sym} -1250 -1130 3 0 {name=p13 sig_type=std_logic lab=VSS}
C {devices/code_shown.sym} -930 -1480 0 0 {name=MODEL2 only_toplevel=true
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
C {lab_pin.sym} -1710 -1090 1 0 {name=p14 sig_type=std_logic lab=vin1}
C {lab_pin.sym} -1710 -1000 3 0 {name=p15 sig_type=std_logic lab=vin2
}
C {/foss/designs/UNIC-CASS-Aug25/sch/delay_variable_line/variable_delay_line.sym} -1490 -1250 0 0 {name=x2}
C {devices/vsource.sym} -2090 -1180 0 0 {name=Vdd1 value=1.2}
C {devices/gnd.sym} -2090 -1090 0 0 {name=Vdd2 lab=GND
value=1.2}
C {devices/lab_pin.sym} -2090 -1220 1 0 {name=Vdd3 sig_type=std_logic lab=VDD
value=1.2}
C {/foss/designs/UNIC-CASS-Aug25/sch/charge_pump/charge_pump.sym} -1330 -1050 0 0 {name=x1}
