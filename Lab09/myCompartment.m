function [S, I, R, fig] = myCompartment(S_init, I_init, R_init, tf, mu, lambda)
    x = [S_init, I_init, R_init];
    f = @(t, x) [-(1-mu)*x(1); (1-mu)*x(1)-(1-lambda)*x(2); (1-lambda)*x(2)];
    [t, answer] = ode45(f, [0, tf], x);
    S = answer(:, 1);
    I = answer(:, 2);
    R = answer(:, 3);
    fig = figure;
    plot(t, answer(:, 1));
    hold on;
    plot(t, answer(:, 2));
    plot(t, answer(:, 3));
    title("My Compartmentalize Model");
    xlabel("Time(days)");
    ylabel("Number of people");
    legend("S", "I", "R");
end
