function output = UniformDistribution(n)
    a = 0;
    b = 100;

    randomNumbers = (a + (b - a) * rand(1,n));

    randomNumbers = round(randomNumbers);
    output = randomNumbers;
end
