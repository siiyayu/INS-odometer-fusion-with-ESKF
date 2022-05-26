function SS_M = skew_symmetric(v)
% Skew symmetric operator for a 3x1 vector.
    SS_M = [
         0, -v(3), v(2);
         v(3), 0, -v(1);
         -v(2), v(1), 0;
         ];
end