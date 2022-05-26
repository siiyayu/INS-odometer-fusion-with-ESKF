function [x, P] = correction(x, P, T, z)
% do correction step
    sigma_odo = 0.01;
    R = eye(3)*sigma_odo;

    if mod(T, 0.3) == 0
        H_jac = DH_func();
        K = P*transpose(H_jac)*inv(H_jac*P*transpose(H_jac) + R);
        delta = K*(z - H_func(x));

        % update
        x(1:3) = x(1:3) + delta(1:3);
        x(4:6) = x(4:6) + delta(4:6);
        x(7:10) = quat_mult(quaternion_from_ang(delta(7:9)), x(7:10));
        x(11:13) = x(11:13) + delta(10:12);
        x(14:16) = x(14:16) + delta(13:15);
        x(17:19) = x(17:19) + delta(16:18);
        
        % compute the corrected covariance
        P = (eye(18) - K*H_jac)*P;
    end
end

function l = quaternion_from_ang(ang)
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

function q = quat_mult(q1, q2)
    v = [q1(2); q1(3); q1(4)];
    sum_term = zeros(4, 4);
    sum_term(1, 2:4) = transpose(-v);
    sum_term(2:4, 1) = v;
    sum_term(2:4, 2:4) = skew_symmetric(v);
    sigma = q1(1) * eye(4) + sum_term;
    q = sigma * q2;
end


function DCM = DCM_calc_from_quat(q)
    q0 = q(1);
    q1 = q(2);
    q2 = q(3);
    q3 = q(4);
    DCM = [(q0^2 + q1^2 - q2^2 - q3^2), 2*(q1*q2 + q0*q3), 2*(q1*q3 - q0*q2);
        2*(q1*q2 - q0*q3), (q0^2 - q1^2 + q2^2 - q3^2), 2*(q2*q3 + q0*q1);
        2*(q1*q3 + q0*q2), 2*(q2*q3 - q0*q1), (q0^2 - q1^2 - q2^2 + q3^2)
        ];
end

function SS_M = skew_symmetric(v)
%     Skew symmetric operator for a 3x1 vector.
    SS_M = [
         0, -v(3), v(2);
         v(3), 0, -v(1);
         -v(2), v(1), 0;
         ];
end

function y = H_func(x)
    y = x(4:6);
end

function DH = DH_func(~)
    DH = zeros(3, 18);
    DH(:, 4:6) = eye(3);
end