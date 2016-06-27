function a = calcA(rk, rk1)
%COMMENT
%1. for every file you would like to write enough info about the history and background of the file
%2. if you follow certain format, matlab can also display the info when you type "help calcA"
%3. a good template is given here
%
% calcA ... 1 sentence summary
%
%SYNOPSIS
% a = calcA(rk, rk1)
%
%INPUT:
% rk:    ... 
% rk1:    ... 
%
%OUTPUT:
%  a:   ...
%	
%DESCRIPTION
%	calcA ...
%
%EXAMPLES
% rk = ...
% rk1 = ...
% a = calcA(rk, rk1)
%
%NOTE
%
%HISTORY	
%	Jocie Shen, 6/23/16, first written
%============================================================
a = log(rk1/rk)/(log(2));
end