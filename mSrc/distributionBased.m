% distributionBased: plots all distribution-based scaling exponents
%                    plots ln(radius or length) vs ln(frequency)
%HISTORY	
%	Jocie Shen, 7/11/16, first written
%============================================================
clear all; close all; clc;
cName = 'patient3_c.txt';
aName = 'patient3.txt';

%C++ Distribution-based method: Scaling exponent a
figure
arr = fillArr(3, 'r', 'C++', cName);
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
[b,bint] = regress(frequency(:), bins(:));
CI = (abs(bint(1)) + abs(bint(2)))/2;
[b,bint,r,rint,stats] = regress(frequency(:),bins(:),95);
exp = -1/b;
formatSpec = 'N = %4.2f\n';
fprintf(formatSpec,length(bins));
formatSpec = 'a (C++) %4.2f\n';
fprintf(formatSpec,exp);
formatSpec = 'CI = %4.2f\n';
fprintf(formatSpec,CI);
rsq = stats(1);
formatSpec = 'R^2 = %4.2f\n';
fprintf(formatSpec,rsq);




%C++ Distribution-based method: Scaling exponent b
figure
arr = fillArr(3, 'l', 'C++', cName);
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
[b,bint] = regress(frequency(:), bins(:));
CI = (abs(bint(1)) + abs(bint(2)))/2;
[b,bint,r,rint,stats] = regress(frequency(:),bins(:),95);
exp = -1/b;
formatSpec = 'N = %4.2f\n';
fprintf(formatSpec,length(bins));
formatSpec = 'a (C++) %4.2f\n';
fprintf(formatSpec,exp);
formatSpec = 'CI = %4.2f\n';
fprintf(formatSpec,CI);
rsq = stats(1);
formatSpec = 'R^2 = %4.2f\n';
fprintf(formatSpec,rsq);



%ANGICART Distribution-based method: Scaling exponent a
figure
arr = fillArr(3, 'r', 'angicart', aName);
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
[b,bint] = regress(frequency(:), bins(:));
CI = (abs(bint(1)) + abs(bint(2)))/2;
[b,bint,r,rint,stats] = regress(frequency(:),bins(:),95);
exp = -1/b;
formatSpec = 'N = %4.2f\n';
fprintf(formatSpec,length(bins));
formatSpec = 'a (C++) %4.2f\n';
fprintf(formatSpec,exp);
formatSpec = 'CI = %4.2f\n';
fprintf(formatSpec,CI);
rsq = stats(1);
formatSpec = 'R^2 = %4.2f\n';
fprintf(formatSpec,rsq);


%ANGICART Distribution-based method: Scaling exponent b
figure
arr = fillArr(3, 'l', 'angicart', aName);
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
[b,bint] = regress(frequency(:), bins(:));
CI = (abs(bint(1)) + abs(bint(2)))/2;
[b,bint,r,rint,stats] = regress(frequency(:),bins(:),95);
exp = -1/b;
formatSpec = 'N = %4.2f\n';
fprintf(formatSpec,length(bins));
formatSpec = 'a (C++) %4.2f\n';
fprintf(formatSpec,exp);
formatSpec = 'CI = %4.2f\n';
fprintf(formatSpec,CI);
rsq = stats(1);
formatSpec = 'R^2 = %4.2f\n';
fprintf(formatSpec,rsq);

