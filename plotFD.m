function plotFD(fs, cnt_point, sample, name)
% plotFD(fs, cnt_point, sample)
% 频谱图显示函数
% 输入为原信号文件（sample）和对应的采样率（fs）、采样点数（cnt_point），以及生成图像文件的名称
% 依次展示频谱矢量图，幅频谱，相位谱

% 图1：矢量图
fftsample = fft(sample);
subplot(2,2,1); plot(fftsample);
title('fft');
xlabel('Re(FFT)');
ylabel('Im(FFT)');

% 图2：幅度谱
f = (0:1:cnt_point - 1) .* (fs / cnt_point);
subplot(2,2,2);plot(f, abs(fftsample));
title('amplitude-frequency');
xlabel('frequency (Hz)');
ylabel('amptitude');

% 图3：相位谱
subplot(2,2,3);plot(f, angle(fftsample));
title('angle-frequency');
xlabel('frequency (Hz)');
ylabel('phase');

% 图4：相位谱（放大）
subplot(2,2,4);plot(f, angle(fftsample));
axis([0, 50, -pi, pi]);
title('angle-frequency (0Hz-50Hz)');
xlabel('frequency (Hz)');
ylabel('phase');

% 保存图像至'FD.fig'文件
saveas(gcf, name, 'fig');

% figure('name', 'angle-frequency（zoom up）','position',[200,80,1500,900])
% subplot(2,3,1);plot(f, angle(fftsample));
% axis([0, 50, -pi, pi]);
% title('angle-frequency (0Hz-50Hz)');
% xlabel('frequency (Hz)');
% ylabel('phase');
% 
% subplot(2,3,2);plot(f, angle(fftsample));
% axis([100, 150, -pi, pi]);
% title('angle-frequency (100Hz-150Hz)');
% xlabel('frequency (Hz)');
% ylabel('phase');
% 
% subplot(2,3,3);plot(f, angle(fftsample));
% axis([1000, 1050, -pi, pi]);
% title('angle-frequency (1000Hz-1050Hz)');
% xlabel('frequency (Hz)');
% ylabel('phase');
% 
% subplot(2,3,4);plot(f, angle(fftsample));
% axis([5000, 5050, -pi, pi]);
% title('angle-frequency (5000Hz-5050Hz)');
% xlabel('frequency (Hz)');
% ylabel('phase');
% 
% subplot(2,3,5);plot(f, angle(fftsample));
% axis([10000, 10050, -pi, pi]);
% title('angle-frequency (10000Hz-10050Hz)');
% xlabel('frequency (Hz)');
% ylabel('phase');
% 
% subplot(2,3,6);plot(f, angle(fftsample));
% axis([22000, 22050, -pi, pi]);
% title('angle-frequency (22000Hz-22050Hz)');
% xlabel('frequency (Hz)');
% ylabel('phase');
end
