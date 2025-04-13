function data = Data(x)
    
    data = x;
    
    for(i = 1:size(x,2))
        data(3,i) = sum(data(2, 1:i));
        data(4,i) = int32(data(3,i) * 100) - data(2,i) * 100 + 1;
        data(5,i) = int32(data(3,i) * 100);
    end
    
    

    
       
