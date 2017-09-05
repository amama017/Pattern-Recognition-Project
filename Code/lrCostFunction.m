function [J, grad] = lrCostFunction(theta, X, y, lambda)
%LRCOSTFUNCTION Compute cost and gradient for logistic regression with 
%regularization
%   J = LRCOSTFUNCTION(theta, X, y, lambda) computes the cost of using
%   theta as the parameter for regularized logistic regression and the
%   gradient of the cost w.r.t. to the parameters. 
% =============================================================
m = length(y); % number of training examples

% compute cost function 
z = X * theta;
hx = sigmoid(z);
J = ((1/m) * sum((-y' * log(hx)) - ((1 - y)' * log(1 - hx))));
% add regularization
J = J + ((lambda/(2*m)) * sum(theta(2:end).^2));

% compute the gradient
grad = (1/m) * X' * (sigmoid(X * theta) - y);
temp = theta;
temp(1) = 0;
grad = grad + (lambda/m) .* temp;
grad = grad(:);
% =============================================================
end