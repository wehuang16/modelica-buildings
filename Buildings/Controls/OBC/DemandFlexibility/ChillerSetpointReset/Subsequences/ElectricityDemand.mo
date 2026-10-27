within Buildings.Controls.OBC.DemandFlexibility.ChillerSetpointReset.Subsequences;
block ElectricityDemand "Electricity demand check"

  parameter Real PBuiRedDifMin(final unit="W", final quantity="Power", final min=0)
    "Minimum difference between the electricity demand reduction target and the actual reduction";
  parameter Real PBuiRed_nominal(final unit="W", final quantity="Power", final min=0)
    "Nominal electricity demand reduction of the building";
  parameter Real PBuiRedHys(final unit="W", final quantity="Power", final min=0)=0.05*PBuiRed_nominal
    "Hysteresis for the electricity demand reduction of the building";

  Buildings.Controls.OBC.CDL.Interfaces.RealInput PBuiRedTar(final unit="W", final quantity="Power")
    "Target electricity demand reduction of the building"
    annotation (Placement(transformation(extent={{-140,40},{-100,80}})));
  Buildings.Controls.OBC.CDL.Interfaces.RealInput PBuiRed(final unit="W", final quantity="Power")
    "Electricity demand reduction of the building (baseline demand minus actual demand)"
    annotation (Placement(transformation(extent={{-140,-80},{-100,-40}})));
  Buildings.Controls.OBC.CDL.Interfaces.BooleanOutput need_PBuiShe
    "True if further electricity demand shed of the building is needed"
    annotation (Placement(transformation(extent={{100,-20},{140,20}})));

protected
  Buildings.Controls.OBC.CDL.Reals.Subtract PBuiRedDif
    "Difference between the target and the actual electricity demand reduction"
    annotation (Placement(transformation(extent={{-60,-10},{-40,10}})));
  Buildings.Controls.OBC.CDL.Reals.GreaterThreshold greDifMin(final t=PBuiRedDifMin, final h=PBuiRedHys)
    "Check if the difference is greater than the minimum allowable difference"
    annotation (Placement(transformation(extent={{0,-10},{20,10}})));

equation
  connect(PBuiRedTar, PBuiRedDif.u1)
    annotation (Line(points={{-120,60},{-80,60},{-80,6},{-62,6}}, color={0,0,127}));
  connect(PBuiRed, PBuiRedDif.u2)
    annotation (Line(points={{-120,-60},{-80,-60},{-80,-6},{-62,-6}}, color={0,0,127}));
  connect(PBuiRedDif.y, greDifMin.u)
    annotation (Line(points={{-38,0},{-2,0}}, color={0,0,127}));
  connect(greDifMin.y, need_PBuiShe)
    annotation (Line(points={{22,0},{120,0}}, color={255,0,255}));

  annotation (defaultComponentName="eleDem",
    Icon(coordinateSystem(preserveAspectRatio=false, extent={{-100,-100},{100,100}}, grid={2,2}),
      graphics={Rectangle(extent={{-100,100},{100,-100}}, lineColor={0,0,0},
        fillColor={255,255,255}, fillPattern=FillPattern.Solid),
        Text(extent={{-100,140},{100,100}}, textColor={0,0,255}, textString="%name")}),
    Diagram(coordinateSystem(preserveAspectRatio=false, grid={2,2})),
    Documentation(revisions="<html><ul>
<li>October 27, 2026, by Liam Cochrane:<br/>Made internal blocks protected, completed parameter declarations, and added documentation.</li>
<li>August 18, 2026, by Weiping Huang:<br/>First implementation.</li>
</ul></html>", info="<html>
<p>Electricity demand check for the chilled water temperature setpoint reset strategy.
The output <code>need_PBuiShe</code> is true when <code>PBuiRedTar - PBuiRed</code>
is greater than <code>PBuiRedDifMin</code>, meaning the shed target is not yet met
and the setpoint may be ratcheted further. A hysteresis of <code>PBuiRedHys</code> is applied.</p>
</html>"));
end ElectricityDemand;
