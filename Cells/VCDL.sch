v {xschem version=3.4.8RC file_version=1.3}
G {}
K {}
V {}
S {}
F {}
E {}
N -240 -160 -240 150 {lab=#net1}
N -170 -210 -170 -160 {lab=#net1}
N -200 -210 -170 -210 {lab=#net1}
N -240 -160 -170 -160 {lab=#net1}
N -240 -280 -240 -240 {lab=VDD}
N -100 -280 0 -280 {lab=VDD}
N 0 -280 0 -240 {lab=VDD}
N 0 -210 20 -210 {lab=VDD}
N 20 -280 20 -210 {lab=VDD}
N 0 -280 20 -280 {lab=VDD}
N -260 -210 -240 -210 {lab=VDD}
N -260 -280 -260 -210 {lab=VDD}
N -260 -280 -240 -280 {lab=VDD}
N -100 -320 -100 -280 {lab=VDD}
N -240 -280 -100 -280 {lab=VDD}
N -0 -110 0 -90 {lab=#net2}
N 0 -60 20 -60 {lab=VDD}
N 0 0 0 20 {lab=VOUT}
N 0 -30 0 0 {lab=VOUT}
N 0 110 0 150 {lab=#net3}
N 0 50 20 50 {lab=VSS}
N 0 180 20 180 {lab=VSS}
N 20 150 20 180 {lab=VSS}
N 0 210 0 240 {lab=VSS}
N 20 180 20 240 {lab=VSS}
N 0 240 20 240 {lab=VSS}
N -110 240 0 240 {lab=VSS}
N -240 210 -240 240 {lab=VSS}
N -240 180 -220 180 {lab=VSS}
N -220 180 -220 240 {lab=VSS}
N -240 240 -220 240 {lab=VSS}
N -110 240 -110 270 {lab=VSS}
N -220 240 -110 240 {lab=VSS}
N -50 50 -40 50 {lab=VIN}
N -80 0 -80 50 {lab=VIN}
N -50 -60 -40 -60 {lab=VIN}
N -130 0 -80 0 {lab=VIN}
N -80 -60 -80 0 {lab=VIN}
N -340 180 -280 180 {lab=VCONT}
N -280 110 -280 180 {lab=VCONT}
N -110 110 -110 180 {lab=VCONT}
N -280 110 -110 110 {lab=VCONT}
N -110 180 -40 180 {lab=VCONT}
N 110 -110 110 -90 {lab=#net2}
N 20 -120 20 -60 {lab=VDD}
N -0 -110 110 -110 {lab=#net2}
N 0 -180 -0 -110 {lab=#net2}
N 110 -60 160 -60 {lab=VDD}
N 160 -120 160 -60 {lab=VDD}
N 20 -120 160 -120 {lab=VDD}
N 20 -210 20 -120 {lab=VDD}
N 110 -30 110 -0 {lab=VOUT}
N 0 0 110 -0 {lab=VOUT}
N 70 -60 70 -40 {lab=VIN}
N -50 -40 70 -40 {lab=VIN}
N -50 -60 -50 -40 {lab=VIN}
N -80 -60 -50 -60 {lab=VIN}
N 110 50 140 50 {lab=VSS}
N 110 -0 170 0 {lab=VOUT}
N 110 0 110 20 {lab=VOUT}
N 70 30 70 50 {lab=VIN}
N -50 30 70 30 {lab=VIN}
N -50 30 -50 50 {lab=VIN}
N -80 50 -50 50 {lab=VIN}
N 140 50 140 150 {lab=VSS}
N 20 150 140 150 {lab=VSS}
N 20 50 20 150 {lab=VSS}
N 110 80 110 110 {lab=#net3}
N 0 110 110 110 {lab=#net3}
N 0 80 0 110 {lab=#net3}
N -170 -210 -40 -210 {lab=#net1}
N -240 -180 -240 -160 {lab=#net1}
C {sg13g2_pr/sg13_lv_nmos.sym} -20 50 0 0 {name=M1
l=0.13u
w=2u
ng=1
m=1
model=sg13_lv_nmos
spiceprefix=X
}
C {sg13g2_pr/sg13_lv_nmos.sym} -20 180 0 0 {name=M2
l=0.18u
w=3.5u
ng=1
m=1
model=sg13_lv_nmos
spiceprefix=X
}
C {sg13g2_pr/sg13_lv_nmos.sym} -260 180 0 0 {name=M3
l=0.25u
w=2u
ng=1
m=1
model=sg13_lv_nmos
spiceprefix=X
}
C {sg13g2_pr/sg13_lv_pmos.sym} -20 -60 0 0 {name=M4
l=0.13u
w=4.46u
ng=1
m=1
model=sg13_lv_pmos
spiceprefix=X
}
C {sg13g2_pr/sg13_lv_pmos.sym} -20 -210 0 0 {name=q
l=0.13u
w=2.24u
ng=1
m=1
model=sg13_lv_pmos
spiceprefix=X
}
C {sg13g2_pr/sg13_lv_pmos.sym} -220 -210 0 1 {name=M6
l=0.13u
w=2.24u
ng=1
m=1
model=sg13_lv_pmos
spiceprefix=X
}
C {iopin.sym} -100 -320 3 0 {name=p1 lab=VDD
}
C {iopin.sym} -110 270 1 0 {name=p2 lab=VSS}
C {ipin.sym} -130 0 0 0 {name=p3 lab=VIN}
C {ipin.sym} -340 180 0 0 {name=p4 lab=VCONT}
C {opin.sym} 170 0 0 0 {name=p5 lab=VOUT}
C {sg13g2_pr/sg13_lv_pmos.sym} 90 -60 0 0 {name=M7
l=0.13u
w=2.23u
ng=1
m=1
model=sg13_lv_pmos
spiceprefix=X
spice_ignore=true}
C {sg13g2_pr/sg13_lv_nmos.sym} 90 50 0 0 {name=M8
l=0.13u
w=1u
ng=1
m=1
model=sg13_lv_nmos
spiceprefix=X
spice_ignore=true}
