% R. R. Rhinehart, Automated steady and transient state identification in 
% noisy processes, in Proceedings of the American Control Conference, 2013, 
% no. June 2013, pp. 4477–4493.
%
% Section II

function R = CalculateR(x, l1, l2, l3)

N = length(x);

cl1 = 1 - l1;
cl2 = 1 - l2;
cl3 = 1 - l3;

xf = 0; 
nu2f = 0;
delta2f = 0;
measurement_old = 0;

R = zeros(N,1);

for i = 1:N
   measurement = x(i);
   nu2f = l2 * (measurement - xf) ^ 2 + cl2 * nu2f;
   xf = l1 * measurement + cl1 * xf;
   delta2f = l3 * (measurement - measurement_old) ^ 2 + cl3 * delta2f; 
   measurement_old = measurement;
   
   R(i) = (2 - l1) * nu2f / delta2f;
end

end