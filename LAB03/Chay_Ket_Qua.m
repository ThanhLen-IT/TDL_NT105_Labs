% Thiet lap du lieu dau vao
bits = [1 0 1 0 0 1 0 1 1 0]; 
bitrate = 1; 

% Ve Bipolar-AMI
subplot(2,1,1); 
[t1, s1] = AMI(bits, bitrate);
plot(t1, s1, 'LineWidth', 3);
axis([0 t1(end) -1.1 1.1]);
grid on;
title(['Bipolar-AMI: [' num2str(bits) ']']);

% Ve Pseudoternary
subplot(2,1,2); 
[t2, s2] = Pseudo(bits, bitrate);
plot(t2, s2, 'LineWidth', 3);
axis([0 t2(end) -1.1 1.1]);
grid on;
title(['Pseudoternary: [' num2str(bits) ']']);