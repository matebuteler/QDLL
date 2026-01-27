v {xschem version=3.4.8RC file_version=1.3}
G {}
K {}
V {}
S {}
F {}
E {}
N -150 90 -150 110 {lab=GND}
N 160 80 160 100 {lab=GND}
N -150 -10 10 -10 {lab=V_IN}
N -150 -10 -150 30 {lab=V_IN}
N 160 -10 210 -10 {lab=V_OUT}
N -150 -40 -150 -10 {lab=V_IN}
N 160 -10 160 20 {lab=V_OUT}
N 70 -10 160 -10 {lab=V_OUT}
C {devices/vsource.sym} -150 60 0 0 {name=Vcont value="PWL(0 0.4 10n 1.2)"}
C {gnd.sym} -150 110 0 0 {name=l3 lab=GND}
C {devices/lab_pin.sym} -150 -40 0 0 {name=p1 sig_type=std_logic lab=V_IN}
C {devices/lab_pin.sym} 210 -10 0 1 {name=p2 sig_type=std_logic lab=V_OUT}
C {code_shown.sym} -210 -280 0 0 {name=MODEL1 only_toplevel=true
format="tcleval( @value )"
value="

.param corner=0

.if (corner==0)
.lib cornerMOSlv.lib mos_tt
.lib cornerRES.lib res_typ
.lib cornerCAP.lib cap_typ
.endif
"}
C {devices/code_shown.sym} 400 -230 0 0 {name=NGSPICE1 only_toplevel=true
value="
.control
 tran 1p 10n
 Vcont vcont 0 PWL(0 0.4  1u 1.2  10u 1.2)
 plot v(V_IN) v(V_OUT)
.endc
"
}
C {capa.sym} 160 50 0 0 {name=C1
m=1
value=100f
footprint=1206
device="ceramic capacitor"}
C {devices/gnd.sym} 160 100 0 0 {name=l5 lab=GND}
C {sg13g2_pr/rppd.sym} 40 -10 1 0 {name=R1
w=0.5e-6
l=0.5e-6
model=rppd
body=sub!
spiceprefix=X
b=0
m=1
}
