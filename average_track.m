function average_sample = average_track(sample)
% average_track(sample)
% ˫����ƽ������

sample_left = sample(:,1);
sample_right = sample(:,2);

average_sample = (sample_left + sample_right) / 2;
average_sample = repmat(average_sample, 1, 2);
average_sample = round(average_sample * 128) / 128;
SNR_average = SNR_calc(average_sample, sample);
fprintf('\n˫����ƽ���������������: %f \n',SNR_average);

end

