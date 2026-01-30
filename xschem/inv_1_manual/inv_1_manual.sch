v {xschem version=3.4.8RC file_version=1.2}
G {}
K {}
V {}
S {}
F {}
E {}
N 490 -1330 530 -1330 {
lab=A}
N 570 -1330 640 -1330 {
lab=VSS_D}
N 570 -1290 570 -1270 {
lab=VSS_D}
N 570 -1290 640 -1290 {
lab=VSS_D}
N 570 -1300 570 -1290 {
lab=VSS_D}
N 640 -1330 640 -1290 {
lab=VSS_D}
N 570 -1460 630 -1460 {
lab=VDD_D}
N 570 -1430 630 -1430 {
lab=VDD_D}
N 630 -1460 630 -1430 {
lab=VDD_D}
N 570 -1380 570 -1360 {
lab=Y}
N 490 -1430 530 -1430 {
lab=A}
N 570 -1510 570 -1460 {
lab=VDD_D}
N 490 -1430 490 -1330 {
lab=A}
N 570 -1380 670 -1380 {lab=Y}
N 570 -1400 570 -1380 {
lab=Y}
C {sg13g2_pr/sg13_lv_nmos.sym} 550 -1330 0 0 {name=M1
l=0.13u
w=10u
ng=1
m=1
model=sg13_lv_nmos
spiceprefix=X
}
C {iopin.sym} 570 -1510 0 0 {name=p1 lab=VDD_D}
C {iopin.sym} 570 -1270 0 0 {name=p4 lab=VSS_D}
C {sg13g2_pr/sg13_lv_pmos.sym} 550 -1430 0 0 {name=M2
l=0.13u
w=10u
ng=1
m=1
model=sg13_lv_pmos
spiceprefix=X
}
C {iopin.sym} 490 -1380 0 1 {name=p2 lab=A}
C {iopin.sym} 670 -1380 0 0 {name=p3 lab=Y}
