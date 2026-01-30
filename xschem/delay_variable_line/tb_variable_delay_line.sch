v {xschem version=3.4.6 file_version=1.2}
G {}
K {}
V {}
S {}
E {}
L 4 1000 -560 1000 -40 {}
L 4 1000 -40 1960 -40 {}
L 4 1960 -580 1960 -40 {}
L 4 1000 -580 1960 -580 {}
L 4 1000 -580 1000 -560 {}
P 4 1 1940 160 {}
N 1642.5 -295 1782.5 -295 {lab=vout}
N 1782.5 -315 1782.5 -295 {lab=vout}
N 1782.5 -295 1782.5 -265 {lab=vout}
N 1782.5 -205 1782.5 -175 {lab=GND}
N 1522.5 -245 1522.5 -205 {lab=#net1}
N 1522.5 -145 1522.5 -125 {lab=GND}
N 1432.5 -245 1432.5 -225 {lab=GND}
N 1362.5 -295 1392.5 -295 {lab=vgate}
N 1242.5 -295 1272.5 -295 {lab=vin1}
N 1202.5 -235 1202.5 -225 {lab=GND}
N 1242.5 -305 1242.5 -295 {lab=vin1}
N 1202.5 -295 1242.5 -295 {lab=vin1}
N 1362.5 -305 1362.5 -295 {lab=vgate}
N 1332.5 -295 1362.5 -295 {lab=vgate}
N 1312.5 -415 1332.5 -415 {lab=GND}
N 1392.5 -415 1432.5 -415 {lab=#net2}
N 1432.5 -415 1432.5 -345 {lab=#net2}
C {devices/launcher.sym} 1158.75 -488.75 0 0 {name=h3
descr="Simulate" 
tclcommand="xschem save; xschem netlist; xschem simulate"
}
C {devices/code_shown.sym} 2015 -535 0 0 {name=s1 only_toplevel=false 
value="
.save v(vin) v(vgate) v(vout) v(va)



.tran 2p 20n
.save all
*.ic v(vout) = 0
.control
run
plot v(vin1) v(vout) 

*plot v(vgate) 
*plot v(vout)
*meas tran teval WHEN v(vout) = 0.63
*let res_val = 1000
*let cap_val = teval/res_val
*print cap_val
.endc
"}
C {delay_variable_line/variable_delay_line.sym} 1522.5 -293.75 0 0 {name=x1}
C {lab_pin.sym} 1782.5 -315 1 0 {name=p1 sig_type=std_logic lab=vout}
C {capa.sym} 1782.5 -235 0 0 {name=C1
m=1
value=100f
footprint=1206
device="ceramic capacitor"}
C {gnd.sym} 1782.5 -175 0 0 {name=l1 lab=GND}
C {vsource.sym} 1522.5 -175 0 0 {name=V1 value=0 savecurrent=false}
C {gnd.sym} 1522.5 -125 0 0 {name=l2 lab=GND}
C {gnd.sym} 1432.5 -225 0 0 {name=l3 lab=GND}
C {res.sym} 1302.5 -295 1 0 {name=R1
value=0k
footprint=1206
device=resistor
m=1}
C {vsource.sym} 1202.5 -265 0 0 {name=V5 value="PULSE(0 1.2 0 5p 5p 0.5n 1n)" savecurrent=false}
C {gnd.sym} 1202.5 -225 0 0 {name=l4 lab=GND}
C {lab_pin.sym} 1362.5 -305 1 0 {name=p2 sig_type=std_logic lab=vgate}
C {lab_pin.sym} 1242.5 -305 1 0 {name=p3 sig_type=std_logic lab=vin1
}
C {vsource.sym} 1362.5 -415 1 0 {name=V6 value=1.2 savecurrent=false}
C {gnd.sym} 1312.5 -415 1 0 {name=l5 lab=GND}
C {devices/code_shown.sym} 1022.5 -897.5 0 0 {name=MODEL1 only_toplevel=true
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
C {devices/launcher.sym} 798.125 -938.75 0 0 {name=h1
descr="Simulate" 
tclcommand="xschem save; xschem netlist; xschem simulate"
}
