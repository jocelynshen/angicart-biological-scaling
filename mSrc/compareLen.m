% compareLen: script that plots the frequencies for length from
% the data gathered from the angicart data versus the data from the C++
% code
%HISTORY	
%	Jocie Shen, 7/7/16, first written
%============================================================
clear all; close all; clc;
arr = fillArr(1, 'l', 'angicart', 'C:\Project\Biomathematics\mSrc\angicartdata.txt')
[bins, frequency] = getBinFreq(arr);
bar(bins, frequency, 1, 'r');
title('Comparing Length Frequency (angicart vs C++)','fontweight','bold');
hold on;
arr = fillArr(1, 'l', 'C++', 'ttt.txt')
[bins, frequency] = getBinFreq(arr);
bar(bins, frequency, 1);
legend('Angicart','C++','Location','northwest')
xlabel('Radius','fontweight','bold')         % x-axis label
ylabel('Frequency of the Length','fontweight','bold') % y-axis label

