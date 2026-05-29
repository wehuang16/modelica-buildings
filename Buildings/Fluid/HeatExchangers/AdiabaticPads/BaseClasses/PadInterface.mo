within Buildings.Fluid.HeatExchangers.AdiabaticPads.BaseClasses;
model PadInterface

  parameter Buildings.Fluid.HeatExchangers.AdiabaticPads.Data.Generic per
    annotation (Placement(transformation(extent={{26,20},{46,42}})));
  final parameter Real etaDer[size(per.efficiency.v,1)]=
    Buildings.Utilities.Math.Functions.splineDerivatives(
    x=per.efficiency.v,
    y=per.efficiency.eta,
    ensureMonotonicity=Buildings.Utilities.Math.Functions.isMonotonic(
      x=per.efficiency.eta,
      strict=false));
  Buildings.Controls.OBC.CDL.Interfaces.RealInput v annotation (Placement(
        transformation(extent={{-140,-20},{-100,20}}), iconTransformation(
          extent={{-140,-20},{-100,20}})));
  Buildings.Controls.OBC.CDL.Interfaces.RealOutput eta annotation (Placement(
        transformation(extent={{100,-20},{140,20}}), iconTransformation(extent={{100,-20},
            {140,20}})));
equation

  eta = Buildings.Fluid.HeatExchangers.AdiabaticPads.BaseClasses.Characteristics.saturationEfficiency(per=per.efficiency, v=v, d=etaDer);
  annotation (Icon(coordinateSystem(preserveAspectRatio=false)), Diagram(
        coordinateSystem(preserveAspectRatio=false)));
end PadInterface;
