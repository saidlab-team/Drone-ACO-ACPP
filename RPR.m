function [maxProb,maxProbI] = RPR(cityI, CitiesI, Cities, pheromones, alpha, beta)

% Number of neighbour cities
nCities = length(CitiesI);

city = bsxfun(@times,Cities(cityI,:),ones(nCities,2));

% Distance from city to Cities    
d = (sum(((city-Cities).^2), 2)).^0.5; 

% Heuristic value
n = 1 ./ d;

% Get rid off Inf values VERIFICAR SI ISTO E PRECISO TAR AQUI
n(cityI) = nan;

% n and d must have the same matrix size
n = n';

den = ( nansum( ( pheromones.^alpha ) .* ( n.^beta ) ) );

% Probability which the actual ant goes from city -> Cities
num = ( ( pheromones .^ alpha ) .* ( n .^ beta ) );

p = num ./ den;

maxProb = nanmax(p);

% Check equal probrabilities
maxProbI = find(p == maxProb);

% Choose the next city with max. prob. randomly
if(~isempty(maxProbI))
    maxProbI = maxProbI(randi(length(maxProbI),1));
end

end
