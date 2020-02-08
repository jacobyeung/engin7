function t = collisionPrediction(m1, m2, v1, f)
v2 = (m1 * v1) / (m1 + m2);
momentum = (m1 + m2) * v2;
t = momentum / (f * (m1 + m2) * 9.81);
end

