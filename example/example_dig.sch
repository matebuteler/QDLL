v {xschem version=3.4.8RC file_version=1.3}
G {}
K {}
V {}
S {}
F {}
E {}
N -70 -180 -70 -150 {lab=VDD}
N -110 -230 -110 -200 {lab=VSS}
N -170 -20 -160 -20 {lab=VIN}
N -80 -20 -40 -20 {lab=#net1}
N -170 20 -40 20 {lab=VIN}
N -170 -20 -170 20 {lab=VIN}
N -200 -20 -170 -20 {lab=VIN}
N 40 0 110 -0 {lab=VOUT}
N -200 60 -40 60 {lab=#net2}
C {sg13g2_stdcells/sg13g2_inv_1.sym} -120 -20 0 0 {name=x2 VDD=VDD VSS=VSS prefix=sg13g2_ }
C {iopin.sym} -70 -180 3 0 {name=p1 lab=VDD
}
C {iopin.sym} -110 -200 1 0 {name=p2 lab=VSS}
C {ipin.sym} -200 -20 0 0 {name=p3 lab=VIN}
C {sg13g2_stdcells/sg13g2_mux2_2.sym} 0 0 0 0 {name=x3 VDD=VDD VSS=VSS prefix=sg13g2_ }
C {opin.sym} 110 0 0 0 {name=p5 lab=VOUT}
C {ipin.sym} -200 60 0 0 {name=p4 lab=S}
