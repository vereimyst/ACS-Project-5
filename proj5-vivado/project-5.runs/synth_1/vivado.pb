
�
Command: %s
1870*	planAhead2|
zread_checkpoint -auto_incremental -incremental C:/tmpProjs/project-5/project-5.srcs/utils_1/imports/synth_1/top_module.dcpZ12-2866h px� 
�
;Read reference checkpoint from %s for incremental synthesis3154*	planAhead2M
KC:/tmpProjs/project-5/project-5.srcs/utils_1/imports/synth_1/top_module.dcpZ12-5825h px� 
T
-Please ensure there are no constraint changes3725*	planAheadZ12-7989h px� 
e
Command: %s
53*	vivadotcl24
2synth_design -top top_module -part xc7a35tcsg324-1Z4-113h px� 
:
Starting synth_design
149*	vivadotclZ4-321h px� 
z
@Attempting to get a license for feature '%s' and/or device '%s'
308*common2
	Synthesis2	
xc7a35tZ17-347h px� 
j
0Got license for feature '%s' and/or device '%s'
310*common2
	Synthesis2	
xc7a35tZ17-349h px� 

VNo compile time benefit to using incremental synthesis; A full resynthesis will be run2353*designutilsZ20-5440h px� 
�
�Flow is switching to default flow due to incremental criteria not met. If you would like to alter this behaviour and have the flow terminate instead, please set the following parameter config_implementation {autoIncr.Synth.RejectBehavior Terminate}2229*designutilsZ20-4379h px� 
o
HMultithreading enabled for synth_design using a maximum of %s processes.4828*oasys2
2Z8-7079h px� 
a
?Launching helper process for spawning children vivado processes4827*oasysZ8-7078h px� 
O
#Helper process launched with PID %s4824*oasys2
105596Z8-7075h px� 
�
%s*synth2u
sStarting Synthesize : Time (s): cpu = 00:00:02 ; elapsed = 00:00:05 . Memory (MB): peak = 848.586 ; gain = 471.961
h px� 
�
synthesizing module '%s'%s4497*oasys2

top_module2
 2>
:C:/Users/megan/Documents/GitHub/ACS-Project-5/top_module.v2
38@Z8-6157h px� 
�
synthesizing module '%s'%s4497*oasys2
ripple_carry_adder2
 2@
<C:/Users/megan/Documents/GitHub/ACS-Project-5/ripple_carry.v2
18@Z8-6157h px� 
D
%s
*synth2,
*	Parameter N bound to: 8 - type: integer 
h p
x
� 
�
synthesizing module '%s'%s4497*oasys2

full_adder2
 2>
:C:/Users/megan/Documents/GitHub/ACS-Project-5/full_adder.v2
18@Z8-6157h px� 
�
'done synthesizing module '%s'%s (%s#%s)4495*oasys2

full_adder2
 2
02
12>
:C:/Users/megan/Documents/GitHub/ACS-Project-5/full_adder.v2
18@Z8-6155h px� 
�
'done synthesizing module '%s'%s (%s#%s)4495*oasys2
ripple_carry_adder2
 2
02
12@
<C:/Users/megan/Documents/GitHub/ACS-Project-5/ripple_carry.v2
18@Z8-6155h px� 
�
synthesizing module '%s'%s4497*oasys2
truncated_adder2
 2=
9C:/Users/megan/Documents/GitHub/ACS-Project-5/truncated.v2
18@Z8-6157h px� 
D
%s
*synth2,
*	Parameter N bound to: 8 - type: integer 
h p
x
� 
D
%s
*synth2,
*	Parameter T bound to: 4 - type: integer 
h p
x
� 
�
'done synthesizing module '%s'%s (%s#%s)4495*oasys2
truncated_adder2
 2
02
12=
9C:/Users/megan/Documents/GitHub/ACS-Project-5/truncated.v2
18@Z8-6155h px� 
�
synthesizing module '%s'%s4497*oasys2
simplified_logic_adder2
 2>
:C:/Users/megan/Documents/GitHub/ACS-Project-5/simplified.v2
18@Z8-6157h px� 
D
%s
*synth2,
*	Parameter N bound to: 8 - type: integer 
h p
x
� 
�
'done synthesizing module '%s'%s (%s#%s)4495*oasys2
simplified_logic_adder2
 2
02
12>
:C:/Users/megan/Documents/GitHub/ACS-Project-5/simplified.v2
18@Z8-6155h px� 
�
synthesizing module '%s'%s4497*oasys2
reduced_carry_adder2
 2;
7C:/Users/megan/Documents/GitHub/ACS-Project-5/reduced.v2
18@Z8-6157h px� 
D
%s
*synth2,
*	Parameter N bound to: 8 - type: integer 
h p
x
� 
N
%s
*synth26
4	Parameter CARRY_LIMIT bound to: 4 - type: integer 
h p
x
� 
�
'done synthesizing module '%s'%s (%s#%s)4495*oasys2
reduced_carry_adder2
 2
02
12;
7C:/Users/megan/Documents/GitHub/ACS-Project-5/reduced.v2
18@Z8-6155h px� 
�
synthesizing module '%s'%s4497*oasys2
stochastic_adder2
 2>
:C:/Users/megan/Documents/GitHub/ACS-Project-5/stochastic.v2
18@Z8-6157h px� 
D
%s
*synth2,
*	Parameter N bound to: 8 - type: integer 
h p
x
� 
�
'done synthesizing module '%s'%s (%s#%s)4495*oasys2
stochastic_adder2
 2
02
12>
:C:/Users/megan/Documents/GitHub/ACS-Project-5/stochastic.v2
18@Z8-6155h px� 
�
'done synthesizing module '%s'%s (%s#%s)4495*oasys2

top_module2
 2
02
12>
:C:/Users/megan/Documents/GitHub/ACS-Project-5/top_module.v2
38@Z8-6155h px� 
v
9Port %s in module %s is either unconnected or has no load4866*oasys2
a[3]2
truncated_adderZ8-7129h px� 
v
9Port %s in module %s is either unconnected or has no load4866*oasys2
a[2]2
truncated_adderZ8-7129h px� 
v
9Port %s in module %s is either unconnected or has no load4866*oasys2
a[1]2
truncated_adderZ8-7129h px� 
v
9Port %s in module %s is either unconnected or has no load4866*oasys2
a[0]2
truncated_adderZ8-7129h px� 
v
9Port %s in module %s is either unconnected or has no load4866*oasys2
b[3]2
truncated_adderZ8-7129h px� 
v
9Port %s in module %s is either unconnected or has no load4866*oasys2
b[2]2
truncated_adderZ8-7129h px� 
v
9Port %s in module %s is either unconnected or has no load4866*oasys2
b[1]2
truncated_adderZ8-7129h px� 
v
9Port %s in module %s is either unconnected or has no load4866*oasys2
b[0]2
truncated_adderZ8-7129h px� 
�
%s*synth2u
sFinished Synthesize : Time (s): cpu = 00:00:03 ; elapsed = 00:00:07 . Memory (MB): peak = 954.641 ; gain = 578.016
h px� 
l
%s
*synth2T
R---------------------------------------------------------------------------------
h p
x
� 
�
%s*synth2�
~Finished Constraint Validation : Time (s): cpu = 00:00:04 ; elapsed = 00:00:07 . Memory (MB): peak = 954.641 ; gain = 578.016
h px� 
l
%s
*synth2T
R---------------------------------------------------------------------------------
h p
x
� 
l
%s
*synth2T
R---------------------------------------------------------------------------------
h p
x
� 
D
%s
*synth2,
*Start Loading Part and Timing Information
h p
x
� 
l
%s
*synth2T
R---------------------------------------------------------------------------------
h p
x
� 
8
%s
*synth2 
Loading part: xc7a35tcsg324-1
h p
x
� 
l
%s
*synth2T
R---------------------------------------------------------------------------------
h p
x
� 
�
%s*synth2�
�Finished Loading Part and Timing Information : Time (s): cpu = 00:00:04 ; elapsed = 00:00:07 . Memory (MB): peak = 954.641 ; gain = 578.016
h px� 
l
%s
*synth2T
R---------------------------------------------------------------------------------
h p
x
� 
D
Loading part %s157*device2
xc7a35tcsg324-1Z21-403h px� 
l
%s
*synth2T
R---------------------------------------------------------------------------------
h p
x
� 
�
%s*synth2�
�Finished RTL Optimization Phase 2 : Time (s): cpu = 00:00:04 ; elapsed = 00:00:07 . Memory (MB): peak = 954.641 ; gain = 578.016
h px� 
l
%s
*synth2T
R---------------------------------------------------------------------------------
h p
x
� 
l
%s
*synth2T
R---------------------------------------------------------------------------------
h p
x
� 
:
%s
*synth2"
 Start RTL Component Statistics 
h p
x
� 
l
%s
*synth2T
R---------------------------------------------------------------------------------
h p
x
� 
9
%s
*synth2!
Detailed RTL Component Info : 
h p
x
� 
(
%s
*synth2
+---Adders : 
h p
x
� 
F
%s
*synth2.
,	   2 Input    4 Bit       Adders := 1     
h p
x
� 
&
%s
*synth2
+---XORs : 
h p
x
� 
H
%s
*synth20
.	   2 Input      1 Bit         XORs := 29    
h p
x
� 
H
%s
*synth20
.	   3 Input      1 Bit         XORs := 8     
h p
x
� 
+
%s
*synth2
+---Registers : 
h p
x
� 
H
%s
*synth20
.	                8 Bit    Registers := 1     
h p
x
� 
l
%s
*synth2T
R---------------------------------------------------------------------------------
h p
x
� 
=
%s
*synth2%
#Finished RTL Component Statistics 
h p
x
� 
l
%s
*synth2T
R---------------------------------------------------------------------------------
h p
x
� 
l
%s
*synth2T
R---------------------------------------------------------------------------------
h p
x
� 
6
%s
*synth2
Start Part Resource Summary
h p
x
� 
l
%s
*synth2T
R---------------------------------------------------------------------------------
h p
x
� 
p
%s
*synth2X
VPart Resources:
DSPs: 90 (col length:60)
BRAMs: 100 (col length: RAMB18 60 RAMB36 30)
h p
x
� 
l
%s
*synth2T
R---------------------------------------------------------------------------------
h p
x
� 
9
%s
*synth2!
Finished Part Resource Summary
h p
x
� 
l
%s
*synth2T
R---------------------------------------------------------------------------------
h p
x
� 
l
%s
*synth2T
R---------------------------------------------------------------------------------
h p
x
� 
E
%s
*synth2-
+Start Cross Boundary and Area Optimization
h p
x
� 
l
%s
*synth2T
R---------------------------------------------------------------------------------
h p
x
� 
H
&Parallel synthesis criteria is not met4829*oasysZ8-7080h px� 
t
+design %s has port %s driven by constant %s3447*oasys2

top_module2
sum_truncated[3]2
0Z8-3917h px� 
t
+design %s has port %s driven by constant %s3447*oasys2

top_module2
sum_truncated[2]2
0Z8-3917h px� 
t
+design %s has port %s driven by constant %s3447*oasys2

top_module2
sum_truncated[1]2
0Z8-3917h px� 
t
+design %s has port %s driven by constant %s3447*oasys2

top_module2
sum_truncated[0]2
0Z8-3917h px� 
l
%s
*synth2T
R---------------------------------------------------------------------------------
h p
x
� 
�
%s*synth2�
�Finished Cross Boundary and Area Optimization : Time (s): cpu = 00:00:06 ; elapsed = 00:00:13 . Memory (MB): peak = 1138.406 ; gain = 761.781
h px� 
l
%s
*synth2T
R---------------------------------------------------------------------------------
h p
x
� 
l
%s
*synth2T
R---------------------------------------------------------------------------------
h p
x
� 
4
%s
*synth2
Start Timing Optimization
h p
x
� 
l
%s
*synth2T
R---------------------------------------------------------------------------------
h p
x
� 
l
%s
*synth2T
R---------------------------------------------------------------------------------
h p
x
� 
�
%s*synth2
}Finished Timing Optimization : Time (s): cpu = 00:00:06 ; elapsed = 00:00:13 . Memory (MB): peak = 1138.406 ; gain = 761.781
h px� 
l
%s
*synth2T
R---------------------------------------------------------------------------------
h p
x
� 
l
%s
*synth2T
R---------------------------------------------------------------------------------
h p
x
� 
3
%s
*synth2
Start Technology Mapping
h p
x
� 
l
%s
*synth2T
R---------------------------------------------------------------------------------
h p
x
� 
l
%s
*synth2T
R---------------------------------------------------------------------------------
h p
x
� 
�
%s*synth2~
|Finished Technology Mapping : Time (s): cpu = 00:00:06 ; elapsed = 00:00:13 . Memory (MB): peak = 1138.406 ; gain = 761.781
h px� 
l
%s
*synth2T
R---------------------------------------------------------------------------------
h p
x
� 
l
%s
*synth2T
R---------------------------------------------------------------------------------
h p
x
� 
-
%s
*synth2
Start IO Insertion
h p
x
� 
l
%s
*synth2T
R---------------------------------------------------------------------------------
h p
x
� 
l
%s
*synth2T
R---------------------------------------------------------------------------------
h p
x
� 
?
%s
*synth2'
%Start Flattening Before IO Insertion
h p
x
� 
l
%s
*synth2T
R---------------------------------------------------------------------------------
h p
x
� 
l
%s
*synth2T
R---------------------------------------------------------------------------------
h p
x
� 
B
%s
*synth2*
(Finished Flattening Before IO Insertion
h p
x
� 
l
%s
*synth2T
R---------------------------------------------------------------------------------
h p
x
� 
l
%s
*synth2T
R---------------------------------------------------------------------------------
h p
x
� 
6
%s
*synth2
Start Final Netlist Cleanup
h p
x
� 
l
%s
*synth2T
R---------------------------------------------------------------------------------
h p
x
� 
l
%s
*synth2T
R---------------------------------------------------------------------------------
h p
x
� 
9
%s
*synth2!
Finished Final Netlist Cleanup
h p
x
� 
l
%s
*synth2T
R---------------------------------------------------------------------------------
h p
x
� 
l
%s
*synth2T
R---------------------------------------------------------------------------------
h p
x
� 
�
%s*synth2x
vFinished IO Insertion : Time (s): cpu = 00:00:08 ; elapsed = 00:00:17 . Memory (MB): peak = 1334.965 ; gain = 958.340
h px� 
l
%s
*synth2T
R---------------------------------------------------------------------------------
h p
x
� 
l
%s
*synth2T
R---------------------------------------------------------------------------------
h p
x
� 
=
%s
*synth2%
#Start Renaming Generated Instances
h p
x
� 
l
%s
*synth2T
R---------------------------------------------------------------------------------
h p
x
� 
l
%s
*synth2T
R---------------------------------------------------------------------------------
h p
x
� 
�
%s*synth2�
�Finished Renaming Generated Instances : Time (s): cpu = 00:00:09 ; elapsed = 00:00:17 . Memory (MB): peak = 1334.965 ; gain = 958.340
h px� 
l
%s
*synth2T
R---------------------------------------------------------------------------------
h p
x
� 
l
%s
*synth2T
R---------------------------------------------------------------------------------
h p
x
� 
:
%s
*synth2"
 Start Rebuilding User Hierarchy
h p
x
� 
l
%s
*synth2T
R---------------------------------------------------------------------------------
h p
x
� 
l
%s
*synth2T
R---------------------------------------------------------------------------------
h p
x
� 
�
%s*synth2�
�Finished Rebuilding User Hierarchy : Time (s): cpu = 00:00:09 ; elapsed = 00:00:18 . Memory (MB): peak = 1334.965 ; gain = 958.340
h px� 
l
%s
*synth2T
R---------------------------------------------------------------------------------
h p
x
� 
l
%s
*synth2T
R---------------------------------------------------------------------------------
h p
x
� 
9
%s
*synth2!
Start Renaming Generated Ports
h p
x
� 
l
%s
*synth2T
R---------------------------------------------------------------------------------
h p
x
� 
l
%s
*synth2T
R---------------------------------------------------------------------------------
h p
x
� 
�
%s*synth2�
�Finished Renaming Generated Ports : Time (s): cpu = 00:00:09 ; elapsed = 00:00:18 . Memory (MB): peak = 1334.965 ; gain = 958.340
h px� 
l
%s
*synth2T
R---------------------------------------------------------------------------------
h p
x
� 
l
%s
*synth2T
R---------------------------------------------------------------------------------
h p
x
� 
;
%s
*synth2#
!Start Handling Custom Attributes
h p
x
� 
l
%s
*synth2T
R---------------------------------------------------------------------------------
h p
x
� 
l
%s
*synth2T
R---------------------------------------------------------------------------------
h p
x
� 
�
%s*synth2�
�Finished Handling Custom Attributes : Time (s): cpu = 00:00:09 ; elapsed = 00:00:18 . Memory (MB): peak = 1334.965 ; gain = 958.340
h px� 
l
%s
*synth2T
R---------------------------------------------------------------------------------
h p
x
� 
l
%s
*synth2T
R---------------------------------------------------------------------------------
h p
x
� 
8
%s
*synth2 
Start Renaming Generated Nets
h p
x
� 
l
%s
*synth2T
R---------------------------------------------------------------------------------
h p
x
� 
l
%s
*synth2T
R---------------------------------------------------------------------------------
h p
x
� 
�
%s*synth2�
�Finished Renaming Generated Nets : Time (s): cpu = 00:00:09 ; elapsed = 00:00:18 . Memory (MB): peak = 1334.965 ; gain = 958.340
h px� 
l
%s
*synth2T
R---------------------------------------------------------------------------------
h p
x
� 
l
%s
*synth2T
R---------------------------------------------------------------------------------
h p
x
� 
9
%s
*synth2!
Start Writing Synthesis Report
h p
x
� 
l
%s
*synth2T
R---------------------------------------------------------------------------------
h p
x
� 
/
%s
*synth2

Report BlackBoxes: 
h p
x
� 
8
%s
*synth2 
+-+--------------+----------+
h p
x
� 
8
%s
*synth2 
| |BlackBox name |Instances |
h p
x
� 
8
%s
*synth2 
+-+--------------+----------+
h p
x
� 
8
%s
*synth2 
+-+--------------+----------+
h p
x
� 
/
%s*synth2

Report Cell Usage: 
h px� 
0
%s*synth2
+------+-----+------+
h px� 
0
%s*synth2
|      |Cell |Count |
h px� 
0
%s*synth2
+------+-----+------+
h px� 
0
%s*synth2
|1     |LUT2 |    17|
h px� 
0
%s*synth2
|2     |LUT3 |     1|
h px� 
0
%s*synth2
|3     |LUT4 |     3|
h px� 
0
%s*synth2
|4     |LUT5 |     4|
h px� 
0
%s*synth2
|5     |LUT6 |     5|
h px� 
0
%s*synth2
|6     |IBUF |    16|
h px� 
0
%s*synth2
|7     |OBUF |    40|
h px� 
0
%s*synth2
+------+-----+------+
h px� 
3
%s
*synth2

Report Instance Areas: 
h p
x
� 
<
%s
*synth2$
"+------+---------+-------+------+
h p
x
� 
<
%s
*synth2$
"|      |Instance |Module |Cells |
h p
x
� 
<
%s
*synth2$
"+------+---------+-------+------+
h p
x
� 
<
%s
*synth2$
"|1     |top      |       |    86|
h p
x
� 
<
%s
*synth2$
"+------+---------+-------+------+
h p
x
� 
l
%s
*synth2T
R---------------------------------------------------------------------------------
h p
x
� 
�
%s*synth2�
�Finished Writing Synthesis Report : Time (s): cpu = 00:00:09 ; elapsed = 00:00:18 . Memory (MB): peak = 1334.965 ; gain = 958.340
h px� 
l
%s
*synth2T
R---------------------------------------------------------------------------------
h p
x
� 
a
%s
*synth2I
GSynthesis finished with 0 errors, 0 critical warnings and 13 warnings.
h p
x
� 
�
%s
*synth2�
Synthesis Optimization Runtime : Time (s): cpu = 00:00:09 ; elapsed = 00:00:18 . Memory (MB): peak = 1334.965 ; gain = 958.340
h p
x
� 
�
%s
*synth2�
�Synthesis Optimization Complete : Time (s): cpu = 00:00:09 ; elapsed = 00:00:18 . Memory (MB): peak = 1334.965 ; gain = 958.340
h p
x
� 
B
 Translating synthesized netlist
350*projectZ1-571h px� 
�
I%sTime (s): cpu = %s ; elapsed = %s . Memory (MB): peak = %s ; gain = %s
268*common2
Netlist sorting complete. 2

00:00:002
00:00:00.0012

1349.0162
0.000Z17-268h px� 
K
)Preparing netlist for logic optimization
349*projectZ1-570h px� 
Q
)Pushed %s inverter(s) to %s load pin(s).
98*opt2
02
0Z31-138h px� 
�
I%sTime (s): cpu = %s ; elapsed = %s . Memory (MB): peak = %s ; gain = %s
268*common2
Netlist sorting complete. 2

00:00:002

00:00:002

1460.4452
0.000Z17-268h px� 
l
!Unisim Transformation Summary:
%s111*project2'
%No Unisim elements were transformed.
Z1-111h px� 
V
%Synth Design complete | Checksum: %s
562*	vivadotcl2

e5611277Z4-1430h px� 
C
Releasing license: %s
83*common2
	SynthesisZ17-83h px� 

G%s Infos, %s Warnings, %s Critical Warnings and %s Errors encountered.
28*	vivadotcl2
282
132
02
0Z4-41h px� 
L
%s completed successfully
29*	vivadotcl2
synth_designZ4-42h px� 
�
I%sTime (s): cpu = %s ; elapsed = %s . Memory (MB): peak = %s ; gain = %s
268*common2
synth_design: 2

00:00:092

00:00:202

1460.4452

1091.027Z17-268h px� 
�
I%sTime (s): cpu = %s ; elapsed = %s . Memory (MB): peak = %s ; gain = %s
268*common2
Write ShapeDB Complete: 2

00:00:002
00:00:00.0012

1460.4452
0.000Z17-268h px� 
�
 The %s '%s' has been generated.
621*common2

checkpoint2=
;C:/tmpProjs/project-5/project-5.runs/synth_1/top_module.dcpZ17-1381h px� 
�
Executing command : %s
56330*	planAhead2_
]report_utilization -file top_module_utilization_synth.rpt -pb top_module_utilization_synth.pbZ12-24828h px� 
\
Exiting %s at %s...
206*common2
Vivado2
Thu Dec  5 13:21:42 2024Z17-206h px� 


End Record