function [ bins, frequency ] = getBinFreq( arr)
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
numIntervals = 13;
intervalWidth = (max(arr) - min(arr))/numIntervals;
bins = min(arr):intervalWidth:max(arr);
ncount = histc(arr,bins);
frequency = ncount/length(arr);
end

