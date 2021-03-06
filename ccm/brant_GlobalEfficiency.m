function [eff_global, eff_nodal] = brant_GlobalEfficiency(gBin)

dist = graphallshortestpaths(sparse(gBin), 'Directed', false);

eff_mat = 1./ dist;
eff_mat(~isfinite(eff_mat)) = 0;
eff_nodal = sum(eff_mat, 2) / (size(eff_mat, 1) - 1);
eff_global = mean(eff_nodal);
