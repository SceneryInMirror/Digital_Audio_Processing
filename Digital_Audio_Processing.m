%%%%% ��Ƶ���� %%%%%

% Ԥ������ղ�������
clear;

% ������Ƶ�ļ�
% ���������ݱ�����sample�ڣ�fs�洢��������Ϣ��nbits�洢����λ��
% wavread��������audioread����
wav = input('��������Ƶ�ļ���(����ڵ�ǰĿ¼��������[filename],������ڵ�ǰĿ¼�����������·��)��\n','s');
[sample, fs, nbits] = wavread(wav);

% cnt_plot��¼����������cnt_track��¼��������delta_t��¼���ڲ�������ʱ������t��¼ÿ���������Ӧ��ʱ��
[cnt_point, cnt_track] = size(sample);
delta_t = 1 / fs;
t = (0:1:cnt_point - 1) / fs;



%%% ��ԭʼ��Ƶ�ļ��Ĵ��� %%%

% ��ʾ��Ƶ�ļ���ʱ���β�������TD_origin.fig
% ��дplotTD������Ϊ�ź�ʱ��������ĸ�������
figure('name', 'time domain����origin','position',[200,80,1500,900])
plotTD(t, sample, 'TD_origin');

% ��ʾ��Ƶ�ļ���Ƶ��ͼ��������FD_origin.fig
% ��дplotFD������Ϊ�ź�Ƶ��ͼ����ĸ�������
figure('name', 'frequency domain����origin','position',[200,80,1500,900])
plotFD(fs, cnt_point, sample, 'FD_origin');



%%% 8bits�������� %%%

% ��дUniform_Quantization������Ϊ8bits���������ĸ�������
% ��������ʱ���Σ�TD_Uniform
% ��������Ƶ��ͼ��FD_Uniform
% ������������ʱ���Σ�TD_Uniform_balance
% ������������Ƶ��ͼ��FD_Uniform_balance
[sample_Uniform,sample_Uniform_balance] = Uniform_Quantization(sample);
figure('name', 'time domain����uniform','position',[200,80,1500,900])
plotTD(t, sample_Uniform, 'TD_Uniform');
figure('name', 'frequency domain����uniform','position',[200,80,1500,900])
plotFD(fs, cnt_point, sample_Uniform, 'FD_Uniform');

figure('name', 'time domain����uniform_balance','position',[200,80,1500,900])
plotTD(t, sample_Uniform_balance, 'TD_Uniform_balance');
figure('name', 'frequency domain����uniform_balance','position',[200,80,1500,900])
plotFD(fs, cnt_point, sample_Uniform_balance, 'FD_Uniform_balance');



%%% ���ɱ������� %%%

% ��дu_law_Quantization������Ϊ���ɱ��������ĸ�������
% ����ѹ����ʱ���Σ�TD_U_Law_encoding
% ����ѹ����Ƶ��ͼ��FD_U_Law_encoding
% �������ź�ʱ���Σ�TD_U_Law_expansion
% �������ź�Ƶ��ͼ��FD_U_Law_expansion
% ���ɾ����ʱ���Σ�TD_U_Law_expansion
% ���ɾ����Ƶ��ͼ��FD_U_Law_expansion
[sample_ulaw_encoding, sample_ulaw_expansion, sample_ulaw_balance] = u_law_Quantization(sample);

figure('name', 'time domain������law encoding','position',[200,80,1500,900])
plotTD(t, sample_ulaw_encoding, 'TD_U_Law_encoding');
figure('name', 'frequency domain������law encoding','position',[200,80,1500,900])
plotFD(fs, cnt_point, sample_ulaw_encoding, 'FD_U_Law_encoding');

figure('name', 'time domain������law expansion','position',[200,80,1500,900])
plotTD(t, sample_ulaw_expansion, 'TD_U_Law_expansion');
figure('name', 'frequency domain������law expansion','position',[200,80,1500,900])
plotFD(fs, cnt_point, sample_ulaw_expansion, 'FD_U_Law_expansion');

figure('name', 'time domain������law balance','position',[200,80,1500,900])
plotTD(t, sample_ulaw_balance, 'TD_U_Law_balance');
figure('name', 'frequency domain������law balance','position',[200,80,1500,900])
plotFD(fs, cnt_point, sample_ulaw_balance, 'FD_U_Law_balance');



%%% A�ɱ������� %%%

% ��дA_law_Quantization������ΪA�ɱ��������ĸ�������
% A��ѹ����ʱ���Σ�TD_A_Law_encoding
% A��ѹ����Ƶ��ͼ��FD_A_Law_encoding
% A�����ź�ʱ���Σ�TD_A_Law_expansion
% A�����ź�Ƶ��ͼ��FD_A_Law_expansion
% A�����ź�ʱ���Σ�TD_A_Law_expansion
% A�����ź�Ƶ��ͼ��FD_A_Law_expansion
[sample_Alaw_encoding, sample_Alaw_expansion, sample_Alaw_balance] = A_law_Quantization(sample);

figure('name', 'time domain����Alaw encoding','position',[200,80,1500,900])
plotTD(t, sample_Alaw_encoding, 'TD_A_Law_encoding');
figure('name', 'frequency domain����Alaw encoding','position',[200,80,1500,900])
plotFD(fs, cnt_point, sample_Alaw_encoding, 'FD_A_Law_encoding');

figure('name', 'time domain����Alaw expansion','position',[200,80,1500,900])
plotTD(t, sample_Alaw_expansion, 'TD_A_Law_expansion');
figure('name', 'frequency domain����Alaw expansion','position',[200,80,1500,900])
plotFD(fs, cnt_point, sample_Alaw_expansion, 'FD_A_Law_expansion');

figure('name', 'time domain����Alaw balance','position',[200,80,1500,900])
plotTD(t, sample_Alaw_balance, 'TD_A_Law_balance');
figure('name', 'frequency domain����Alaw balance','position',[200,80,1500,900])
plotFD(fs, cnt_point, sample_Alaw_balance, 'FD_A_Law_balance');



%%% �Ա� %%%

figure('name', 'time domain����comparison','position',[200,80,1500,900])
subplot(5,1,1),compare(t, sample, sample_Uniform);title('origin-8bits uniform'); % �Ա�ԭ���κ�8bits������������
subplot(5,1,2),compare(t, sample, sample_ulaw_expansion);title('origin-ulaw'); % �Ա�ԭ���κͦ�����������
subplot(5,1,3),compare(t, sample, sample_Alaw_expansion);title('origin-Alaw'); % �Ա�ԭ���κ�A����������
subplot(5,1,4),compare(t, sample_ulaw_expansion, sample_Alaw_expansion); title('ulaw-Alaw');% �ԱȦ����������κ�A����������
subplot(5,1,5),compare(t, sample_ulaw_expansion, sample_ulaw_balance); title('ulaw-ulaw balance');% �ԱȦ����������κͦ����������Ⲩ��
saveas(gcf, 'comparison', 'fig');



%%% ��չ���� %%%
fprintf('\n### ��չ���� ###\n');
average_track(sample); % ˫����ƽ��
reduction(sample, t, fs);  % ָ��˥��



%%% д��wav�ļ� %%%

audiowrite('sample_8bits_Uniform.wav',sample_Uniform,fs);
audiowrite('sample_ulaw.wav',sample_ulaw_expansion,fs);
audiowrite('sample_Alaw.wav',sample_Alaw_expansion,fs);

%%%%% END %%%%%