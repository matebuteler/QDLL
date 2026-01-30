v {xschem version=3.4.8RC file_version=1.3}
G {}
K {}
V {}
S {}
F {}
E {}
N -210 -0 -160 -0 {lab=RIN}
N -100 -0 -70 0 {lab=#net1}
N -10 -0 20 0 {lab=#net2}
N 80 -0 120 -0 {lab=#net3}
N 180 -0 230 0 {lab=ROUT}
C {sg13g2_pr/rppd.sym} -130 0 3 0 {name=R1
w=1e-6
l=10e-6
model=rppd
body=sub!
spiceprefix=X
b=0
m=1
}
C {sg13g2_pr/rppd.sym} -40 0 3 0 {name=R3
w=1e-6
l=10e-6
model=rppd
body=sub!
spiceprefix=X
b=0
m=1
}
C {sg13g2_pr/rppd.sym} 50 0 3 0 {name=R4
w=1e-6
l=10e-6
model=rppd
body=sub!
spiceprefix=X
b=0
m=1
}
C {sg13g2_pr/rppd.sym} 150 0 3 0 {name=R5
w=1e-6
l=10e-6
model=rppd
body=sub!
spiceprefix=X
b=0
m=1
}
C {ipin.sym} -210 0 0 0 {name=p1 lab=RIN}
C {opin.sym} 230 0 0 0 {name=p5 lab=ROUT}
