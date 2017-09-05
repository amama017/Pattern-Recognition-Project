%Run the System on 132 image(Test Set) with Training 86 image per class
%(Training Set).

%Initialize Some Variables
fno = 132;
C = 1.5;
T_angle = 130;
Sig = 7.6;
Hi = 0.35;
Low = 0;
Endpiont = 0;
Gap_size = 1;

%Train 86 Image (Training Set).
Features = Train();

%Extract Test Images Features
TestFeatures = zeros(fno,2);
for i = 1:fno
    %Read Image.
    I = imread(['Test/',mat2str(i),'.bmp']);
    %initialize Feature vector.
    temp = zeros(2,1);
    %Get mean of Vertical & Horizontal ends feature.
    temp(1) = (Horiz(I)+Vertic(I))/2;
    %Get Corner ends feature.
    Ic = corner(double(I),C,T_angle,Sig,Hi,Low,Endpiont,Gap_size);
    temp(2) = size(Ic,1);
    %Save Features.
    TestFeatures(i,:) = temp;
end;

%Set the Matrix Structure.
[ X, y ] = SetMat( Features, Features );
X = mapFeature(X(:, 1), X(:, 2));
TestFeatures = mapFeature(TestFeatures(:, 1), TestFeatures(:, 2));

%Train on the Training Set
lambda = 0.1;
num_labels = 3;
[all_theta] = oneVsAll(X, y, num_labels, lambda);

%Predict the result
PredTest = predictOneVsAll(all_theta, TestFeatures);

%Print Results in file.
fid = fopen('result.txt','wt');
fprintf(fid,'%d\n',PredTest);
fclose(fid);