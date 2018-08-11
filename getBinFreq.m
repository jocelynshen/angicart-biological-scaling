function [ bins, frequency ] = getBinFreq(arr, method)
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
 numIntervals = 20;
 frequency = [];
 bins = [];
if(method == 1 | method ==2)
    intervalWidth = (max(arr) - min(arr))/numIntervals;
    bins = min(arr):intervalWidth:max(arr);
    ncount = histc(arr,bins);
    frequency = ncount/length(arr);
elseif(method ==3)
	intervalWidth = (max(arr) - min(arr))/numIntervals;
	bins = min(arr):intervalWidth:max(arr);
	ncount = histc(arr,bins);
 	frequency1 = ncount/length(arr);
	bins = log(bins);
    frequency = log(frequency1);
	infVal = find(abs(frequency(:)) == Inf);
    for idx = 1:length(infVal)
        bins(infVal(idx)) = [];
        infVal = infVal - 1;
    end
	frequency = frequency(abs(frequency) ~= Inf);
else
    for idx = 1:length(arr)
        if(mod(idx,2) ~= 0)
            frequency = [frequency arr(idx)];
        else
            bins = [bins arr(idx)];
        end
    end
    infVal = find(abs(frequency(:)) == Inf);
    for idx = 1:length(infVal)
        bins(infVal(idx)) = [];
        infVal = infVal - 1;
    end
	frequency = frequency(abs(frequency) ~= Inf);
end
end

