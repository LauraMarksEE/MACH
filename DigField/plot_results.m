function plot_results(Vm,Hx,Hy,Bx,By,muN,Core)

%% Plot equipotentials
figure;
plot_equipotentials(Vm,Core);

%% Plot H
figure;
plot_H(Hx,Hy,Core);

% Plot B
% ~~~~~~
figure;
plot_B(Bx,By,Core);
