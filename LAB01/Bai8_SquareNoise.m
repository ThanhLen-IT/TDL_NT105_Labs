t = 0:0.001:2; % Thời gian từ 0 đến 2 giây [cite: 499]
x = square(5 * pi * t); % Tạo sóng vuông gốc [cite: 500]

SNR = 10; % Tỉ số tín hiệu trên nhiễu (dB)
sigPower = sum(abs(x).^2)/length(x); % Tính công suất tín hiệu
noisePower = sigPower / (10^(SNR/10)); % Tính công suất nhiễu cần thiết
noise = sqrt(noisePower) * randn(size(x)); % Tạo nhiễu Gaussian 
y = x + noise; % Tín hiệu sau khi cộng nhiễu [cite: 461]
% ----------------------------------

figure;
subplot(2,1,1);
plot(t, x, 'LineWidth', 2);
ylim([-1.5 1.5]); title('Tín hiệu sóng vuông gốc');
grid on;

subplot(2,1,2);
plot(t, y, 'Color', [0.85 0.32 0.1]);
title(['Sóng vuông có nhiễu Gaussian (SNR = ', num2str(SNR), 'dB)']);
xlabel('Time (s)');
grid on;