v {xschem version=3.4.8RC file_version=1.3}
G {}
K {}
V {}
S {}
F {}
E {}
N -320 -110 -320 -80 {lab=VDD}
N -250 -160 -250 -130 {lab=VSS}
N 470 0 490 0 {lab=#net1}
N 610 0 680 0 {lab=#net2}
N 470 -60 490 -60 {lab=#net1}
N 470 -60 470 0 {lab=#net1}
N 570 -60 610 -60 {lab=#net2}
N 610 -60 610 0 {lab=#net2}
N 570 0 610 0 {lab=#net2}
N 760 0 790 0 {lab=#net3}
N 870 0 900 0 {lab=#net4}
N 980 0 1140 0 {lab=VOUT}
N -310 0 40 -0 {lab=VIN}
N 120 -0 150 0 {lab=#net5}
N 230 0 260 0 {lab=#net6}
N 340 -0 360 -0 {lab=#net7}
N 440 0 470 0 {lab=#net1}
C {sg13g2_stdcells/sg13g2_dlygate4sd1_1.sym} 530 0 0 0 {name=x7 VDD=VDD VSS=VSS prefix=sg13g2_ }
C {opin.sym} 1140 0 0 0 {name=p5 lab=VOUT}
C {ipin.sym} -310 0 0 0 {name=p3 lab=VIN}
C {iopin.sym} -320 -110 3 0 {name=p1 lab=VDD
}
C {iopin.sym} -250 -130 1 0 {name=p2 lab=VSS}
C {sg13g2_stdcells/sg13g2_dlygate4sd1_1.sym} 530 -60 0 0 {name=x1 VDD=VDD VSS=VSS prefix=sg13g2_ }
C {sg13g2_stdcells/sg13g2_inv_2.sym} -10 -350 0 0 {name=x30 VDD=VDD VSS=VSS prefix=sg13g2_ spice_ignore=true}
C {sg13g2_stdcells/sg13g2_inv_4.sym} 720 0 0 0 {name=x2 VDD=VDD VSS=VSS prefix=sg13g2_ }
C {sg13g2_stdcells/sg13g2_inv_8.sym} 830 0 0 0 {name=x3 VDD=VDD VSS=VSS prefix=sg13g2_ }
C {sg13g2_stdcells/sg13g2_inv_16.sym} 940 0 0 0 {name=x4 VDD=VDD VSS=VSS prefix=sg13g2_ }
C {sg13g2_stdcells/sg13g2_dlygate4sd1_1.sym} 400 0 0 0 {name=x5 VDD=VDD VSS=VSS prefix=sg13g2_ }
C {sg13g2_stdcells/sg13g2_dlygate4sd1_1.sym} 300 0 0 0 {name=x6 VDD=VDD VSS=VSS prefix=sg13g2_ }
C {sg13g2_stdcells/sg13g2_dlygate4sd1_1.sym} 190 0 0 0 {name=x8 VDD=VDD VSS=VSS prefix=sg13g2_ }
C {sg13g2_stdcells/sg13g2_dlygate4sd1_1.sym} 80 0 0 0 {name=x9 VDD=VDD VSS=VSS prefix=sg13g2_ }
