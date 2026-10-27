within Buildings.Controls.OBC.DemandFlexibility.ChillerSetpointReset;
block Controller "Controller"

  parameter Real PBuiRedDifMin(
    final unit="W",
    final quantity="Power")
    "Minimum difference between the electricity demand reduction target and the actual electricity demand reduction of the building";
  parameter Real PBuiRed_nominal(
    min=0,
    unit="W")
    "Nominal electricity demand reduction of the building";
  parameter Real PBuiRedHys(
    min=0,
    unit="W")=0.05*PBuiRed_nominal
    "Hysteresis for the electricity demand reduction of the building";

  annotation (defaultComponentName="booPasThr",
    Icon(coordinateSystem(preserveAspectRatio=false, extent={{-100,-100},{100,100}},
    grid={2,2}), graphics={Rectangle(
      extent={{-100,100},{100,-100}},
      lineColor={0,0,0},
      fillColor={255,255,255},
      fillPattern=FillPattern.Solid), Text(
      extent={{-100,140},{100,100}},
      textColor={0,0,255},
          textString="%name")}), Diagram(
    coordinateSystem(preserveAspectRatio=false,
    grid={2,2})),
    Documentation(revisions="<html>
<ul>
<li>
August 18, 2026, by Weiping Huang:<br/>
First implementation.
</li>
</ul>
</html>", info="<html>
<p>
Passes a Boolean signal through without modification.
</p>
</html>"));
end Controller;
