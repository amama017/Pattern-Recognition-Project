function [ Features ] = Train()
%Train the Training Set

%Initialize set of variables.
fno = 86;
Features = cell(fno,3);
str = cell(3,1);
str(1) = {'Line/line'};
str(2) = {'Diamond/dia'};
str(3) = {'Ellipse/ellipse'};
C = 1.5;
T_angle = 130;
Sig = 7.6;
Hi = 0.35;
Low = 0;
Endpiont = 0;
Gap_size = 1;

%Loop on all Types.
for i = 1:3
    %Loop on all Images in this Type.
    for j = 1:fno
        %Read Image.
        I = imread([cell2mat(str(i)),mat2str(j),'.bmp']);
        %initialize Feature vector.
        temp = zeros(2,1);
        %Get mean of Vertical & Horizontal ends feature.
        temp(1) = (Horiz(I)+Vertic(I))/2;
        %Get Corner ends feature.
        Ic = corner(double(I),C,T_angle,Sig,Hi,Low,Endpiont,Gap_size);
        temp(2) = size(Ic,1);
        %Save Features in Cell Matrix.
        Features(j,i) = {temp};
    end;
end;

end
