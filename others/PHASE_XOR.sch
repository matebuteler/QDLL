v {xschem version=3.4.8RC file_version=1.3}
G {}
K {}
V {}
S {}
F {}
E {}
N 0 -70 0 -50 {lab=#net1}
N 0 -150 0 -130 {lab=GND}
N 0 -150 50 -150 {lab=GND}
N 50 -150 50 -130 {lab=GND}
N -350 -10 -280 -10 {lab=GND}
N -350 -10 -350 0 {lab=GND}
N -150 -10 -90 -10 {lab=V_IN}
N -150 -30 -150 -10 {lab=V_IN}
N -220 -10 -150 -10 {lab=V_IN}
N -90 -20 -90 -10 {lab=V_IN}
N -150 20 -150 50 {lab=V_OUT}
N -150 110 -150 170 {lab=GND}
N -90 -20 -10 -20 {lab=V_IN}
N -150 20 -10 20 {lab=V_OUT}
N 360 0 370 0 {lab=V_CONT}
N 370 0 370 40 {lab=V_CONT}
N 370 100 370 120 {lab=GND}
N 110 0 250 0 {lab=V_P}
N 250 -70 250 0 {lab=V_P}
N 250 0 300 0 {lab=V_P}
C {devices/vsource.sym} 0 -100 2 0 {name=VDD value="1.2"}
C {gnd.sym} 50 -130 0 0 {name=l1 lab=GND}
C {gnd.sym} -150 170 0 0 {name=l3 lab=GND}
C {gnd.sym} -350 0 0 0 {name=l4 lab=GND}
C {vsource.sym} -250 -10 1 0 {name=Vin value="PULSE(0 1.2 0 10p 10p 0.99n 2n)"}
C {devices/lab_pin.sym} -150 -30 0 0 {name=p1 sig_type=std_logic lab=V_IN}
C {devices/lab_pin.sym} -150 30 0 1 {name=p2 sig_type=std_logic lab=V_OUT}
C {code_shown.sym} -540 -400 0 0 {name=MODEL1 only_toplevel=true
format="tcleval( @value )"
value="

.param corner=0

.if (corner==0)
.lib cornerMOSlv.lib mos_tt
.lib cornerRES.lib res_typ
.lib cornerCAP.lib cap_typ
.endif

.include /foss/pdks/ihp-sg13g2/libs.ref/sg13g2_stdcell/spice/sg13g2_stdcell.spice"}
C {devices/code_shown.sym} -860 -180 0 0 {name=NGSPICE1 only_toplevel=true
value="
.control
 tran 1p 10n
 plot v(V_IN) v(V_OUT)
.endc
"
spice_ignore=true}
C {code.sym} -660 50 0 0 {name=NGSPICE2 only_toplevel=true
value="
.control
* ---- settings you tweak ----


   * ---- user settings ----
  let vlow  = 0
  let vhigh = 1.2
  let v50   = vlow + 0.5*(vhigh - vlow)

  let start_edge = 0     ; skip early edges (settling)
  let N = 200             ; number of phase samples



  tran 1p 200n

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
C {sg13g2_stdcells/sg13g2_xor2_1.sym} 50 0 0 0 {name=x2 VDD=VDD VSS=VSS prefix=sg13g2_ }
C {vsource.sym} -150 80 0 0 {name=Vin1 value="PULSE(0 1.2 0.5n 10p 10p 1n 2n)"}
C {lab_pin.sym} 370 0 2 0 {name=p3 sig_type=std_logic lab=V_CONT
}
C {sg13g2_pr/cap_cmim.sym} 370 70 0 0 {name=C1
model=cap_cmim
w=10e-6
l=10e-6
m=1
spiceprefix=X}
C {gnd.sym} 370 120 0 0 {name=l5 lab=GND}
C {sg13g2_pr/rppd.sym} 330 0 3 0 {name=R2
w=1e-6
l=40e-6
model=rppd
body=sub!
spiceprefix=X
b=0
m=1
}
C {lab_pin.sym} 250 -70 2 0 {name=p4 sig_type=std_logic lab=V_P
}
