% Paul Marchando
% Drubin Lab
% 2-19-24

WT_dir = '/Volumes/Paul_Paper/20240202/Compiled_Data/382.1/PMY382.1_MOVIE_022.nd2 - C=0 Processed Results/LineROIs/';
L_S_dir = '/Volumes/Paul_Paper/20240202/Compiled_Data/374.1/PMY374.1_MOVIE_003.nd2 - C=0 Processed Results/LineROIs/';
K_E_dir = '/Volumes/Paul_Paper/20240202/Compiled_Data/376.1/PMY376.1_MOVIE_006.nd2 - C=0 Processed Results/LineROIs/';
triple_PM_dir = '/Volumes/Paul_Paper/20240202/Compiled_Data/378.1/PMY378.1_MOVIE_009.nd2 - C=0 Processed Results/LineROIs/';

mic_per_pix = 0.065;

WT_list = [175,166,440,516,534,585,706,639,444];
L_S_list = [100,87,55,225,258,402,438,390,606,607,614,647,783,727,740,857,796,867,934];
K_E_list = [23,132,134,154,443,568,403,542,589,774,619,1026,223];
triple_PM_list = [22,41,56,74,105,123,186,140,179,221,345,343,272];

WT_data = cell(size(WT_list));
L_S_data = cell(size(L_S_list));
K_E_data = cell(size(K_E_list));
triple_PM_data = cell(size(triple_PM_list));

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

for k = 1:length(K_E_data)

    filespec = 'profiles.txt';
    temp_dir = dir([K_E_dir 'PMY' '*c1_' sprintf('%d',K_E_list(k)) filespec]);
    K_E_data{k} = readtable([K_E_dir temp_dir.name]);

end

K_E_heights = cellfun(@height, K_E_data);

for l = 1:length(triple_PM_data)

    filespec = 'profiles.txt';
    temp_dir = dir([triple_PM_dir 'PMY' '*c1_' sprintf('%d',triple_PM_list(l)) filespec]);
    triple_PM_data{l} = readtable([triple_PM_dir temp_dir.name]);

end

triple_PM_heights = cellfun(@height, triple_PM_data);


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

K_E_plot = nan(length(K_E_list),WT_avg);

for o = 1:length(K_E_list)

    temp_Data = K_E_data{o};
    temp_Data = temp_Data.Value;
    K_E_plot(o,:) = interp1(temp_Data, linspace(1,numel(temp_Data),WT_avg));

end

triple_PM_plot = nan(length(triple_PM_list),WT_avg);

for p = 1:length(triple_PM_list)

    temp_Data = triple_PM_data{p};
    temp_Data = temp_Data.Value;
    triple_PM_plot(p,:) = interp1(temp_Data, linspace(1,numel(temp_Data),WT_avg));

end


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

options.color_area =  [253 250 114]./255;    % Yellow theme
options.color_line =  [0.9290    0.6940    0.1250];
plot_areaerrorbar(K_E_plot, options);
hold on

options.color_area =  [144 238 144]./255;    % Green theme
options.color_line =  [ 0.4660    0.6740    0.1880];
plot_areaerrorbar(triple_PM_plot, options);
xlim([0 WT_avg*mic_per_pix])
ylim([30 90])
xlabel('Length (µM)', 'FontSize', 40)
ylabel('Fluorescence (AU)', 'FontSize', 40)
ax = gca;
ax.FontSize = 40;
hold off

leg = legend('', 'WT', '','L203S','','K21E K23E','','K21E K23E L203S');
