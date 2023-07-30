function [Tour, TourLength] = NNS(Points, forbiddenPointsI, startP)

% Length before identifying the forbidden zones
pointsL = length(Points);

% Check forbidden points
aux = 1:pointsL;
aux(forbiddenPointsI) = nan;
Points = Points(~isnan(aux),:);

% Length before identifying the forbidden zones
pointsL = length(Points);

% Initial point
r = startP;

Index = 1;

Tour = zeros(pointsL,2);
TourI = zeros(1,pointsL);

Tour(Index, 1:end) = Points(r,:);
TourI(Index) = r;

P = 1:pointsL;

while(~isempty(P))
        
    startPi = TourI(Index);
    
    startPc = Points(startPi,:);
    
    P = P(P ~= startPi);
    
    startPcMatrix = repmat(startPc,size(Points,1),1);
    
    d = sqrt(sum(((startPcMatrix-Points).^2), 2));  
    d(TourI(TourI>0)) = nan;                        % Make the already visited neighbours useless
    d(d==0) = nan;                                  % Make the actual neighbour useless (d = 0)
    
    [minDist, minDistInd] = min(d);
        
    Index = Index + 1;
    
    Tour(Index,:) = Points(minDistInd,:);
    TourI(Index) = minDistInd;
    
    P = P(P~=minDistInd);
    
end
 
TourLength = lengthFc(TourI, TourI, Points);

Tour = [Tour; Tour(1,:)];

end

