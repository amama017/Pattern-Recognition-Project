%Validate the Classifier using 22 image per valid set.
%Training set 21,21,20
Features = Train();

%Validate 1st quarter
TempFeatures = Features(1:64,:);
TempTest = Features(65:86,:);
%Set the Matrix Structure.
[ X, y1, X_test, y_test1 ] = SetMat( TempFeatures, TempTest );
%Classify the Data
[PTrain1, PTest1] = LR(X, y1, X_test, y_test1);

%Validate 2nd quarter
TempFeatures = Features([1:42 65:86],:);
TempTest = Features(43:64,:);
%Set the Matrix Structure.
[ X, y2, X_test, y_test2 ] = SetMat( TempFeatures, TempTest );
%Classify the Data
[PTrain2, PTest2] = LR(X, y2, X_test, y_test2);

%Validate 3rd quarter
TempFeatures = Features([1:21 44:86],:);
TempTest = Features(22:43,:);
%Set the Matrix Structure.
[ X, y3, X_test, y_test3 ] = SetMat( TempFeatures, TempTest );
%Classify the Data
[PTrain3, PTest3] = LR(X, y3, X_test, y_test3);

%Validate 4th quarter
TempFeatures = Features(23:86,:);
TempTest = Features(1:22,:);
%Set the Matrix Structure.
[ X, y4, X_test, y_test4 ] = SetMat( TempFeatures, TempTest );
%Classify the Data
[PTrain4, PTest4] = LR(X, y4, X_test, y_test4);