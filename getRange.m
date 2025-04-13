function output = getRange(x,choice,n)
    
    randomNumbers = [];
    randomNumbers = generateRandomNumber(choice,n);
    
    A = Data(x);
    B = [];
    
    for(i = 1:n)
        for(j = 1:size(x,2))
            if(randomNumbers(i) >= A(4,j) && randomNumbers(i) <= A(5,j))
                B(i) = A(1,j);
                break;
            end;
        end;
    end;
    
    output = [randomNumbers;B];
    