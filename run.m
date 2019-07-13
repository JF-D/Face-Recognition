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

%% read test data and gen LBP descriptor
fprintf('deal with test data\n');
y = textread('test_label.txt', '%d');
lines = textread('recognition_test.txt', '%s');
[ntest, ~] = size(lines);
X = uint8(zeros(ntest, 29736));
for i = 1:ntest
    img = imread(['CroppedYale/', lines{i}]);
    h = LBP(img);
    X(i, :) = h(:);
end

%% KNN gen result
fprintf('KNN\n');
k = 1;
y_pred = zeros(ntest, 1);
for i = 1:ntest
    dis = zeros(ntrain, 1);
    for j = 1:ntrain
        dis(j) = sum(min(Xtrain(j, :), X(i, :)));
    end
    [~, idx] = sort(dis, 'descend');
    candidates = ylabel(idx(1:k));
    y_pred(i) = mode(candidates);
end


%% acc
acc = sum(y_pred == y) / ntest;
fprintf('accuracy: %f\n', acc);
    
