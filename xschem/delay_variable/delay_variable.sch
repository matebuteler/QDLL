v {xschem version=3.4.8RC file_version=1.2}
G {}
K {}
V {}
S {}
F {}
E {}
N 50 -160 90 -160 { lab=VIN_D}
N 50 -160 50 -50 { lab=VIN_D}
N 50 -50 90 -50 { lab=VIN_D}
N 130 -240 130 -190 { lab=#net1}
N 130 -160 160 -160 { lab=VDD_D}
N 130 -50 160 -50 { lab=VSS_D}
N 160 -50 160 60 { lab=VSS_D}
N 130 -20 130 30 { lab=#net2}
N 130 100 130 170 {
lab=VSS_D}
N 130 -310 130 -300 {
lab=VDD_D}
N 130 -310 160 -310 {
lab=VDD_D}
N 160 -270 160 -160 {
lab=VDD_D}
N 130 -270 160 -270 {
lab=VDD_D}
N 130 100 160 100 {
lab=VSS_D}
N 130 60 160 60 {
lab=VSS_D}
N -60 -270 90 -270 {
lab=#net3}
N -120 -310 -120 -300 {
lab=VDD_D}
N -120 -310 130 -310 {
lab=VDD_D}
N -120 -220 -120 30 {
lab=#net3}
N -90 100 130 100 {
lab=VSS_D}
N -120 90 -120 100 {
lab=VSS_D}
N -120 -220 -60 -220 {
lab=#net3}
N -60 -270 -60 -220 {
lab=#net3}
N -120 60 -90 60 {
lab=VSS_D}
N -90 60 -90 100 {
lab=VSS_D}
N -160 20 -160 60 {
lab=VCONT_D}
N -160 20 90 20 {
lab=VCONT_D}
N 90 20 90 60 {
lab=VCONT_D}
N -150 -270 -120 -270 {
lab=VDD_D}
N 160 -310 160 -270 {
lab=VDD_D}
N 130 90 130 100 {
lab=VSS_D}
N -120 -240 -120 -220 {
lab=#net3}
N -80 -270 -60 -270 {
lab=#net3}
N -120 100 -90 100 {
lab=VSS_D}
N -210 60 -160 60 {lab=VCONT_D}
N -150 -310 -150 -270 {lab=VDD_D}
N -150 -310 -120 -310 {lab=VDD_D}
N 70 -370 130 -370 {lab=VDD_D}
N 130 -370 130 -310 {lab=VDD_D}
N 80 170 130 170 {lab=VSS_D}
N 160 60 160 100 {
lab=VSS_D}
N 130 -110 130 -80 { lab=VOUT_D}
N 130 -110 275 -110 {lab=VOUT_D}
N 130 -130 130 -110 { lab=VOUT_D}
C {devices/iopin.sym} 88.75 170 2 0 {name=p13 sig_type=std_logic lab=VSS_D}
C {devices/iopin.sym} 70 -370 2 0 {name=p17 sig_type=std_logic lab=VDD_D}
C {devices/opin.sym} 273.75 -110 0 0 {name=p5 lab=VOUT_D}
C {devices/ipin.sym} -210 60 0 0 {name=p8 lab=VCONT_D}
C {sg13g2_pr/sg13_lv_nmos.sym} -140 60 0 0 {name=M3
l=0.13u
w=1u
ng=1
m=1
model=sg13_lv_nmos
spiceprefix=X
}
C {sg13g2_pr/sg13_lv_nmos.sym} 110 60 0 0 {name=M5
l=2u
w=2u
ng=1
m=1
model=sg13_lv_nmos
spiceprefix=X
}
C {sg13g2_pr/sg13_lv_pmos.sym} -100 -270 0 1 {name=M4
l=0.13u
w=2.24u
ng=1
m=1
model=sg13_lv_pmos
spiceprefix=X
}
C {sg13g2_pr/sg13_lv_pmos.sym} 110 -270 0 0 {name=M6
l=2u
w=4u
ng=1
m=1
model=sg13_lv_pmos
spiceprefix=X
}
C {devices/ipin.sym} 50 -111.25 0 0 {name=p1 lab=VIN_D}
C {sg13g2_pr/sg13_lv_pmos.sym} 110 -160 0 0 {name=M7
l=2u
w=20u
ng=4
m=1
model=sg13_lv_pmos
spiceprefix=X
}
C {sg13g2_pr/sg13_lv_nmos.sym} 110 -50 0 0 {name=M8
l=3u
w=5u
ng=1
m=1
model=sg13_lv_nmos
spiceprefix=X
}
