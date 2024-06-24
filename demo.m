% 定义函数 f(x)
f = @(x) sin(x) - cos(x);

% 计算 f'(0) 的解析值
f_prime = @(x) cos(x) + sin(x);
exact_value = f_prime(0);

% 初始化 h 值和误差数组
h_values = 10.^(-1:-1:-12);
error_centered = zeros(size(h_values));
error_forward = zeros(size(h_values));

% 计算误差
for i = 1:length(h_values)
    h = h_values(i);
    % 三点中心差分公式
    df_centered = (f(0+h) - f(0-h)) / (2*h);
    % 两点前向差分公式
    df_forward = (f(h) - f(0)) / h;
    
    % 计算误差
    error_centered(i) = abs(df_centered - exact_value);
    error_forward(i) = abs(df_forward - exact_value);
end

% 画出结果图
log_h_values = log10(h_values);
loglog(h_values, error_centered, 'g', h_values, error_forward, 'r');
xlabel('log(h)');
ylabel('log(Error)');
legend('三点中心差分', '两点前向差分');
title('误差与步长大小关系');
grid off;

% 找出最小误差和对应的 h
[min_error_centered, min_index_centered] = min(error_centered);
[min_error_forward, min_index_forward] = min(error_forward);
optimal_h_centered = h_values(min_index_centered);
optimal_h_forward = h_values(min_index_forward);

disp(['最小三点中心差分误差为: ', num2str(min_error_centered), '，对应 h 值为: ', num2str(optimal_h_centered)]);
disp(['最小两点前向差分误差为: ', num2str(min_error_forward), '，对应 h 值为: ', num2str(optimal_h_forward)]);
