function [x, fs, nbits] = wavread(filename)
% [x, fs, nbits] = wavread(filename)
% 模拟封装老版本的wavread函数，读取数据、采样率、采样位数  

% 利用audioread读取数据和采样率
[x, fs] = audioread(filename);

% 利用audioinfo读取采样位数
info = audioinfo(filename);
nbits = info.BitsPerSample;

end
