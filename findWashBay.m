function washBayNumber = findWashBay(carNo, washBay1, washBay2, washBay3)
    if any(washBay1(:, 1) == carNo)
        washBayNumber = 1;
    elseif any(washBay2(:, 1) == carNo)
        washBayNumber = 2;
    elseif any(washBay3(:, 1) == carNo)
        washBayNumber = 3;
    else
        washBayNumber = NaN;
    end
