function [u_rotated] = rotateVector(u,angle)
rotation=[cos(angle) -sin(angle); sin(angle) cos(angle)];
u_rotated=rotation * u;
end