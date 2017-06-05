# Matlab
It is the first time for me to use Matlab to finish a project.

And there are some problems and solutions I want to record. 

music.wav:样例音频

实验报告请见:report.pdf

主函数程序代码请见:Digital_Audio_Processing.m

如若运行主函数代码，将会产生近1GB的文件，请当心~具体操作方法请见report.pdf的‘附0：程序使用样例’部分



--------------------------------------------
#### 函数文件：

wavread.m  % 读取样例音频

SNR_calc.m  % 计算信噪比

plotTD.m  % 显示时域波形

plotFD.m  % 显示频谱图

Uniform_Quantization.m  % 均匀量化

A_law_Quantization.m  % A律量化

u_law_Quantization.m  % μ律量化

Sample_Balance.m  % 均衡函数

compare.m  % 对比函数

average_track.m  % 双声道平均

reduction.m  % 衰减函数

函数的具体功能说明和代码请见report.pdf



-----------------------------------------------
‘static_image_audio’文件夹内保存有实验过程中的图像文件、音频文件及有关数据：

reduction_sample.wav：衰减后的音频

sample_8bits_Uniform.wav：8bits均匀量化后的音频

sample_Alaw.wav：A律量化后的音频

sample_ulaw.wav：μ律量化后的音频

SNR_Alaw.txt：A律量化的信噪比

SNR_ulaw.txt：μ律量化的信噪比

SNR_Uniform.txt：8bits均匀量化的信噪比

comparison.png：时域对比波形0

compare1.png：时域对比波形1

compare2.png：时域对比波形2

compare3.png：时域对比波形3

FD_origin.png：原始音频频谱图

zoomup.png：放大的相位谱

FD_A_Law_encoding.png：A律压缩频谱图

FD_A_Law_expansion.png：A律扩张频谱图

FD_A_Law_balance.png：A律均衡频谱图

FD_U_Law_encoding.png：μ律压缩频谱图

FD_U_Law_expansion.png：μ律扩张频谱图

FD_U_Law_balance.png：μ律均衡频谱图

FD_Uniform.png：8bits均匀量化频谱图

FD_Uniform_balance.png：8bits均匀量化均衡频谱图

TD_origin.png：原始音频时域波形

TD_A_Law_encoding.png：A律压缩时域波形

TD_A_Law_expansion.png：A律扩张时域波形

TD_A_Law_balance.png：A律均衡时域波形

TD_U_Law_encoding.png：μ律压缩时域波形

TD_U_Law_expansion.png：μ律扩张时域波形

TD_U_Law_balance.png：μ律均衡时域波形

TD_Uniform.png：8bits均匀量化时域波形

TD_Uniform_balance.png：8bits均匀量化均衡时域波形
