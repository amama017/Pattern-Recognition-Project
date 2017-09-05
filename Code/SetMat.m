function [ X, y, X_test, y_test ] = SetMat( TempFeatures, TempTest )
%Set the Martices for the Classifier

%Set the Training Matrix Structure.
X_temp = cell2mat(TempFeatures(:,1));
X1 = [X_temp(1:2:end) X_temp(2:2:end)];
X_temp = cell2mat(TempFeatures(:,2));
X2 = [X_temp(1:2:end) X_temp(2:2:end)];
X_temp = cell2mat(TempFeatures(:,3));
X3 = [X_temp(1:2:end) X_temp(2:2:end)];
X = [X1; X2; X3];

%Set the Output Matrix Structure
o = ones(size(X1,1),1);
y = [o; 2*o; 3*o];

%Set the Validation Matrix Structure
X_temp = cell2mat(TempTest(:,1));
X1 = [X_temp(1:2:end) X_temp(2:2:end)];
X_temp = cell2mat(TempTest(:,2));
X2 = [X_temp(1:2:end) X_temp(2:2:end)];
X_temp = cell2mat(TempTest(:,3));
X3 = [X_temp(1:2:end) X_temp(2:2:end)];
X_test = [X1; X2; X3];

%Set the Validation Output Matrix Structure
o = ones(size(X1,1),1);
y_test = [o; 2*o; 3*o];

end