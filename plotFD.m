function plotFD(fs, cnt_point, sample, name)
% plotFD(fs, cnt_point, sample)
% Ƶ��ͼ��ʾ����
% ����Ϊԭ�ź��ļ���sample���Ͷ�Ӧ�Ĳ����ʣ�fs��������������cnt_point�����Լ�����ͼ���ļ�������
% ����չʾƵ��ʸ��ͼ����Ƶ�ף���λ��

% ͼ1��ʸ��ͼ
fftsample = fft(sample);
subplot(2,2,1); plot(fftsample);
title('fft');
xlabel('Re(FFT)');
ylabel('Im(FFT)');

% ͼ2��������
f = (0:1:cnt_point - 1) .* (fs / cnt_point);
subplot(2,2,2);plot(f, abs(fftsample));
title('amplitude-frequency');
xlabel('frequency (Hz)');
ylabel('amptitude');

% ͼ3����λ��
subplot(2,2,3);plot(f, angle(fftsample));
title('angle-frequency');
xlabel('frequency (Hz)');
ylabel('phase');

% ͼ4����λ�ף��Ŵ�
subplot(2,2,4);plot(f, angle(fftsample));
axis([0, 50, -pi, pi]);
title('angle-frequency (0Hz-50Hz)');
xlabel('frequency (Hz)');
ylabel('phase');

% ����ͼ����'FD.fig'�ļ�
saveas(gcf, name, 'fig');

% figure('name', 'angle-frequency��zoom up��','position',[200,80,1500,900])
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
