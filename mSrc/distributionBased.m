% distributionBased: plots all distribution-based scaling exponents
%                    plots ln(radius or length) vs ln(frequency)
%HISTORY	
%	Jocie Shen, 7/11/16, first written
%============================================================
clear all; close all; clc;

%C++ Distribution-based method: Scaling exponent a
figure
arr = fillArr(3, 'r', 'C++', 'ttt.txt');
[bins, frequency] = getBinFreq(arr, 3);
scatter(bins, frequency);
title('Distribution-based calculation of a (C++)','fontweight','bold');
xlabel('ln(radius)','fontweight','bold')         % x-axis label
ylabel('ln(relative frequency)','fontweight','bold') % y-axis label
coeffs = polyfit(bins, frequency, 1);
fittedX = linspace(min(bins), max(bins), length(frequency));
fittedY = polyval(coeffs, fittedX);
hold on;
plot(fittedX, fittedY, 'r-', 'LineWidth', 1);
exp = -1/coeffs(1);
formatSpec = 'a (C++) %4.2f\n';
fprintf(formatSpec,exp);
yresid = frequency - fittedY;
SSresid = sum(yresid.^2);
SStotal = (length(frequency)-1) * var(frequency);
rsq = 1 - SSresid/SStotal;
formatSpec = 'R2 = %4.2f \n';
fprintf(formatSpec,rsq);

%C++ Distribution-based method: Scaling exponent b
figure
arr = fillArr(3, 'l', 'C++', 'ttt.txt');
[bins, frequency] = getBinFreq(arr, 3);
scatter(bins, frequency);
title('Distribution-based calculation of b (C++)','fontweight','bold');
xlabel('ln(length)','fontweight','bold')         % x-axis label
ylabel('ln(relative frequency)','fontweight','bold') % y-axis label
coeffs = polyfit(bins, frequency, 1);
fittedX = linspace(min(bins), max(bins), length(frequency));
fittedY = polyval(coeffs, fittedX);
hold on;
plot(fittedX, fittedY, 'r-', 'LineWidth', 1);
exp = -1/coeffs(1);
formatSpec = 'b (C++) %4.2f\n';
fprintf(formatSpec,exp);
yresid = frequency - fittedY;
SSresid = sum(yresid.^2);
SStotal = (length(frequency)-1) * var(frequency);
rsq = 1 - SSresid/SStotal;
formatSpec = 'R2 = %4.2f \n';
fprintf(formatSpec,rsq);


%ANGICART Distribution-based method: Scaling exponent a
figure
arr = fillArr(3, 'r', 'angicart', 'mouselungs.txt');
[bins, frequency] = getBinFreq(arr, 3);
scatter(bins, frequency);
title('Distribution-based calculation of a (angicart)','fontweight','bold');
xlabel('ln(radius)','fontweight','bold')         % x-axis label
ylabel('ln(relative frequency)','fontweight','bold') % y-axis label
coeffs = polyfit(bins, frequency, 1);
fittedX = linspace(min(bins), max(bins), length(frequency));
fittedY = polyval(coeffs, fittedX);
hold on;
plot(fittedX, fittedY, 'r-', 'LineWidth', 1);
exp = -1/coeffs(1);
formatSpec = 'a (angicart) %4.2f\n';
fprintf(formatSpec,exp);
yresid = frequency - fittedY;
SSresid = sum(yresid.^2);
SStotal = (length(frequency)-1) * var(frequency);
rsq = 1 - SSresid/SStotal;
formatSpec = 'R2 = %4.2f \n';
fprintf(formatSpec,rsq);

%ANGICART Distribution-based method: Scaling exponent b
figure
arr = fillArr(3, 'l', 'angicart', 'mouselungs.txt');
[bins, frequency] = getBinFreq(arr, 3);
scatter(bins, frequency);
title('Distribution-based calculation of b (angicart)','fontweight','bold');
xlabel('ln(length)','fontweight','bold')         % x-axis label
ylabel('ln(relative frequency)','fontweight','bold') % y-axis label
coeffs = polyfit(bins, frequency, 1);
fittedX = linspace(min(bins), max(bins), length(frequency));
fittedY = polyval(coeffs, fittedX);
hold on;
plot(fittedX, fittedY, 'r-', 'LineWidth', 1);
exp = -1/coeffs(1);
formatSpec = 'b (angicart) %4.2f\n';
fprintf(formatSpec,exp);
yresid = frequency - fittedY;
SSresid = sum(yresid.^2);
SStotal = (length(frequency)-1) * var(frequency);
rsq = 1 - SSresid/SStotal;
formatSpec = 'R2 = %4.2f \n';
fprintf(formatSpec,rsq);

