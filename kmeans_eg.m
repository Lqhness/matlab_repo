clc,clear
sigma = 1;  % 标准差
data = sigma * randn(20000, 2);  % 生成高斯分布数据

k_values = [4, 16, 64, 256];  % 不同的k值
figure;  

for i = 1:length(k_values)
    k = k_values(i);
    [labels, ~] = kmeans(data, k, 'Replicates', 5, 'Options', statset('MaxIter', 500)); % kmeans进行聚类
    
    % 计算每个标签的比例
    category_counts = histcounts(labels, k);
    category_ratios = category_counts / sum(category_counts);
    
    %subplot(2, 2, i);
    pie(category_ratios);
    title(sprintf('k = %d', k));
end
