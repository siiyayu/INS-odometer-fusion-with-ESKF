# INS-odometer-fusion-with-ESKF
INS + odometer fusion, specialist's thesis work. Simulation in MathLab Simulink.
The vehicle motion model simulates roll angles, wheels' lateral motion, tire deformation, etc. Calculations are in the flat Earth NED coordinate system.

Ways to improve:
* create a more complicated INS model (with corresponding Simulink block, which is already inserted in the BINS subsystem) that implements random bias walk, bias instability, etc. Also, try to estimate biases in the state vector.
* implement the round Earth coordinate system :)
