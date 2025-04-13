function output = getArrivalTime(x)
    
    output = [];
    n = size(x,2);
    intArr = x(2,1:n);
   
    for(i = 1:n)
        if(i == 1)
            arrTime(i) = 0;
        else
            arrTime(i) = arrTime(1,i-1) + intArr(i);
        end;
    end;
    
    output = arrTime;