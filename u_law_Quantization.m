function [sample_ulaw_encoding, sample_ulaw_expansion, sample_ulaw_balance] = u_law_Quantization(sample)
% [sample_ulaw_encoding, sample_ulaw_expansion, sample_ulaw_balance] = u_law_Quantization(sample)
% μ律编码量化函数
% 输入为信号文件，输出为μ律压缩、扩张及均衡后的信号文件，并将信噪比计算结果输出到命令窗口

% 实现μ律过程
% 1.输入μ值（本次作业中应输入255）
% 2.μ律压缩（sample_temp1）
% 3.均匀量化（sample_temp2）
% 4.μ律扩张（sample_temp3）
% 5.均衡（sample_ulaw_balance）
mu = input('\n请输入μ值(正整数，本次作业中应输入255)：');
mu = abs(mu);
sample_temp1 = sign(sample) .* log(1 + (mu .* abs(sample))) / log(1 + mu);
sample_temp2 = round(sample_temp1 * 256) / 256;
sample_temp3 = sign(sample_temp2) .* ((1 + mu) .^ abs(sample_temp2) - 1) / mu;
Bit8_U_Quan = sample_temp3;

% Bit8_U_Quan记录波形数据
% SNR_Bit8_U记录信噪比
SNR_Bit8_U = SNR_calc(Bit8_U_Quan, sample);
fprintf('\nμ律量化信噪比: %f \n',SNR_Bit8_U);
sample_ulaw_encoding = sample_temp2;
sample_ulaw_expansion = Bit8_U_Quan;

%%% μ律均衡（滤波） %%%
sample_ulaw_balance = Sample_Balance(sample_ulaw_expansion, length(sample));
SNR_Bit8_U_balance = SNR_calc(sample_ulaw_balance, sample);
fprintf('μ律量化均衡信噪比: %f \n',SNR_Bit8_U_balance);

% 将得到的信噪比数据将输出到'SNR_ulaw.txt'文件中
fid = fopen('SNR_ulaw.txt','wt');
fprintf(fid,'μ律量化信噪比: %f \n',SNR_Bit8_U);
fprintf(fid,'μ律量化均衡信噪比: %f \n',SNR_Bit8_U_balance);
fclose(fid);

end


