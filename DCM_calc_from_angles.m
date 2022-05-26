function DCM_calc = DCM_calc_from_angles(ang)

phi = ang(1);
theta = ang(2);
psi = ang(3);
DCM_calc = [
    cos(theta)*cos(psi), cos(theta)*sin(psi), -sin(theta);
    sin(phi)*sin(theta)*cos(psi) - cos(phi)*sin(psi), sin(phi)*sin(theta)*sin(psi) + cos(phi)*cos(psi), sin(phi)*cos(theta);
    cos(phi)*sin(theta)*cos(psi) + sin(phi)*sin(psi),...
    cos(phi)*sin(theta)*sin(psi) - sin(phi)*cos(psi), cos(phi)*cos(theta)
    ];

% decomposition

% % roll matrix phi
% M1 = [
%     1, 0, 0;...
%     0, cos(phi), sin(phi);...
%     0, -sin(phi), cos(phi)...
%     ];
% % pitch matrix theta
% M2 = [
%     cos(theta), 0, -sin(theta);...
%     0, 1, 0;...
%     sin(theta), 0, cos(theta)...
%     ];
% % yaw matrix psi
% M3 = [
%     cos(psi), sin(psi), 0;
%     -sin(psi), cos(psi), 0;
%     0, 0, 1
%     ];

% DCM_calc = M1*M2*M3;