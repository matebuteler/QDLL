v {xschem version=3.4.6 file_version=1.2}
G {}
K {}
V {}
S {}
E {}
N 1310 -320 1310 -280 {lab=GND}
N 1310 -220 1310 -190 {lab=vin1}
N 1310 -70 1310 -40 {lab=GND}
N 1310 -160 1310 -130 {lab=vin2}
N 1842.5 -60 1842.5 -46.25 {lab=GND}
N 1780 -80 1780 -60 {lab=GND}
N 1780 -160 1780 -140 {lab=vdn}
N 1630 -160 1780 -160 {lab=vdn}
N 1630 -190 1780 -190 {lab=vup}
N 1780 -230 1780 -190 {lab=vup}
N 1777.5 -230 1780 -230 {lab=vup}
N 1780 -250 1780 -230 {lab=vup}
N 1840 -340 1840 -320 {lab=GND}
N 1780 -340 1840 -340 {lab=GND}
N 1780 -340 1780 -310 {lab=GND}
N 1780 -60 1842.5 -60 {lab=GND}
N 1310 -160 1470 -160 {lab=vin2}
N 1310 -190 1470 -190 {lab=vin1}
N 1992.5 -80 1992.5 -66.25 {lab=GND}
N 1930 -100 1930 -80 {lab=GND}
N 1930 -180 1930 -160 {lab=vc}
N 1928.75 -180 1930 -180 {lab=vc}
N 1930 -80 1992.5 -80 {lab=GND}
N 960 -80 960 -20 {
lab=GND}
N 960 -180 960 -140 {lab=VSS}
N 860 -80 860 -20 {
lab=GND}
N 860 -180 860 -140 {lab=VDD}
N 1928.75 -203.75 1928.75 -180 {lab=vc}
N 1900 -180 1928.75 -180 {lab=vc}
C {devices/code_shown.sym} 2045 -375 0 0 {name=s1 only_toplevel=false 
value="
.save v(vin1) v(vin2) v(vup) v(vdn) v(vc) 



.tran 2p 10n
.save all
*.ic v(vout) = 0
.control
run
*plot v(vin1) v(vin2) 
plot v(vup) v(vdn) v(vc)

*plot v(vin2) 

*plot v(vout)
*meas tran teval WHEN v(vout) = 0.63
*let res_val = 1000
*let cap_val = teval/res_val
*print cap_val
.endc
"}
C {devices/launcher.sym} 1166.25 -175 0 0 {name=h3
descr="Simulate" 
tclcommand="xschem save; xschem netlist; xschem simulate"
}
C {devices/vsource.sym} 1310 -250 2 0 {name=VIN1 value="PULSE(0 1.2 0 1p 1p 1n 2n)"}
C {devices/gnd.sym} 1310 -320 2 0 {name=l5 lab=GND}
C {/foss/designs/DLL/phase_detector.sym} 1550 -180 0 0 {name=x2
}
C {devices/vsource.sym} 1310 -100 0 0 {name=VIN2 value="PULSE(0 1.2 1.0n 1p 1p 1n 2n)"}
C {devices/gnd.sym} 1310 -40 0 0 {name=l9 lab=GND}
C {devices/gnd.sym} 1842.5 -47.5 0 0 {name=l10 lab=GND}
C {devices/capa.sym} 1780 -110 0 0 {name=C2
m=1
value=100f
footprint=1206
device="ceramic capacitor"
spice_ignore=true}
C {devices/capa.sym} 1780 -280 2 0 {name=C3
m=1
value=100f
footprint=1206
device="ceramic capacitor"
spice_ignore=true}
C {devices/lab_pin.sym} 1690 -190 1 0 {name=p7 sig_type=std_logic lab=vup}
C {devices/lab_pin.sym} 1690 -160 3 0 {name=p8 sig_type=std_logic lab=vdn}
C {devices/gnd.sym} 1840 -320 0 0 {name=l11 lab=GND}
C {devices/lab_pin.sym} 1390 -190 1 0 {name=p6 sig_type=std_logic lab=vin1}
C {devices/lab_pin.sym} 1390 -160 3 0 {name=p9 sig_type=std_logic lab=vin2}
C {/foss/designs/DLL/push_pull.sym} 1880 -180 0 0 {name=x3
}
C {devices/gnd.sym} 1992.5 -67.5 0 0 {name=l1 lab=GND}
C {devices/capa.sym} 1930 -130 0 0 {name=C1
m=1
value=100f
footprint=1206
device="ceramic capacitor"
}
C {devices/vsource.sym} 960 -110 0 0 {name=Vss1 value=0}
C {devices/gnd.sym} 960 -20 0 0 {name=l34 lab=GND}
C {devices/lab_pin.sym} 960 -180 0 0 {name=p26 sig_type=std_logic lab=VSS}
C {devices/vsource.sym} 860 -110 0 0 {name=Vdd1 value=1.2}
C {devices/gnd.sym} 860 -20 0 0 {name=Vdd2 lab=GND
value=1.2}
C {devices/lab_pin.sym} 860 -180 0 0 {name=Vdd3 sig_type=std_logic lab=VDD
value=1.2}
C {devices/lab_pin.sym} 1928.75 -203.75 1 0 {name=p1 sig_type=std_logic lab=vc}
C {devices/code_shown.sym} 1150 -790 0 0 {name=MODEL1 only_toplevel=true
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
