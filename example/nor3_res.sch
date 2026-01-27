v {xschem version=3.4.8RC file_version=1.3}
G {}
K {}
V {}
S {}
F {}
E {}
N -80 40 -50 40 {lab=VC}
N -80 -0 -50 0 {lab=VB}
N -80 -40 -50 -40 {lab=VA}
N 70 -0 110 -0 {lab=#net1}
N 170 0 210 0 {lab=VOUT}
C {sg13g2_stdcells/sg13g2_nor3_1.sym} 10 0 0 0 {name=x1 VDD=VDD VSS=VSS prefix=sg13g2_ }
C {iopin.sym} 210 0 0 0 {name=p1 lab=VOUT}
C {iopin.sym} -80 -40 2 0 {name=p2 lab=VA}
C {iopin.sym} -80 0 2 0 {name=p3 lab=VB}
C {iopin.sym} -80 40 2 0 {name=p4 lab=VC}
C {sg13g2_pr/rppd.sym} 140 0 1 0 {name=R1
w=0.5e-6
l=0.5e-6
model=rppd
body=sub!
spiceprefix=X
b=0
m=1
}
