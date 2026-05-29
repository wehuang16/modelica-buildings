within Buildings.Fluid.HeatExchangers.AdiabaticPads.Data;
record MfrA6inVersion1 "Fan data for Greenheck 12 BIDW fan"
  extends Buildings.Fluid.HeatExchangers.AdiabaticPads.Data.Generic(
    efficiency(v={0,1.27, 1.524, 1.778, 2.032, 2.2352, 2.5146, 2.7686, 3.0226,
       3.302,  3.556,355.6},
        eta={0.819,0.744, 0.731, 0.714, 0.695, 0.681, 0.664, 0.66,  0.647, 0.634,
       0.623,5.56788318e-13}));

  annotation (
defaultComponentPrefixes="parameter",
defaultComponentName="per",
Documentation(info="<html>
<p>
Fan performance data.
See the documentation of
<a href=\"modelica://Buildings.Fluid.Movers.Data.Fans.Greenheck\">
Buildings.Fluid.Movers.Data.Fans.Greenheck</a>.
</p>
</html>"));
end MfrA6inVersion1;
