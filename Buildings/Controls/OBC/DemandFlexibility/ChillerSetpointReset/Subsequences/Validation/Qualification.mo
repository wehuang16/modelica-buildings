within Buildings.Controls.OBC.DemandFlexibility.ChillerSetpointReset.Subsequences.Validation;
model Qualification "Qualification"

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
