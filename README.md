# INS-odometer-fusion-with-ESKF
INS + odometer fusion, specialist's thesis work. Simulation in MathLab Simulink.
Vehicle motion model is a quite difficult and simulates roll angles, wheels' lateral motion, tire deformation, etc. Motion model is based on a well-known MatLab example. Calculations are in the flat Earth NED coordinate system.

Ways to improve:
* create more difficult INS model (with corresponding Simulink block, which is already inserted in the BINS sybsystem) that implements random bias walk, bias instability, etc. Also, try to estimate biases in the state vector.
* implement the round Earth coordinate system :)
