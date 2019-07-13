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

for i = 1:ntest
    if(y_pred(i) ~= y(i))
        fprintf('%d %d %d\n', i, y(i), y_pred(i));
    end
end
14 1 3
128 10 35
150 11 3
190 15 8
195 16 9
202 16 20
214 17 20
326 25 24
393 30 27
412 31 3
439 33 20
442 33 37
444 33 8
462 35 20
466 35 32
477 36 12
487 36 2
500 37 32
513 38 32

dis = zeros(ntrain, 1);
for j = 1:ntrain
    dis(j) = sum(min(Xtrain(j, :), X(14, :)));
end
[~, idx] = sort(dis, 'descend');
candidates = ylabel(idx(1:k));
%y_pred(i) = mode(candidates);