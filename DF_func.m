function DF = DF_func(x_, dT, BINS_output)
% F function jacobian
    q = x_(7:10);
    a = BINS_output(1:3);
    ab = x_(11:13);
%     w = BINS_output(4:6);
    DCM = DCM_calc_from_quat(q);
    DF = eye(18);
    DF(1:3, 4:6) = eye(3)*dT;
    DF(4:6, 7:9) = -skew_symmetric(inv(DCM)*(a - ab))*dT;
    DF(4:6, 10:12) = -inv(DCM)*dT;
    DF(4:6, 16:18) = eye(3)*dT;
    DF(7:9, 13:15) = -inv(DCM)*dT;
end