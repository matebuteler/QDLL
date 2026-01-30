-- sch_path: /foss/designs/UNIC-CASS-Aug25/sch/DLL/DLL_tb_top.sch
entity DLL_tb_top is
end DLL_tb_top ;

architecture arch_DLL_tb_top of DLL_tb_top is

component push_pull 
port (
  UP_IN : in std_logic ;
  VC : out std_logic ;
  DN_IN : in std_logic
);
end component ;

component phase_detector 
port (
  CK_IN : in std_logic ;
  UP : out std_logic ;
  CK_REF : in std_logic ;
  DN : out std_logic
);
end component ;

component variable_delay_line 
port (
  VDD : inout std_logic ;
  VSS : inout std_logic ;
  VCONT : in std_logic ;
  VOUT : out std_logic ;
  VIN : in std_logic
);
end component ;


signal VDD : std_logic := '1.2' ;
signal VIN : std_logic := '1.2' ;
signal VSS : std_logic := '1.2' ;
signal vc : std_logic ;
signal vdn : std_logic ;
signal vup : std_logic ;
signal net1 : std_logic ;
signal net2 : std_logic ;
signal net3 : std_logic ;
signal net4 : std_logic ;
signal GND : std_logic := '1.2' ;
signal Vout : std_logic ;
begin
Vdd1 : vsource
generic map (
   value => 1.2
)
port map (
   p => VDD ,
   m => GND
);

VIN3 : vsource
generic map (
   value => PULSE(0 1.2 0 5p 5p 1n 2n)
)
port map (
   p => VIN ,
   m => GND
);

x3 : push_pull
port map (
   UP_IN => vup ,
   VC => vc ,
   DN_IN => vdn
);

x2 : phase_detector
port map (
   CK_IN => Vout ,
   UP => vup ,
   CK_REF => VIN ,
   DN => vdn
);

x5 : variable_delay_line
port map (
   VDD => VDD ,
   VSS => net1 ,
   VCONT => net2 ,
   VOUT => net3 ,
   VIN => net4
);

Vdd4 : vsource
generic map (
   value => 0
)
port map (
   p => VSS ,
   m => GND
);


.save v(vin1) v(vin2)  v(vc) v(vdn) v(vup)



.tran 10p 10n
.save all
*.ic v(vout) = 0
.control
run
plot v(vin1) v(vin2)
plot v(vc)
plot v(vup) v(vdn)


*plot v(vin2) 

*plot v(vout)
*meas tran teval WHEN v(vout) = 0.63
*let res_val = 1000
*let cap_val = teval/res_val
*print cap_val
.endc



.param corner=0

.if (corner==0)
.lib $::SG13G2_MODELS/cornerMOSlv.lib mos_tt
.lib $::SG13G2_MODELS/cornerMOSlv.lib mos_tt
.lib $::SG13G2_MODELS/cornerRES.lib res_typ
.lib $::SG13G2_MODELS/cornerCAP.lib cap_typ
.endif

.include /foss/pdks/ihp-sg13g2/libs.ref/sg13g2_stdcell/spice/sg13g2_stdcell.spice

end arch_DLL_tb_top ;


-- expanding   symbol:  /foss/designs/UNIC-CASS-Aug25/sch/push_pull/push_pull.sym # of pins=3
-- sym_path: /foss/designs/UNIC-CASS-Aug25/sch/push_pull/push_pull.sym
-- sch_path: /foss/designs/UNIC-CASS-Aug25/sch/push_pull/push_pull.sch
entity push_pull is
port (
  UP_IN : in std_logic ;
  VC : out std_logic ;
  DN_IN : in std_logic
);
end push_pull ;

architecture arch_push_pull of push_pull is

component inv_1_manual 
port (
  VDD_D : inout std_logic ;
  A : inout std_logic ;
  Y : inout std_logic ;
  VSS_D : inout std_logic
);
end component ;


signal UPB : std_logic ;
signal VDD : std_logic ;
signal VSS : std_logic ;
signal net1 : std_logic ;
signal net2 : std_logic ;
signal net3 : std_logic ;
signal net4 : std_logic ;
signal net5 : std_logic ;
signal net6 : std_logic ;
signal net7 : std_logic ;
signal DNB : std_logic ;
begin
M1 : sg13_lv_nmos
generic map (
   l => 4.5e-07 ,
   w => 3.0e-07 ,
   ng => 1 ,
   m => 1 ,
   model => sg13_lv_nmos ,
   spiceprefix => X
)
port map (
   D => net1 ,
   G => DN_IN ,
   S => net2 ,
   B => VSS
);

M7 : sg13_lv_pmos
generic map (
   l => 1.3e-07 ,
   w => 1.5e-07 ,
   ng => 1 ,
   m => 1 ,
   model => sg13_lv_pmos ,
   spiceprefix => X
)
port map (
   D => net1 ,
   G => net1 ,
   S => VDD ,
   B => VDD
);

M2 : sg13_lv_nmos
generic map (
   l => 4.5e-07 ,
   w => 3.0e-07 ,
   ng => 1 ,
   m => 1 ,
   model => sg13_lv_nmos ,
   spiceprefix => X
)
port map (
   D => net7 ,
   G => DNB ,
   S => net2 ,
   B => VSS
);

M3 : sg13_lv_nmos
generic map (
   l => 4.5e-07 ,
   w => 3.0e-07 ,
   ng => 1 ,
   m => 1 ,
   model => sg13_lv_nmos ,
   spiceprefix => X
)
port map (
   D => net2 ,
   G => VDD ,
   S => VSS ,
   B => VSS
);

M4 : sg13_lv_pmos
generic map (
   l => 1.3e-07 ,
   w => 1.5e-07 ,
   ng => 1 ,
   m => 1 ,
   model => sg13_lv_pmos ,
   spiceprefix => X
)
port map (
   D => net1 ,
   G => net1 ,
   S => VDD ,
   B => VDD
);

M5 : sg13_lv_pmos
generic map (
   l => 1.3e-07 ,
   w => 1.5e-07 ,
   ng => 1 ,
   m => 1 ,
   model => sg13_lv_pmos ,
   spiceprefix => X
)
port map (
   D => net5 ,
   G => net7 ,
   S => VDD ,
   B => VDD
);

M6 : sg13_lv_nmos
generic map (
   l => 4.5e-07 ,
   w => 3.0e-07 ,
   ng => 1 ,
   m => 1 ,
   model => sg13_lv_nmos ,
   spiceprefix => X
)
port map (
   D => net4 ,
   G => UPB ,
   S => net3 ,
   B => VSS
);

M8 : sg13_lv_pmos
generic map (
   l => 1.3e-07 ,
   w => 1.5e-07 ,
   ng => 1 ,
   m => 1 ,
   model => sg13_lv_pmos ,
   spiceprefix => X
)
port map (
   D => net6 ,
   G => net4 ,
   S => VDD ,
   B => VDD
);

M9 : sg13_lv_nmos
generic map (
   l => 4.5e-07 ,
   w => 3.0e-07 ,
   ng => 1 ,
   m => 1 ,
   model => sg13_lv_nmos ,
   spiceprefix => X
)
port map (
   D => VC ,
   G => UP_IN ,
   S => net3 ,
   B => VSS
);

M10 : sg13_lv_nmos
generic map (
   l => 4.5e-07 ,
   w => 3.0e-07 ,
   ng => 1 ,
   m => 1 ,
   model => sg13_lv_nmos ,
   spiceprefix => X
)
port map (
   D => net3 ,
   G => VDD ,
   S => VSS ,
   B => VSS
);

M11 : sg13_lv_pmos
generic map (
   l => 1.3e-07 ,
   w => 1.5e-07 ,
   ng => 1 ,
   m => 1 ,
   model => sg13_lv_pmos ,
   spiceprefix => X
)
port map (
   D => VC ,
   G => net1 ,
   S => VDD ,
   B => VDD
);

M12 : sg13_lv_pmos
generic map (
   l => 1.3e-07 ,
   w => 1.5e-07 ,
   ng => 1 ,
   m => 1 ,
   model => sg13_lv_pmos ,
   spiceprefix => X
)
port map (
   D => VC ,
   G => net1 ,
   S => VDD ,
   B => VDD
);

M13 : sg13_lv_pmos
generic map (
   l => 1.3e-07 ,
   w => 1.5e-07 ,
   ng => 1 ,
   m => 1 ,
   model => sg13_lv_pmos ,
   spiceprefix => X
)
port map (
   D => net6 ,
   G => net4 ,
   S => VDD ,
   B => VDD
);

M14 : sg13_lv_pmos
generic map (
   l => 1.3e-07 ,
   w => 1.5e-07 ,
   ng => 1 ,
   m => 1 ,
   model => sg13_lv_pmos ,
   spiceprefix => X
)
port map (
   D => net5 ,
   G => net7 ,
   S => VDD ,
   B => VDD
);

x1 : inv_1_manual
port map (
   VDD_D => VDD ,
   A => DN_IN ,
   Y => DNB ,
   VSS_D => VSS
);

x2 : inv_1_manual
port map (
   VDD_D => VDD ,
   A => UP_IN ,
   Y => UPB ,
   VSS_D => VSS
);

end arch_push_pull ;


-- expanding   symbol:  /foss/designs/UNIC-CASS-Aug25/sch/phase_detector/phase_detector.sym # of pins=4
-- sym_path: /foss/designs/UNIC-CASS-Aug25/sch/phase_detector/phase_detector.sym
-- sch_path: /foss/designs/UNIC-CASS-Aug25/sch/phase_detector/phase_detector.sch
entity phase_detector is
port (
  CK_IN : in std_logic ;
  UP : out std_logic ;
  CK_REF : in std_logic ;
  DN : out std_logic
);
end phase_detector ;

architecture arch_phase_detector of phase_detector is

component inv_1_manual 
port (
  VDD_D : inout std_logic ;
  A : inout std_logic ;
  Y : inout std_logic ;
  VSS_D : inout std_logic
);
end component ;


signal net10 : std_logic ;
signal net11 : std_logic ;
signal net12 : std_logic ;
signal net13 : std_logic ;
signal net14 : std_logic ;
signal VDD : std_logic ;
signal VSS : std_logic ;
signal net1 : std_logic ;
signal net2 : std_logic ;
signal net3 : std_logic ;
signal net4 : std_logic ;
signal net5 : std_logic ;
signal net6 : std_logic ;
signal net7 : std_logic ;
signal net8 : std_logic ;
signal net9 : std_logic ;
begin
M7 : sg13_lv_pmos
generic map (
   l => 4.0e-06 ,
   w => 5.0e-06 ,
   ng => 1 ,
   m => 1 ,
   model => sg13_lv_pmos ,
   spiceprefix => X
)
port map (
   D => net2 ,
   G => CK_IN ,
   S => VDD ,
   B => VDD
);

M8 : sg13_lv_pmos
generic map (
   l => 4.0e-06 ,
   w => 5.0e-06 ,
   ng => 1 ,
   m => 1 ,
   model => sg13_lv_pmos ,
   spiceprefix => X
)
port map (
   D => net1 ,
   G => CK_IN ,
   S => VDD ,
   B => VDD
);

M9 : sg13_lv_nmos
generic map (
   l => 5.0e-06 ,
   w => 2.0e-06 ,
   ng => 5 ,
   m => 1 ,
   model => sg13_lv_nmos ,
   spiceprefix => X
)
port map (
   D => net2 ,
   G => CK_REF ,
   S => net1 ,
   B => net1
);

M10 : sg13_lv_nmos
generic map (
   l => 5.0e-06 ,
   w => 2.0e-06 ,
   ng => 5 ,
   m => 1 ,
   model => sg13_lv_nmos ,
   spiceprefix => X
)
port map (
   D => net2 ,
   G => DN ,
   S => net1 ,
   B => VSS
);

M11 : sg13_lv_nmos
generic map (
   l => 5.0e-06 ,
   w => 2.0e-06 ,
   ng => 5 ,
   m => 1 ,
   model => sg13_lv_nmos ,
   spiceprefix => X
)
port map (
   D => net1 ,
   G => CK_IN ,
   S => VSS ,
   B => VSS
);

M6 : sg13_lv_pmos
generic map (
   l => 4.0e-06 ,
   w => 5.0e-06 ,
   ng => 1 ,
   m => 1 ,
   model => sg13_lv_pmos ,
   spiceprefix => X
)
port map (
   D => net5 ,
   G => net4 ,
   S => VDD ,
   B => VDD
);

M12 : sg13_lv_nmos
generic map (
   l => 5.0e-06 ,
   w => 2.0e-06 ,
   ng => 5 ,
   m => 1 ,
   model => sg13_lv_nmos ,
   spiceprefix => X
)
port map (
   D => net5 ,
   G => CK_IN ,
   S => net6 ,
   B => net7
);

M13 : sg13_lv_nmos
generic map (
   l => 5.0e-06 ,
   w => 2.0e-06 ,
   ng => 5 ,
   m => 1 ,
   model => sg13_lv_nmos ,
   spiceprefix => X
)
port map (
   D => net6 ,
   G => net4 ,
   S => net7 ,
   B => net7
);

M14 : sg13_lv_pmos
generic map (
   l => 4.0e-06 ,
   w => 5.0e-06 ,
   ng => 1 ,
   m => 1 ,
   model => sg13_lv_pmos ,
   spiceprefix => X
)
port map (
   D => net6 ,
   G => net4 ,
   S => VDD ,
   B => VDD
);

x1 : inv_1_manual
port map (
   VDD_D => VDD ,
   A => net2 ,
   Y => net3 ,
   VSS_D => VSS
);

x2 : inv_1_manual
port map (
   VDD_D => VDD ,
   A => net3 ,
   Y => net4 ,
   VSS_D => VSS
);

x3 : inv_1_manual
port map (
   VDD_D => VDD ,
   A => net5 ,
   Y => UP ,
   VSS_D => net7
);

M19 : sg13_lv_pmos
generic map (
   l => 4.0e-06 ,
   w => 5.0e-06 ,
   ng => 1 ,
   m => 1 ,
   model => sg13_lv_pmos ,
   spiceprefix => X
)
port map (
   D => net9 ,
   G => CK_IN ,
   S => VDD ,
   B => VDD
);

M20 : sg13_lv_pmos
generic map (
   l => 4.0e-06 ,
   w => 5.0e-06 ,
   ng => 1 ,
   m => 1 ,
   model => sg13_lv_pmos ,
   spiceprefix => X
)
port map (
   D => net8 ,
   G => CK_IN ,
   S => VDD ,
   B => VDD
);

M21 : sg13_lv_nmos
generic map (
   l => 5.0e-06 ,
   w => 2.0e-06 ,
   ng => 5 ,
   m => 1 ,
   model => sg13_lv_nmos ,
   spiceprefix => X
)
port map (
   D => net9 ,
   G => CK_REF ,
   S => net8 ,
   B => net8
);

M22 : sg13_lv_nmos
generic map (
   l => 5.0e-06 ,
   w => 2.0e-06 ,
   ng => 5 ,
   m => 1 ,
   model => sg13_lv_nmos ,
   spiceprefix => X
)
port map (
   D => net9 ,
   G => UP ,
   S => net8 ,
   B => VSS
);

M23 : sg13_lv_nmos
generic map (
   l => 5.0e-06 ,
   w => 2.0e-06 ,
   ng => 5 ,
   m => 1 ,
   model => sg13_lv_nmos ,
   spiceprefix => X
)
port map (
   D => net8 ,
   G => CK_IN ,
   S => VSS ,
   B => VSS
);

M24 : sg13_lv_pmos
generic map (
   l => 4.0e-06 ,
   w => 5.0e-06 ,
   ng => 1 ,
   m => 1 ,
   model => sg13_lv_pmos ,
   spiceprefix => X
)
port map (
   D => net11 ,
   G => net10 ,
   S => VDD ,
   B => VDD
);

M25 : sg13_lv_nmos
generic map (
   l => 5.0e-06 ,
   w => 2.0e-06 ,
   ng => 5 ,
   m => 1 ,
   model => sg13_lv_nmos ,
   spiceprefix => X
)
port map (
   D => net11 ,
   G => CK_REF ,
   S => net12 ,
   B => net13
);

M26 : sg13_lv_nmos
generic map (
   l => 5.0e-06 ,
   w => 2.0e-06 ,
   ng => 5 ,
   m => 1 ,
   model => sg13_lv_nmos ,
   spiceprefix => X
)
port map (
   D => net12 ,
   G => net10 ,
   S => net13 ,
   B => net13
);

M27 : sg13_lv_pmos
generic map (
   l => 4.0e-06 ,
   w => 5.0e-06 ,
   ng => 1 ,
   m => 1 ,
   model => sg13_lv_pmos ,
   spiceprefix => X
)
port map (
   D => net12 ,
   G => net10 ,
   S => VDD ,
   B => VDD
);

x4 : inv_1_manual
port map (
   VDD_D => VDD ,
   A => net9 ,
   Y => net14 ,
   VSS_D => VSS
);

x5 : inv_1_manual
port map (
   VDD_D => VDD ,
   A => net14 ,
   Y => net10 ,
   VSS_D => VSS
);

x6 : inv_1_manual
port map (
   VDD_D => VDD ,
   A => net11 ,
   Y => DN ,
   VSS_D => net13
);

end arch_phase_detector ;


-- expanding   symbol:  /foss/designs/UNIC-CASS-Aug25/sch/delay_variable_line/variable_delay_line.sym # of pins=5
-- sym_path: /foss/designs/UNIC-CASS-Aug25/sch/delay_variable_line/variable_delay_line.sym
-- sch_path: /foss/designs/UNIC-CASS-Aug25/sch/delay_variable_line/variable_delay_line.sch
entity variable_delay_line is
port (
  VDD : inout std_logic ;
  VSS : inout std_logic ;
  VCONT : in std_logic ;
  VOUT : out std_logic ;
  VIN : in std_logic
);
end variable_delay_line ;

architecture arch_variable_delay_line of variable_delay_line is

component delay_variable 
port (
  VDD_D : inout std_logic ;
  VIN_D : in std_logic ;
  VOUT_D : out std_logic ;
  VCONT_D : in std_logic ;
  VSS_D : inout std_logic
);
end component ;

component large_delay_vto1p1 
port (
  VCC : inout std_logic ;
  VSS : inout std_logic ;
  VIN : inout std_logic ;
  VOUT : inout std_logic
);
end component ;


signal va : std_logic ;
begin
x1 : delay_variable
port map (
   VDD_D => VDD ,
   VIN_D => VIN ,
   VOUT_D => va ,
   VCONT_D => VCONT ,
   VSS_D => VSS
);

x2 : large_delay_vto1p1
port map (
   VCC => VDD ,
   VSS => VSS ,
   VIN => va ,
   VOUT => VOUT
);

end arch_variable_delay_line ;


-- expanding   symbol:  /foss/designs/UNIC-CASS-Aug25/sch/inv_1_manual/inv_1_manual.sym # of pins=4
-- sym_path: /foss/designs/UNIC-CASS-Aug25/sch/inv_1_manual/inv_1_manual.sym
-- sch_path: /foss/designs/UNIC-CASS-Aug25/sch/inv_1_manual/inv_1_manual.sch
entity inv_1_manual is
port (
  VDD_D : inout std_logic ;
  A : inout std_logic ;
  Y : inout std_logic ;
  VSS_D : inout std_logic
);
end inv_1_manual ;

architecture arch_inv_1_manual of inv_1_manual is

begin
M1 : sg13_lv_nmos
generic map (
   l => 1.3e-07 ,
   w => 1.0e-05 ,
   ng => 1 ,
   m => 1 ,
   model => sg13_lv_nmos ,
   spiceprefix => X
)
port map (
   D => Y ,
   G => A ,
   S => VSS_D ,
   B => VSS_D
);

M2 : sg13_lv_pmos
generic map (
   l => 1.3e-07 ,
   w => 1.0e-05 ,
   ng => 1 ,
   m => 1 ,
   model => sg13_lv_pmos ,
   spiceprefix => X
)
port map (
   D => Y ,
   G => A ,
   S => VDD_D ,
   B => VDD_D
);

end arch_inv_1_manual ;


-- expanding   symbol:  /foss/designs/UNIC-CASS-Aug25/sch/delay_variable/delay_variable.sym # of pins=5
-- sym_path: /foss/designs/UNIC-CASS-Aug25/sch/delay_variable/delay_variable.sym
-- sch_path: /foss/designs/UNIC-CASS-Aug25/sch/delay_variable/delay_variable.sch
entity delay_variable is
port (
  VDD_D : inout std_logic ;
  VIN_D : in std_logic ;
  VOUT_D : out std_logic ;
  VCONT_D : in std_logic ;
  VSS_D : inout std_logic
);
end delay_variable ;

architecture arch_delay_variable of delay_variable is


signal net1 : std_logic ;
signal net2 : std_logic ;
signal net3 : std_logic ;
begin
M3 : sg13_lv_nmos
generic map (
   l => 1.3e-07 ,
   w => 1.0e-06 ,
   ng => 1 ,
   m => 1 ,
   model => sg13_lv_nmos ,
   spiceprefix => X
)
port map (
   D => net3 ,
   G => VCONT_D ,
   S => VSS_D ,
   B => VSS_D
);

M5 : sg13_lv_nmos
generic map (
   l => 2.0e-06 ,
   w => 2.0e-06 ,
   ng => 1 ,
   m => 1 ,
   model => sg13_lv_nmos ,
   spiceprefix => X
)
port map (
   D => net2 ,
   G => VCONT_D ,
   S => VSS_D ,
   B => VSS_D
);

M4 : sg13_lv_pmos
generic map (
   l => 1.3e-07 ,
   w => 2.24e-06 ,
   ng => 1 ,
   m => 1 ,
   model => sg13_lv_pmos ,
   spiceprefix => X
)
port map (
   D => net3 ,
   G => net3 ,
   S => VDD_D ,
   B => VDD_D
);

M6 : sg13_lv_pmos
generic map (
   l => 2.0e-06 ,
   w => 4.0e-06 ,
   ng => 1 ,
   m => 1 ,
   model => sg13_lv_pmos ,
   spiceprefix => X
)
port map (
   D => net1 ,
   G => net3 ,
   S => VDD_D ,
   B => VDD_D
);

M7 : sg13_lv_pmos
generic map (
   l => 2.0e-06 ,
   w => 2.0e-05 ,
   ng => 4 ,
   m => 1 ,
   model => sg13_lv_pmos ,
   spiceprefix => X
)
port map (
   D => VOUT_D ,
   G => VIN_D ,
   S => net1 ,
   B => VDD_D
);

M8 : sg13_lv_nmos
generic map (
   l => 3.0e-06 ,
   w => 5.0e-06 ,
   ng => 1 ,
   m => 1 ,
   model => sg13_lv_nmos ,
   spiceprefix => X
)
port map (
   D => VOUT_D ,
   G => VIN_D ,
   S => net2 ,
   B => VSS_D
);

end arch_delay_variable ;


-- expanding   symbol:  /foss/designs/UNIC-CASS-Aug25/sch/large_delay_vto1p1/large_delay_vto1p1.sym # of pins=4
-- sym_path: /foss/designs/UNIC-CASS-Aug25/sch/large_delay_vto1p1/large_delay_vto1p1.sym
-- sch_path: /foss/designs/UNIC-CASS-Aug25/sch/large_delay_vto1p1/large_delay_vto1p1.sch
entity large_delay_vto1p1 is
port (
  VCC : inout std_logic ;
  VSS : inout std_logic ;
  VIN : inout std_logic ;
  VOUT : inout std_logic
);
end large_delay_vto1p1 ;

architecture arch_large_delay_vto1p1 of large_delay_vto1p1 is

component sg13g2_dlygate4sd3_1 
generic (
VDD : integer := VDD ;
VSS : integer := VSS ;
prefix : integer := sg13g2_
);
port (
  A : in std_logic ;
  X : out std_logic
);
end component ;

component sg13g2_dlygate4sd1_1 
generic (
VDD : integer := VDD ;
VSS : integer := VSS ;
prefix : integer := sg13g2_
);
port (
  A : in std_logic ;
  X : out std_logic
);
end component ;


signal n1 : std_logic ;
signal n2 : std_logic ;
signal n3 : std_logic ;
signal net1 : std_logic ;
signal net2 : std_logic_vector (3 downto 0) ;
signal net3 : std_logic_vector (3 downto 0) ;
begin
x1_X_0 : sg13g2_dlygate4sd3_1
generic map (
   VDD => VCC ,
   VSS => VSS ,
   prefix => sg13g2_
)
port map (
   A => net2(3) ,
   X => net3(3)
);
x1_X_1 : sg13g2_dlygate4sd3_1
generic map (
   VDD => VCC ,
   VSS => VSS ,
   prefix => sg13g2_
)
port map (
   A => net2(2) ,
   X => net3(2)
);
x1_X_2 : sg13g2_dlygate4sd3_1
generic map (
   VDD => VCC ,
   VSS => VSS ,
   prefix => sg13g2_
)
port map (
   A => net2(1) ,
   X => net3(1)
);
x1_X_3 : sg13g2_dlygate4sd3_1
generic map (
   VDD => VCC ,
   VSS => VSS ,
   prefix => sg13g2_
)
port map (
   A => net2(0) ,
   X => net3(0)
);

x5 : sg13g2_dlygate4sd1_1
generic map (
   VDD => VCC ,
   VSS => VSS ,
   prefix => sg13g2_
)
port map (
   A => net1 ,
   X => VOUT
);

x1 : sg13g2_dlygate4sd1_1
generic map (
   VDD => VCC ,
   VSS => VSS ,
   prefix => sg13g2_
)
port map (
   A => net1 ,
   X => VOUT
);

x2 : sg13g2_dlygate4sd1_1
generic map (
   VDD => VCC ,
   VSS => VSS ,
   prefix => sg13g2_
)
port map (
   A => net1 ,
   X => VOUT
);

x3 : sg13g2_dlygate4sd1_1
generic map (
   VDD => VCC ,
   VSS => VSS ,
   prefix => sg13g2_
)
port map (
   A => net1 ,
   X => VOUT
);

x4 : sg13g2_dlygate4sd1_1
generic map (
   VDD => VCC ,
   VSS => VSS ,
   prefix => sg13g2_
)
port map (
   A => VIN ,
   X => net1
);

x6 : sg13g2_dlygate4sd1_1
generic map (
   VDD => VCC ,
   VSS => VSS ,
   prefix => sg13g2_
)
port map (
   A => VIN ,
   X => net1
);

x7 : sg13g2_dlygate4sd1_1
generic map (
   VDD => VCC ,
   VSS => VSS ,
   prefix => sg13g2_
)
port map (
   A => VIN ,
   X => net1
);

x8 : sg13g2_dlygate4sd1_1
generic map (
   VDD => VCC ,
   VSS => VSS ,
   prefix => sg13g2_
)
port map (
   A => VIN ,
   X => net1
);

end arch_large_delay_vto1p1 ;

