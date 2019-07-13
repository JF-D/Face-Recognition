function [ hist ] = clac_Hist(region)
%CLAC_HIST clac the histogram of the region
%   ...
[m, n] = size(region);
hist = uint8(zeros(59, 1));
for x = 1:m
    for y = 1:n
        hist(region(x, y)+1) = hist(region(x, y)+1) + 1;
    end
end
end

