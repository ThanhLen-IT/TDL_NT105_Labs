% Định nghĩa các tham số cơ bản
f = 2400; % Tần số 2400 MHz (Wi-Fi) [cite: 407]
c = 299.792458; % Vận tốc ánh sáng [cite: 409]
d = 1:1:1000; % Khoảng cách từ 1m đến 1000m [cite: 411]

% Công thức tính FSL (Free Space Loss) [cite: 400]
fspl = ((4 * pi * d * f) / c).^2;

% Chuyển đổi sang đơn vị Decibel (dB) [cite: 404]
fspl_dB = 10 * log10(fspl);

% Vẽ đồ thị
figure;
plot(d, fspl_dB, 'LineWidth', 2);
grid on; % Bật lưới để dễ quan sát
xlabel('Distance (m)'); % Trục X là khoảng cách [cite: 414]
ylabel('Path Loss (dB)'); % Trục Y là độ suy hao [cite: 416]
title('Phân tích suy hao truyền dẫn theo khoảng cách (f = 2400MHz)');