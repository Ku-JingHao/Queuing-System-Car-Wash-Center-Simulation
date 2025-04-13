function data = printTableData(x)
    
    data = Data(x);
    
    for(i = 1:size(x,2))
        printf('|       %d         |     %.2f        |   %.2f      |        %-2d - %-3d       |\n', data(1,i), data(2,i), data(3,i), data(4,i), data(5,i));
    end
    disp(      '+-------------------------------------------------------------------------+');