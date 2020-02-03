function [u_recovered] = recoverVector(u,angle)
rotation=inv([cos(angle) -sin(angle); sin(angle) cos(angle)]);
u_recovered=rotation * u;
end