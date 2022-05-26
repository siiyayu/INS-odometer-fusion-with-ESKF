function q = quat_mult(q1, q2)
% multiply quaternions
    v = [q1(2); q1(3); q1(4)];
    sum_term = zeros(4, 4);
    sum_term(1, 2:4) = transpose(-v);
    sum_term(2:4, 1) = v;
    sum_term(2:4, 2:4) = skew_symmetric(v);
    sigma = q1(1) * eye(4) + sum_term;
    q = sigma * q2;
end