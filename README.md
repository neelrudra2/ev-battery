<h1 align="center">EV Battery Management System (BMS) Simulation</h1>

<p align="center">
  <b>A MATLAB-based simulation project focused on battery monitoring, protection logic, thermal behavior, and State-of-Charge estimation for EV applications.</b>
</p>

<p align="center">
  <img src="https://img.shields.io/badge/MATLAB-R2021a+-orange">
  <img src="https://img.shields.io/badge/Electric%20Vehicle-Systems-blue">
  <img src="https://img.shields.io/badge/Status-Completed-success">
</p>

---

## 🔍 Project Overview

This project simulates a multi-cell lithium-ion battery pack and implements core Battery Management System (BMS) functionalities using MATLAB.

The simulation focuses on:

- Cell voltage monitoring  
- Internal resistance modeling  
- Thermal behavior due to I²R losses  
- State-of-Charge (SoC) estimation  
- Protection logic implementation  
- Passive cell balancing  

The objective is to understand battery safety, monitoring principles, and control logic relevant to electric vehicle systems.

---

## 🎯 Key Objectives

- Modeled a 4-cell lithium-ion battery pack with voltage imbalance conditions  
- Implemented over-voltage, under-voltage, and over-temperature protection logic  
- Developed Coulomb counting-based SoC estimation  
- Simulated internal resistance effects and dynamic load variation  
- Implemented basic passive cell balancing strategy  

---

## 🔋 Battery Modeling Approach

| Feature | Implementation |
|----------|----------------|
| Cell Voltage | Discharge-based voltage drop model |
| Internal Resistance | Modeled using I × R voltage drop |
| Thermal Rise | Based on I²R heating |
| Load Profile | Dynamic current variation |
| SOC Estimation | Coulomb counting method |

---

## ⚙️ Protection Logic Implemented

| Protection Type | Threshold Condition |
|----------------|--------------------|
| Over Voltage | > 4.25 V |
| Under Voltage | < 3.0 V |
| Over Temperature | > 60°C |

Fault flags are generated when threshold conditions are exceeded.

---

## 🔄 Cell Balancing Strategy

- Monitored voltage difference between highest and lowest cell  
- Applied passive balancing when imbalance exceeded threshold  
- Reduced voltage of highest cell slightly to maintain pack uniformity  

This demonstrates simplified balancing behavior used in EV battery packs.

---

## 📊 Simulation Output

The script generates:

- Cell voltage variation plot  
- Temperature rise plot  
- State-of-Charge (SoC) plot  
- Fault status output  
- Estimated energy loss due to internal resistance  

---

## 🖼️ Sample Output Graphs

*(Add simulation plots here)*

---

## 🚗 Applications

- Electric Vehicle Battery Systems  
- Energy Storage Systems  
- Battery Safety Analysis  
- Thermal Management Studies  
- EV Control System Modeling  

---

## ▶️ How to Run

1. Clone or download the repository  
2. Open MATLAB  
3. Run the script:

  ```matlab
  bms_simulation.m
  ```

4. Observe voltage, temperature, SOC plots and fault status output

---

## 🛠️ Tools and Technologies Used

1. MATLAB
2. Control & System Modeling Concepts
3. Basic Thermal Modeling
4. EV Battery Monitoring Principles
