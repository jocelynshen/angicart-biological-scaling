function name(method)
%UNTITLED Summary of this function goes here
%   Detailed explanation goes here
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
end

