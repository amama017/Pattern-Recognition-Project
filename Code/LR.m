function [ PredTrain, PredTest ] = LR( X, y, X_test, y_test )
%LR Summary of this function goes here
%   Detailed explanation goes here

%Apply logistic regression
X = mapFeature(X(:, 1), X(:, 2));
X_test = mapFeature(X_test(:, 1), X_test(:, 2));
lambda = 0.1;
num_labels = 3;
[all_theta] = oneVsAll(X, y, num_labels, lambda);
%Predict the result
PredTrain = predictOneVsAll(all_theta, X);
PredTest = predictOneVsAll(all_theta, X_test);
fprintf('\nTraining Set Accuracy: %f\n', mean(double(PredTrain == y)) * 100);
fprintf('\nValidation Set Accuracy: %f\n', mean(double(PredTest == y_test)) * 100);

end
