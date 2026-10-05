function smoothed = myFilter(x, width)
    % Kiem tra chan le cua width 
    if mod(width, 2) == 0
        width = width + 1; % Neu chan tang 1
    end

    % Do dai cua th x
    len = length(x);

    % Khoi tao smoothed kthuoc bang x
    smoothed = zeros(1, len);

    % Loc trung binh dong
    half_width = (width - 1) / 2;
    smoothed(1) = x(1);
    k = 1;
    for i = 2:half_width
        smoothed(i) = mean(x(i-k:i+k));
        k = k+1;
    end
    for i = 1+half_width:len-half_width
        smoothed(i) = mean(x(i - half_width:i + half_width));
    end
    t = 1;
    for i = len-half_width+1:len-1
        smoothed(i) = mean(x(i-t:i+t));
        t = t+1;
    end
    smoothed(len) = x(len);
end
