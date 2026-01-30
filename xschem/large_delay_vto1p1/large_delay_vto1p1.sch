v {xschem version=3.4.8RC file_version=1.2}
G {}
K {}
V {}
S {}
F {}
E {}
N 40 90 90 90 {lab=VIN}
N 40 180 80 180 {lab=VIN}
N 40 90 40 180 {lab=VIN}
N -70 90 40 90 {lab=VIN}
N 160 180 270 180 {lab=VOUT}
N 270 90 270 180 {lab=VOUT}
N 170 90 270 90 {lab=VOUT}
N 40 280 90 280 {lab=VIN}
N 40 180 40 280 {lab=VIN}
N 170 280 270 280 {lab=VOUT}
N 270 180 270 280 {lab=VOUT}
N 40 370 100 370 {lab=VIN}
N 40 280 40 370 {lab=VIN}
N 180 370 270 370 {lab=VOUT}
N 270 280 270 370 {lab=VOUT}
N 270 90 340 90 {lab=VOUT}
N 270 370 330 370 {lab=VOUT}
N 270 280 330 280 {lab=VOUT}
N 270 180 330 180 {lab=VOUT}
N 500 280 500 370 {lab=VOUT}
N 420 90 500 90 {lab=VOUT}
N 410 180 500 180 {lab=VOUT}
N 500 90 500 180 {lab=VOUT}
N 410 280 500 280 {lab=VOUT}
N 500 180 500 280 {lab=VOUT}
N 40 470 100 470 {lab=VIN}
N 40 370 40 470 {lab=VIN}
N 270 370 270 470 {lab=VOUT}
N 180 470 270 470 {lab=VOUT}
N 270 470 330 470 {lab=VOUT}
N 410 470 500 470 {lab=VOUT}
N 500 370 500 470 {lab=VOUT}
N 410 370 500 370 {lab=VOUT}
N 500 90 570 90 {lab=VOUT}
N 500 370 560 370 {lab=VOUT}
N 500 280 560 280 {lab=VOUT}
N 500 180 560 180 {lab=VOUT}
C {devices/lab_pin.sym} 90 -70 0 0 {name=p6 sig_type=std_logic lab=VIN,n1,n2,n3
spice_ignore=true}
C {devices/lab_pin.sym} 330 -70 0 1 {name=p7 sig_type=std_logic lab=n1,n2,n3,VOUT
spice_ignore=true}
C {devices/iopin.sym} 260 -170 2 0 {name=p4 lab=VIN}
C {devices/iopin.sym} 270 -130 2 0 {name=p5 lab=VOUT}
C {devices/iopin.sym} 170 -170 2 0 {name=p1 lab=VCC}
C {devices/iopin.sym} 170 -130 2 0 {name=p2 lab=VSS}
C {sg13g2_stdcells/sg13g2_dlygate4sd3_1.sym} 190 -70 0 0 {name=x1[0:3] VDD=VCC VSS=VSS prefix=sg13g2_ spice_ignore=true}
C {devices/lab_pin.sym} -60 90 0 0 {name=p3 sig_type=std_logic lab=VIN}
C {devices/lab_pin.sym} 565 90 0 1 {name=p8 sig_type=std_logic lab=VOUT}
C {sg13g2_stdcells/sg13g2_dlygate4sd2_1.sym} 130 90 0 0 {name=x1 VDD=VCC VSS=VSS prefix=sg13g2_ }
C {sg13g2_stdcells/sg13g2_dlygate4sd2_1.sym} 120 180 0 0 {name=x2 VDD=VCC VSS=VSS prefix=sg13g2_ }
C {sg13g2_stdcells/sg13g2_dlygate4sd2_1.sym} 130 280 0 0 {name=x3 VDD=VCC VSS=VSS prefix=sg13g2_ }
C {sg13g2_stdcells/sg13g2_dlygate4sd3_1.sym} 140 370 0 0 {name=x4 VDD=VCC VSS=VSS prefix=sg13g2_ spice_ignore=true}
C {sg13g2_stdcells/sg13g2_dlygate4sd3_1.sym} 930 270 0 0 {name=x5 VDD=VCC VSS=VSS prefix=sg13g2_ spice_ignore=true}
C {sg13g2_stdcells/sg13g2_dlygate4sd2_1.sym} 380 90 0 0 {name=x6 VDD=VCC VSS=VSS prefix=sg13g2_ spice_ignore=short}
C {sg13g2_stdcells/sg13g2_dlygate4sd2_1.sym} 370 180 0 0 {name=x7 VDD=VCC VSS=VSS prefix=sg13g2_ spice_ignore=true}
C {sg13g2_stdcells/sg13g2_dlygate4sd2_1.sym} 370 280 0 0 {name=x8 VDD=VCC VSS=VSS prefix=sg13g2_ spice_ignore=true}
C {sg13g2_stdcells/sg13g2_dlygate4sd2_1.sym} 370 370 0 0 {name=x9 VDD=VCC VSS=VSS prefix=sg13g2_ spice_ignore=true}
C {sg13g2_stdcells/sg13g2_dlygate4sd2_1.sym} 140 470 0 0 {name=x10 VDD=VCC VSS=VSS prefix=sg13g2_ }
C {sg13g2_stdcells/sg13g2_dlygate4sd2_1.sym} 370 470 0 0 {name=x11 VDD=VCC VSS=VSS prefix=sg13g2_ spice_ignore=true}
