function [ res ] = PatternsTable()
%FORMTABLE hash 256 patterns into 58 uniform/1 non-uniform patterns
% ...

res = uint8(zeros(256, 1));
num = 0;
for i = 0:255
    hop  = 0;
    last = bitand(1, bitshift(i, -7));
    for j = -6:0
        cur = bitand(1, bitshift(i, j));
        if(cur ~= last)
            hop = hop + 1;
        end
        last = cur;
    end
    if(hop <= 2)
        num = num + 1;
        res(i+1) = num;
    end
end

end

