function [v, theta] = targetPractice(L_target, height, tol)
statement = false;
while(~statement)
    prompt = "Input a positive initial velocity\n";
    v1 = input(prompt);
    prompt = "Input an angle that the shot is taken at between 0 and 90 degrees noninclusive\n";
    theta1 = input(prompt);
    vx = v1 * cos(theta1);
    vy = v1 * sin(theta1);
    Ltrial = vx * ((vy + sqrt(vy * vy + 2 * 9.81 * height)) / 9.81);
    if(abs(Ltrial - L_target) <= tol)
        v = v1;
        theta = theta1;
        statement = true;
    else
        statement = false;
    end
end

