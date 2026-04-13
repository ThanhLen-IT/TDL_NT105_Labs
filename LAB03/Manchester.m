%% --- Manchester ---
function Manchester()
    bits = [1 0 1 0 0 1 0 1 1 0]; % Dữ liệu mẫu
    bitrate = 1;
    
    [t, s] = manchester_inverse_func(bits, bitrate);
    
    figure;
    plot(t, s, 'LineWidth', 3); 
    axis([0 t(end) -1.1 1.1]); 
    grid on; 
    title(['Manchester: [' num2str(bits) ']']); 
    xlabel('Time');
    ylabel('Voltage');
end

function [t, x] = manchester_inverse_func(bits, bitrate)
    T = length(bits)/bitrate; 
    n = 200; 
    N = n*length(bits);
    dt = T/N; 
    t = 0:dt:T; 
    x = zeros(1, length(t)); 
    
    for i = 0:length(bits)-1
        if bits(i+1) == 0
            % Logic ngược: bit 0 từ mức thấp lên cao
            x(i*n+1 : (i+0.5)*n) = -1;
            x((i+0.5)*n+1 : (i+1)*n) = 1;
        else
            % Logic ngược: bit 1 từ mức cao xuống thấp
            x(i*n+1 : (i+0.5)*n) = 1;
            x((i+0.5)*n+1 : (i+1)*n) = -1;
        end
    end
end