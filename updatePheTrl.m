function pheromonesMemory = updatePheTrl(pheromonesMemory, bTourLengths, TourArcs, rho, tLimits)

for k = 1:length(TourArcs)
    
    % Evaporation
    pheromonesMemory{k} = (1 - rho) .* pheromonesMemory{k};
    pheromonesMemoryI = find(pheromonesMemory{k} > 0);
    
    tau_min = tLimits{k}(1);
    tau_max = tLimits{k}(2);
    
    % Update the pheromone matrix
    for i=1:length(pheromonesMemoryI)
        
        % Current arc index
        tauIndex = pheromonesMemoryI(i);
        
        % Current arc row and col
        [arcN,arcM] = ind2sub(size(pheromonesMemory{k}),tauIndex);
        
        % Current arc pheromone value
        tau = pheromonesMemory{k}(arcN,arcM);
        
        % Find out if this arc belongs to the best tour
        [tauN,tauM] = find(TourArcs{k} == tauIndex);
        
        % Amount of pheromone
        if(isempty(tauN))
            delta = 0;
            
            tau = tau + delta;
            
        else
            C = bTourLengths;
            
            delta = 1 / C;
            
            tau = tau + delta;
            
            if(tau > tau_max)
                tau = tau_max;
            elseif(tau < tau_min)
                tau = tau_min;
            end      
            
        end
        
        % Update the pheromone matrix
        pheromonesMemory{k}(arcN,arcM) = tau;
        pheromonesMemory{k}(arcM,arcN) = tau; % TSP symmetric
        
    end
    
end

end