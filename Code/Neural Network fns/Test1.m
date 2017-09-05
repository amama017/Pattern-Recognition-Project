%Validate the Classifier using 22 image per valid set.
%Training set 21,21,20
Features = Train();

%Validate 1st quarter
TempFeatures = Features(1:64,:);
TempTest = Features(65:86,:);
%Set the Matrix Structure.
[ X, y1, X_test, y_test1 ] = SetMat( TempFeatures, TempTest );
