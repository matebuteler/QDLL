v {xschem version=3.4.8RC file_version=1.3}
G {}
K {}
V {}
S {}
F {}
E {}
N 720 60 720 130 {lab=VSS}
N 530 0 570 0 {lab=#net1}
N 510 420 560 420 {lab=#net2}
N 230 400 310 400 {lab=VIN}
N 410 310 410 340 {lab=VDD}
N 660 500 660 540 {lab=VSS}
N 410 500 410 540 {lab=VSS}
N 460 70 460 130 {lab=VSS}
N 420 -170 420 -60 {lab=VDD}
N 550 -170 720 -170 {lab=VDD}
N 720 -170 720 -60 {lab=VDD}
N 550 -210 550 -170 {lab=VDD}
N 420 -170 550 -170 {lab=VDD}
N 350 100 380 100 {lab=VCONT}
N 380 70 380 100 {lab=VCONT}
N 230 0 310 0 {lab=VIN}
N 590 130 590 160 {lab=VSS}
N 590 130 720 130 {lab=VSS}
N 460 130 590 130 {lab=VSS}
N 230 0 230 400 {lab=VIN}
N 220 -0 230 0 {lab=VIN}
N 760 420 810 420 {lab=CPOUT}
N 870 0 1270 -0 {lab=VOUT}
N -40 440 310 440 {lab=PD2}
C {/foss/designs/DLL/2026/Cells/DLine.sym} 720 0 0 0 {name=x1}
C {lab_pin.sym} 720 100 2 0 {name=p1 sig_type=std_logic lab=VSS}
C {lab_pin.sym} 720 -100 2 0 {name=p2 sig_type=std_logic lab=VDD}
C {/foss/designs/DLL/2026/Cells/VCDL.sym} 420 0 0 0 {name=x2}
C {/foss/designs/DLL/2026/Cells/PD.sym} 410 420 0 0 {name=x3
}
C {/foss/designs/DLL/2026/Cells/CP.sym} 660 420 0 0 {name=x4
}
C {lab_pin.sym} 420 -100 2 0 {name=p3 sig_type=std_logic lab=VDD}
C {lab_pin.sym} 460 100 2 0 {name=p5 sig_type=std_logic lab=VSS}
C {lab_pin.sym} 660 540 2 0 {name=p6 sig_type=std_logic lab=VSS}
C {lab_pin.sym} 410 540 2 0 {name=p7 sig_type=std_logic lab=VSS}
C {lab_pin.sym} 410 310 2 0 {name=p10 sig_type=std_logic lab=VDD}
C {iopin.sym} 550 -210 3 0 {name=p8 lab=VDD
}
C {opin.sym} 1270 0 0 0 {name=p9 lab=VOUT}
C {ipin.sym} 350 100 0 0 {name=p4 lab=VCONT}
C {ipin.sym} 220 0 0 0 {name=p11 lab=VIN}
C {iopin.sym} 590 160 1 0 {name=p12 lab=VSS}
C {ipin.sym} -40 440 0 0 {name=p14 lab=PD2}
C {opin.sym} 810 420 0 0 {name=p13 lab=CPOUT}
