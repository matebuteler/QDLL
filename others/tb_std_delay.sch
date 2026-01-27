v {xschem version=3.4.8RC file_version=1.3}
G {}
K {}
V {}
S {}
F {}
E {}
N -840 -140 -840 -120 {lab=GND}
N -530 -150 -530 -130 {lab=GND}
N -840 -240 -680 -240 {lab=V_IN}
N -840 -240 -840 -200 {lab=V_IN}
N -530 -240 -480 -240 {lab=V_OUT}
N -840 -270 -840 -240 {lab=V_IN}
N -530 -240 -530 -210 {lab=V_OUT}
N -600 -240 -530 -240 {lab=V_OUT}
N -860 -400 -860 -380 {lab=GND}
N -760 -400 -760 -380 {lab=GND}
C {gnd.sym} -840 -120 0 0 {name=l3 lab=GND}
C {devices/lab_pin.sym} -840 -270 0 0 {name=p1 sig_type=std_logic lab=V_IN}
C {devices/lab_pin.sym} -480 -240 0 1 {name=p2 sig_type=std_logic lab=V_OUT}
C {capa.sym} -530 -180 0 0 {name=C1
m=1
value=100f
footprint=1206
device="ceramic capacitor"}
C {devices/gnd.sym} -530 -130 0 0 {name=l5 lab=GND}
C {vsource.sym} -840 -170 0 0 {name=Vin value="PULSE(0 1.2 0 10p 10p 1n 2n)"}
C {code.sym} -180 -620 0 0 {name=NGSPICE1 only_toplevel=true
value="
.control
  let vlow = 0.0
  let vhigh = 1.2
  let v10 = vlow + 0.1*(vhigh-vlow)
  let v90 = vlow + 0.9*(vhigh-vlow)
  let v50 = vlow + 0.5*(vhigh-vlow)

 tran 1p 10n
 
* --- Rise/Fall V_IN ---
  meas tran trise_in  TRIG v(V_IN)  VAL=v10 RISE=1  TARG v(V_IN)  VAL=v90 RISE=1
  meas tran tfall_in  TRIG v(V_IN)  VAL=v90 FALL=1  TARG v(V_IN)  VAL=v10 FALL=1

  * --- Rise/Fall V_OUT ---
  meas tran trise_out TRIG v(V_OUT) VAL=v10 RISE=1  TARG v(V_OUT) VAL=v90 RISE=1
  meas tran tfall_out TRIG v(V_OUT) VAL=v90 FALL=1  TARG v(V_OUT) VAL=v10 FALL=1

  * Temporal phase difference (delay) at 50% crossing
  meas tran dt_rise TRIG v(v_in)  VAL=v50 RISE=1 TARG v(v_out) VAL=v50 RISE=1
  meas tran dt_fall TRIG v(v_in)  VAL=v50 FALL=1 TARG v(v_out) VAL=v50 FALL=1

 * (Optional) period + phase in degrees
  meas tran Tin TRIG v(v_in) VAL=v50 RISE=1 TARG v(v_in) VAL=v50 RISE=2
  let phi_deg = 360*dt_rise/Tin
  print trise_in tfall_in trise_out tfall_out dt_rise dt_fall Tin phi_deg

 plot v(V_IN) v(V_OUT)
.endc
"
spice_ignore=true}
C {code.sym} -310 -620 0 0 {name=NGSPICE3 only_toplevel=true
value="
.control
* ---- settings you tweak ----
  let vlow  = 0
  let vhigh = 1.2
  let v50   = vlow + 0.5*(vhigh - vlow)
  let start_edge = 5     ; skip first 4 edges (settling)
  let N = 20             ; number of cycles to average

  tran 1p 50n

  * ---- accumulators ----
  let sumdt = 0
  let sumT  = 0
  let k = 0
  let i = start_edge

  while k < N
    * crossing times at edge i
    meas tran tin  WHEN v(V_IN)=v50  RISE=i
    meas tran tout WHEN v(V_OUT)=v50 RISE=i

    let dt = tout - tin
    let sumdt = sumdt + dt

    * period from input edges: T(i) = t_in(i+1) - t_in(i)
    meas tran tin_next WHEN v(V_IN)=v50 RISE=(i+1)
    let T = tin_next - tin
    let sumT = sumT + T

    let i = i + 1
    let k = k + 1
  end

  let dt_avg = sumdt / N
  let T_avg  = sumT  / N
  let phi_deg_avg = 360 * dt_avg / T_avg

  print dt_avg T_avg phi_deg_avg

 plot v(V_IN) v(V_OUT)
.endc
"
spice_ignore=true}
C {code.sym} -310 -440 0 0 {name=NGSPICE2 only_toplevel=true
value="
.control
* ---- settings you tweak ----
   * ---- user settings ----
  let vlow  = 0
  let vhigh = 1.2
  let v50   = vlow + 0.5*(vhigh - vlow)

  let start_edge = 5     ; skip early edges (settling)
  let N = 50             ; number of phase samples

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

    * store sample at time = tin
    let tvec[k]   = tin
    let phivec[k] = phi

    let k = k + 1
    let i = i + 1
  end

  * plot phase vs time (one point per cycle)
  plot phivec vs tvec
  plot v(V_IN) v(V_OUT)
.endc
"}
C {sg13g2_stdcells/sg13g2_dlygate4sd2_1.sym} -640 -240 0 0 {name=x1 VDD=VDD VSS=VSS prefix=sg13g2_ }
C {code_shown.sym} -960 -830 0 0 {name=MODEL2 only_toplevel=true
format="tcleval( @value )"
value="

.param corner=0

.if (corner==0)
.lib cornerMOSlv.lib mos_tt
.lib cornerRES.lib res_typ
.lib cornerCAP.lib cap_typ
.endif

.include /foss/pdks/ihp-sg13g2/libs.ref/sg13g2_stdcell/spice/sg13g2_stdcell.spice"}
C {vsource.sym} -860 -430 0 0 {name=V3 value=1.2 savecurrent=false}
C {gnd.sym} -860 -380 0 0 {name=l1 lab=GND}
C {lab_pin.sym} -860 -460 2 0 {name=p3 sig_type=std_logic lab=VDD}
C {vsource.sym} -760 -430 0 0 {name=V4 value=0 savecurrent=false}
C {gnd.sym} -760 -380 0 0 {name=l4 lab=GND}
C {lab_pin.sym} -760 -460 2 0 {name=p5 sig_type=std_logic lab=VSS}
