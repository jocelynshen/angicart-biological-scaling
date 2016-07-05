function c = line2strcell(line)
%line2strcell: clean a line read from a file and convert it into a string cell array
%SYNOPSIS
% line2strcell(line)
%
%INPUT:
% line:  a string line
%
%OUTPUT:
%  c:   output strcell array
%	
%DESCRIPTION
%	line2strcell remove whitespace and extra special characters and convert the line
% into a string cell array
%
%EXAMPLES
%  line = 'name	 vol 	 len 	 r_vl 	 r_obs 	 par	 num_child	 children'
%  c = line2strcell(line) 
%
%HISTORY	
%	Jocie Shen, 7/5/16, first written
%============================================================

c = strsplit(strtrim(line),{'\n','\t',' '});
