function dv_dt = Euler_motion_equation(ang, w)
% ang - phi, theta, psi (roll, pitch, yaw)
    phi = ang(1);
    theta = ang(2);
    psi = ang(3);
    dv_dt = zeros(3,1);
    dv_dt(1) = w(1) + w(2)*sin(phi)*tan(theta) + w(3)*cos(phi)*tan(theta);
    dv_dt(2) = w(2)*cos(phi) - w(3)*sin(phi);
    dv_dt(3) = (w(2)*sin(phi) + w(3)*cos(phi))/cos(theta);   
end
