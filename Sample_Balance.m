function sample_balance = sample_balance(sample, cnt_point)
% sample_balance = balance(sample)
% 信号均衡函数
% 滤去信号中高于fs/2的频率，由数字信号恢复到模拟信号
% 具体步骤：
% 1.构建窗函数
% 2.频域滤波

window0 = boxcar(cnt_point / 2);
[row, line] = size(sample);
window0 = repmat(window0, 1, line);
window = zeros(row, line);
window(1:cnt_point / 2, 1:line) = window0;

sample_balance = 2 * real(ifft(fft(sample) .* window));

end