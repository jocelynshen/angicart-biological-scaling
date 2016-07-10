% compareRad: script that plots the frequencies for radii from
% the data gathered from the angicart data versus the data from the C++
% code
%HISTORY	
%	Jocie Shen, 7/7/16, first written
%============================================================
clear all; close all; clc;
arr = fillArr(1, 'r', 'angicart', 'C:\Project\Biomathematics\mSrc\angicartdata.txt')
[bins, frequency] = getBinFreq(arr);
bar(bins, frequency, 1, 'r');
title('Comparing radius frequency (angicart vs C++)','fontweight','bold');
hold on;
arr = fillArr(1, 'r', 'C++', 'ttt.txt')
[bins, frequency] = getBinFreq(arr);
bar(bins, frequency, 1);
legend('Angicart','C++','Location','northwest')
xlabel('Radius','fontweight','bold')         % x-axis label
ylabel('Frequency of the Radius','fontweight','bold') % y-axis label

