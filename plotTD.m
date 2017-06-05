function plotTD(t, sample, name)
% plotTD(t, sample, name)
% 时域波形显示函数，针对单声道、双声道信号
% 输入为原信号文件（sample，需确保为单声道或双声道信号文件，否则会报错）和对应的时刻信息（t，需与信号对应，否则也会报错），以及生成图像文件的名称
% 若为双声道文件，则分别用sample_left和sample_right记录左、右声道，依次展示双声道、左声道、右声道波形
[point, track] = size(sample);
t_size = size(t);

% 信号与时刻信息不对应时会报错：ERROR.输入信号和时间信息不对应！
if (point ~= t_size)
    errordlg('输入信号和时间信息不对应！','error');
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
% 输入文件非双声道或单声道时会报错：ERROR.输入信号和时间信息不对应！
    errordlg('输入文件超出本程序处理范围！','error');

end;

% 保存图像至'TD.fig'文件
saveas(gcf, name, 'fig');

end