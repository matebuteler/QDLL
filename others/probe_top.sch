v {xschem version=3.4.8RC file_version=1.3}
G {}
K {}
V {}
S {}
F {}
E {}
N 690 -390 690 -370 {lab=#net1}
N 690 -470 690 -450 {lab=GND}
N 690 -470 740 -470 {lab=GND}
N 740 -470 740 -450 {lab=GND}
N 540 -330 580 -330 {lab=V_IN}
N 540 -350 540 -330 {lab=V_IN}
N 690 -270 690 -250 {lab=GND}
N 850 -260 850 -240 {lab=GND}
N 800 -320 900 -320 {lab=V_OUT}
N -70 -190 -70 -180 {lab=GND}
N -70 -190 0 -190 {lab=GND}
N 0 -20 0 50 {lab=V_OUT}
N 0 110 0 130 {lab=GND}
N -40 -60 0 -60 {lab=V_IN}
N -40 -20 0 -20 {lab=V_OUT}
N 0 -110 0 -60 {lab=V_IN}
N 0 -190 0 -170 {lab=GND}
N -420 10 -420 30 {lab=GND}
N -320 10 -320 30 {lab=GND}
N 380 -40 390 -40 {lab=V_CONT}
N 390 -40 390 0 {lab=V_CONT}
N 390 60 390 80 {lab=GND}
N 0 -60 10 -60 {lab=V_IN}
N 0 -20 10 -20 {lab=V_OUT}
N 230 -40 320 -40 {lab=V_P}
N 230 -110 230 -40 {lab=V_P}
N 390 -310 390 -40 {lab=V_CONT}
N 390 -310 580 -310 {lab=V_CONT}
N 130 -40 230 -40 {lab=V_P}
C {devices/vsource.sym} 690 -420 2 0 {name=VDD1 value="1.2"}
C {gnd.sym} 740 -450 0 0 {name=l5 lab=GND}
C {gnd.sym} 690 -250 0 0 {name=l6 lab=GND}
C {devices/lab_pin.sym} 540 -350 0 0 {name=p4 sig_type=std_logic lab=V_IN}
C {devices/lab_pin.sym} 900 -320 0 1 {name=p5 sig_type=std_logic lab=V_OUT}
C {capa.sym} 850 -290 0 0 {name=C1
m=1
value=100f
footprint=1206
device="ceramic capacitor"}
C {devices/gnd.sym} 850 -240 0 0 {name=l9 lab=GND}
C {/foss/designs/DLL/2026/clemen/delay_controlable.sym} 730 -320 0 0 {name=x1}
C {vsource.sym} 0 -140 2 1 {name=V1 value="pulse(0,1.2,0,1p,1p,1n,2n) dc 0 ac 0)" savecurrent=false}
C {vsource.sym} 0 80 0 0 {name=V2 value="pulse(0,1.2,0.5n,1p,1p,1n,2n) dc 0 ac 0)" savecurrent=false
spice_ignore=true}
C {gnd.sym} 0 130 0 0 {name=l1 lab=GND}
C {gnd.sym} -70 -180 0 0 {name=l2 lab=GND}
C {lab_pin.sym} 390 -40 2 0 {name=p2 sig_type=std_logic lab=V_CONT
}
C {lab_pin.sym} -40 -60 0 0 {name=p3 sig_type=std_logic lab=V_IN
}
C {lab_pin.sym} -40 -20 0 0 {name=p1 sig_type=std_logic lab=V_OUT
}
C {code_shown.sym} -420 180 0 0 {name=MODEL only_toplevel=true
format="tcleval( @value )"
value="
.lib cornerMOSlv.lib mos_tt
.lib cornerCAP.lib cap_typ
.lib cornerRES.lib res_typ
.include /foss/pdks/ihp-sg13g2/libs.ref/sg13g2_stdcell/spice/sg13g2_stdcell.spice
"}
C {sg13g2_stdcells/sg13g2_xor2_1.sym} 70 -40 0 0 {name=x2 VDD=VDD VSS=VSS prefix=sg13g2_ }
C {vsource.sym} -420 -20 0 0 {name=V3 value=1.2 savecurrent=false}
C {gnd.sym} -420 30 0 0 {name=l3 lab=GND}
C {lab_pin.sym} -420 -50 2 0 {name=p6 sig_type=std_logic lab=VDD}
C {vsource.sym} -320 -20 0 0 {name=V4 value=0 savecurrent=false}
C {gnd.sym} -320 30 0 0 {name=l4 lab=GND}
C {lab_pin.sym} -320 -50 2 0 {name=p7 sig_type=std_logic lab=VSS}
C {sg13g2_pr/cap_cmim.sym} 390 30 0 0 {name=C2
model=cap_cmim
w=10e-6
l=10e-6
m=1
spiceprefix=X}
C {gnd.sym} 390 80 0 0 {name=l7 lab=GND}
C {sg13g2_pr/rppd.sym} 350 -40 3 0 {name=R2
w=1e-6
l=40e-6
model=rppd
body=sub!
spiceprefix=X
b=0
m=1
}
C {lab_pin.sym} 230 -110 1 0 {name=p8 sig_type=std_logic lab=V_P
}
C {code.sym} -540 -250 0 0 {name=NGSPICE2 only_toplevel=true
value="
.control
* ---- settings you tweak ----


   * ---- user settings ----
  let vlow  = 0
  let vhigh = 1.2
  let v50   = vlow + 0.5*(vhigh - vlow)

  let start_edge = 0     ; skip early edges (settling)
  let N = 1000             ; number of phase samples



  tran 1p 1000n

  * ---- allocate vectors ----
  let tvec   = vector(N)
  let phivec = vector(N)

  let k = 0
  let i = start_edge

  while k < N
    * crossing times
    meas tran tin      WHEN v(v_in)=v50  RISE=i
    meas tran tout     WHEN v(v_out)=v50 RISE=i
    meas tran tin_next WHEN v(v_in)=v50  RISE=(i+1)

    * delay + period
    let dt = tout - tin
    let T  = tin_next - tin

    * phase in degrees (per-cycle)
    let phi = 360*dt/T
    let phi = phi - 360*floor(phi/360)

    * store sample at time = tin
    let tvec[k]   = tin
    let phivec[k] = phi

    let k = k + 1
    let i = i + 1
  end

  * plot phase vs time (one point per cycle)
  plot phivec vs tvec
  plot v(V_CONT) V_P
  plot v(V_IN) v(V_OUT) v(V_CONT)
.endc
"}
