function l = quaternion_from_ang(ang)
% calculate quaternions from angles
    l = zeros(4, 1);
    roll = ang(1);
    pitch = ang(2);
    yaw = ang(3);
    cy = cos(yaw * 0.5);
    sy = sin(yaw * 0.5);
    cr = cos(roll * 0.5);
    sr = sin(roll * 0.5);
    cp = cos(pitch * 0.5);
    sp = sin(pitch * 0.5);
    l = zeros(4, 1);
    l(1) = cr * cp * cy + sr * sp * sy;
    l(2) = sr * cp * cy - cr * sp * sy;
    l(3) = cr * sp * cy + sr * cp * sy;
    l(4) = cr * cp * sy - sr * sp * cy;
end