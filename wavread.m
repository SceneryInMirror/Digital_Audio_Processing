function [x, fs, nbits] = wavread(filename)
% [x, fs, nbits] = wavread(filename)
% ģ���װ�ϰ汾��wavread��������ȡ���ݡ������ʡ�����λ��  

% ����audioread��ȡ���ݺͲ�����
[x, fs] = audioread(filename);

% ����audioinfo��ȡ����λ��
info = audioinfo(filename);
nbits = info.BitsPerSample;

end
