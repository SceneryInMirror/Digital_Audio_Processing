function plotTD(t, sample, name)
% plotTD(t, sample, name)
% ʱ������ʾ��������Ե�������˫�����ź�
% ����Ϊԭ�ź��ļ���sample����ȷ��Ϊ��������˫�����ź��ļ�������ᱨ���Ͷ�Ӧ��ʱ����Ϣ��t�������źŶ�Ӧ������Ҳ�ᱨ�����Լ�����ͼ���ļ�������
% ��Ϊ˫�����ļ�����ֱ���sample_left��sample_right��¼��������������չʾ˫������������������������
[point, track] = size(sample);
t_size = size(t);

% �ź���ʱ����Ϣ����Ӧʱ�ᱨ��ERROR.�����źź�ʱ����Ϣ����Ӧ��
if (point ~= t_size)
    errordlg('�����źź�ʱ����Ϣ����Ӧ��','error');
elseif (track == 2)
    sample_left = sample(:,1);
    sample_right = sample(:,2);
    subplot(3,1,1);plot(t, sample);
        title('time domain waveform');
        xlabel('time (seconds)');
        ylim([-1 1]);
    subplot(3,1,2);plot(t, sample_left,'b');
        title('left track');
        xlabel('time (seconds)');
        ylim([-1 1]);
    subplot(3,1,3);plot(t, sample_right,'r');
        title('right track');
        xlabel('time (seconds)');
        ylim([-1 1]);
elseif (track == 1)
    plot(t, sample);
    title('time domain waveform');
    xlabel('time (seconds)');
    ylim([-1 1]);
else
% �����ļ���˫����������ʱ�ᱨ��ERROR.�����źź�ʱ����Ϣ����Ӧ��
    errordlg('�����ļ�������������Χ��','error');

end;

% ����ͼ����'TD.fig'�ļ�
saveas(gcf, name, 'fig');

end