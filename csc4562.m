[y, fs]=audioread('blake1.wav'); % Read wave file
left=y(:,1); % Left channel 
right=y(:,2); % Right channel



%Failed attempt at a better plot
%%spectrogram(left);
% size('blake1.wav');
% length(left)
% whos left;
% whos fs;
% TotalTime = length(left)./fs;
% t = 0:TotalTime/(length(left)):TotalTime-TotalTime/length(left);
% plot(t,left)

normalize(left); % normalize the audio
%lowpass(left, .5);

findpeaks(left,"MinPeakDistance",10000,"MinPeakHeight",.018); % plot the graph w/ keys selected

[major_peaks, index] = findpeaks(left,"MinPeakDistance",10000,"MinPeakHeight",.018);% record values of peaks.
indices=index;                                                                      % get index values
distances = mean(diff(indices));                                                    %Average distance between presses
average = mean(major_peaks);                                                        % Average volume of each press
