function neigbours = NNFc(gridMatrix, neigbours)

gridMatrixSize = size(gridMatrix);

sN = gridMatrixSize(1);

sM = gridMatrixSize(2);

aux = zeros(8,1);

for i = 1:length(neigbours)

    [N, M] = ind2sub(gridMatrixSize,neigbours(i));

    north = N-1;
    east = M-1;
    south = N+1;
    west = M+1;
    
    j = 1;

    if(south <= sN)
        if(gridMatrix(sub2ind(gridMatrixSize,south,M)) == 1)
            aux(j) = sub2ind(gridMatrixSize,south,M);
            j=j+1;
        end
    end
    
    if(west <= sM)
        if(gridMatrix(sub2ind(gridMatrixSize,N,west)) == 1)
            aux(j) = sub2ind(gridMatrixSize,N,west);
            j=j+1;
        end
    end
    
    if(north > 0)
        if(gridMatrix(sub2ind(gridMatrixSize,north,M)) == 1)
            aux(j) = sub2ind(gridMatrixSize,north,M);
            j=j+1;
        end
    end

    if(east > 0)
        if(gridMatrix(sub2ind(gridMatrixSize,N,east)) == 1)
            aux(j) = sub2ind(gridMatrixSize,N,east);
            j=j+1;
        end
    end
    
    if((south <= sN) && (west <= sM))
        if(gridMatrix(sub2ind(gridMatrixSize,south,west)) == 1)
            aux(j) = sub2ind(gridMatrixSize,south,west);
            j=j+1;
        end
    end
    
    if((south <= sN) && (east > 0))
        if(gridMatrix(sub2ind(gridMatrixSize,south,east)) == 1)
            aux(j) = sub2ind(gridMatrixSize,south,east);
            j=j+1;
        end
    end
    
    if((north > 0) && (west <= sM))
        if(gridMatrix(sub2ind(gridMatrixSize,north,west)) == 1)
            aux(j) = sub2ind(gridMatrixSize,north,west);
            j=j+1;
        end
    end
    
    if((north > 0) && (east > 0))
        if(gridMatrix(sub2ind(gridMatrixSize,north,east)) == 1)
            aux(j) = sub2ind(gridMatrixSize,north,east);
            j=j+1;
        end
    end
    
end
    
neigbours = aux(aux>0);

neigbours = unique(neigbours);
    
return

end