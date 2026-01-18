v {xschem version=3.4.8RC file_version=1.3}
G {}
K {}
V {}
S {}
F {}
E {}
N -240 -90 -240 -60 {lab=VDD}
N -170 -140 -170 -110 {lab=VSS}
N 230 -0 290 -0 {lab=#net1}
N 370 -0 460 0 {lab=#net2}
N 540 -0 610 -0 {lab=VOUT}
N -170 -0 -40 -0 {lab=VIN}
N 40 -0 150 -0 {lab=#net3}
C {sg13g2_stdcells/sg13g2_dlygate4sd1_1.sym} 0 0 0 0 {name=x7[1:0] VDD=VDD VSS=VSS prefix=sg13g2_ }
C {sg13g2_stdcells/sg13g2_inv_2.sym} 190 0 0 0 {name=x9[3:0] VDD=VDD VSS=VSS prefix=sg13g2_ }
C {opin.sym} 610 0 0 0 {name=p5 lab=VOUT}
C {ipin.sym} -170 0 0 0 {name=p3 lab=VIN}
C {iopin.sym} -240 -90 3 0 {name=p1 lab=VDD
}
C {iopin.sym} -170 -110 1 0 {name=p2 lab=VSS}
C {sg13g2_stdcells/sg13g2_inv_2.sym} 330 0 0 0 {name=x1[7:0] VDD=VDD VSS=VSS prefix=sg13g2_ }
C {sg13g2_stdcells/sg13g2_inv_2.sym} 500 0 0 0 {name=x2[31:0] VDD=VDD VSS=VSS prefix=sg13g2_ }
