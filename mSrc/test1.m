numberOfRolls = 1e7;
numberOfPairsOfDice = 5;
randomIntegers = randi(6, [numberOfRolls, numberOfPairsOfDice * 2]);
SumOf5PairsOfDice = sum(randomIntegers, 2); % Sum across columns
minSum = min(SumOf5PairsOfDice)
maxSum = max(SumOf5PairsOfDice)
numberOfBins = maxSum - minSum + 1
[counts binCenters] = hist(SumOf5PairsOfDice, numberOfBins); % No loop over i needed.
counts = counts / sum(counts);
bar(binCenters, counts, 'BarWidth', 1);
grid on;
% Enlarge figure to full screen.
set(gcf, 'units','normalized','outerposition',[0 0 1 1]);