-- sch_path: /home/designer/shared/UNIC-CASS-Aug25/tb_variable_delay_line.sch
entity tb_variable_delay_line is
end tb_variable_delay_line ;

architecture arch_tb_variable_delay_line of tb_variable_delay_line is

component variable_delay_line 
port (
  VDD : inout std_logic ;
  VSS : inout std_logic ;
  VCONT : in std_logic ;
  VOUT : out std_logic ;
  VIN : in std_logic
);
end component ;


signal out : std_logic ;
signal in : std_logic ;
signal net1 : std_logic ;
signal net2 : std_logic ;
signal net3 : std_logic ;
signal GND : std_logic ;
begin
Vin1 : vsource
generic map (
   value => dc 0 ac 0 pulse(0, 1.2, 0, 25p, 25p, 250p, 500p )
)
port map (
   p => in ,
   m => GND
);

Vdd1 : vsource
generic map (
   value => 1.2
)
port map (
   p => net1 ,
   m => GND
);

VCONT : vsource
generic map (
   value => dc {VCONT}
)
port map (
   p => net2 ,
   m => net3
);

x1 : variable_delay_line
port map (
   VDD => net1 ,
   VSS => GND ,
   VCONT => net2 ,
   VOUT => out ,
   VIN => in
);


.lib cornerMOSlv.lib mos_tt


.param temp=27
.param VCONT=0.60
.control
save all
.step param VCONT 0.40 0.90 0.05
.tran 1p 3n

* barrer VCONT de 0.40 a 0.90 V en pasos de 50 mV
*.step param VCONT 0.40 0.90 0.05
*meas tran tdelay TRIG v(in) VAl=0.9 FALl=1 TARG v(out) VAl=0.9 RISE=1
write tran_logic_not.raw
.endc

end arch_tb_variable_delay_line ;


-- expanding   symbol:  variable_delay_line.sym # of pins=5
-- sym_path: /home/designer/shared/UNIC-CASS-Aug25/variable_delay_line.sym
-- sch_path: /home/designer/shared/UNIC-CASS-Aug25/variable_delay_line.sch
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

component variable_delay 
port (
  VDD_D : inout std_logic ;
  VIN_D : in std_logic ;
  VOUT_D : out std_logic ;
  VCONT_D : in std_logic ;
  VSS_D : inout std_logic
);
end component ;


signal net1 : std_logic ;
signal net2 : std_logic ;
signal net3 : std_logic ;
signal net4 : std_logic ;
begin
x1 : variable_delay
port map (
   VDD_D => VDD ,
   VIN_D => VIN ,
   VOUT_D => net1 ,
   VCONT_D => VCONT ,
   VSS_D => VSS
);

x2 : variable_delay
port map (
   VDD_D => VDD ,
   VIN_D => net1 ,
   VOUT_D => net2 ,
   VCONT_D => VCONT ,
   VSS_D => VSS
);

x3 : variable_delay
port map (
   VDD_D => VDD ,
   VIN_D => net2 ,
   VOUT_D => net4 ,
   VCONT_D => VCONT ,
   VSS_D => VSS
);

x4 : variable_delay
port map (
   VDD_D => VDD ,
   VIN_D => net4 ,
   VOUT_D => net3 ,
   VCONT_D => VCONT ,
   VSS_D => VSS
);

x5 : variable_delay
port map (
   VDD_D => VDD ,
   VIN_D => net3 ,
   VOUT_D => VOUT ,
   VCONT_D => VCONT ,
   VSS_D => VSS
);

end arch_variable_delay_line ;


-- expanding   symbol:  variable_delay.sym # of pins=5
-- sym_path: /home/designer/shared/UNIC-CASS-Aug25/variable_delay.sym
-- sch_path: /home/designer/shared/UNIC-CASS-Aug25/variable_delay.sch
entity variable_delay is
port (
  VDD_D : inout std_logic ;
  VIN_D : in std_logic ;
  VOUT_D : out std_logic ;
  VCONT_D : in std_logic ;
  VSS_D : inout std_logic
);
end variable_delay ;

architecture arch_variable_delay of variable_delay is

component inv_1_manual 
port (
  VDD_D : inout std_logic ;
  A : inout std_logic ;
  Y : inout std_logic ;
  VSS_D : inout std_logic
);
end component ;


signal net1 : std_logic ;
signal net2 : std_logic ;
signal net3 : std_logic ;
signal net4 : std_logic ;
begin
M5 : sg13_lv_nmos
generic map (
   l => 1.3e-07 ,
   w => 5.0e-06 ,
   ng => 1 ,
   m => 1 ,
   model => sg13_lv_nmos ,
   spiceprefix => X
)
port map (
   D => net3 ,
   G => VCONT_D ,
   S => net2 ,
   B => net2
);

M6 : sg13_lv_pmos
generic map (
   l => 1.3e-07 ,
   w => 5.0e-06 ,
   ng => 1 ,
   m => 1 ,
   model => sg13_lv_pmos ,
   spiceprefix => X
)
port map (
   D => net1 ,
   G => net4 ,
   S => VDD_D ,
   B => VDD_D
);

M2 : sg13_lv_pmos
generic map (
   l => 1.3e-07 ,
   w => 8.8e-07 ,
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

M1 : sg13_lv_nmos
generic map (
   l => 1.3e-07 ,
   w => 4.0e-07 ,
   ng => 1 ,
   m => 1 ,
   model => sg13_lv_nmos ,
   spiceprefix => X
)
port map (
   D => VOUT_D ,
   G => VIN_D ,
   S => net3 ,
   B => net2
);

x1 : inv_1_manual
port map (
   VDD_D => VDD_D ,
   A => VCONT_D ,
   Y => net4 ,
   VSS_D => net2
);

end arch_variable_delay ;


-- expanding   symbol:  /home/designer/shared/UNIC-CASS-Aug25/others/inv_1_manual.sym # of pins=4
-- sym_path: /home/designer/shared/UNIC-CASS-Aug25/others/inv_1_manual.sym
-- sch_path: /home/designer/shared/UNIC-CASS-Aug25/others/inv_1_manual.sch
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

