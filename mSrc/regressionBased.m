% regressionBased: plots all regression-based scaling exponents
%                  plots ln(Number of endpoints) vs ln(radius or length)
%HISTORY	
%	Jocie Shen, 7/11/16, first written
%============================================================
clear all; close all; clc;

%ANGICART Regression-based method: Scaling exponent a
figure
arr = fillArr(4, 'r', 'angicart', 'mouselungs.txt');
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
exp = coeffs(1);
formatSpec = 'a (angicart) %4.2f\n';
fprintf(formatSpec,exp);
yresid = frequency - fittedY;
SSresid = sum(yresid.^2);
SStotal = (length(frequency)-1) * var(frequency);
rsq = 1 - SSresid/SStotal;
formatSpec = 'R2 = %4.2f \n';
fprintf(formatSpec,rsq);

%ANGICART Regression-based method: Scaling exponent b
figure
arr = fillArr(4, 'l', 'angicart', 'mouselungs.txt');
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
exp = coeffs(1);
formatSpec = 'b (angicart) %4.2f\n';
fprintf(formatSpec,exp);
yresid = frequency - fittedY;
SSresid = sum(yresid.^2);
SStotal = (length(frequency)-1) * var(frequency);
rsq = 1 - SSresid/SStotal;
formatSpec = 'R2 = %4.2f \n';
fprintf(formatSpec,rsq);

