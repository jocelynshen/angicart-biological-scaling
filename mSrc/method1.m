% A = importdata('summary_withRoots.tsv');
clear all; close all; clc;

% COMMENT
% -- write file history and notes in the beginning, refer to example in calcA.m
% -- in general, it is not a good practice to hard code values
%    the code loses generality
% -- you also want to convert script into function somewhere down
%    the road, define a variable helps you with that
% A = importdata('ttt.txt');
dataFile = '../data/ttt.txt';
A = importdata(dataFile);
A = A.data;

%COMMENT:  -- use comment line or space line to make code more readable
arr = [];

nRows = size(A,1) %rows 2-124
% loop through all the ...
% COMMENT -- again, the fixed value of 114 is kind of odd here
for i = 1:114
    %COMMENT: since you have a if logic here, normally
    % you would like to write some comments here about the logics
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
        a = abs(calcA(rk,rk1));
        if(a < 20)
          arr = [arr a];
        end
    end
end
% COMMENT Matlab has lots of interval functions to similar tasks
% -- a general advice is reuse existing code rather than rewrite 
% -- also whenever possible, do vector (array ) operation instead of looping 
%    since matlab is optimized toward vector operation
% -- check mean function for what you want to do here
sum = 0;
for i = 1:length(arr)
    sum = sum + arr(i);
end
a = sum/length(arr)

%numIntervals = 10;
%intervalWidth = (max(arr)-min(arr))/numIntervals;
%x = min(arr):intervalWidth:max(arr);
%ncount = histc(arr,x);
%relativefreq = ncount/length(arr);
%bar(x-intervalWidth/2, relativefreq, 1)
%xlim([min(x) max(x)]);
%set(gca, 'xtick',x);

% COMMENT, again, add a comment at main coding section
% also why the hard coded value 50
% also try to avoid using i,j. It works but there are two potential issues
% 1. i, j by default is the complex number in matlab
% 2. always good to have a variable name more readable, say iCol, iCount, instead of i
bins = logspace(log10(min(arr)), log10(max(arr)));
frequency = [];
%COMMENT again try to avoid nested looping, see if you can use matlab "find" function to do 
% what you want to do here ...
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
%COMMENT> it is a good habit to generate a complete, readable plot
% meaning use xlabed, ylabel, title, grid, legend, ...
% and help bar to see if you can make the plot look better
figure; box on; hold on; grid on; 
bar(bins, frequency, 1);
xlabel('LOG_1_0(xxxx)','fontweight','bold');
ylabel('xxxx','fontweight','bold');
title('xxxx','fontweight','bold')
