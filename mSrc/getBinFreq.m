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
    N = sum(ncount);
 	frequency1 = ncount/length(arr);
	bins = log(bins);
    frequency = log(frequency1);
	infVal = find(abs(frequency(:)) == Inf);
    for idx = 1:length(infVal)
        N = N - exp(frequency(idx))*length(arr);
        bins(idx) = [];
    end
	frequency = frequency(abs(frequency) ~= Inf);
    formatSpec = 'N = %4.2f \n';
    fprintf(formatSpec,N);
    CI = tinv(1-(.05/2),N-2)*std(arr)/sqrt(length(arr));
    formatSpec = 'CI = %4.2f \n';
    fprintf(formatSpec,CI);
else
    for idx = 1:length(arr)
        if(mod(idx,2) ~= 0)
            frequency = [frequency arr(idx)];
        else
            bins = [bins arr(idx)];
        end
    end
    
end
end

