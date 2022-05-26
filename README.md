# INS-odometer-fusion-with-ESKF
INS + odometer fusion, specialist's thesis work. Simulation in MathLab Simulink.
Vehicle motion model is quite difficult and simulates roll angles, wheels lateral motion, tire deformation etc. Motion model based on well-known MatLab example. Calculations are in the flat Earth NED coordinate system.

Ways to improve:
* create more difficult INS model (with corresponding Simulink block, which already inserted in the BINS sybsystem), which implements random bias walk, bias instability etc. and try to estimate biases in the state vector.
* implement round Earth coordinate system :)
