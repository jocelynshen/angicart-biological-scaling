% calcScale: script that plots all the scaling exponents for radius and
% length, usint the ratio-based method and the regression-based method
%HISTORY	
%	Jocie Shen, 6/23/16, first written
%============================================================
clear all; close all; clc;

%Distribution-based method: Scaling exponent a
figure
arr = fillArr(3, 'r', 'C++', 'ttt.txt');
[bins, frequency] = getBinFreq(arr, 3);
scatter(bins, frequency);
title('Regression-based calculation of a (C++)','fontweight','bold');
xlabel('ln(radius)','fontweight','bold')         % x-axis label
ylabel('ln(relative frequency)','fontweight','bold') % y-axis label
coeffs = polyfit(bins, frequency, 1)
-1/coeffs(1)
% Get fitted values
fittedX = linspace(min(bins), max(bins), length(frequency));
fittedY = polyval(coeffs, fittedX);
yresid = frequency - fittedY;
SSresid = sum(yresid.^2);
SStotal = (length(frequency)-1) * var(frequency);
rsq = 1 - SSresid/SStotal
% Plot the fitted line
hold on;
plot(fittedX, fittedY, 'r-', 'LineWidth', 1);


%Distribution-based method: Scaling exponent b
figure
arr = fillArr(3, 'l', 'C++', 'ttt.txt');
[bins, frequency] = getBinFreq(arr, 3);
scatter(bins, frequency);
title('Regression-based calculation of b (C++)','fontweight','bold');
xlabel('LOG(length)','fontweight','bold')         % x-axis label
ylabel('LOG(frequency of the length)','fontweight','bold') % y-axis label
coeffs = polyfit(bins, frequency, 1);
-1/coeffs(1)
% Get fitted values
fittedX = linspace(min(bins), max(bins), length(frequency));
fittedY = polyval(coeffs, fittedX);
yresid = frequency - fittedY;
SSresid = sum(yresid.^2);
SStotal = (length(frequency)-1) * var(frequency);
rsq = 1 - SSresid/SStotal
% Plot the fitted line
hold on;
plot(fittedX, fittedY, 'r-', 'LineWidth', 1);


%Distribution-based method: Scaling exponent a
figure
arr = fillArr(3, 'r', 'angicart', 'angicartdata.txt');
[bins, frequency] = getBinFreq(arr, 3);
scatter(bins, frequency);
title('Regression-based calculation of a (angicart)','fontweight','bold');
xlabel('ln(radius)','fontweight','bold')         % x-axis label
ylabel('ln(relative frequency)','fontweight','bold') % y-axis label
coeffs = polyfit(bins, frequency, 1);
-1/coeffs(1)
% Get fitted values
fittedX = linspace(min(bins), max(bins), length(frequency));
fittedY = polyval(coeffs, fittedX);
yresid = frequency - fittedY;
SSresid = sum(yresid.^2);
SStotal = (length(frequency)-1) * var(frequency);
rsq = 1 - SSresid/SStotal
% Plot the fitted line
hold on;
plot(fittedX, fittedY, 'r-', 'LineWidth', 1);

%Distribution-based method: Scaling exponent b
figure
arr = fillArr(3, 'l', 'angicart', 'angicartdata.txt');
[bins, frequency] = getBinFreq(arr, 3);
scatter(bins, frequency);
title('Regression-based calculation of b (angicart)','fontweight','bold');
xlabel('LOG(length)','fontweight','bold')         % x-axis label
ylabel('LOG(frequency of the length)','fontweight','bold') % y-axis label
coeffs = polyfit(bins, frequency, 1);
-1/coeffs(1)
% Get fitted values
fittedX = linspace(min(bins), max(bins), length(frequency));
fittedY = polyval(coeffs, fittedX);
yresid = frequency - fittedY;
SSresid = sum(yresid.^2);
SStotal = (length(frequency)-1) * var(frequency);
rsq = 1 - SSresid/SStotal
% Plot the fitted line
hold on;
plot(fittedX, fittedY, 'r-', 'LineWidth', 1);

