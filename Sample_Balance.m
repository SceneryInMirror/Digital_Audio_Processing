function sample_balance = sample_balance(sample, cnt_point)
% sample_balance = balance(sample)
% �źž��⺯��
% ��ȥ�ź��и���fs/2��Ƶ�ʣ��������źŻָ���ģ���ź�
% ���岽�裺
% 1.����������
% 2.Ƶ���˲�

window0 = boxcar(cnt_point / 2);
[row, line] = size(sample);
window0 = repmat(window0, 1, line);
window = zeros(row, line);
window(1:cnt_point / 2, 1:line) = window0;

sample_balance = 2 * real(ifft(fft(sample) .* window));

end