function DCM = DCM_calc_from_quat(q)
% calc DCM from quaternion
    q0 = q(1);
    q1 = q(2);
    q2 = q(3);
    q3 = q(4);
    DCM = [(q0^2 + q1^2 - q2^2 - q3^2), 2*(q1*q2 + q0*q3), 2*(q1*q3 - q0*q2);
        2*(q1*q2 - q0*q3), (q0^2 - q1^2 + q2^2 - q3^2), 2*(q2*q3 + q0*q1);
        2*(q1*q3 + q0*q2), 2*(q2*q3 - q0*q1), (q0^2 - q1^2 - q2^2 + q3^2)
        ];
end