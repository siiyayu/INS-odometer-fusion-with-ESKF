function dl_dt = quatenion_motion_equation(quat, w)

p = w(1);
q = w(2);
r = w(3);
M = [
    0, -p, -q, -r;
    p, 0, r, -q;
    q, -r, 0, p;
    r, q, -p, 0
    ];
quat = reshape(quat, [4, 1]);
dl_dt = 0.5*(M*quat + quat*(1 - (quat(1).^2 + quat(2).^2 + quat(3).^2 + quat(4).^2)));
    
end
