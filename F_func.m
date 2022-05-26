function x = F_func(x_, dT, BINS_output) 
% nominal state kinematics
    a = BINS_output(1:3);
    w = BINS_output(4:6);
    p_ = x_(1:3);
    v_ = x_(4:6);
    q_ = x_(7:10);
    ab_ = x_(11:13);
    wb_ = x_(14:16);
    g_ = x_(17:19);

    q = quat_mult(q_, quaternion_from_ang(w*dT));

%     ang = f_func(ang_, w)*dT;
%     ang = RK4(ang_, @f_func, w, dT);
%     ang = w*dT;
    
    DCM = DCM_calc_from_quat(q);
    p = p_ + dT*v_ + 0.5*(dT*dT)*(inv(DCM)*(a - ab_) + g_);
    v = v_ + dT*(inv(DCM)*(a - ab_) + g_);
    ab = ab_;
    wb = wb_;
    g = g_;

    x = [p; v; q; ab; wb; g];
end