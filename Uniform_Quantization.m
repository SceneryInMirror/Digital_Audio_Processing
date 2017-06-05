function [sample_8bits_Uniform, sample_8bits_Uniform_balance] = Uniform_Quantization(sample)
% [sample_Uniform, sample_8bits_Uniform_balance] = Uniform_Quantization(sample)
% ������������
% ����Ϊ�ź��ļ������Ϊ8bits�������������룩���Լ��������ź��ļ�
% ��Ҫ����Ϊ����8bits�����źţ��������룩��������źţ���������ȼ���������������
% ����ʵ��8bits����������ȡ������8bits����������ȡ������8bits������ȡ�м�ֵ����nbits�������ܣ����жԱ�

% 8bits�����������������룩
% Bit8_Uniform_Quan��¼��������
% SNR_Bit8��¼�����
Bit8_Uniform_Quan = round(sample * 128) / 128;
SNR_Bit8 = SNR_calc(Bit8_Uniform_Quan, sample);
fprintf('\n8λ�������������: %f \n',SNR_Bit8);
sample_8bits_Uniform = Bit8_Uniform_Quan;

% 8bits��������������ȡ����
% ceil_Uniform_Quan��¼��������
% SNR_ceil��¼�����
ceil_Uniform_Quan = ceil(sample * 128) / 128;
SNR_ceil = SNR_calc(ceil_Uniform_Quan, sample);

% 8bits��������������ȡ����
% floor_Uniform_Quan��¼��������
% SNR_floor��¼�����
floor_Uniform_Quan = floor(sample * 128) / 128;
SNR_floor = SNR_calc(floor_Uniform_Quan, sample);

% 8bits����������ȡ����ȡ��������ȡ�����м�ֵ��
% mid_Uniform_Quan��¼��������
% SNR_mid��¼�����
mid_Uniform_Quan = (floor_Uniform_Quan + ceil_Uniform_Quan) / 2;
SNR_mid = SNR_calc(mid_Uniform_Quan, sample);

%%% 8bits�����������⣨�˲��� %%%
sample_8bits_Uniform_balance = Sample_Balance(sample_8bits_Uniform, length(sample));
SNR_Bit8_balance = SNR_calc(sample_8bits_Uniform_balance, sample);
fprintf('8λ�����������������: %f \n',SNR_Bit8_balance);

%n_bits��������
% Bitn_Uniform_Quan��¼��������
% SNR_Bitn��¼�����
syms bit_quan;
bit_quan = input('\n�������Զ�������λ��n��');
Bitn_Uniform_Quan = round(sample * (2 ^ (bit_quan - 1))) / (2 ^ (bit_quan - 1));
SNR_Bitn = SNR_calc(Bitn_Uniform_Quan, sample);
fprintf('\nnλ�������������: %f \n',SNR_Bitn);

% ���õ�����������ݽ������'SNR_Uniform.txt'�ļ���
fid = fopen('SNR_Uniform.txt','wt');
fprintf(fid, '8λ�������������(round): %f ',SNR_Bit8);
fprintf(fid, '\n8λ�������������(ceil): %f ',SNR_ceil);
fprintf(fid, '\n8λ�������������(floor): %f ',SNR_floor);
fprintf(fid, '\n8λ�������������(mid): %f ',SNR_mid);
fprintf(fid,'\n8λ�����������������: %f ',SNR_Bit8_balance);
fprintf(fid, '\nnλ�������������: %f ',SNR_Bitn);
fclose(fid);

end