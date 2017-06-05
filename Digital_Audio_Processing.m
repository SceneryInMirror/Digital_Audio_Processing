%%%%% 音频处理 %%%%%

% 预处理，清空残留数据
clear;

% 读入音频文件
% 采样点数据保存在sample内，fs存储采样率信息，nbits存储采样位数
% wavread函数基于audioread函数
wav = input('请输入音频文件名(如果在当前目录下请输入[filename],如果不在当前目录下请输入绝对路径)：\n','s');
[sample, fs, nbits] = wavread(wav);

% cnt_plot记录采样点数，cnt_track记录声道数，delta_t记录相邻采样点间的时间间隔，t记录每个采样点对应的时刻
[cnt_point, cnt_track] = size(sample);
delta_t = 1 / fs;
t = (0:1:cnt_point - 1) / fs;



%%% 对原始音频文件的处理 %%%

% 显示音频文件的时域波形并保存至TD_origin.fig
% 编写plotTD函数作为信号时域波形输出的辅助函数
figure('name', 'time domain——origin','position',[200,80,1500,900])
plotTD(t, sample, 'TD_origin');

% 显示音频文件的频谱图并保存至FD_origin.fig
% 编写plotFD函数作为信号频谱图输出的辅助函数
figure('name', 'frequency domain——origin','position',[200,80,1500,900])
plotFD(fs, cnt_point, sample, 'FD_origin');



%%% 8bits均匀量化 %%%

% 编写Uniform_Quantization函数作为8bits均匀量化的辅助函数
% 均匀量化时域波形：TD_Uniform
% 均匀量化频谱图：FD_Uniform
% 均匀量化均衡时域波形：TD_Uniform_balance
% 均匀量化均衡频谱图：FD_Uniform_balance
[sample_Uniform,sample_Uniform_balance] = Uniform_Quantization(sample);
figure('name', 'time domain——uniform','position',[200,80,1500,900])
plotTD(t, sample_Uniform, 'TD_Uniform');
figure('name', 'frequency domain——uniform','position',[200,80,1500,900])
plotFD(fs, cnt_point, sample_Uniform, 'FD_Uniform');

figure('name', 'time domain——uniform_balance','position',[200,80,1500,900])
plotTD(t, sample_Uniform_balance, 'TD_Uniform_balance');
figure('name', 'frequency domain——uniform_balance','position',[200,80,1500,900])
plotFD(fs, cnt_point, sample_Uniform_balance, 'FD_Uniform_balance');



%%% μ律编码量化 %%%

% 编写u_law_Quantization函数作为μ律编码量化的辅助函数
% μ律压缩后时域波形：TD_U_Law_encoding
% μ律压缩后频谱图：FD_U_Law_encoding
% μ律扩张后时域波形：TD_U_Law_expansion
% μ律扩张后频谱图：FD_U_Law_expansion
% μ律均衡后时域波形：TD_U_Law_expansion
% μ律均衡后频谱图：FD_U_Law_expansion
[sample_ulaw_encoding, sample_ulaw_expansion, sample_ulaw_balance] = u_law_Quantization(sample);

figure('name', 'time domain——μlaw encoding','position',[200,80,1500,900])
plotTD(t, sample_ulaw_encoding, 'TD_U_Law_encoding');
figure('name', 'frequency domain——μlaw encoding','position',[200,80,1500,900])
plotFD(fs, cnt_point, sample_ulaw_encoding, 'FD_U_Law_encoding');

figure('name', 'time domain——μlaw expansion','position',[200,80,1500,900])
plotTD(t, sample_ulaw_expansion, 'TD_U_Law_expansion');
figure('name', 'frequency domain——μlaw expansion','position',[200,80,1500,900])
plotFD(fs, cnt_point, sample_ulaw_expansion, 'FD_U_Law_expansion');

figure('name', 'time domain——μlaw balance','position',[200,80,1500,900])
plotTD(t, sample_ulaw_balance, 'TD_U_Law_balance');
figure('name', 'frequency domain——μlaw balance','position',[200,80,1500,900])
plotFD(fs, cnt_point, sample_ulaw_balance, 'FD_U_Law_balance');



%%% A律编码量化 %%%

% 编写A_law_Quantization函数作为A律编码量化的辅助函数
% A律压缩后时域波形：TD_A_Law_encoding
% A律压缩后频谱图：FD_A_Law_encoding
% A律扩张后时域波形：TD_A_Law_expansion
% A律扩张后频谱图：FD_A_Law_expansion
% A律扩张后时域波形：TD_A_Law_expansion
% A律扩张后频谱图：FD_A_Law_expansion
[sample_Alaw_encoding, sample_Alaw_expansion, sample_Alaw_balance] = A_law_Quantization(sample);

figure('name', 'time domain——Alaw encoding','position',[200,80,1500,900])
plotTD(t, sample_Alaw_encoding, 'TD_A_Law_encoding');
figure('name', 'frequency domain——Alaw encoding','position',[200,80,1500,900])
plotFD(fs, cnt_point, sample_Alaw_encoding, 'FD_A_Law_encoding');

figure('name', 'time domain——Alaw expansion','position',[200,80,1500,900])
plotTD(t, sample_Alaw_expansion, 'TD_A_Law_expansion');
figure('name', 'frequency domain——Alaw expansion','position',[200,80,1500,900])
plotFD(fs, cnt_point, sample_Alaw_expansion, 'FD_A_Law_expansion');

figure('name', 'time domain——Alaw balance','position',[200,80,1500,900])
plotTD(t, sample_Alaw_balance, 'TD_A_Law_balance');
figure('name', 'frequency domain——Alaw balance','position',[200,80,1500,900])
plotFD(fs, cnt_point, sample_Alaw_balance, 'FD_A_Law_balance');



%%% 对比 %%%

figure('name', 'time domain——comparison','position',[200,80,1500,900])
subplot(5,1,1),compare(t, sample, sample_Uniform);title('origin-8bits uniform'); % 对比原波形和8bits均匀量化波形
subplot(5,1,2),compare(t, sample, sample_ulaw_expansion);title('origin-ulaw'); % 对比原波形和μ律量化波形
subplot(5,1,3),compare(t, sample, sample_Alaw_expansion);title('origin-Alaw'); % 对比原波形和A律量化波形
subplot(5,1,4),compare(t, sample_ulaw_expansion, sample_Alaw_expansion); title('ulaw-Alaw');% 对比μ律量化波形和A律量化波形
subplot(5,1,5),compare(t, sample_ulaw_expansion, sample_ulaw_balance); title('ulaw-ulaw balance');% 对比μ律量化波形和μ律量化均衡波形
saveas(gcf, 'comparison', 'fig');



%%% 拓展内容 %%%
fprintf('\n### 拓展内容 ###\n');
average_track(sample); % 双声道平均
reduction(sample, t, fs);  % 指数衰减



%%% 写入wav文件 %%%

audiowrite('sample_8bits_Uniform.wav',sample_Uniform,fs);
audiowrite('sample_ulaw.wav',sample_ulaw_expansion,fs);
audiowrite('sample_Alaw.wav',sample_Alaw_expansion,fs);

%%%%% END %%%%%