function SNR = SNR_calc(noise, signal)
%SNR = SNR_calc(noise, singal)
%����Ϊ����ǰ��Ĳ��Σ���������

%Ps��ʾ�źŹ���
Ps = sum(signal.^2);

%Pn��ʾ������������
Pn = sum((noise - signal).^2);

%��������SNR = 10 * log10(Ps / Pn)
SNR = 10 * log10(Ps / Pn);

%����ʱʹ�ã�fprintf('\n%d %d\n', Ps, Pn);
end