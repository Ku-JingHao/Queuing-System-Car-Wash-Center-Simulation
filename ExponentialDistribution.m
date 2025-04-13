function output = ExponentialDistribution(n)
    lambda = 3;  %Example we set it as 3
    exp_samples = ceil(-log(1 - rand(1, n)) / lambda * 100);
    output = max(1, min(exp_samples, 100));  % Clamp values to the range [1, 100]
end
