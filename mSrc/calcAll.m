% conservationBased: plots scaling exponents for all four methods
%                    plots scaling exponent vs frequency
%HISTORY	
%	Jocie Shen, 7/11/16, first written
%============================================================
clear all; close all; clc;
cName = 'patient1_c.txt';
aName = 'patient1.txt';

%C++ Conservation-based method: Scaling exponent a
figure('Position', [100, 100, 1024, 1200])

subplot(2,2,1);
arr = fillArr(1, 'r', 'C++', cName);
[bins, frequency] = getBinFreq(arr, 1);
bar(bins, frequency, 1);
title('Conservation-based calculation of a (C++)','fontweight','bold');
xlabel('radius scaling exponent a','fontweight','bold')         % x-axis label
ylabel('Relative frequency','fontweight','bold') % y-axis label
x1 = mean(arr);
y1=get(gca,'ylim');
hold on
plot([x1 x1],y1, 'r-', 'LineWidth', 1);
x2 = median(arr);
y2=get(gca,'ylim');
plot([x2 x2],y2, '-.g', 'LineWidth', 1);
formatSpec = 'N = %4.2f \n';
fprintf(formatSpec,length(arr));
formatSpec = 'a (C++) %4.2f (mean)\n';
fprintf(formatSpec,x1);
[b,bint] = regress(frequency(:), bins(:), 95);
CI = (abs(bint(1)) + abs(bint(2)))/2;
[b,bint,r,rint,stats] = regress(frequency(:),bins(:),95);
formatSpec = 'CI = %4.2f (mean)\n';
fprintf(formatSpec,CI);
formatSpec = 'Standard Dev = %4.2f (mean)\n';
fprintf(formatSpec,std(arr));

%C++ Conservation-based method: Scaling exponent b
subplot(2,2,2);
arr = fillArr(1, 'l', 'C++', cName);
[bins, frequency] = getBinFreq(arr, 1);
bar(bins, frequency, 1);
title('Conservation-based calculation of b (C++)','fontweight','bold');
xlabel('Length scaling exponent b','fontweight','bold')         % x-axis label
ylabel('Relative frequency','fontweight','bold') % y-axis label
x1 = mean(arr);
y1=get(gca,'ylim');
hold on
plot([x1 x1],y1, 'r-', 'LineWidth', 1);
x2 = median(arr);
y2=get(gca,'ylim');
plot([x2 x2],y2, '-.g', 'LineWidth', 1);
formatSpec = 'N = %4.2f \n';
fprintf(formatSpec,length(arr));
formatSpec = 'b (C++) %4.2f (mean)\n';
fprintf(formatSpec,x1);
[b,bint] = regress(frequency(:), bins(:));
CI = (abs(bint(1)) + abs(bint(2)))/2;
[b,bint,r,rint,stats] = regress(frequency(:),bins(:),95);
formatSpec = 'CI = %4.2f (mean)\n';
fprintf(formatSpec,CI);
formatSpec = 'Standard Dev = %4.2f (mean)\n';
fprintf(formatSpec,std(arr));

%ANGICART Conservation-based method: Scaling exponent a
subplot(2,2,3);
arr = fillArr(1, 'r', 'angicart', aName);
[bins, frequency] = getBinFreq(arr, 1);
bar(bins, frequency, 1);
title('Conservation-based calculation of a (angicart)','fontweight','bold');
xlabel('Radius scaling exponent a','fontweight','bold')         % x-axis label
ylabel('Relative frequency','fontweight','bold') % y-axis label
x1 = mean(arr);
y1=get(gca,'ylim');
hold on
plot([x1 x1],y1, 'r-', 'LineWidth', 1);
x2 = median(arr);
y2=get(gca,'ylim');
plot([x2 x2],y2, '-.g', 'LineWidth', 1);
formatSpec = 'N = %4.2f \n';
fprintf(formatSpec,length(arr));
formatSpec = 'a (angicart) %4.2f (mean)\n';
fprintf(formatSpec,x1);
[b,bint] = regress(frequency(:), bins(:));
CI = (abs(bint(1)) + abs(bint(2)))/2;
[b,bint,r,rint,stats] = regress(frequency(:),bins(:),95);
formatSpec = 'CI = %4.2f (mean)\n';
fprintf(formatSpec,CI);
formatSpec = 'Standard Dev = %4.2f (mean)\n';
fprintf(formatSpec,std(arr));

%ANGICART Conservation-based method: Scaling exponent b
subplot(2,2,4);
arr = fillArr(1, 'l', 'angicart', aName);
[bins, frequency] = getBinFreq(arr, 1);
bar(bins, frequency, 1);
title('Conservation-based calculation of b (angicart)','fontweight','bold');
xlabel('Length scaling exponent b','fontweight','bold')         % x-axis label
ylabel('Relative frequency','fontweight','bold') % y-axis label
x1 = mean(arr);
y1=get(gca,'ylim');
hold on
plot([x1 x1],y1, 'r-', 'LineWidth', 1);
x2 = median(arr);
y2=get(gca,'ylim');
plot([x2 x2],y2, '-.g', 'LineWidth', 1);
formatSpec = 'N = %4.2f \n';
fprintf(formatSpec,length(arr));
formatSpec = 'b (angicart) %4.2f (mean)\n';
fprintf(formatSpec,x1);
[b,bint] = regress(frequency(:), bins(:));
CI = (abs(bint(1)) + abs(bint(2)))/2;
[b,bint,r,rint,stats] = regress(frequency(:),bins(:),95);
formatSpec = 'CI = %4.2f (mean)\n';
fprintf(formatSpec,CI);
formatSpec = 'Standard Dev = %4.2f (mean)\n';
fprintf(formatSpec,std(arr));

%Ratio-based method: Scaling exponent a
figure('Position', [100, 100, 1024, 1200])
subplot(2,2,1);
arr = fillArr(2, 'r', 'C++', cName);
[bins, frequency] = getBinFreq(arr, 2);
bar(bins, frequency, 1);
title('Ratio-based calculation of a (C++)','fontweight','bold');
xlabel('Radius scale factor','fontweight','bold')         % x-axis label
ylabel('Relative frequency','fontweight','bold') % y-axis label
x1 = mean(arr);
y1=get(gca,'ylim');
hold on
a1 = plot([x1 x1],y1, 'r-', 'LineWidth', 1);
x2 = median(arr);
y2=get(gca,'ylim');
a2 = plot([x2 x2],y2, '-.g', 'LineWidth', 1);
exp1 = -log(x1)/log(2);
arr1 = -log(arr)/log(2);
arr1 = arr1(abs(arr1) ~= Inf);
formatSpec = 'N = %4.2f (mean)\n';
fprintf(formatSpec,length(arr1))
formatSpec = 'a (C++) %4.2f (mean)\n';
fprintf(formatSpec,exp1)
[b,bint] = regress(frequency(:), bins(:));
CI = (abs(bint(1)) + abs(bint(2)))/2;
[b,bint,r,rint,stats] = regress(frequency(:),bins(:),95);
formatSpec = 'CI = %4.2f (mean)\n';
fprintf(formatSpec,CI);
formatSpec = 'Standard Dev = %4.2f (mean)\n';
fprintf(formatSpec,std(arr));

%Ratio-based method: Scaling exponent b
subplot(2,2,2);
arr = fillArr(2, 'l', 'C++', cName);
[bins, frequency] = getBinFreq(arr, 2);
bar(bins, frequency, 1);
title('Ratio-based calculation of b (C++)','fontweight','bold');
xlabel('Length scale factor','fontweight','bold')         % x-axis label
ylabel('Relative frequency','fontweight','bold') % y-axis label
x1 = mean(arr);
y1=get(gca,'ylim');
hold on
a1 = plot([x1 x1],y1, 'r-', 'LineWidth', 1);
x2 = median(arr);
y2=get(gca,'ylim');
a2 = plot([x2 x2],y2, '-.g', 'LineWidth', 1);
exp1 = -log(x1)/log(2);
arr1 = -log(arr)/log(2);
arr1 = arr1(abs(arr1) ~= Inf);
formatSpec = 'N = %4.2f (mean)\n';
fprintf(formatSpec,length(arr1))
formatSpec = 'b (C++) %4.2f (mean)\n';
fprintf(formatSpec,exp1)
[b,bint] = regress(frequency(:), bins(:));
CI = (abs(bint(1)) + abs(bint(2)))/2;
[b,bint,r,rint,stats] = regress(frequency(:),bins(:),95);
formatSpec = 'CI = %4.2f (mean)\n';
fprintf(formatSpec,CI);
formatSpec = 'Standard Dev = %4.2f (mean)\n';
fprintf(formatSpec,std(arr));

%ANGICART Ratio-based method: Scaling exponent a
subplot(2,2,3);
arr = fillArr(2, 'r', 'angicart', aName);
[bins, frequency] = getBinFreq(arr, 2);
bar(bins, frequency, 1);
title('Ratio-based calculation of a (angicart)','fontweight','bold');
xlabel('Radius scale factor','fontweight','bold')         % x-axis label
ylabel('Relative frequency','fontweight','bold') % y-axis label
x1 = mean(arr);
y1=get(gca,'ylim');
hold on
a1 = plot([x1 x1],y1, 'r-', 'LineWidth', 1);
x2 = median(arr);
y2=get(gca,'ylim');
a2 = plot([x2 x2],y2, '-.g', 'LineWidth', 1);
exp1 = -log(x1)/log(2);
arr1 = -log(arr)/log(2);
arr1 = arr1(abs(arr1) ~= Inf);
formatSpec = 'N = %4.2f (mean)\n';
fprintf(formatSpec,length(arr1))
formatSpec = 'a (angicart) %4.2f (mean)\n';
fprintf(formatSpec,exp1)
[b,bint] = regress(frequency(:), bins(:));
CI = (abs(bint(1)) + abs(bint(2)))/2;
[b,bint,r,rint,stats] = regress(frequency(:),bins(:),95);
formatSpec = 'CI = %4.2f (mean)\n';
fprintf(formatSpec,CI);
formatSpec = 'Standard Dev = %4.2f (mean)\n';
fprintf(formatSpec,std(arr));

%ANGICART Ratio-based method: Scaling exponent b
subplot(2,2,4);
arr = fillArr(2, 'l', 'angicart', aName);
[bins, frequency] = getBinFreq(arr, 2);
bar(bins, frequency, 1);
title('Ratio-based calculation of b (angicart)','fontweight','bold');
xlabel('Length scale factor','fontweight','bold')         % x-axis label
ylabel('Relative frequency','fontweight','bold') % y-axis label
x1 = mean(arr);
y1=get(gca,'ylim');
hold on
a1 = plot([x1 x1],y1, 'r-', 'LineWidth', 1);
x2 = median(arr);
y2=get(gca,'ylim');
a2 = plot([x2 x2],y2, '-.g', 'LineWidth', 1);
exp1 = -log(x1)/log(2);
arr1 = -log(arr)/log(2);
arr1 = arr1(abs(arr1) ~= Inf);
formatSpec = 'N = %4.2f (mean)\n';
fprintf(formatSpec,length(arr1))
formatSpec = 'b (angicart) %4.2f (mean)\n';
fprintf(formatSpec,exp1)
[b,bint] = regress(frequency(:), bins(:));
CI = (abs(bint(1)) + abs(bint(2)))/2;
[b,bint,r,rint,stats] = regress(frequency(:),bins(:),95);
formatSpec = 'CI = %4.2f (mean)\n';
fprintf(formatSpec,CI);
formatSpec = 'Standard Dev = %4.2f (mean)\n';
fprintf(formatSpec,std(arr));

%C++ Distribution-based method: Scaling exponent a
figure('Position', [100, 100, 1024, 1200])
subplot(2,2,1);
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
yresid = frequency - fittedY;
SSresid = sum(yresid.^2);
SStotal = (length(frequency)-1) * var(frequency);
rsq = 1 - SSresid/SStotal;
rsq = rsq*rsq;
formatSpec = 'R2 = %4.2f \n';
fprintf(formatSpec,rsq);

%C++ Distribution-based method: Scaling exponent b
subplot(2,2,2);
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
yresid = frequency - fittedY;
SSresid = sum(yresid.^2);
SStotal = (length(frequency)-1) * var(frequency);
rsq = 1 - SSresid/SStotal;
rsq = rsq*rsq;
formatSpec = 'R2 = %4.2f \n';
fprintf(formatSpec,rsq);


%ANGICART Distribution-based method: Scaling exponent a
subplot(2,2,3);
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
yresid = frequency - fittedY;
SSresid = sum(yresid.^2);
SStotal = (length(frequency)-1) * var(frequency);
rsq = 1 - SSresid/SStotal;
rsq = rsq*rsq;
formatSpec = 'R2 = %4.2f \n';
fprintf(formatSpec,rsq);


%ANGICART Distribution-based method: Scaling exponent b
subplot(2,2,4);
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
yresid = frequency - fittedY;
SSresid = sum(yresid.^2);
SStotal = (length(frequency)-1) * var(frequency);
rsq = 1 - SSresid/SStotal;
rsq = rsq*rsq;
formatSpec = 'R2 = %4.2f \n';
fprintf(formatSpec,rsq);

%C++ Regression-based method: Scaling exponent a
figure('Position', [100, 100, 1024, 1200])
subplot(2,2,1);
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
yresid = frequency - fittedY;
SSresid = sum(yresid.^2);
SStotal = (length(frequency)-1) * var(frequency);
rsq = 1 - SSresid/SStotal;
rsq = rsq*rsq;
formatSpec = 'R2 = %4.2f \n';
fprintf(formatSpec,rsq);

%C++ Regression-based method: Scaling exponent a
subplot(2,2,2);
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
yresid = frequency - fittedY;
SSresid = sum(yresid.^2);
SStotal = (length(frequency)-1) * var(frequency);
rsq = 1 - SSresid/SStotal;
rsq = rsq*rsq;
formatSpec = 'R2 = %4.2f \n';
fprintf(formatSpec,rsq);

%ANGICART Regression-based method: Scaling exponent a
subplot(2,2,3);
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
yresid = frequency - fittedY;
SSresid = sum(yresid.^2);
SStotal = (length(frequency)-1) * var(frequency);
rsq = 1 - SSresid/SStotal;
rsq = rsq*rsq;
formatSpec = 'R2 = %4.2f \n';
fprintf(formatSpec,rsq);

%ANGICART Regression-based method: Scaling exponent b
subplot(2,2,4);
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
yresid = frequency - fittedY;
SSresid = sum(yresid.^2);
SStotal = (length(frequency)-1) * var(frequency);
rsq = 1 - SSresid/SStotal;
rsq = rsq*rsq;
formatSpec = 'R2 = %4.2f \n';
fprintf(formatSpec,rsq);

