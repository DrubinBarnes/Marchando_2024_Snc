% Paul Marchando
% Drubin Lab
% 2-19-24
% COMPARE WTs

WT_dir = '/Volumes/Paul_Paper/20240507/Compiled_Data/WT/PMY383.1_MOVIE_001.nd2 - C=0 Processed Results/LineROIs/';
% L_S_dir = '/Volumes/Paul_Paper/20240507/Compiled_Data/WT/PMY383.1_MOVIE_014.nd2 - C=0 Processed Results/LineROIs/';
L_S_dir = '/Volumes/Paul_Paper/20240507/Compiled_Data/WT/PMY383.1_MOVIE_013.nd2 - C=0 Processed Results/LineROIs/';

mic_per_pix = 0.065;

WT_list = [675,92,120,514,50];
% L_S_list = [264,208,410,392,219,12,127,78,153,142,146,326,380,378];
L_S_list = [149,155,54,128,299,123,14, 209];

WT_data = cell(size(WT_list));
L_S_data = cell(size(L_S_list));

for i = 1:length(WT_data)

    filespec = 'profiles.txt';
    temp_dir = dir([WT_dir 'PMY' '*c1_' sprintf('%d',WT_list(i)) filespec]);
    WT_data{i} = readtable([WT_dir temp_dir.name]);

end

WT_heights = cellfun(@height, WT_data);

for j = 1:length(L_S_data)

    filespec = 'profiles.txt';
    temp_dir = dir([L_S_dir 'PMY' '*c1_' sprintf('%d',L_S_list(j)) filespec]);
    L_S_data{j} = readtable([L_S_dir temp_dir.name]);

end

L_S_heights = cellfun(@height, L_S_data);

WT_avg = floor(mean(WT_heights));

WT_plot = nan(length(WT_list),WT_avg);

for m = 1:length(WT_list)

    temp_Data = WT_data{m};
    temp_Data = temp_Data.Value;
    WT_plot(m,:) = interp1(temp_Data, linspace(1,numel(temp_Data),WT_avg));

end

L_S_plot = nan(length(L_S_list),WT_avg);

for n = 1:length(L_S_list)

    temp_Data = L_S_data{n};
    temp_Data = temp_Data.Value;
    L_S_plot(n,:) = interp1(temp_Data, linspace(1,numel(temp_Data),WT_avg));

end

L_S_plot = [L_S_plot;WT_plot];

fig = gcf;
options.handle = fig;
options.color_area = [128 193 219]./255;    % Blue theme
options.color_line = [ 52 148 186]./255;
options.alpha      = 0.5;
options.line_width = 2;
options.error      = 'c95'; % 95 percent confidence interval
options.x_axis      = linspace(1,WT_avg,WT_avg).* mic_per_pix;
plot_areaerrorbar(WT_plot, options);
hold on

options.color_area = [243 169 114]./255;    % Orange theme
options.color_line = [236 112  22]./255;
plot_areaerrorbar(L_S_plot, options);
hold on

xlim([0 WT_avg*mic_per_pix])
%ylim([30 90])
xlabel('Length (µM)', 'FontSize', 40)
ylabel('Fluorescence (AU)', 'FontSize', 40)
ax = gca;
ax.FontSize = 40;
hold off

leg = legend('', 'Untreated', '','+ 500 µM 3-IAA');
