function [t,x] = Pseudo(bits, bitrate)
    n = 200;
    N = n*length(bits);
    T = length(bits)/bitrate; 
    dt = T/N;
    t = 0:dt:T;
    x = zeros(1,length(t));
    last = 1;
    for i = 0:length(bits)-1
        if bits(i+1) == 0
            x(i*n+1:(i+1)*n) = last;
            last = last*-1;
        else
            x(i*n+1:(i+1)*n) = 0;
        end
    end
end