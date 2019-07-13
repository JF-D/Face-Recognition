function [ lbp_h ] = LBP(img)
%LBP extract LBP histogram of input img
%   img is divided into 8*8 cell, each img has 24*21 cells, local LBP is computed in P = 8, R = 1.
[m, n] = size(img);
P = 8;
R = 1;
table = PatternsTable();
feature = uint8(zeros(m, n));
neighbor = uint8(zeros(8, 1));
for y = 1+R:n-R
    for x = 1+R:m-R
        center = img(x, y);
        neighbor(8) = img(x-1, y-1) >= center;
        neighbor(7) = img(x-1, y  ) >= center;
        neighbor(6) = img(x-1, y+1) >= center;
        neighbor(5) = img(x  , y+1) >= center;
        neighbor(4) = img(x+1, y+1) >= center;
        neighbor(3) = img(x+1, y  ) >= center;
        neighbor(2) = img(x+1, y-1) >= center;
        neighbor(1) = img(x  , y-1) >= center;
        patt = 0;
        for k = 1:8
            patt = patt + neighbor(k) * bitshift(1, k-1);
        end
        feature(x, y) = table(patt+1);
    end
end

H = 8;
W = 8;
hist = uint8(zeros((m/H)*(n/W), 59));
id = 1;
for x = 1:H:m
    for y = 1:W:n
        region = feature(x:x+H-1, y:y+W-1);
        hist(id, :) = clac_Hist(region);
        id = id + 1;
    end
end
hist = hist';
lbp_h = hist(:);
end

