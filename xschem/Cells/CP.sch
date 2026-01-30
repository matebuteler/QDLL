v {xschem version=3.4.8RC file_version=1.3}
G {}
K {}
V {}
S {}
F {}
E {}
N 0 150 0 170 {lab=VSS}
N -0 0 0 40 {lab=CPOUT}
N -270 -0 -230 0 {lab=#net1}
N -40 -0 -0 -0 {lab=CPOUT}
N 100 0 100 40 {lab=CPOUT}
N -0 0 100 0 {lab=CPOUT}
N 100 100 100 150 {lab=VSS}
N 0 150 100 150 {lab=VSS}
N 0 100 0 150 {lab=VSS}
N 240 0 310 0 {lab=CPOUT}
N 240 0 240 40 {lab=CPOUT}
N 100 0 240 0 {lab=CPOUT}
N 240 100 240 150 {lab=VSS}
N 100 150 240 150 {lab=VSS}
N -590 0 -460 0 {lab=CPIN}
C {sg13g2_pr/cap_cmim.sym} 0 70 0 0 {name=C1
model=cap_cmim
w=20e-6
l=20e-6
m=1
spiceprefix=X
}
C {sg13g2_pr/rppd.sym} -150 -110 3 0 {name=R2
w=1e-6
l=40e-6
model=rppd
body=sub!
spiceprefix=X
b=0
m=1
spice_ignore=true}
C {iopin.sym} 0 170 1 0 {name=p3 lab=VSS}
C {ipin.sym} -580 0 0 0 {name=p1 lab=CPIN}
C {opin.sym} 310 0 0 0 {name=p5 lab=CPOUT}
C {Cells/RES.sym} -360 0 0 0 {name=x1
}
C {Cells/RES.sym} -130 0 0 0 {name=x2
}
C {sg13g2_pr/cap_cmim.sym} 100 70 0 0 {name=C2
model=cap_cmim
w=20e-6
l=20e-6
m=1
spiceprefix=X
}
C {sg13g2_pr/cap_cmim.sym} 240 70 0 0 {name=C3
model=cap_cmim
w=20e-6
l=20e-6
m=1
spiceprefix=X
}
