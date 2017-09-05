function [ Max_Bound ] = Vertic( Image )
%Max vote of number of Vertical ends

%Get Indexes of the White Pixels
[r c] = find(Image);
%Get columns to scan
c_uni = unique(c);
%Initialize bound.
bound = zeros(size(c_uni));

%count number of ends (Vertically)
for i = 1:size(c_uni,1)
    ind_uni = find(c == c_uni(i));
    r_uni = r(ind_uni);
    if(size(r_uni,1) == 1)
        %if column has only one pixel
        bound(i) = 2;
        continue;
    end;
    r_uni = r_uni - ones(size(r_uni))*r_uni(1);
    bound(i) = 2;
    for j = 2:size(r_uni)
        %check if the step is one pixel
        temp = r_uni(j) - r_uni(j-1);
        if(temp ~= 1)
            bound(i) = bound(i) + 2;
        end;
    end;
end;

%Get frequent number of edges
Max_Bound = mode(bound);

end