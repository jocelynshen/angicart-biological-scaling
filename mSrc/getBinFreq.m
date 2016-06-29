function [ bins, frequency ] = getBinFreq( arr)
%UNTITLED Summary of this function goes here
%   Detailed explanation goes here
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

end

