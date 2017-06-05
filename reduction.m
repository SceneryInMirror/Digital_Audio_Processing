function reduction_sample = reduction(sample, t, fs)
% reduction_sample = reduction(sample, t, fs)
% ˥������
% ��ʱ�����ָ��˥����������ʵ��˥��Ч��

production = exp(-0.5 * t);
production = production';
production = repmat(production, 1, 2);
reduction_sample = sample .* production;
audiowrite('reduction_sample.wav',reduction_sample, fs);
end