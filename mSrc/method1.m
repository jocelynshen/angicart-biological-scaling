% method1 is a matlab script to plot the values of the scaling exponent a,
% their frequencies, and return the mean of this set of scaling exponents
%HISTORY	
%	Jocie Shen, 6/23/16, first written
%============================================================
clear all; close all; clc;

% input data from data file
dataFile = '../data/ttt.txt';
A = importdata(dataFile);
A = A.data;

arr = []; 						% arr is an array that stores values of a
nRows = size(A,1)             

% iLast = findLastRow(A);
iLast = 114;
for i = 1:iLast
    %Makes sure a parent exists
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
        idx_par = find(round(A(:,1))==par);
        rk1 = A(i,4);
        %rk1 = A(i,5);
        rk = A(idx_par,4);
        %rk = A(idx_par,5);
        a = calcA(rk,rk1);
        if(a < 20)                %prevent values of infinity
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
xlabel('LOG_1_0(radius)','fontweight','bold') % x-axis label
ylabel('frequency of the radius','fontweight','bold') % y-axis label


