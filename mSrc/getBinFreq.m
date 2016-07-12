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
 numIntervals = 13;
if(method == 1)
    intervalWidth = (max(arr) - min(arr))/numIntervals;
    bins = min(arr):intervalWidth:max(arr);
    ncount = histc(arr,bins);
    frequency = ncount/length(arr);
else
	bins = logspace(log10(min(arr)), log10(max(arr)), numIntervals);
    ncount = histc(log(arr),bins);
    frequency = log(ncount/length(arr));
    idx = 0;
    for ind = 1:length(frequency)
        if(frequency(ind) == 0)
            idx = ind + 1;
            break;
        end
    end
    bins = bins(1:idx)
end
end

