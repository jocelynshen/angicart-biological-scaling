% method1 is a matlab script to plot the values of the scaling exponent a,
% their frequencies, and return the mean of this set of scaling exponents
%HISTORY	
%	Jocie Shen, 6/23/16, first written
%============================================================
clear all; close all; clc;

% input data from data file
dataFile = 'ttt.txt';
A = importdata(dataFile);
A = A.data;

arr = []; 						% arr is an array that stores values of a       

for i = 1:length(A)
    %Makes sure a parent exists
    if(~isnan(A(i,6)))
        par  = A(i,6);
        idx_par = find(round(A(:,1))==par);
        rk1 = A(i,4);
        rk = A(idx_par,4);
        a = calcA(rk,rk1);
        if(abs(a) ~= Inf)
            arr = [arr a];
        end
    end
end

a = mean(arr)

%numIntervals = 10;
%intervalWidth = (max(arr)-min(arr))/numIntervals;
%x = min(arr):intervalWidth:max(arr);
%ncount = histc(arr,x);
%relativefreq = ncount/length(arr);
%bar(x-intervalWidth/2, relativefreq, 1)
%xlim([min(x) max(x)]);
%set(gca, 'xtick',x);

bins = logspace(log10(min(arr)), log10(max(arr)));
frequency = [];

for i = 1:50
    count = 0;
    for a = arr
        if i ==50
            count = 1;
        else if a >= bins(i) && a < bins(i+1)
                count = count + 1;
            end
        end
    end
    frequency = [frequency count];
end
figure; box on; hold on; grid on; 
bar(bins, frequency, 1);
title('Ratio-based calculation of a','fontweight','bold');
xlabel('radius scaling exponent a','fontweight','bold') % x-axis label
ylabel('frequency of the scaling exponent','fontweight','bold') % y-axis label


