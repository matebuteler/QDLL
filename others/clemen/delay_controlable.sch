v {xschem version=3.4.8RC file_version=1.3}
G {}
K {}
V {}
S {}
F {}
E {}
N 760 -660 760 -350 {lab=#net1}
N 830 -710 960 -710 {lab=#net1}
N 760 -680 760 -660 {lab=#net1}
N 830 -710 830 -660 {lab=#net1}
N 800 -710 830 -710 {lab=#net1}
N 760 -660 830 -660 {lab=#net1}
N 760 -780 760 -740 {lab=V_DD}
N 900 -780 1000 -780 {lab=V_DD}
N 1000 -780 1000 -740 {lab=V_DD}
N 1000 -710 1020 -710 {lab=V_DD}
N 1020 -780 1020 -710 {lab=V_DD}
N 1000 -780 1020 -780 {lab=V_DD}
N 740 -710 760 -710 {lab=V_DD}
N 740 -780 740 -710 {lab=V_DD}
N 740 -780 760 -780 {lab=V_DD}
N 900 -820 900 -780 {lab=V_DD}
N 760 -780 900 -780 {lab=V_DD}
N 1000 -680 1000 -590 {lab=#net2}
N 1000 -560 1020 -560 {lab=V_DD}
N 1020 -710 1020 -560 {lab=V_DD}
N 1000 -510 1000 -480 {lab=V_OUT}
N 1000 -510 1170 -510 {lab=V_OUT}
N 1000 -530 1000 -510 {lab=V_OUT}
N 1000 -420 1000 -350 {lab=#net3}
N 1000 -450 1020 -450 {lab=V_SS}
N 1000 -320 1020 -320 {lab=V_SS}
N 1020 -450 1020 -320 {lab=V_SS}
N 1000 -290 1000 -260 {lab=V_SS}
N 1020 -320 1020 -260 {lab=V_SS}
N 1000 -260 1020 -260 {lab=V_SS}
N 890 -260 1000 -260 {lab=V_SS}
N 760 -290 760 -260 {lab=V_SS}
N 760 -320 780 -320 {lab=V_SS}
N 780 -320 780 -260 {lab=V_SS}
N 760 -260 780 -260 {lab=V_SS}
N 890 -260 890 -230 {lab=V_SS}
N 780 -260 890 -260 {lab=V_SS}
N 920 -450 960 -450 {lab=V_IN}
N 920 -500 920 -450 {lab=V_IN}
N 920 -560 960 -560 {lab=V_IN}
N 870 -500 920 -500 {lab=V_IN}
N 920 -560 920 -500 {lab=V_IN}
N 660 -320 720 -320 {lab=V_CONT}
N 720 -390 720 -320 {lab=V_CONT}
N 720 -390 920 -390 {lab=V_CONT}
N 920 -390 920 -320 {lab=V_CONT}
N 920 -320 960 -320 {lab=V_CONT}
C {sg13g2_pr/sg13_lv_nmos.sym} 980 -450 0 0 {name=M1
l=0.13u
w=2u
ng=1
m=1
model=sg13_lv_nmos
spiceprefix=X
}
C {sg13g2_pr/sg13_lv_nmos.sym} 980 -320 0 0 {name=M2
l=0.16u
w=5u
ng=1
m=1
model=sg13_lv_nmos
spiceprefix=X
}
C {sg13g2_pr/sg13_lv_nmos.sym} 740 -320 0 0 {name=M3
l=0.25u
w=2u
ng=1
m=1
model=sg13_lv_nmos
spiceprefix=X
}
C {sg13g2_pr/sg13_lv_pmos.sym} 980 -560 0 0 {name=M4
l=0.13u
w=5u
ng=1
m=1
model=sg13_lv_pmos
spiceprefix=X
}
C {sg13g2_pr/sg13_lv_pmos.sym} 980 -710 0 0 {name=M5
l=0.16u
w=5u
ng=1
m=1
model=sg13_lv_pmos
spiceprefix=X
}
C {sg13g2_pr/sg13_lv_pmos.sym} 780 -710 0 1 {name=M6
l=0.13u
w=2.24u
ng=1
m=1
model=sg13_lv_pmos
spiceprefix=X
}
C {iopin.sym} 900 -820 3 0 {name=p1 lab=V_DD
}
C {iopin.sym} 890 -230 1 0 {name=p2 lab=V_SS}
C {ipin.sym} 870 -500 0 0 {name=p3 lab=V_IN}
C {ipin.sym} 660 -320 0 0 {name=p4 lab=V_CONT}
C {opin.sym} 1170 -510 0 0 {name=p5 lab=V_OUT}
