function ang = quaternion_to_angles(q)
%#codegen
    q0 = q(1);
    q1 = q(2);
    q2 = q(3);
    q3 = q(4);
    phi = atan2(2*(q2*q3 + q0*q1), (q0^2 - q1^2 - q2^2 - q3^2));
    theta = asin(-2*(q1*q3 - q0*q2));
    psi = atan2(2*(q1*q2 +q0*q3), (q0^2 + q1^2 - q2^2 - q3^2));
    ang = [phi; theta; psi];
end
