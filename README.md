# Drone-ACO-ACPP
Drone-ACO-ACPP ia an open-source and novel approach for Path Planning to enhance UAV data collection for fruit detection in crops trained in vertical trellis, for instance, woody crops such as vineyards. The novelty of the proposed method consists on considering the biophysical environment of the field and being able to fly multiple UAVs at the same time considering a safety distance between them. The optimization algorithm utilized is the Ant Colony Optimization (ACO). 

## How to run the code?
The Drone-ACO-ACPP software is programmed in MATLAB (The MathWorks Inc., Massachussets). The whole code can be run through the main script (MMAS.m). However, the other two scripts (NNFc.m and NNS.m) need to be run to be able to execute the main script. 
MMAS.m incorporates the initial overview of the field, along with the constraints or areas above which the UAV is not allowed to fly. Those areas are previously defined thanks to a prior nadir flight, which considers the Canopy Height Model (CHM) and the identified obstacles around the field. 

*The Cities and ACPP parameters of the MMAS.m script should be modified in order to properly run the code for your own field. 

## Which modifications are required?
The following table summarizes the required modifications to implement the Drone-ACO-ACPP for your own study case. A description of each variable is provided. 

| Variable                 | Description                                                                        
| ------------------------ | ---------------------------------------------------------------------------------- 
| cities          | Visualization of the field through a grid composed by X and Y elements. Each element a1, a2, a3, b1... should be given a coordinate within the field in the format [X, Y]. For instance, [1,1] or [3,1].  |                                                  
| rows                   | Number of rows within the predefined grid. It should be the maximum value of X within [X, Y]. |                                                    
| columns                 | Number of columns within the predefined grid. It should be the maximum value of Y within [X, Y].  |
| SttPotGlI        | Position(s) above which the UAV will start designing the path. In case there is more than one value, the algorithm will design a path for each individual UAV. The sum of the individual paths will cover the whole field. |
| rho                    | Pheromone evaporation rate. It should be between 0 and 1.  |

## Outputs
There software outputs three results: (1) the Route to be followed, (2) metrics' graphs such as the cost per the number of iterations, the minimum interation cost per number of iterations, and the mean cost per number of iterations, and (3) the pheromones graph for the designed path. An example of the outputs is shown in the Figure below. Moreover, it includes three scenarios regarding the route to be followed, considering one, two, and three UAVs flying synchronously. 

![GitHub](https://github.com/saidlab-team/Drone-ACO-ACPP/assets/59556308/5e516aa5-ff20-454e-973e-4075c0803aa0)

## Available dataset
A [dataset](https://doi.org/10.1016/j.dib.2022.108876) including multispectral UAV imagery over a vineyard is provided to generate the orthomosaic, Digital Surface Model (DSM), Digital Terrain Model (DTM), and Canopy Height Model (CHM) and obtain insights on the biophysical characteristics of the field, that will be helpful to select the Forbidden areas. 

## Citation
Drone-ACO-ACPP - An open-source approach to enhance fruit detection through a Path Planning design based on the biophysical environment of the field. saidlab-team/Drone-ACO-ACPP Github Page 2023, https://github.com/saidlab-team/Drone-ACO-ACPP
