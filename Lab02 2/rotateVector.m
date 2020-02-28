function [u_rotated] = rotateVector(u,angle)
rotation=[cos(angle) -sin(angle); sin(angle) cos(angle)];
u_rotated=rotation * u;
end

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% START OF AUTOGRADER FEEDBACK %
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%
% Your score is 8 / 8.
% 
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% END OF AUTOGRADER FEEDBACK %
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
