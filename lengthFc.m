function l = lengthFc(cityI, CitiesI, Cities)

nCities = length(Cities);

TourCoordinates = Cities(CitiesI,:);

shfTourCoordinates = circshift(Cities(cityI,:), nCities-1);

Tourlength = sqrt( sum( ( TourCoordinates - shfTourCoordinates).^2, 2 ) );

l = sum( Tourlength(1:end) );

end


