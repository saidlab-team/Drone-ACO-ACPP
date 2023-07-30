
%mSz = [5 5];

% ind_pt = [20];
% 
% [row, col] = ind2sub(mSz, ind_pt);

%LC = [1 1; 3 3; 5 5; 1 5];

%LC2XY_(LC, mSz)



function XY = LC2XY(LC, sz)

X = LC(:,2);

Y = sz(1).*ones(length(LC(:,1)),1) - ( LC(:,1) - ones(length(LC(:,1)),1) );

XY = [X Y];

return

end





