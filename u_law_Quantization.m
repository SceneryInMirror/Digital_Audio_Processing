function [sample_ulaw_encoding, sample_ulaw_expansion, sample_ulaw_balance] = u_law_Quantization(sample)
% [sample_ulaw_encoding, sample_ulaw_expansion, sample_ulaw_balance] = u_law_Quantization(sample)
% ���ɱ�����������
% ����Ϊ�ź��ļ������Ϊ����ѹ�������ż��������ź��ļ�����������ȼ���������������

% ʵ�֦��ɹ���
% 1.�����ֵ��������ҵ��Ӧ����255��
% 2.����ѹ����sample_temp1��
% 3.����������sample_temp2��
% 4.�������ţ�sample_temp3��
% 5.���⣨sample_ulaw_balance��
mu = input('\n�������ֵ(��������������ҵ��Ӧ����255)��');
mu = abs(mu);
sample_temp1 = sign(sample) .* log(1 + (mu .* abs(sample))) / log(1 + mu);
sample_temp2 = round(sample_temp1 * 256) / 256;
sample_temp3 = sign(sample_temp2) .* ((1 + mu) .^ abs(sample_temp2) - 1) / mu;
Bit8_U_Quan = sample_temp3;

% Bit8_U_Quan��¼��������
% SNR_Bit8_U��¼�����
SNR_Bit8_U = SNR_calc(Bit8_U_Quan, sample);
fprintf('\n�������������: %f \n',SNR_Bit8_U);
sample_ulaw_encoding = sample_temp2;
sample_ulaw_expansion = Bit8_U_Quan;

%%% ���ɾ��⣨�˲��� %%%
sample_ulaw_balance = Sample_Balance(sample_ulaw_expansion, length(sample));
SNR_Bit8_U_balance = SNR_calc(sample_ulaw_balance, sample);
fprintf('�����������������: %f \n',SNR_Bit8_U_balance);

% ���õ�����������ݽ������'SNR_ulaw.txt'�ļ���
fid = fopen('SNR_ulaw.txt','wt');
fprintf(fid,'�������������: %f \n',SNR_Bit8_U);
fprintf(fid,'�����������������: %f \n',SNR_Bit8_U_balance);
fclose(fid);

end


