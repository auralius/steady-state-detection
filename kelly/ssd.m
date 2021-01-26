% R. R. Rhinehart, Automated steady and transient state identification in
% noisy processes, in Proceedings of the American Control Conference, 2013,
% no. June 2013, pp. 4477–4493.
%
% Section V

function P = ssd(x, n, t_crit)

P = zeros(length(x),1);

if n > length(x)
    n = length(x);
end

k = 1;
should_break = 0;
while 1 
    from = k;
    to = from + n - 1; 
    
    if to > length(x)
        to = length(x);
        n = to -from  + 1;
        should_break = 1;
    end
    
    x_active = x(from:to);
   
    % By first differencing xt it is possible to unbiasedly1 estimate the slope
    % m of the drift component mt as the arithmetic average of xt − xt−1 with
    % n sampled values of xt in the window which areequally spaced in time
    % i.e., given a uniform sampling period or cycle.
    m = 0;
    for t = 2 : n
        m = m + (x_active(t)-x_active(t-1));
    end
    m = m/n;
    
    % eq. 3
    mu = (sum(x_active) - sum(1:n)*m)/n;
    
    % eq. 4
    sd = 0;
    for t = 1 : n
        sd = sd + (x_active(t) - m*t-mu)^2;
    end
    sd = sqrt(sd/(n-2));
    
    % eq. 5
    y = 0;
    for t = 1 : n
        if abs(x_active(t)-mu) <= t_crit * sd
            y = y + 1;
        end
    end
    y = y/n;
    
    P(from:to,1) = y;
    
    if should_break == 1
        break;
    end
    
    k = k + n;
end

end