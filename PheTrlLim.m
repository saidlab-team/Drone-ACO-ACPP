function tLimits = PheTrlLim(bsTourLength, rho, avg, n)

nRobots = length(avg); 

tLimits = cell(1,nRobots);

for k=1:nRobots
    
    tau_max = 1 / (rho * bsTourLength);
    
    tau_min = ( tau_max * ( 1 - ( (0.05)^(1/n) ) ) ) / ( ( avg(k) - 1) - ( (0.05)^(1/n) ) );
    
    tLimits{k} = [tau_min tau_max];
    
end

end

