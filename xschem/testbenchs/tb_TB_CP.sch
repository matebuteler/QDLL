v {xschem version=3.4.8RC file_version=1.3}
G {}
K {}
V {}
S {}
F {}
E {}
N -490 450 -490 470 {lab=GND}
N -390 450 -390 470 {lab=GND}
N -390 290 -390 310 {lab=VSS}
N -490 290 -490 310 {lab=VSS}
N -490 180 -490 230 {lab=PDIN1}
N -390 180 -390 230 {lab=PDIN2}
N 140 -0 180 0 {lab=VDD}
N 0 80 0 100 {lab=VSS}
N 280 80 280 100 {lab=VSS}
N 140 100 140 150 {lab=VSS}
N 140 100 280 100 {lab=VSS}
N -0 -120 0 -80 {lab=VDD}
N 380 -0 440 -0 {lab=VCONT}
N -160 20 -100 20 {lab=PDIN2}
N -160 -20 -100 -20 {lab=PDIN1}
N 0 100 140 100 {lab=VSS}
N 140 -30 140 -0 {lab=VDD}
N 100 -0 140 -0 {lab=VDD}
C {vsource.sym} -490 260 0 1 {name=V1 value="pulse(0,1.2,0,1p,1p,1n,2n) dc 0 ac 0)" savecurrent=false}
C {vsource.sym} -390 260 0 0 {name=V2 value="pulse(0,1.2,0.5n,1p,1p,1n,2n) dc 0 ac 0)" savecurrent=false}
C {code_shown.sym} -450 -360 0 0 {name=MODEL only_toplevel=true
format="tcleval( @value )"
value="
.lib cornerMOSlv.lib mos_tt
.lib cornerCAP.lib cap_typ
.lib cornerRES.lib res_typ
.include /foss/pdks/ihp-sg13g2/libs.ref/sg13g2_stdcell/spice/sg13g2_stdcell.spice
"}
C {devices/code_shown.sym} -750 -360 0 0 {name=NGSPICE only_toplevel=true 
value="
.param temp=27
.control
save all 
tran 2p 20n 0.05n
plot v(PDIN1) v(PDIN2)
plot v(VCONT)
plot v(PDOUT)


.endc
"}
C {vsource.sym} -490 420 0 0 {name=V3 value=1.2 savecurrent=false}
C {gnd.sym} -490 470 0 0 {name=l3 lab=GND}
C {lab_pin.sym} -490 390 2 0 {name=p1 sig_type=std_logic lab=VDD}
C {vsource.sym} -390 420 0 0 {name=V4 value=0 savecurrent=false}
C {gnd.sym} -390 470 0 0 {name=l4 lab=GND}
C {lab_pin.sym} -390 390 2 0 {name=p5 sig_type=std_logic lab=VSS}
C {lab_pin.sym} -490 310 2 0 {name=p2 sig_type=std_logic lab=VSS}
C {lab_pin.sym} -390 310 2 0 {name=p7 sig_type=std_logic lab=VSS}
C {lab_pin.sym} -490 180 2 0 {name=p8 sig_type=std_logic lab=PDIN1
}
C {lab_pin.sym} -390 180 2 0 {name=p9 sig_type=std_logic lab=PDIN2
}
C {/foss/designs/DLL/2026/Cells/PD.sym} 0 0 0 0 {name=x1}
C {/foss/designs/DLL/2026/Cells/CP.sym} 280 0 0 0 {name=x2}
C {lab_pin.sym} 140 150 2 0 {name=p3 sig_type=std_logic lab=VSS}
C {lab_pin.sym} 0 -120 2 0 {name=p4 sig_type=std_logic lab=VDD}
C {lab_pin.sym} -160 20 0 0 {name=p6 sig_type=std_logic lab=PDIN2
}
C {lab_pin.sym} -160 -20 0 0 {name=p10 sig_type=std_logic lab=PDIN1
}
C {lab_pin.sym} 440 0 2 0 {name=p11 sig_type=std_logic lab=VCONT
}
C {lab_pin.sym} 140 -30 1 0 {name=p12 sig_type=std_logic lab=PDOUT}
