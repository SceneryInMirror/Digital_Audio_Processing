function [sample_8bits_Uniform, sample_8bits_Uniform_balance] = Uniform_Quantization(sample)
% [sample_Uniform, sample_8bits_Uniform_balance] = Uniform_Quantization(sample)
% 均匀量化函数
% 输入为信号文件，输出为8bits量化（四舍五入）后以及均衡后的信号文件
% 主要功能为产生8bits量化信号（四舍五入）及均衡后信号，并将信噪比计算结果输出到命令窗口
% 辅助实现8bits量化（向上取整）、8bits量化（向下取整）、8bits量化（取中间值）、nbits量化功能，进行对比

% 8bits均匀量化（四舍五入）
% Bit8_Uniform_Quan记录波形数据
% SNR_Bit8记录信噪比
Bit8_Uniform_Quan = round(sample * 128) / 128;
SNR_Bit8 = SNR_calc(Bit8_Uniform_Quan, sample);
fprintf('\n8位均匀量化信噪比: %f \n',SNR_Bit8);
sample_8bits_Uniform = Bit8_Uniform_Quan;

% 8bits均匀量化（向上取整）
% ceil_Uniform_Quan记录波形数据
% SNR_ceil记录信噪比
ceil_Uniform_Quan = ceil(sample * 128) / 128;
SNR_ceil = SNR_calc(ceil_Uniform_Quan, sample);

% 8bits均匀量化（向下取整）
% floor_Uniform_Quan记录波形数据
% SNR_floor记录信噪比
floor_Uniform_Quan = floor(sample * 128) / 128;
SNR_floor = SNR_calc(floor_Uniform_Quan, sample);

% 8bits均匀量化（取向上取整和向下取整的中间值）
% mid_Uniform_Quan记录波形数据
% SNR_mid记录信噪比
mid_Uniform_Quan = (floor_Uniform_Quan + ceil_Uniform_Quan) / 2;
SNR_mid = SNR_calc(mid_Uniform_Quan, sample);

%%% 8bits均匀量化均衡（滤波） %%%
sample_8bits_Uniform_balance = Sample_Balance(sample_8bits_Uniform, length(sample));
SNR_Bit8_balance = SNR_calc(sample_8bits_Uniform_balance, sample);
fprintf('8位均匀量化均衡信噪比: %f \n',SNR_Bit8_balance);

%n_bits均匀量化
% Bitn_Uniform_Quan记录波形数据
% SNR_Bitn记录信噪比
syms bit_quan;
bit_quan = input('\n请输入自定义量化位数n：');
Bitn_Uniform_Quan = round(sample * (2 ^ (bit_quan - 1))) / (2 ^ (bit_quan - 1));
SNR_Bitn = SNR_calc(Bitn_Uniform_Quan, sample);
fprintf('\nn位均匀量化信噪比: %f \n',SNR_Bitn);

% 将得到的信噪比数据将输出到'SNR_Uniform.txt'文件中
fid = fopen('SNR_Uniform.txt','wt');
fprintf(fid, '8位均匀量化信噪比(round): %f ',SNR_Bit8);
fprintf(fid, '\n8位均匀量化信噪比(ceil): %f ',SNR_ceil);
fprintf(fid, '\n8位均匀量化信噪比(floor): %f ',SNR_floor);
fprintf(fid, '\n8位均匀量化信噪比(mid): %f ',SNR_mid);
fprintf(fid,'\n8位均匀量化均衡信噪比: %f ',SNR_Bit8_balance);
fprintf(fid, '\nn位均匀量化信噪比: %f ',SNR_Bitn);
fclose(fid);

end