%% read train data and gen LBP descriptor
fprintf('deal with train data\n');
ylabel = textread('train_label.txt', '%d');
lines = textread('recognition_train.txt', '%s');
[ntrain, ~] = size(lines);
Xtrain = uint8(zeros(ntrain, 29736));
for i = 1:ntrain
    img = imread(['CroppedYale/', lines{i}]);
    h = LBP(img);
    Xtrain(i, :) = h(:);
end

save trainLBP Xtrain ntrain