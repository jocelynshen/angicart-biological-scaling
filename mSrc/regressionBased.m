% regressionBased: plots all regression-based scaling exponents
%                  plots ln(Number of endpoints) vs ln(radius or length)
%HISTORY	
%	Jocie Shen, 7/11/16, first written
%============================================================
clear all; close all; clc;
cName = 'patient3_c.txt'
aName = 'patient3.txt'

%C++ Regression-based method: Scaling exponent a
figure
arr = fillArr(4, 'r', 'C++', cName);
[bins, frequency] = getBinFreq(arr, 4);
scatter(bins, frequency);
title('Regression-based calculation of a (C++)','fontweight','bold');
xlabel('ln(Number of endpoints)','fontweight','bold')         % x-axis label
ylabel('ln(radius)','fontweight','bold') % y-axis label
coeffs = polyfit(bins, frequency, 1);
fittedX = linspace(min(bins), max(bins), length(frequency));
fittedY = polyval(coeffs, fittedX);
hold on;
plot(fittedX, fittedY, 'r-', 'LineWidth', 1);
[b,bint] = regress(frequency(:), bins(:));
CI = (abs(bint(1)) + abs(bint(2)))/2;
[b,bint,r,rint,stats] = regress(frequency(:),bins(:),95);
exp = b;
formatSpec = 'N = %4.2f\n';
fprintf(formatSpec,length(bins));
formatSpec = 'a (C++) %4.2f\n';
fprintf(formatSpec,exp);
formatSpec = 'CI = %4.2f\n';
fprintf(formatSpec,CI);
rsq = stats(1);
formatSpec = 'R^2 = %4.2f\n';
fprintf(formatSpec,rsq);

%C++ Regression-based method: Scaling exponent a
figure
arr = fillArr(4, 'l', 'C++', cName);
[bins, frequency] = getBinFreq(arr, 4);
scatter(bins, frequency);
title('Regression-based calculation of a (C++)','fontweight','bold');
xlabel('ln(Number of endpoints)','fontweight','bold')         % x-axis label
ylabel('ln(radius)','fontweight','bold') % y-axis label
coeffs = polyfit(bins, frequency, 1);
fittedX = linspace(min(bins), max(bins), length(frequency));
fittedY = polyval(coeffs, fittedX);
hold on;
plot(fittedX, fittedY, 'r-', 'LineWidth', 1);
[b,bint] = regress(frequency(:), bins(:));
CI = (abs(bint(1)) + abs(bint(2)))/2;
[b,bint,r,rint,stats] = regress(frequency(:),bins(:),95);
exp = b;
formatSpec = 'N = %4.2f\n';
fprintf(formatSpec,length(bins));
formatSpec = 'a (C++) %4.2f\n';
fprintf(formatSpec,exp);
formatSpec = 'CI = %4.2f\n';
fprintf(formatSpec,CI);
rsq = stats(1);
formatSpec = 'R^2 = %4.2f\n';
fprintf(formatSpec,rsq);

%ANGICART Regression-based method: Scaling exponent a
figure
arr = fillArr(4, 'r', 'angicart', aName);
[bins, frequency] = getBinFreq(arr, 4);
scatter(bins, frequency);
title('Regression-based calculation of a (angicart)','fontweight','bold');
xlabel('ln(Number of endpoints)','fontweight','bold')         % x-axis label
ylabel('ln(radius)','fontweight','bold') % y-axis label
coeffs = polyfit(bins, frequency, 1);
fittedX = linspace(min(bins), max(bins), length(frequency));
fittedY = polyval(coeffs, fittedX);
hold on;
plot(fittedX, fittedY, 'r-', 'LineWidth', 1);
[b,bint] = regress(frequency(:), bins(:));
CI = (abs(bint(1)) + abs(bint(2)))/2;
[b,bint,r,rint,stats] = regress(frequency(:),bins(:),95);
exp = b;
formatSpec = 'N = %4.2f\n';
fprintf(formatSpec,length(bins));
formatSpec = 'a (C++) %4.2f\n';
fprintf(formatSpec,exp);
formatSpec = 'CI = %4.2f\n';
fprintf(formatSpec,CI);
rsq = stats(1);
formatSpec = 'R^2 = %4.2f\n';
fprintf(formatSpec,rsq);

%ANGICART Regression-based method: Scaling exponent b
figure
arr = fillArr(4, 'l', 'angicart', aName);
[bins, frequency] = getBinFreq(arr, 4);
scatter(bins, frequency);
title('Regression-based calculation of b (angicart)','fontweight','bold');
xlabel('ln(Number of endpoints)','fontweight','bold')         % x-axis label
ylabel('ln(length)','fontweight','bold') % y-axis label
coeffs = polyfit(bins, frequency, 1);
fittedX = linspace(min(bins), max(bins), length(frequency));
fittedY = polyval(coeffs, fittedX);
hold on;
plot(fittedX, fittedY, 'r-', 'LineWidth', 1);
[b,bint] = regress(frequency(:), bins(:));
CI = (abs(bint(1)) + abs(bint(2)))/2;
[b,bint,r,rint,stats] = regress(frequency(:),bins(:),95);
exp = b;
formatSpec = 'N = %4.2f\n';
fprintf(formatSpec,length(bins));
formatSpec = 'a (C++) %4.2f\n';
fprintf(formatSpec,exp);
formatSpec = 'CI = %4.2f\n';
fprintf(formatSpec,CI);
rsq = stats(1);
formatSpec = 'R^2 = %4.2f\n';
fprintf(formatSpec,rsq);

