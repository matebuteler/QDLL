v {xschem version=3.4.6 file_version=1.2}
G {}
K {}
V {}
S {}
E {}
L 4 120 -400 120 -80 {}
L 4 120 -400 670 -400 {}
L 4 670 -400 670 -90 {}
L 4 120 -80 120 -60 {}
L 4 120 -60 670 -60 {}
L 4 670 -90 670 -60 {}
N 650 -230 715.625 -230 {lab=VOUT}
N 260 -140 540 -140 {lab=VSS}
N 92.5 -230 220 -230 {lab=VIN}
N 260 -180 260 -140 {lab=VSS}
N 103.4375 -140 260 -140 {lab=VSS}
N 100 -90 300 -90 {lab=VCONT}
N 300 -180 300 -90 {lab=VCONT}
N 350 -230 360 -230 {lab=va}
N 280 -380 280 -280 {lab=VDD}
N 102.5 -380 280 -380 {lab=VDD}
N 344.375 -258.75 350 -258.75 {lab=va}
N 350 -258.75 350 -230 {lab=va}
N 340 -230 350 -230 {lab=va}
N 540 -190 540 -140 {lab=VSS}
N 280 -380 540 -380 {lab=VDD}
N 538.75 -270.625 540 -270.625 {lab=VDD}
N 540 -380 540 -270.625 {lab=VDD}
C {devices/iopin.sym} 103.4375 -140 2 0 {name=p13 sig_type=std_logic lab=VSS}
C {devices/iopin.sym} 105 -380 2 0 {name=p17 sig_type=std_logic lab=VDD}
C {devices/ipin.sym} 92.5 -230 0 0 {name=p4 lab=VIN}
C {devices/opin.sym} 715.625 -230 0 0 {name=p5 lab=VOUT}
C {devices/lab_pin.sym} 344.375 -258.75 1 0 {name=p1 sig_type=std_logic lab=va}
C {delay_variable/delay_variable.sym} 280 -230 0 0 {name=x1}
C {large_delay_vto1p1/large_delay_vto1p1.sym} 480 -230 0 0 {name=x2}
C {ipin.sym} 100 -90 0 0 {name=p2 lab=VCONT}
