function output = generateRandomNumber(choice,n)
    
    randomNumbers = [];
    
    switch choice
        case 1
            % Use Linear Congruential Generator (LCG)
            randomNumbers = LinearCongruentialGenerators(n); 
        case 2
            % Use Random Variate Generator for Exponential Distribution
            randomNumbers = ExponentialDistribution(n);
        case 3
            % Use Random Variate Generator for Uniform Distribution
            randomNumbers = UniformDistribution(n); 
        case 4
            % Use Freemat built-in rand() function
            randomNumbers = randFunction(n);
        otherwise
            error('Invalid choice. Please choose a valid option.');
    end;
    
    output = randomNumbers;
end
