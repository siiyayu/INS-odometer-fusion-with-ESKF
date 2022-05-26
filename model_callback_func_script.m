% stop simulation callback function
figure(1);
out.x_gt.data = permute(out.x_gt.data,[3, 1, 2]);
plot3(out.x_gt.data(:, 1), out.x_gt.data(:, 2), -out.x_gt.data(:, 3), 'Color', 'r', 'LineWidth', 1.5);
legend('Истинная траектория')
xlabel('X, \itм');
ylabel('Y, \itм');
zlabel('Z, \itм');
figure(2);
plot3(out.x.data(:, 1), out.x.data(:, 2), -out.x.data(:, 3), 'Color', 'b', 'LineWidth', 1.5);
hold on;
xlabel('X, \itм');
ylabel('Y, \itм');
zlabel('Z, \itм');
% legend('pos')
hold on;
plot3(out.x_gt.data(:, 1), out.x_gt.data(:, 2), -out.x_gt.data(:, 3), 'Color', 'r', 'LineWidth', 1.5);
hold on;
legend('Рассчитанная траектория', 'Истинная траектория')

% errors
figure(3);
yyaxis left;
plot(out.hor_err_fus.time, out.hor_err_fus.data, 'Color', 'b', 'LineWidth', 1.5);
xlabel('время, \itс');
ylabel('Горизонтальная ошибка, \itм');
hold on;
yyaxis right;
plot(out.ver_err_fus.time, out.ver_err_fus.data, 'Color', 'r', 'LineWidth', 1.5);
ylabel('Вертикальная ошибка, \itм');
legend('Горизонтальная позиционная ошибка', 'Вертикальная позиционная ошибка');
grid on;

figure(4);
yyaxis left;
plot(out.hor_err_ins.time, out.hor_err_ins.data, '-', 'Color', 'b', 'LineWidth', 1.5);
xlabel('время, \itс');
ylabel('Горизонтальная ошибка, \itм');
hold on;
yyaxis right;
plot(out.ver_err_ins.time, out.ver_err_ins.data, '-', 'Color', 'r', 'LineWidth', 1.5);
ylabel('Вертикальная ошибка, \itм');
legend('Горизонтальная позиционная ошибка', 'Вертикальная позиционная ошибка');
grid on;
