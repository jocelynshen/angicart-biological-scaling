function a = calcA(rk, rk1)
a = -log10(rk1/rk)/(log10(2));
%calcA: function that calculates the scaling exponent
%SYNOPSIS
% a = calcA(rk, rk1)
%
%INPUT:
% rk:    radius or length of the parent vessel
% rk1:   radius or length of the child vessel
%
%OUTPUT:
%  a:   scaling exponent
%	
%DESCRIPTION
%	calcA uses the ratio-based method to determine the scaling exponents, a
%	and b
%
%EXAMPLES
% rk = 0.2
% rk1 = 0.1
% a = calcA(rk, rk1)
%
%HISTORY	
%	Jocie Shen, 6/23/16, first written
%============================================================
end