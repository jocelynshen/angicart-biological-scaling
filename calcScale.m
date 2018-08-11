% calcScale: script that plots all the scaling exponents for radius and
% length, usint the ratio-based method and the regression-based method
%HISTORY	
%	Jocie Shen, 6/23/16, first written
%============================================================
clear all; close all; clc;

%Ratio-based method: Scaling exponent a
subplot(2,2,1);box on; hold on; grid on;
%arr = fillArrAngicart(1, 'r');
arr = fillArr(1, 'r', 'C++', 'ttt.txt');
[bins, frequency] = getBinFreq(arr, 1);
bar(bins, frequency, 1);
title('Ratio-based calculation of a','fontweight','bold');
xlabel('radius scaling exponent a','fontweight','bold')         % x-axis label
ylabel('frequency of the scaling exponent','fontweight','bold') % y-axis label
mean(arr)

%Ratio-based method: Scaling exponent b
subplot(2,2,2);box on; hold on; grid on;
%arr = fillArrAngicart(1, 'l');
arr = fillArr(1, 'l', 'C++', 'ttt.txt');
[bins, frequency] = getBinFreq(arr, 1);
bar(bins, frequency, 1);
title('Ratio-based calculation of b','fontweight','bold');
xlabel('Length scaling exponent b','fontweight','bold')         % x-axis label
ylabel('frequency of the scaling exponent','fontweight','bold') % y-axis label
mean(arr)

%Regression-based method: Scaling exponent a
subplot(2,2,3);box on; hold on; grid on;
%arr = fillArrAngicart(3, 'r');
arr = fillArr(3, 'r', 'C++', 'ttt.txt');
[bins, frequency] = getBinFreq(arr, 3);
bar(bins, frequency, 1);
title('Regression-based calculation of a','fontweight','bold');
xlabel('LOG(radius)','fontweight','bold')         % x-axis label
ylabel('LOG(frequency of the radius)','fontweight','bold') % y-axis label

%Regression-based method: Scaling exponent b
subplot(2,2,4);box on; hold on; grid on;
%arr = fillArrAngicart(3, 'l');
arr = fillArr(3, 'l', 'C++', 'ttt.txt');
[bins, frequency] = getBinFreq(arr, 3);
bar(bins, frequency, 1);
title('Regression-based calculation of b','fontweight','bold');
xlabel('LOG(length)','fontweight','bold')         % x-axis label
ylabel('LOG(frequency of the length)','fontweight','bold') % y-axis label

