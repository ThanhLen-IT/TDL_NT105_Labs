f = 2400; c = 299.792458; d = 1:1:1000;
Gt = 5; % Độ lợi anten phát (dB) - Giả sử 5dBi
Gr = 3; % Độ lợi anten thu (dB) - Giả sử 3dBi

fspl_dB = 10 * log10(((4 * pi * d * f) / c).^2);

% Tính suy hao thực tế sau khi trừ đi độ lợi anten
total_loss = fspl_dB - Gt - Gr;

% Vẽ so sánh
figure;
plot(d, fspl_dB, 'r--', 'LineWidth', 1.5); hold on;
plot(d, total_loss, 'b', 'LineWidth', 2);
legend('Suy hao lý thuyết (FSL)', 'Suy hao có Anten (Gt=5, Gr=3)');
xlabel('Distance (m)'); ylabel('Loss (dB)');
title('Ảnh hưởng của độ lợi Anten đến tổng suy hao');
grid on;