function a = line2numarray(line)
%line2numarray: clean a line read from a file and convert it into a numerical array
%SYNOPSIS
% line2strcell(line)
%
%INPUT:
% line:  a string line
%
%OUTPUT:
%  a:   output number array
%	
%DESCRIPTION
%	line2numarray remove whitespace and extra special characters and convert the
% resulting cell array into a numeric array
%
%EXAMPLES
%  line = '85.001	1278.77	102.227	1.99544	2.97947	nan	2	78.001	84.001'
%  a = line2numarray(line) 
%
%HISTORY	
%	Jocie Shen, 7/5/16, first written
%============================================================

c = strsplit(strtrim(line),{'\n','\t',' '});
a = str2double(c);
