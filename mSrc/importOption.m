function [ name, len, rad, parent ] = importOption(software, datafile)
%getBinFreq: function that creates the bins and the frequency to plot the
%scaling exponents
%
%INPUT:
% arr: array containing the scaling exponents
%
%OUTPUT:
%  bins
%  frequency: frequency that each variable occurs
%
%EXAMPLES
% [bins, frequency] = getBinFreq(arr);
%
%HISTORY	
%	Jocie Shen, 6/23/16, first written
%============================================================
if(strcmp(software, 'C++'))
    A = importdata(datafile);
    A = A.data;
    name   = num2cell(A(:,1));
    len    = num2cell(A(:,3));
    rad    = num2cell(A(:,5));
    parent = num2cell(A(:,6));
else
    dataPath=[datafile];
    [alldataStructure]=tdfread(dataPath, 'tab');
    name   = cellstr(alldataStructure.name);
    len    = num2cell(alldataStructure.len);
	rad    = num2cell(alldataStructure.rad);
	parent = cellstr(alldataStructure.parent);
end
end

