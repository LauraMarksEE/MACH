function [Anew,Error]=solveFD(A,muN,Core)


if Core.Ideal
   % Only solve the air-gap and the air surrounding the core.
   % Core remains unchanged from initial conditions
   [Anew,Error]=solve_air_only(A,muN,Core);
   
else
   % Solve the whole problem: core + air    
   [Anew,Error]=solve_whole_core(A,muN,Core);   
end
