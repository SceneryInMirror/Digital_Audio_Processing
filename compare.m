function compare(t, sample1, sample2)
% compare(sample1, sample2)
% 对比函数，比较两种波形的差别
% 实现对比方法：时域波形作差
plot(t, sample1 - sample2);
xlabel('time (seconds)');

end