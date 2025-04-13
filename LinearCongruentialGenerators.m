function output = LinearCongruentialGenerators(n) 
    randomNumbers=[];
    a = ceil(100 * rand); % Randomly generate an integer between 1 and 100 for 'a'
    c = ceil(100 * rand); % Randomly generate an integer between 1 and 100 for 'c'
    x = ceil(100 * rand); % Randomly generate an integer between 1 and 100 for 'x'
    
    for (i=1:n)
        remainder = mod(a * x + c, 100); % Using mod 100 to get two-digit numbers
        randomNumbers(i) = remainder;
        x = remainder;
    end;
  	output = randomNumbers;
   
end
