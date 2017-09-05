function [ Max_Bound ] = Horiz( Image )
%Max vote of number of Horizontal ends

%Get Indexes of the White Pixels
[r c] = find(Image);
%Get rows to scan
r_uni = unique(r);
%Initialize bound.
bound = zeros(size(r_uni));

%count number of ends (Horizontaly)
for i = 1:size(r_uni,1)
    ind_uni = find(r == r_uni(i));
    c_uni = c(ind_uni);
    if(size(c_uni,1) == 1)
        %if row has only one pixel
        bound(i) = 2;
        continue;
    end;
    c_uni = c_uni - ones(size(c_uni))*c_uni(1);
    bound(i) = 2;
    for j = 2:size(c_uni)
        %check if the setp is one pixel
        temp = c_uni(j) - c_uni(j-1);
        if(temp ~= 1)
            bound(i) = bound(i) + 2;
        end;
    end;
end;

%Get frequent number of edges
Max_Bound = mode(bound);

end
