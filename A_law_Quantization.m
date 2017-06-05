function [sample_Alaw_encoding, sample_Alaw_expansion, sample_Alaw_balance] = A_law_Quantization(sample)
% [sample_Alaw_encoding, sample_Alaw_expansion, sample_Alaw_balance] = A_law_Quantization(sample)
% A�ɱ�����������
% ����Ϊ�ź��ļ������ΪA��ѹ�������ż��������ź��ļ�����������ȼ���������������

% ʵ��A�ɹ���
% 1.A��ѹ����sample_temp1��
% 2.����������sample_temp2��
% 3.A�����ţ�sample_temp3��
% 4.���⣨sample_Alaw_balance��

[m, n] = size(sample);
A = 87.6 * ones(m, n);

% ��flag1���sample�о���ֵС��1/A�����ݣ�flag2���sample�о���ֵ����1/A��1֮�������
flag1 = ceil(1 ./ A - abs(sample));
flag2 = ceil(abs(sample) - 1 ./ A);
sample_temp1 = sign(sample) .* (A .* flag1 .* abs(sample) ./ (1 + log(A)) + flag2 .* (1 + log(A .* (abs(sample) + (sample == 0)))) ./ (1 + log(A)));
sample_temp2 = round(sample_temp1 * 256) / 256;
sample_temp3 = sign(sample_temp2) .* (abs(sample_temp2) .* flag1 .* (1 + log(A)) ./ A + flag2 .* exp(abs(sample_temp2) .* (1 + log(A)) - 1) ./ A);
Bit8_A_Quan = sample_temp3;

% Bit8_A_Quan��¼��������
% SNR_Bit8_U��¼�����
SNR_Bit8_A = SNR_calc(Bit8_A_Quan, sample);
fprintf('\nA�����������: %f \n',SNR_Bit8_A);
sample_Alaw_encoding = sample_temp2;
sample_Alaw_expansion = Bit8_A_Quan;

%%% A�ɾ��⣨�˲��� %%%
sample_Alaw_balance = Sample_Balance(sample_Alaw_expansion, length(sample));
SNR_Bit8_A_balance = SNR_calc(sample_Alaw_balance, sample);
fprintf('A���������������: %f \n',SNR_Bit8_A_balance);

% ���õ�����������ݽ������'SNR_Alaw.txt'�ļ���
fid = fopen('SNR_Alaw.txt','wt');
fprintf(fid,'A�����������: %f \n',SNR_Bit8_A);
fprintf(fid,'A���������������: %f \n',SNR_Bit8_A_balance);
fclose(fid);

end


