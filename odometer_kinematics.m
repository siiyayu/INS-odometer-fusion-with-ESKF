function v_eb = odometer_kinematics(WhlVel, InertFrmPos, InertFrmAng, omega_eb, T_r, l_br)
    v_er = 0.5*(WhlVel(3) + WhlVel(4));
    v_eb = [v_er; 0; 0] - skew_symmetric(omega_eb)*[-l_br; 0; 0];
end
