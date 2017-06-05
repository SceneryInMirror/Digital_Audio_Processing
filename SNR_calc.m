function SNR = SNR_calc(noise, signal)
%SNR = SNR_calc(noise, singal)
%输入为量化前后的波形，输出信噪比

%Ps表示信号功率
Ps = sum(signal.^2);

%Pn表示量化噪声功率
Pn = sum((noise - signal).^2);

%求得信噪比SNR = 10 * log10(Ps / Pn)
SNR = 10 * log10(Ps / Pn);

%测试时使用：fprintf('\n%d %d\n', Ps, Pn);
end