v {xschem version=3.4.8RC file_version=1.3}
G {}
K {}
V {}
S {}
F {}
E {}
N 0 -160 0 -140 {lab=GND}
N 0 -160 50 -160 {lab=GND}
N 50 -160 50 -140 {lab=GND}
N -150 90 -150 110 {lab=GND}
N -150 0 -150 30 {lab=V_CONT}
N -350 -20 -280 -20 {lab=GND}
N -350 -20 -350 -10 {lab=GND}
N -150 -40 -150 -20 {lab=V_IN}
N -220 -20 -150 -20 {lab=V_IN}
N 160 50 160 70 {lab=GND}
N 0 -80 0 -60 {lab=#net1}
N -150 -20 -80 -20 {lab=V_IN}
N 100 -10 210 -10 {lab=V_OUT}
N -150 0 -90 -0 {lab=V_CONT}
N 0 -60 20 -60 {lab=#net1}
N 20 40 20 60 {lab=GND}
C {devices/vsource.sym} 0 -110 2 0 {name=VDD value="1.2"}
C {gnd.sym} 50 -140 0 0 {name=l1 lab=GND}
C {gnd.sym} -150 110 0 0 {name=l3 lab=GND}
C {gnd.sym} -350 -10 0 0 {name=l4 lab=GND}
C {vsource.sym} -250 -20 1 0 {name=Vin value="PULSE(0 1.2 0 10p 10p 0.99n 2n)"}
C {devices/lab_pin.sym} -150 -40 0 0 {name=p1 sig_type=std_logic lab=V_IN}
C {devices/lab_pin.sym} 210 -10 0 1 {name=p2 sig_type=std_logic lab=V_OUT}
C {code_shown.sym} -610 -200 0 0 {name=MODEL1 only_toplevel=true
format="tcleval( @value )"
value="

.param corner=0

.if (corner==0)
.lib cornerMOSlv.lib mos_tt
.lib cornerRES.lib res_typ
.lib cornerCAP.lib cap_typ
.endif
"}
C {devices/code_shown.sym} -860 -190 0 0 {name=NGSPICE1 only_toplevel=true
value="
.control
 tran 1p 10n
 plot v(V_IN) v(V_OUT)
.endc
"
spice_ignore=true}
C {capa.sym} 160 20 0 0 {name=C1
m=1
value=100f
footprint=1206
device="ceramic capacitor"}
C {devices/gnd.sym} 160 70 0 0 {name=l5 lab=GND}
C {code.sym} -650 80 0 0 {name=NGSPICE2 only_toplevel=true
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
    meas tran tin      WHEN v(V_IN)=v50  RISE=i
    meas tran tout     WHEN v(V_OUT)=v50 RISE=i
    meas tran tin_next WHEN v(V_IN)=v50  RISE=(i+1)

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
  plot v(V_IN) v(V_OUT) v(V_CONT)
  plot phivec vs v(V_CONT)
.endc
"}
C {devices/vsource.sym} -150 60 0 0 {name=Vcont value="PWL(0 0 200n 1.2)"}
C {devices/lab_pin.sym} -150 10 0 0 {name=p3 sig_type=std_logic lab=V_CONT}
C {/foss/designs/DLL/2026/clemen/delay_controlable.sym} 60 -10 0 0 {name=x1}
C {gnd.sym} 20 60 0 0 {name=l2 lab=GND}
