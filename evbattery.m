clc;
clear;
close all;

%% Parameters
dt = 1;
T = 2000;
time = 0:dt:T;

num_cells = 4;
capacity = 2.5;   % Ah
internal_resistance = 0.05; % Ohm
base_current = 1.5;

%% Initialize
voltage = zeros(num_cells,length(time));
temperature = zeros(num_cells,length(time));
soc = zeros(1,length(time));

voltage(:,1) = [4.2 4.15 4.18 4.1];
temperature(:,1) = 25;
soc(1) = 100;

%% Balancing Threshold
balance_threshold = 0.05;

%% Fault Flags
over_voltage = false;
under_voltage = false;
over_temp = false;

%% Simulation
for t = 2:length(time)
    
    % Dynamic load variation
    current = base_current + 0.5*sin(0.01*t);
    
    % Voltage drop model including internal resistance
    voltage(:,t) = voltage(:,t-1) - ...
        (current*dt)/(capacity*3600) ...
        - internal_resistance*current*0.001;
    
    % Temperature rise model (I^2R heating)
    temperature(:,t) = temperature(:,t-1) ...
        + (current^2 * internal_resistance)*0.01;
    
    % SOC Estimation
    soc(t) = soc(t-1) - (current*dt)/(capacity*3600)*100;
    
    % Cell imbalance growth
    voltage(1,t) = voltage(1,t) - 0.00005*t;
    
    % Passive Cell Balancing
    max_v = max(voltage(:,t));
    min_v = min(voltage(:,t));
    
    if (max_v - min_v) > balance_threshold
        idx = find(voltage(:,t)==max_v);
        voltage(idx,t) = voltage(idx,t) - 0.01; % discharge highest cell
    end
    
    % Protection Logic
    if any(voltage(:,t) > 4.25)
        over_voltage = true;
    end
    
    if any(voltage(:,t) < 3.0)
        under_voltage = true;
    end
    
    if any(temperature(:,t) > 60)
        over_temp = true;
    end
end

%% Plot Voltage
figure;
plot(time, voltage);
title('Cell Voltage with Balancing');
xlabel('Time (s)');
ylabel('Voltage (V)');
grid on;

%% Plot Temperature
figure;
plot(time, temperature);
title('Cell Temperature Rise');
xlabel('Time (s)');
ylabel('Temperature (°C)');
grid on;

%% Plot SOC
figure;
plot(time, soc);
title('State of Charge Estimation');
xlabel('Time (s)');
ylabel('SOC (%)');
grid on;

%% Efficiency Estimation
energy_loss = internal_resistance * base_current^2 * T;
disp(['Estimated Energy Loss (J): ', num2str(energy_loss)]);

%% Fault Display
disp('Fault Status:');
disp(['Over Voltage: ', num2str(over_voltage)]);
disp(['Under Voltage: ', num2str(under_voltage)]);
disp(['Over Temperature: ', num2str(over_temp)]);