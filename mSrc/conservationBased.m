% conservationBased: plots all conservation-based scaling exponents
%                    plots scaling exponent vs frequency
%HISTORY	
%	Jocie Shen, 7/11/16, first written
%============================================================
clear all; close all; clc;

%C++ Conservation-based method: Scaling exponent a
figure
arr = fillArr(1, 'r', 'C++', 'ttt.txt');
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
legend('Relative frequency','mean', 'median');
formatSpec = 'a (C++) %4.2f (mean)\n';
fprintf(formatSpec,x1);
formatSpec = 'a (C++) %4.2f (median)\n';
fprintf(formatSpec,x2);
formatSpec = 'N = %4.2f \n';
fprintf(formatSpec,length(arr));


%C++ Conservation-based method: Scaling exponent b
figure
arr = fillArr(1, 'l', 'C++', 'ttt.txt');
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
legend('Relative frequency','mean', 'median');
formatSpec = 'b (C++) %4.2f (mean)\n';
fprintf(formatSpec,x1);
formatSpec = 'b (C++) %4.2f (median)\n';
fprintf(formatSpec,x2);
formatSpec = 'N = %4.2f \n';
fprintf(formatSpec,length(arr));

%ANGICART Conservation-based method: Scaling exponent a
figure
arr = fillArr(1, 'r', 'angicart', 'patient2.txt');
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
legend('Relative frequency','mean', 'median');
formatSpec = 'a (angicart) %4.2f (mean)\n';
fprintf(formatSpec,x1);
formatSpec = 'a (angicart) %4.2f (median)\n';
fprintf(formatSpec,x2);
formatSpec = 'N = %4.2f \n';
fprintf(formatSpec,length(arr));

%ANGICART Conservation-based method: Scaling exponent b
figure
arr = fillArr(1, 'l', 'angicart', 'patient2.txt');
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
legend('Relative frequency','mean', 'median');
formatSpec = 'b (angicart) %4.2f (mean)\n';
fprintf(formatSpec,x1);
formatSpec = 'b (angicart) %4.2f (median)\n';
fprintf(formatSpec,x2);
formatSpec = 'N = %4.2f \n';
fprintf(formatSpec,length(arr));

