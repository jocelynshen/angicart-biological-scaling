% A = importdata('summary_withRoots.tsv');
clear all; close all; clc;
A = importdata('ttt.txt');
A = A.data;
% A = A.textdata;
% B = A.data;
% A{1,1} = 'name';
% A{1,2} = 'vol';
% A{1,3} = 'len';
% A{1,4} = '<r>_vl';
% A{1,5} = '<r>_obs';
arr = [];
nRows = size(A,1) %rows 2-124
% loop through all the ...
for i = 1:113
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
        a = (calcA(rk,rk1));
        if(a < 20)
          arr = [arr a];
        end
    end
end
sum = 0;
for i = 1:length(arr)
    sum = sum + arr(i);
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
bar(bins, frequency, 1);
title('Ratio-based calculation of a');
xlabel('radius') % x-axis label
ylabel('frequency of the radius') % y-axis label
a = sum/length(arr)
