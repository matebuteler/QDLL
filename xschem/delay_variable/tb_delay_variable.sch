v {xschem version=3.4.6 file_version=1.2}
G {}
K {}
V {}
S {}
E {}
B 2 845 -525 1645 -125 {flags=graph
y1=-1
y2=1.5
ypos1=0
ypos2=2
divy=5
subdivy=1
unity=1
x1=-3.6930214e-09
x2=1.3728963e-08
divx=5
subdivx=1


dataset=-1
unitx=1
logx=0
logy=0
rawfile=$netlist_dir/tran_logic_not.raw
color="6 7 4"
node="in
out
net2"}
B 2 1715 -525 2515 -125 {flags=graph
y1=0
y2=1.5
ypos1=0
ypos2=2
divy=5
subdivy=1
unity=1
x1=-3.6930214e-09
x2=1.3728963e-08
divx=5
subdivx=1


dataset=-1
unitx=1
logx=0
logy=0
rawfile=$netlist_dir/tran_logic_not.raw
color=10
node=out}
N 850 250 850 270 {
lab=GND}
N 1390 210 1390 270 {
lab=GND}
N 1390 -20 1390 150 {
lab=#net1}
N 850 130 850 190 {
lab=in}
N 830 130 850 130 {
lab=in}
N 1312.5 193.75 1312.5 233.75 {lab=GND}
N 1057.5 322.5 1057.5 342.5 {lab=GND}
N 1057.5 260 1060 260 {lab=#net2}
N 970 170 1020 170 {lab=GND}
N 850 120 980 120 {lab=in}
N 850 120 850 130 {lab=in}
N 1040 -20 1040 70 {lab=#net1}
N 1310 120 1310 130 {lab=out}
N 1310 120 1330 120 {lab=out}
N 1040 -20 1390 -20 {lab=#net1}
N 970 170 970 300 {lab=GND}
N 1060 167.5 1060 260 {lab=#net2}
N 1100 120 1310 120 {lab=out}
C {devices/launcher.sym} 1526.25 23.75 0 0 {name=h3
descr="Simulate" 
tclcommand="xschem save; xschem netlist; xschem simulate"
}
C {devices/code_shown.sym} 1457.5 90 0 0 {name=NGSPICE only_toplevel=true 
value="
.param temp=27
.Param VCONT=0.5
.control
  save all
  step param VCONT 0.40 0.90 0.05   ; barrido 0.40→0.90 V en pasos de 50 mV
   *Vcont vcont 0 PWL(0n 0.40 10n 0.90)
  tran 1p 20n
  meas tran tdelay TRIG v(in) VAL=0.9 FALL=1 TARG v(out) VAL=0.9 RISE=1
  write tran_logic_not.raw
.endc
.end
"
}
C {devices/gnd.sym} 970 300 0 0 {name=l3 lab=GND}
C {devices/gnd.sym} 850 270 0 0 {name=l4 lab=GND}
C {devices/vsource.sym} 850 220 0 0 {name=Vin1 value="dc 0 ac 0 pulse(0, 1.2, 0, 25p, 25p, 250p, 500p ) "}
C {devices/vsource.sym} 1390 180 0 0 {name=Vdd1 value=1.2}
C {devices/gnd.sym} 1390 270 0 0 {name=l5 lab=GND}
C {devices/launcher.sym} 1522.5 -22.5 0 0 {name=h1
descr="load waves Ctrl + left click" 
tclcommand="xschem raw_read $netlist_dir/tran_logic_not.raw tran"
}
C {devices/lab_pin.sym} 830 130 0 0 {name=p9 sig_type=std_logic lab=in}
C {devices/lab_pin.sym} 1320 120 2 0 {name=p10 sig_type=std_logic lab=out}
C {devices/capa.sym} 1312.5 162.5 0 0 {name=C2
m=1
value=1f
footprint=1206
device="ceramic capacitor"
}
C {devices/gnd.sym} 1312.5 232.5 0 0 {name=l8 lab=GND}
C {devices/gnd.sym} 1057.5 340 0 0 {name=l6 lab=GND}
C {devices/vsource.sym} 1057.5 290 0 0 {name=VCONT value="dc \{VCONT\}"}
C {/foss/designs/UNIC-CASS-Aug25/sch/delay_variable/delay_variable.sym} 1040 120 0 0 {name=x1}
C {devices/code_shown.sym} 800 450 0 0 {name=MODEL1 only_toplevel=true
format="tcleval( @value )"
value="

.param corner=0

.if (corner==0)
.lib $::SG13G2_MODELS/cornerMOSlv.lib mos_tt
.lib $::SG13G2_MODELS/cornerMOSlv.lib mos_tt
.lib $::SG13G2_MODELS/cornerRES.lib res_typ
.lib $::SG13G2_MODELS/cornerCAP.lib cap_typ
.endif

.include /foss/pdks/ihp-sg13g2/libs.ref/sg13g2_stdcell/spice/sg13g2_stdcell.spice
"}
