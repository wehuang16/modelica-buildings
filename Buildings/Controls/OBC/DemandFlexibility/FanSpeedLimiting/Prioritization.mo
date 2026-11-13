within Buildings.Controls.OBC.DemandFlexibility.FanSpeedLimiting;
model Prioritization
  "Validation model for the block that prioritizes air handling units for fan speed limiting"
  extends Modelica.Icons.Example;

  Buildings.Controls.OBC.DemandFlexibility.FanSpeedLimiting.Subsequences.Prioritization priSiz(
    final nAHU=3,
    final priCri=Buildings.Controls.OBC.DemandFlexibility.FanSpeedLimiting.Types.PrioritizationCriteria.FanSize,
    final fanSiz={10,30,20})
    "Prioritization based on fan size"
    annotation (Placement(transformation(extent={{30,30},{50,50}})));

  Buildings.Controls.OBC.DemandFlexibility.FanSpeedLimiting.Subsequences.Prioritization priSpe(
    final nAHU=3,
    final priCri=Buildings.Controls.OBC.DemandFlexibility.FanSpeedLimiting.Types.PrioritizationCriteria.CurrentFanSpeed,
    final fanSiz={10,30,20})
    "Prioritization based on current fan speed"
    annotation (Placement(transformation(extent={{30,-50},{50,-30}})));

  Buildings.Controls.OBC.CDL.Logical.Sources.TimeTable disFla(
    table=[0,0,0,0;
           1800,0,1,0;
           3600,0,1,0],
    period=3600)
    "Disqualification flags; unit 2 is disqualified after 1800 s"
    annotation (Placement(transformation(extent={{-80,50},{-60,70}})));

  Buildings.Controls.OBC.CDL.Reals.Sources.TimeTable fanSpe(
    table=[0,0.5,0.7,0.9;
           450,0.9,0.7,0.5;
           900,0.5,0.7,0.9;
           1350,0.9,0.7,0.5;
           1800,0.5,0.7,0.9;
           2250,0.9,0.7,0.5;
           2700,0.5,0.7,0.9;
           3150,0.9,0.7,0.5;
           3600,0.9,0.7,0.5],
    smoothness=Buildings.Controls.OBC.CDL.Types.Smoothness.ConstantSegments)
    "Current fan speeds"
    annotation (Placement(transformation(extent={{-80,-50},{-60,-30}})));

  Buildings.Controls.OBC.CDL.Integers.Sources.TimeTable nSel(
    table=[0,1; 900,2; 2700,1; 3600,1],
    period=3600)
    "Number of units to select"
    annotation (Placement(transformation(extent={{-80,-90},{-60,-70}})));

equation
  connect(disFla.y, priSiz.disFla)
    annotation (Line(points={{-58,60},{0,60},{0,46},{28,46}}, color={255,0,255}));
  connect(disFla.y, priSpe.disFla)
    annotation (Line(points={{-58,60},{0,60},{0,-34},{28,-34}}, color={255,0,255}));
  connect(fanSpe.y, priSpe.fanSpe)
    annotation (Line(points={{-58,-40},{28,-40}}, color={0,0,127}));
  connect(nSel.y[1], priSiz.nSel)
    annotation (Line(points={{-58,-80},{10,-80},{10,34},{28,34}}, color={255,127,0}));
  connect(nSel.y[1], priSpe.nSel)
    annotation (Line(points={{-58,-80},{10,-80},{10,-46},{28,-46}}, color={255,127,0}));

  annotation (
    experiment(StopTime=3600, Tolerance=1e-06),
    Documentation(info="<html>
<p>
This model validates the block
<a href=\"modelica://Buildings.Controls.OBC.DemandFlexibility.FanSpeedLimiting.Subsequences.Prioritization\">
Buildings.Controls.OBC.DemandFlexibility.FanSpeedLimiting.Subsequences.Prioritization</a>
for three air handling units, using both prioritization criteria.
</p>
<p>
The instance <code>priSiz</code> prioritizes by fan size, with
<code>fanSiz = {10, 30, 20}</code>, so the ranking is unit 2, unit 3, unit 1.
The instance <code>priSpe</code> prioritizes by current fan speed. The fan speeds
alternate every <code>450</code> s between <code>{0.5, 0.7, 0.9}</code>, which ranks
unit 3, unit 2, unit 1, and <code>{0.9, 0.7, 0.5}</code>, which ranks unit 1, unit 2, unit 3.
Both instances receive the same number of units to select, <code>nSel</code>, and the
same disqualification flags, <code>disFla</code>.
</p>
<p>
The inputs and expected outputs are as follows:
</p>
<ul>
<li>
From <code>0</code> s to <code>900</code> s, <code>nSel = 1</code> and no unit is
disqualified. For <code>priSiz</code>, only unit 2 is enabled, i.e.,
<code>yEna = {false, true, false}</code>. For <code>priSpe</code>, unit 3 is enabled
until <code>450</code> s, and unit 1 is enabled from <code>450</code> s to <code>900</code> s.
</li>
<li>
From <code>900</code> s to <code>1800</code> s, <code>nSel = 2</code> and no unit is
disqualified. For <code>priSiz</code>, units 2 and 3 are enabled,
i.e., <code>yEna = {false, true, true}</code>. For <code>priSpe</code>, units 2 and 3
are enabled until <code>1350</code> s, and units 1 and 2 are enabled from
<code>1350</code> s to <code>1800</code> s.
</li>
<li>
From <code>1800</code> s to <code>2700</code> s, <code>nSel = 2</code> and unit 2 is
disqualified. For both instances, units 1 and 3 are enabled, i.e.,
<code>yEna = {true, false, true}</code>, since they are the only two qualified units.
</li>
<li>
From <code>2700</code> s to <code>3600</code> s, <code>nSel = 1</code> and unit 2 remains
disqualified. For <code>priSiz</code>, only unit 3 is enabled, i.e.,
<code>yEna = {false, false, true}</code>. For <code>priSpe</code>, unit 3 is enabled
until <code>3150</code> s, and unit 1 is enabled from <code>3150</code> s to
<code>3600</code> s.
</li>
</ul>
<p>
Note that in <code>priSpe</code>, unit 2 has the second highest fan speed throughout,
but it is not enabled after <code>1800</code> s because it is disqualified.
</p>
</html>",
revisions="<html>
<ul>
<li>
November 13, 2026, by Weiping Huang and Liam Cochrane:<br/>
First implementation.
</li>
</ul>
</html>"));
end Prioritization;
