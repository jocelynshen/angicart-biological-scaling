method = 3;
type = 'l';
arr = fillArr(method);

bins = logspace(log10(min(arr)), log10(max(arr)));
frequency = [];

for i = 1:length(bins)
    count = 0;
    for a = arr
        if i ==50
            count = 1;
        else if a >= bins(i) && a < bins(i+1)
                count = count + 1;
            end
        end
    end
    frequency = [frequency count];
end

figure; box on; hold on; grid on; 
bar(bins, frequency, 1);

if(method == 3)
    y2 = min(find(frequency == max(frequency)));
    x = [bins(y2) bins(50)];
    y = [max(frequency) frequency(50)];
    hold on;
    plot(x,y);
end
if(method == 1)
    if(type == 'r')
        title('Ratio-based calculation of a','fontweight','bold');
    xlabel('radius scaling exponent a','fontweight','bold')         % x-axis label
    ylabel('frequency of the scaling exponent','fontweight','bold') % y-axis label
    end
    if(type == 'l')
        title('Ratio-based calculation of b','fontweight','bold');
    xlabel('Length scaling exponent b','fontweight','bold')         % x-axis label
    ylabel('frequency of the scaling exponent','fontweight','bold') % y-axis label
    end
end
if(method == 3)
    if(type == 'r')
        title('Regression-based calculation of a');
xlabel('LOG(radius)') % x-axis label
ylabel('LOG(frequency of the radius)') % y-axis label
    end
    if(type == 'l')
       title('Regression-based calculation of a');
xlabel('LOG(length)') % x-axis label
ylabel('LOG(frequency of the length)') % y-axis label
    end
end