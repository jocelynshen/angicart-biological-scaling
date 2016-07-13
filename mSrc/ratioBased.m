% ratioBased: plots all ratio-based scaling exponents
%                   plots scale factor vs relative frequency
%HISTORY	
%	Jocie Shen, 7/11/16, first written
%============================================================
clear all; close all; clc;

%Ratio-based method: Scaling exponent a
figure
arr = fillArr(2, 'r', 'C++', 'ttt.txt');
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
legend('Relative frequency','mean', 'median');
exp1 = -log(x1)/log(2);
exp2 = -log(x2)/log(2);
formatSpec = 'a (C++) %4.2f (mean)\n';
fprintf(formatSpec,exp1)
formatSpec = 'a (C++) %4.2f (median)\n';
fprintf(formatSpec,exp2)
N = length(arr)

%Ratio-based method: Scaling exponent b
figure
arr = fillArr(2, 'l', 'C++', 'ttt.txt');
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
legend('Relative frequency','mean', 'median');
exp1 = -log(x1)/log(2);
exp2 = -log(x2)/log(2);
formatSpec = 'b (C++) %4.2f (mean)\n';
fprintf(formatSpec,exp1)
formatSpec = 'b (C++) %4.2f (median)\n';
fprintf(formatSpec,exp2)
N = length(arr)


%ANGICART Ratio-based method: Scaling exponent a
figure
arr = fillArr(2, 'r', 'angicart', 'angicartdata.txt');
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
legend('Relative frequency','mean', 'median');
exp1 = -log(x1)/log(2);
exp2 = -log(x2)/log(2);
formatSpec = 'a (angicart) %4.2f (mean)\n';
fprintf(formatSpec,exp1)
formatSpec = 'a (angicart) %4.2f (median)\n';
fprintf(formatSpec,exp2)
N = length(arr)

%ANGICART Ratio-based method: Scaling exponent b
figure
arr = fillArr(2, 'l', 'angicart', 'angicartdata.txt');
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
legend('Relative frequency','mean', 'median');
exp1 = -log(x1)/log(2);
exp2 = -log(x2)/log(2);
formatSpec = 'b (angicart) %4.2f (mean)\n';
fprintf(formatSpec,exp1)
formatSpec = 'b (angicart) %4.2f (median)\n';
fprintf(formatSpec,exp2)
N = length(arr)


