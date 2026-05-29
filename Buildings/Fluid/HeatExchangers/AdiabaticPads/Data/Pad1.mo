within Buildings.Fluid.HeatExchangers.AdiabaticPads.Data;
record Pad1 "Fan data for Greenheck 12 BIDW fan"
  extends Buildings.Fluid.HeatExchangers.AdiabaticPads.Data.Generic(
    efficiency(v={0.941802252816019,1.41392017800028,1.88603810318454,2.36058962592129,
          2.82784035600056,3.30239187873731,3.77450980392156,4.17118620497844},
        eta={2684.68468468468,2671.17117117117,2536.03603603603,2186.93693693693,
          1698.19819819819,1191.44144144144,581.081081081081,0}));

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
end Pad1;
