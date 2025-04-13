function [serviceRecord, newEndTime] = processService(carNo, serviceData, arrivalTime, currentEndTime)
    serviceTime = serviceData(2);
    timeServiceBegins = max(arrivalTime, currentEndTime);
    timeServiceEnds = timeServiceBegins + serviceTime;
    waitingTime = timeServiceBegins - arrivalTime;
    timeSpentInSystem = waitingTime + serviceTime;
    serviceRecord = [carNo, serviceData(1), serviceTime, timeServiceBegins, timeServiceEnds, waitingTime, timeSpentInSystem];
    newEndTime = timeServiceEnds;
end