# Car Wash Center Simulation

## Project Overview
This project implements a queuing system simulation for a three-bay car wash center. The simulation models car arrivals, service processing, and resource allocation to help car wash businesses optimize their operations and improve customer satisfaction.

## Purpose
The Car Wash Center Simulation assists business owners in:
- Predicting customer waiting times
- Optimizing resource allocation across multiple wash bays
- Identifying bottlenecks in the service process
- Making data-driven decisions for business efficiency

## Features
- Simulation of a three-bay car wash center with different service characteristics
- Multiple random number generation methods:
  - Linear Congruential Generator (LCG)
  - Exponential Distribution
  - Uniform Distribution
  - Built-in rand() function
- Comprehensive probability distributions for:
  - Service times for each wash bay
  - Inter-arrival times
  - Car wash service types (Interior, Exterior, Full Service)
- First-come-first-serve queue management
- Detailed activity logs and service records
- Statistical analysis of system performance metrics

## Technology Stack
- **MATLAB/FreeMat**: Core programming environment used for numerical computing
- **Object-Oriented Design**: Modular approach with separate function files for different components
- **Statistical Analysis**: Applied queuing theory and probability distributions
- **Discrete Event Simulation**: Event-driven approach to model real-time operations

## Key Components
1. **Random Number Generators**:
   - Linear Congruential Generator
   - Exponential Distribution Generator
   - Uniform Distribution Generator
   - Built-in rand() function

2. **Data Processing Functions**:
   - Cumulative Distribution Function (CDF) calculation
   - Range determination for probability tables
   - Service time processing
   - Arrival time calculations

3. **Simulation Logic**:
   - Car arrival generation
   - Wash bay assignment based on availability
   - Service time calculation
   - Waiting time determination
   - System time tracking

4. **Results Analysis**:
   - Individual wash bay performance metrics
   - Overall system statistics
   - Waiting time probabilities
   - Resource utilization rates

## Performance Metrics
The simulation tracks and reports:
- Average waiting time per customer
- Average time spent in the system
- Probability of customers waiting in queue
- Average service time for each wash bay
- Average inter-arrival time
- Overall system efficiency

## How to Use
1. Run the `mainSimulator.m` file in MATLAB/FreeMat
2. Input the number of cars to simulate
3. Select random number generation methods for:
   - Inter-arrival times
   - Service times
   - Service types
4. Review the simulation results and statistics

## File Structure
- `mainSimulator.m`: Main simulation controller
- `Data.m`: CDF and range calculations for probability tables
- `displayWashBayResults.m`: Formats and displays wash bay service records
- `ExponentialDistribution.m`: Generates exponentially distributed random numbers
- `findWashBay.m`: Determines which wash bay processed a specific car
- `generateRandomNumber.m`: Implements different random number generation methods
- `getArrivalTime.m`: Calculates arrival times from inter-arrival times
- `getRange.m`: Maps random numbers to corresponding probability ranges
- `getValidChoice.m`: Validates user input
- `LinearCongruentialGenerators.m`: Implements the LCG random number generator
- `processService.m`: Processes service records for each car
- `randFunction.m`: Implements built-in random number generation
- `UniformDistribution.m`: Generates uniformly distributed random numbers
- `printTableData.m`: Formats and displays data in tabular format

## Implementation Details
The simulation follows a discrete event model where each car arrival represents an event. When a car arrives, the system checks for available wash bays. If a wash bay is available, the car enters service immediately; otherwise, it waits in the queue until a wash bay becomes available.

Service times vary depending on the wash bay and service type. The system tracks when each car arrives, begins service, ends service, and calculates waiting times and total time spent in the system.
