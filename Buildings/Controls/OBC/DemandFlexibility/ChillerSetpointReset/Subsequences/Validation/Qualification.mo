within Buildings.Controls.OBC.DemandFlexibility.ChillerSetpointReset.Subsequences.Validation;
model Qualification "Qualification"

  Buildings.Controls.OBC.DemandFlexibility.ChillerSetpointReset.Subsequences.Qualification qua(
    final nAHU=2,
    final uCooCoiMax={0.95, 0.95},
    final fanSpeMax={0.95, 0.95},
    final dTSupMax={1, 1},
    final uCooCoiHys=0.01,
    final fanSpeHys=0.01,
    final dTSupHys=0.1)
    "Chiller plant load check"
    annotation (Placement(transformation(extent={{40,-20},{80,20}})));

  Buildings.Controls.OBC.CDL.Reals.Sources.Pulse uCooCoi[2](
    each amplitude=0.1,
    each width=0.5,
    each period=86400,
    shift={0, 43200},
    each offset=0.9)
    "Cooling coil control signal"
    annotation (Placement(transformation(extent={{-60,50},{-40,70}})));

  Buildings.Controls.OBC.CDL.Reals.Sources.Pulse fanSpe[2](
    each amplitude=0.1,
    each width=0.5,
    each period=43200,
    each offset=0.9)
    "Fan speed"
    annotation (Placement(transformation(extent={{-60,-10},{-40,10}})));

  Buildings.Controls.OBC.CDL.Reals.Sources.Pulse dTSup[2](
    each amplitude=2,
    each width=0.5,
    each period=21600,
    each offset=0)
    "Supply air temperature minus its setpoint"
    annotation (Placement(transformation(extent={{-60,-70},{-40,-50}})));

equation
  connect(uCooCoi.y, qua.uCooCoi)
    annotation (Line(points={{-38,60},{0,60},{0,12},{36,12}}, color={0,0,127}));
  connect(fanSpe.y, qua.fanSpe)
    annotation (Line(points={{-38,0},{36,0}}, color={0,0,127}));
  connect(dTSup.y, qua.dTSup)
    annotation (Line(points={{-38,-60},{0,-60},{0,-12},{36,-12}}, color={0,0,127}));

annotation (experiment(StopTime=86400, Interval=1, Tolerance=1e-06),
  __Dymola_Commands(file="modelica://Buildings/Resources/Scripts/Dymola/Controls/OBC/DemandFlexibility/ChillerSetpointReset/Subsequences/Validation/Qualification.mos"
    "Simulate and plot"),
  Documentation(info="<html>
<p>
This example validates
<a href=\"modelica://Buildings.Controls.OBC.DemandFlexibility.ChillerSetpointReset.Subsequences.Qualification\">
Buildings.Controls.OBC.DemandFlexibility.ChillerSetpointReset.Subsequences.Qualification</a>.
</p>
</html>", revisions="<html>
<ul>
<li>
October 21, 2026, by Weiping Huang, Liam Cochrane:<br/>
First implementation.
</li>
</ul>
</html>"),
    Icon(coordinateSystem(preserveAspectRatio=false,extent={{-100,-100},{100,100}}),
        graphics={
        Ellipse(lineColor = {75,138,73},
                fillColor={255,255,255},
                fillPattern = FillPattern.Solid,
                extent = {{-100,-100},{100,100}}),
        Polygon(lineColor = {0,0,255},
                fillColor = {75,138,73},
                pattern = LinePattern.None,
                fillPattern = FillPattern.Solid,
                points = {{-36,60},{64,0},{-36,-60},{-36,60}})}),
    Diagram(coordinateSystem(preserveAspectRatio=false,
      extent={{-100,-100},{100,100}})));
end Qualification;
