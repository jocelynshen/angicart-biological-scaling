% ratioBased: plots all ratio-based scaling exponents
%HISTORY	
%	Jocie Shen, 6/23/16, first written
%============================================================
clear all; close all; clc;

%Ratio-based method: Scaling exponent a
figure
arr = fillArr(1, 'r', 'C++', 'ttt.txt');
[bins, frequency] = getBinFreq(arr, 1);
bar(bins, frequency, 1);
title('Ratio-based calculation of a (C++)','fontweight','bold');
xlabel('radius scaling exponent a','fontweight','bold')         % x-axis label
ylabel('frequency of the scaling exponent','fontweight','bold') % y-axis label
mean(arr)

%Ratio-based method: Scaling exponent b
figure
arr = fillArr(1, 'l', 'C++', 'ttt.txt');
[bins, frequency] = getBinFreq(arr, 1);
bar(bins, frequency, 1);
title('Ratio-based calculation of b (C++)','fontweight','bold');
xlabel('Length scaling exponent b','fontweight','bold')         % x-axis label
ylabel('frequency of the scaling exponent','fontweight','bold') % y-axis label
mean(arr)

%Ratio-based method: Scaling exponent a
figure
arr = fillArr(1, 'r', 'angicart', 'angicartdata.txt');
[bins, frequency] = getBinFreq(arr, 1);
bar(bins, frequency, 1);
title('Ratio-based calculation of a','fontweight','bold');
xlabel('radius scaling exponent a (angicart)','fontweight','bold')         % x-axis label
ylabel('frequency of the scaling exponent','fontweight','bold') % y-axis label
mean(arr)

%Ratio-based method: Scaling exponent b
%arr = fillArrAngicart(1, 'l');
figure
arr = fillArr(1, 'l', 'angicart', 'angicartdata.txt');
[bins, frequency] = getBinFreq(arr, 1);
bar(bins, frequency, 1);
title('Ratio-based calculation of b (angicart)','fontweight','bold');
xlabel('Length scaling exponent b','fontweight','bold')         % x-axis label
ylabel('frequency of the scaling exponent','fontweight','bold') % y-axis label
mean(arr)


