% R. R. Rhinehart, Automated steady and transient state identification in 
% noisy processes, in Proceedings of the American Control Conference, 2013, 
% no. June 2013, pp. 4477–4493.
%
% Section V

function R = CalculateR_N(x, N)

R = zeros(length(x),1);

if N > length(x)
    N = length(x);
end

k = 1;

while 1
    from = k;
    to = from+N-1; 
    
    if to > length(x)
        break;
    end
    
    sum1 = 0;
    sum2 = 0;
    sum3 = 0;
    
    for i = from:to
      sum1 = sum1 + x(i)^2;
      sum2 = sum2 + x(i);
      sum3 = sum3 + (x(i+1)-x(i))^2;
    end
    
    R(from:to,1) = 0.5 * (sum1-sum2^2/N)/sum3;  % Eq. 15

    k = k+N;
end