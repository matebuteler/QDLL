v {xschem version=3.4.6 file_version=1.2}
G {}
K {}
V {}
S {}
E {}
N -80 -20 -50 -20 {lab=CLK_in}
N -80 20 -50 20 {lab=xxx}
N 70 -0 100 0 {lab=PD_out}
C {sg13g2_stdcells/sg13g2_xor2_1.sym} 10 0 0 0 {name=x1 VDD=VDD VSS=VSS prefix=sg13g2_ }
C {iopin.sym} 100 0 0 0 {name=p1 lab=PD_out}
C {iopin.sym} -80 -20 2 0 {name=p2 lab=CLK_in
}
C {iopin.sym} -80 20 2 0 {name=p3 lab=CLK_out}
