function l = distanceFc(paths,Cities,i)

[m nRobots] = size(paths);

TourCoordinates = cell(1,nRobots);

d = 0;

for k = 1:nRobots-1
    
    TourCoordinates{k} = Cities(paths{k}(i,:),:);
    
    TourCoordinates{k+1} = Cities(paths{k+1}(i,:),:);
    
    d = abs( d - sqrt( sum( ( TourCoordinates{k} - TourCoordinates{k+1}).^2, 2 ) ) );
    
end

l = length( find( d <= sqrt(2) ) );

end