v {xschem version=3.4.8RC file_version=1.3}
G {}
K {}
V {}
S {}
F {}
E {}
N -200 130 -150 130 {lab=IN2}
N -200 -110 -150 -110 {lab=IN1}
N 0 40 0 70 {lab=VDD}
N -0 -200 0 -170 {lab=VDD}
N 0 190 0 230 {lab=VSS}
N -0 -50 -0 -10 {lab=VSS}
N 400 70 400 110 {lab=VSS}
N 400 -110 400 -70 {lab=VDD}
N 150 -110 180 -110 {lab=OUT1}
N 150 130 180 130 {lab=OUT2}
N 260 0 310 0 {lab=OUT1}
N 490 0 560 0 {lab=OUT2}
N 150 160 170 160 {lab=CP}
N 170 -80 170 160 {lab=CP}
N 150 -80 170 -80 {lab=CP}
C {Cells/TOP.sym} 0 -110 0 0 {name=x1}
C {Cells/TOP.sym} 0 130 0 0 {name=x2}
C {iopin.sym} -290 -250 2 0 {name=p1 lab=VDD
}
C {iopin.sym} -290 -220 2 0 {name=p2 lab=VSS}
C {lab_wire.sym} 0 -200 0 0 {name=p3 sig_type=std_logic lab=VDD}
C {lab_wire.sym} 0 40 0 0 {name=p4 sig_type=std_logic lab=VDD}
C {lab_wire.sym} 0 -20 0 0 {name=p5 sig_type=std_logic lab=VSS}
C {lab_wire.sym} 0 230 0 0 {name=p6 sig_type=std_logic lab=VSS}
C {ipin.sym} -200 -110 0 0 {name=p7 lab=IN1}
C {ipin.sym} -200 130 0 0 {name=p8 lab=IN2}
C {Cells/LATCH.sym} 400 0 0 0 {name=x3}
C {lab_wire.sym} 400 -110 1 0 {name=p9 sig_type=std_logic lab=VDD}
C {lab_wire.sym} 400 110 1 0 {name=p10 sig_type=std_logic lab=VSS}
C {opin.sym} 180 -110 0 0 {name=p11 lab=OUT1}
C {opin.sym} 180 130 0 0 {name=p12 lab=OUT2}
C {lab_wire.sym} 260 0 0 0 {name=p13 sig_type=std_logic lab=OUT1}
C {lab_wire.sym} 560 0 0 0 {name=p14 sig_type=std_logic lab=OUT2}
C {iopin.sym} 170 30 2 0 {name=p16 lab=CP}
