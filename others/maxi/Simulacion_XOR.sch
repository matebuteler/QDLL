v {xschem version=3.4.8RC file_version=1.3}
G {}
K {}
V {}
S {}
F {}
E {}
N -110 -250 -110 -240 {lab=GND}
N -110 -250 -40 -250 {lab=GND}
N -40 -80 -40 -10 {lab=CLKout}
N -40 50 -40 70 {lab=GND}
N -80 -120 -40 -120 {lab=CLKin}
N -80 -80 -40 -80 {lab=CLKout}
N -40 -170 -40 -120 {lab=CLKin}
N -40 -250 -40 -230 {lab=GND}
N -460 -50 -460 -30 {lab=GND}
N -360 -50 -360 -30 {lab=GND}
N 340 -100 350 -100 {lab=Cont}
N 350 -100 350 -60 {lab=Cont}
N 350 0 350 20 {lab=GND}
N -40 -120 -30 -120 {lab=CLKin}
N -40 -80 -30 -80 {lab=CLKout}
N 90 -100 230 -100 {lab=out}
N 230 -170 230 -100 {lab=out}
N 230 -100 280 -100 {lab=out}
C {vsource.sym} -40 -200 2 1 {name=V1 value="pulse(0,1.2,0,1p,1p,1n,2n) dc 0 ac 0)" savecurrent=false}
C {vsource.sym} -40 20 0 0 {name=V2 value="pulse(0,1.2,0.5n,1p,1p,1n,2n) dc 0 ac 0)" savecurrent=false}
C {gnd.sym} -40 70 0 0 {name=l1 lab=GND}
C {gnd.sym} -110 -240 0 0 {name=l2 lab=GND}
C {lab_pin.sym} 350 -100 2 0 {name=p2 sig_type=std_logic lab=Cont}
C {lab_pin.sym} -80 -120 0 0 {name=p3 sig_type=std_logic lab=CLKin}
C {lab_pin.sym} -80 -80 0 0 {name=p4 sig_type=std_logic lab=CLKout}
C {code_shown.sym} -460 120 0 0 {name=MODEL only_toplevel=true
format="tcleval( @value )"
value="
.lib cornerMOSlv.lib mos_tt
.lib cornerCAP.lib cap_typ
.lib cornerRES.lib res_typ
.include /foss/pdks/ihp-sg13g2/libs.ref/sg13g2_stdcell/spice/sg13g2_stdcell.spice
"}
C {devices/code_shown.sym} -460 -340 0 0 {name=NGSPICE only_toplevel=true 
value="
.param temp=27
.control
save all 
tran 2p 20n 0.05n
plot v(CLKin) v(CLKout)
plot v(out)
plot v(Cont)


.endc
"}
C {sg13g2_stdcells/sg13g2_xor2_1.sym} 30 -100 0 0 {name=x1 VDD=VDD VSS=VSS prefix=sg13g2_ }
C {vsource.sym} -460 -80 0 0 {name=V3 value=1.2 savecurrent=false}
C {gnd.sym} -460 -30 0 0 {name=l3 lab=GND}
C {lab_pin.sym} -460 -110 2 0 {name=p1 sig_type=std_logic lab=VDD}
C {vsource.sym} -360 -80 0 0 {name=V4 value=0 savecurrent=false}
C {gnd.sym} -360 -30 0 0 {name=l4 lab=GND}
C {lab_pin.sym} -360 -110 2 0 {name=p5 sig_type=std_logic lab=VSS}
C {sg13g2_pr/cap_cmim.sym} 350 -30 0 0 {name=C1
model=cap_cmim
w=10e-6
l=10e-6
m=1
spiceprefix=X}
C {gnd.sym} 350 20 0 0 {name=l5 lab=GND}
C {sg13g2_pr/rppd.sym} 310 -100 3 0 {name=R2
w=1e-6
l=40e-6
model=rppd
body=sub!
spiceprefix=X
b=0
m=1
}
C {lab_pin.sym} 230 -170 1 0 {name=p6 sig_type=std_logic lab=out}
