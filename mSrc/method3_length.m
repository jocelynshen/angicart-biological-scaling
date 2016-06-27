% method3_length is a matlab script to plot the log of the relative frequencies of the
% log of lengths of vessels from a data set, then calculate the scaling
% exponent, b by finding the slope of between the highest frequency length
% and the lowest frequency length
%HISTORY	
%	Jocie Shen, 6/23/16, first written
%============================================================
clear all; close all; clc;
%import data file
datafile = 'ttt.txt';
A = importdata(datafile);
A = A.data;

arr = [];
for i = 1:114
    if(A(i,6) > 0)
        name = A(i,1);
        vol  = A(i,2);
        len  = A(i,3);
        r1   = A(i,4);
        r2   = A(i,5);
        par  = A(i,6);
        num_child  = A(i,7);
        c1   = A(i,8);
        c2   = A(i,9);
        lk = A(i,3);
        %rk = A(idx_par,5);
        arr = [arr lk];
    end
end
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
for i = 1:length(bins)
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
frequency = log(frequency);
bins = log(bins);
y2 = min(find(frequency == max(frequency)));
bar(bins, frequency, 1);
title('Regression-based calculation of b');
xlabel('ln(length)') % x-axis label
ylabel('ln(frequency of the length)') % y-axis label
x = [bins(y2) bins(50)];
y = [max(frequency) frequency(50)];
hold on;
plot(x,y);
-1/((max(frequency)-frequency(50))/(bins(y2)-bins(50)))
