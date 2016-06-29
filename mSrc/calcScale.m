% calcScale: script that plots all the scaling exponents for radius and
% length, usint the ratio-based method and the regression-based method
%HISTORY	
%	Jocie Shen, 6/23/16, first written
%============================================================
clear all; close all; clc;

%Ratio-based method: Scaling exponent a
subplot(2,2,1);box on; hold on; grid on;
arr = fillArr(1, 'r');
[bins, frequency] = getBinFreq(arr);
bar(bins, frequency, 1);
title('Ratio-based calculation of a','fontweight','bold');
xlabel('radius scaling exponent a','fontweight','bold')         % x-axis label
ylabel('frequency of the scaling exponent','fontweight','bold') % y-axis label

%Ratio-based method: Scaling exponent b
subplot(2,2,2);box on; hold on; grid on;
arr = fillArr(1, 'l');
[bins, frequency] = getBinFreq(arr);
bar(bins, frequency, 1);
title('Ratio-based calculation of b','fontweight','bold');
xlabel('Length scaling exponent b','fontweight','bold')         % x-axis label
ylabel('frequency of the scaling exponent','fontweight','bold') % y-axis label

%Regression-based method: Scaling exponent a
subplot(2,2,3);box on; hold on; grid on;
arr = fillArr(3, 'r');
[bins, frequency] = getBinFreq(arr);
bar(bins, frequency, 1);
title('Regression-based calculation of a');
xlabel('LOG(radius)') % x-axis label
ylabel('LOG(frequency of the radius)') % y-axis label
y2 = min(find(frequency == max(frequency)));
x = [bins(y2) bins(50)];
y = [max(frequency) frequency(50)];
hold on;
plot(x,y);

%Regression-based method: Scaling exponent a
subplot(2,2,4);box on; hold on; grid on;
arr = fillArr(3, 'l');
[bins, frequency] = getBinFreq(arr);
bar(bins, frequency, 1);
title('Regression-based calculation of a');
xlabel('LOG(length)') % x-axis label
ylabel('LOG(frequency of the length)') % y-axis label
y2 = min(find(frequency == max(frequency)));
x = [bins(y2) bins(50)];
y = [max(frequency) frequency(50)];
hold on;
plot(x,y);
