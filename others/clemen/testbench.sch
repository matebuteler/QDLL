v {xschem version=3.4.8RC file_version=1.3}
G {}
K {}
V {}
S {}
F {}
E {}
N -10 -80 -10 -60 {lab=#net1}
N -10 -160 -10 -140 {lab=GND}
N -10 -160 40 -160 {lab=GND}
N 40 -160 40 -140 {lab=GND}
N -160 0 -160 70 {lab=#net2}
N -160 0 -120 0 {lab=#net2}
N -360 -20 -290 -20 {lab=GND}
N -360 -20 -360 -10 {lab=GND}
N -160 -20 -120 -20 {lab=V_IN}
N -160 -40 -160 -20 {lab=V_IN}
N -230 -20 -160 -20 {lab=V_IN}
N -10 40 -10 60 {lab=GND}
N 150 50 150 70 {lab=GND}
N 100 -10 200 -10 {lab=V_OUT}
N -160 130 -160 160 {lab=GND}
C {devices/vsource.sym} -10 -110 2 0 {name=VDD value="1.2"}
C {gnd.sym} 40 -140 0 0 {name=l1 lab=GND}
C {gnd.sym} -10 60 0 0 {name=l2 lab=GND}
C {gnd.sym} -360 -10 0 0 {name=l4 lab=GND}
C {vsource.sym} -260 -20 1 0 {name=Vin value="PULSE(0 1.2 0 10p 10p 0.99n 2n)"}
C {devices/lab_pin.sym} -160 -40 0 0 {name=p1 sig_type=std_logic lab=V_IN}
C {devices/lab_pin.sym} 200 -10 0 1 {name=p2 sig_type=std_logic lab=V_OUT}
C {code_shown.sym} -620 -200 0 0 {name=MODEL1 only_toplevel=true
format="tcleval( @value )"
value="

.param corner=0

.if (corner==0)
.lib cornerMOSlv.lib mos_tt
.lib cornerRES.lib res_typ
.lib cornerCAP.lib cap_typ
.endif
"}
C {devices/code_shown.sym} -320 -190 0 0 {name=NGSPICE1 only_toplevel=true
value="
.control
 tran 1p 10n
 plot v(V_IN) v(V_OUT)
.endc
"}
C {capa.sym} 150 20 0 0 {name=C1
m=1
value=100f
footprint=1206
device="ceramic capacitor"}
C {devices/gnd.sym} 150 70 0 0 {name=l5 lab=GND}
C {/foss/designs/DLL/2026/clemen/delay_controlable.sym} 30 -10 0 0 {name=x1}
C {devices/vsource.sym} -160 100 0 0 {name=Vcont1 value="PWL(0 0.4 10n 1.2)"}
C {gnd.sym} -160 160 0 0 {name=l3 lab=GND}
