%% --- Differential Manchester ---
function Di_Manchester()
    bits = [1 0 1 0 0 1 0 1 1 0]; % Dữ liệu mẫu
    bitrate = 1; 
    
    [t, s] = dman_inverse_func(bits, bitrate);
    
    figure;
    plot(t, s, 'LineWidth', 3);
    axis([0 t(end) -1.1 1.1]);
    grid on; 
    title(['Differential Manchester: [' num2str(bits) ']']); % [cite: 330]
    xlabel('Time');
    ylabel('Voltage');
end

function [t, x] = dman_inverse_func(bits, bitrate)
    T = length(bits)/bitrate; 
    n = 200;
    N = n*length(bits); 
    dt = T/N; 
    t = 0:dt:T; 
    x = zeros(1, length(t)); 
    
    last = [0 0]; 
    
    for i = 0:length(bits)-1 
        if i == 0 
            if bits(i+1) == 0 
                % Bit 0 vẽ mức thấp lên cao 
                x(i*n+1:(i+0.5)*n) = -1;
                x((i+0.5)*n+1:(i+1)*n) = 1;
                last(1) = -1;
                last(2) = 1;
            else 
                % Bit 1 vẽ mức cao xuống thấp 
                x(i*n+1:(i+0.5)*n) = 1;
                x((i+0.5)*n+1:(i+1)*n) = -1;
                last(1) = 1;
                last(2) = -1;
            end
        else
            % ĐẢO LOGIC CHO CÁC BIT SAU
            if bits(i+1) == 0
                % Bit 0 thực hiện đảo hướng (Transition)
                last(1) = last(1) * -1;
                last(2) = last(2) * -1;
                x(i*n+1:(i+0.5)*n) = last(1);
                x((i+0.5)*n+1:(i+1)*n) = last(2);
            else
                % Bit 1 giữ nguyên hướng (No Transition)
                x(i*n+1:(i+0.5)*n) = last(1);
                x((i+0.5)*n+1:(i+1)*n) = last(2);
            end
        end
    end
end