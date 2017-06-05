function [sample_Alaw_encoding, sample_Alaw_expansion, sample_Alaw_balance] = A_law_Quantization(sample)
% [sample_Alaw_encoding, sample_Alaw_expansion, sample_Alaw_balance] = A_law_Quantization(sample)
% A律编码量化函数
% 输入为信号文件，输出为A律压缩、扩张及均衡后的信号文件，并将信噪比计算结果输出到命令窗口

% 实现A律过程
% 1.A律压缩（sample_temp1）
% 2.均匀量化（sample_temp2）
% 3.A律扩张（sample_temp3）
% 4.均衡（sample_Alaw_balance）

[m, n] = size(sample);
A = 87.6 * ones(m, n);

% 用flag1标记sample中绝对值小于1/A的数据，flag2标记sample中绝对值介于1/A和1之间的数据
flag1 = ceil(1 ./ A - abs(sample));
flag2 = ceil(abs(sample) - 1 ./ A);
sample_temp1 = sign(sample) .* (A .* flag1 .* abs(sample) ./ (1 + log(A)) + flag2 .* (1 + log(A .* (abs(sample) + (sample == 0)))) ./ (1 + log(A)));
sample_temp2 = round(sample_temp1 * 256) / 256;
sample_temp3 = sign(sample_temp2) .* (abs(sample_temp2) .* flag1 .* (1 + log(A)) ./ A + flag2 .* exp(abs(sample_temp2) .* (1 + log(A)) - 1) ./ A);
Bit8_A_Quan = sample_temp3;

% Bit8_A_Quan记录波形数据
% SNR_Bit8_U记录信噪比
SNR_Bit8_A = SNR_calc(Bit8_A_Quan, sample);
fprintf('\nA律量化信噪比: %f \n',SNR_Bit8_A);
sample_Alaw_encoding = sample_temp2;
sample_Alaw_expansion = Bit8_A_Quan;

%%% A律均衡（滤波） %%%
sample_Alaw_balance = Sample_Balance(sample_Alaw_expansion, length(sample));
SNR_Bit8_A_balance = SNR_calc(sample_Alaw_balance, sample);
fprintf('A律量化均衡信噪比: %f \n',SNR_Bit8_A_balance);

% 将得到的信噪比数据将输出到'SNR_Alaw.txt'文件中
fid = fopen('SNR_Alaw.txt','wt');
fprintf(fid,'A律量化信噪比: %f \n',SNR_Bit8_A);
fprintf(fid,'A律量化均衡信噪比: %f \n',SNR_Bit8_A_balance);
fclose(fid);

end


