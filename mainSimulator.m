function output = mainSimulator();
    
    printf('\n');
    disp(      '+-------------------------------------------------------------------------+');
    disp(      '|                     Service Time for Wash Bay 1                         |');
    disp(      '+-------------------------------------------------------------------------+');
    disp(      '|   Service time  |   Probability   |     CDF     |         Range         |');
    disp(      '+-------------------------------------------------------------------------+');
    washBayServiceTime1 = [2, 3, 4, 5; 0.20, 0.30, 0.30, 0.20];
    printTableData(washBayServiceTime1);
    
    printf('\n');
    disp(      '+-------------------------------------------------------------------------+');
    disp(      '|                     Service Time for Wash Bay 2                         |');
    disp(      '+-------------------------------------------------------------------------+');
    disp(      '|   Service time  |   Probability   |     CDF     |         Range         |');
    disp(      '+-------------------------------------------------------------------------+');
    washBayServiceTime2 = [1, 2, 3, 4; 0.15, 0.25, 0.20, 0.40];        
    printTableData(washBayServiceTime2);
    
    printf('\n');
    disp(      '+-------------------------------------------------------------------------+');
    disp(      '|                    Service Time for Wash Bay  3                         |');
    disp(      '+-------------------------------------------------------------------------+');
    disp(      '|   Service time  |   Probability   |     CDF     |         Range         |');
    disp(      '+-------------------------------------------------------------------------+');
    washBayServiceTime3 = [4, 5, 6, 7; 0.35, 0.25, 0.20, 0.20];
    printTableData(washBayServiceTime3);
    
    printf('\n');
    disp(      '+-------------------------------------------------------------------------+');
    disp(      '|                        Interarrival Time                                |');
    disp(      '+-------------------------------------------------------------------------+');
    disp(      '|  Inter arrival  |   Probability   |     CDF     |         Range         |');
    disp(      '|      time       |                 |             |                       |');
    disp(      '+-------------------------------------------------------------------------+');
    interarrivalTimeProb = [1, 2, 3, 4, 5; 0.20, 0.20, 0.20, 0.20, 0.20];
    printTableData(interarrivalTimeProb);
    
    printf('\n');
    disp(      '+-------------------------------------------------------------------------+');
    disp(      '|                        Car Wash Service Type                            |');
    disp(      '+-------------------------------------------------------------------------+');
    disp(      '|   Ticket type   |   Probability   |     CDF     |         Range         |');
    disp(      '+-------------------------------------------------------------------------+');
    carWashTypeProb = [1, 2, 3; 0.35, 0.20, 0.45];
    printTableData(carWashTypeProb);
    
    %getting input from user (with validation) 
    printf('Ticket type 1: Interior\nTicket type 2: Exterior\nTicket type 3: Full Service\n\n');
    carNumber = input('Please input the number of cars: ');
    
    %getting input from user (type of generator) 
    printf('\n');
    printf('+-----------------------------------------------------------------+');
    printf('\nType of random number generator:                                  |\n');
    printf('1. Linear Congruential Generator (LCG):                           |\n');
    printf('2. Random Variate Generator for Exponential Distribution:         |\n');
    printf('3. Random Variate Generator for Uniform Distribution:             |\n');
    printf('4. Freemat built-in rand() function:                              |\n');    
    disp('+-----------------------------------------------------------------+');
    printf(' Choose From 1 - 4                                                |\n');
    disp('+-----------------------------------------------------------------+');
    printf('\n');
    
    % Get type of random number generator for interarrival time from user
    choice1 = getValidChoice('Please choose the type of random number generator for inter-arrival time: ', 4);
    % Generate inter-arrival times and arrival times
    interarrivalTime = getRange(interarrivalTimeProb, choice1, carNumber);
    arrivalTime = getArrivalTime(interarrivalTime);
    
    printf('\n');
    
    % Get type of random number generator for service time from user
    choice2 = getValidChoice('Please choose the type of random number generator for service time: ', 4);
    printf('\n');
    
    % Get type of random number generator for service type from user
    choice3 = getValidChoice('Please choose the type of random number generator for service type: ', 4);
    carWashType = getRange(carWashTypeProb, choice3, carNumber);
    printf('\n');
    
    interarrivalTime(1,1) = 0;
    interarrivalTime(2,1) = 0;
    
   % Generate the overall simulation table
    disp('Overall Simulation Table:');
    disp(      '+------------------------------------------------------------------------------------------+');
    disp(      '|  n | RN for Inter-arrival time  |  Inter-arrival time  |  Arrival time  |  Service type  |');
    disp(      '+------------------------------------------------------------------------------------------+');
    for i = 1:carNumber 
        if(i == 1)
            fprintf('| %2d |%15d             |%12d          |%10d      |%8d        |\n', i, interarrivalTime(1,i), interarrivalTime(2,i), arrivalTime(i), carWashType(2,i));
        else
            fprintf('| %2d |%15d             |%12d          |%10d      |%8d        |\n', i, interarrivalTime(1,i), interarrivalTime(2,i), arrivalTime(i), carWashType(2,i));
        end; 
    end
    disp(      '+------------------------------------------------------------------------------------------+');
    printf('\n');
   
     % Initialize variables for the wash bays
    washBay1 = [];
    washBay2 = [];
    washBay3 = [];
    
    % Processing for each wash bay
    currentEndTime1 = 0;
    currentEndTime2 = 0;
    currentEndTime3 = 0;
    
    % Processing for each wash bay
    for i = 1:carNumber
        % Check if Wash Bay 1 is available
        if isempty(washBay1) || washBay1(end, 5) <= arrivalTime(i)
            serviceData = getRange(washBayServiceTime1, choice2, 1);
            [serviceRecord, currentEndTime1] = processService(i, serviceData, arrivalTime(i), currentEndTime1);
            washBay1 = [washBay1; serviceRecord];
            fprintf('Arrival of car %d at minute %d and queue at the counter 1\n\n', i, arrivalTime(i));
            fprintf('Service for car %d started at minute %d.\n\n', i, serviceRecord(4));
            fprintf('Departure of car %d at minute %d.\n\n', i, serviceRecord(5));
            printf('\n');
        % Check if Wash Bay 2 is available
        elseif isempty(washBay2) || washBay2(end, 5) <= arrivalTime(i)
            serviceData = getRange(washBayServiceTime2, choice2, 1);
            [serviceRecord, currentEndTime2] = processService(i, serviceData, arrivalTime(i), currentEndTime2);
            washBay2 = [washBay2; serviceRecord];
            fprintf('Arrival of car %d at minute %d and queue at the counter 2\n\n', i, arrivalTime(i));
            fprintf('Service for car %d started at minute %d.\n\n', i, serviceRecord(4));
            fprintf('Departure of car %d at minute %d.\n\n', i, serviceRecord(5));
            printf('\n');
        % Wash Bay 1 and 2 are busy, use Wash Bay 3
        else
            serviceData = getRange(washBayServiceTime3, choice2, 1);
            [serviceRecord, currentEndTime3] = processService(i, serviceData, arrivalTime(i), currentEndTime3);
            washBay3 = [washBay3; serviceRecord];
            fprintf('Arrival of car %d at minute %d and queue at the counter 3\n\n', i, arrivalTime(i));
            fprintf('Service for car %d started at minute %d.\n\n', i, serviceRecord(4));
            fprintf('Departure of car %d at minute %d.\n\n', i, serviceRecord(5));
            printf('\n');
        end
    end

    % Display results for each wash bay
    displayWashBayResults('Wash bay 1', washBay1);
    displayWashBayResults('Wash bay 2', washBay2);
    displayWashBayResults('Wash bay 3', washBay3);
    
    % Create a matrix to hold the data for all wash bays
    allServiceRecords = [washBay1; washBay2; washBay3];

    % Get the 'n' column (assuming 'n' is the first column)
    nColumn = allServiceRecords(:, 1);

    % Sort the 'n' column and get the indices of the sorted rows
    [sortedN, sortedIndices] = sort(nColumn);

    % Rearrange allServiceRecords based on the sorted indices
    sortedServiceRecords = allServiceRecords(sortedIndices, :);

    % Display the sorted summary table
    printf('\n');
    printf('\n');
    disp('Summary For Three Wash Bay:');
    disp('+-----------------------------------------------------------------------------------------------------------------------------------------------------------+');
    disp('|  n |  Counter  |  Arrival time  | Service Time | Time service begins  |  Time service ends  |  Waiting time  |  Time spends in the system  | Service type |');
    disp('+-----------------------------------------------------------------------------------------------------------------------------------------------------------+');
    for i = 1:size(sortedServiceRecords, 1)
        washBayNumber = findWashBay(sortedServiceRecords(i, 1), washBay1, washBay2, washBay3);
        fprintf('| %2d |    %2d     |      %3d       |      %2d      |        %3d           |       %3d           |      %2d        |           %2d                |      %2d      |\n', ...
        sortedServiceRecords(i, 1), washBayNumber, arrivalTime(1, sortedServiceRecords(i, 1)), sortedServiceRecords(i, 3), sortedServiceRecords(i, 4), sortedServiceRecords(i, 5), ...
        sortedServiceRecords(i, 6), sortedServiceRecords(i, 7), carWashType(2, sortedServiceRecords(i, 1)));
    end
    disp('+-----------------------------------------------------------------------------------------------------------------------------------------------------------+');
        
    % Calculate statistics for Wash Bay 1
    averageWaitingTime1 = mean(washBay1(:, 6)); % Column 6 contains waiting time
    averageTimeSpent1 = mean(washBay1(:, 7)); % Column 7 contains time spent in the system
    probabilityWaitQueue1 = sum(washBay1(:, 6) > 0) / size(washBay1, 1);
    averageServiceTime1 = mean(washBay1(:, 3)); % Column 3 contains service time
    
    % Calculate statistics for Wash Bay 2
    averageWaitingTime2 = mean(washBay2(:, 6)); % Column 6 contains waiting time
    averageTimeSpent2 = mean(washBay2(:, 7)); % Column 7 contains time spent in the system
    probabilityWaitQueue2 = sum(washBay2(:, 6) > 0) / size(washBay2, 1);
    averageServiceTime2 = mean(washBay2(:, 3)); % Column 3 contains service time
    
    % Calculate statistics for Wash Bay 3
    averageWaitingTime3 = mean(washBay3(:, 6)); % Column 6 contains waiting time
    averageTimeSpent3 = mean(washBay3(:, 7)); % Column 7 contains time spent in the system
    probabilityWaitQueue3 = sum(washBay3(:, 6) > 0) / size(washBay3, 1);
    averageServiceTime3 = mean(washBay3(:, 3)); % Column 3 contains service time
    
    % Calculate overall statistics
    averageInterArrivalTime = mean(interarrivalTime(2, :));
    averageArrivalTime = mean(arrivalTime);
    averageServiceTimeAll = mean([washBay1(:, 3); washBay2(:, 3); washBay3(:, 3)]);
    averageWaitingTimeAll = mean([washBay1(:, 6); washBay2(:, 6); washBay3(:, 6)]);
    averageTimeSpentAll = mean([washBay1(:, 7); washBay2(:, 7); washBay3(:, 7)]);
    probabilityWaitQueueAll = (sum(washBay1(:, 6) > 0) + sum(washBay2(:, 6) > 0) + sum(washBay3(:, 6) > 0)) ...
                               / (size(washBay1, 1) + size(washBay2, 1) + size(washBay3, 1));
    
    % Display statistics for each wash bay
    fprintf('\nWash Bay 1\n');
    fprintf('Average waiting time of a car owner: %.2f\n', averageWaitingTime1);
    fprintf('Average time spent: %.2f\n', averageTimeSpent1);
    fprintf('Probability that a car owner has to wait in the queue: %.2f\n', probabilityWaitQueue1);
    fprintf('Average service time: %.2f\n', averageServiceTime1);
    
    fprintf('\nWash Bay 2\n');
    fprintf('Average waiting time of a car owner: %.2f\n', averageWaitingTime2);
    fprintf('Average time spent: %.2f\n', averageTimeSpent2);
    fprintf('Probability that a car owner has to wait in the queue: %.2f\n', probabilityWaitQueue2);
    fprintf('Average service time: %.2f\n', averageServiceTime2);
    
    fprintf('\nWash Bay 3\n');
    fprintf('Average waiting time of a car owner: %.2f\n', averageWaitingTime3);
    fprintf('Average time spent: %.2f\n', averageTimeSpent3);
    fprintf('Probability that a car owner has to wait in the queue: %.2f\n', probabilityWaitQueue3);
    fprintf('Average service time: %.2f\n', averageServiceTime3);
    
    % Display overall summary
    fprintf('\nSummary For Three Wash Bay\n');
    fprintf('Average inter-arrival time: %.2f\n', averageInterArrivalTime);
    fprintf('Average arrival time: %.2f\n', averageArrivalTime);
    fprintf('Average service time for all wash bay: %.2f\n', averageServiceTimeAll);
    fprintf('Average waiting time for all wash bay: %.2f\n', averageWaitingTimeAll);
    fprintf('Average time spent for all wash bay: %.2f\n', averageTimeSpentAll);
    fprintf('Probability that a car owner has to wait in the queue: %.2f\n', probabilityWaitQueueAll);
end