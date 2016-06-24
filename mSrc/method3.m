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
% loop through all the ...
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
        rk = A(i,4);
        %rk = A(idx_par,5);
        arr = [arr rk];
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
frequency = log(frequency);
bins = log(bins);
y2 = min(find(frequency == max(frequency)));
bar(bins, frequency, 1);
-1/((max(frequency)-frequency(50))/(bins(y2)-bins(50)))
