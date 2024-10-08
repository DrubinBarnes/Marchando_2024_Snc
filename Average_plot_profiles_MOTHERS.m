% Paul Marchando
% Drubin Lab
% 2-19-24

WT_dirs = {'/Volumes/Paul_Paper/2024-05-02/Compiled Data/441/PMY441_1-02.tif - C=0 Processed Results/LineROIs/',...
    '/Volumes/Paul_Paper/2024-05-02/Compiled Data/442/PMY442_1-01.tif - C=0 Processed Results/LineROIs/',...
    '/Volumes/Paul_Paper/2024-05-02/Compiled Data/442/PMY442_1-02.tif - C=0 Processed Results/LineROIs/'};

WT_cells = {[3 30 33 94], [164 19 31 43 127 55 30 147 75 145],...
    [123 113 112]};

L_S_dirs = {'/Volumes/Paul_Paper/2024-05-13/Compiled Data/450/PMY450_1-02.tif - C=0 Processed Results/LineROIs/',...
    '/Volumes/Paul_Paper/2024-05-13/Compiled Data/451/PMY451_1-01.tif - C=0 Processed Results/LineROIs/'...
    '/Volumes/Paul_Paper/2024-05-13/Compiled Data/451/PMY451_1-02.tif - C=0 Processed Results/LineROIs/'};

L_S_cells = {[84 35 123 77],...
    [158 131 56 147 7 112], [64 103 22 67 139]};

K_E_dirs = {'/Volumes/Paul_Paper/2024-05-13/Compiled Data/452/PMY452_1-01.tif - C=0 Processed Results/LineROIs/',...
    '/Volumes/Paul_Paper/2024-05-13/Compiled Data/452/PMY452_1-02.tif - C=0 Processed Results/LineROIs/',...
    '/Volumes/Paul_Paper/2024-05-13/Compiled Data/453/PMY453_1-01.tif - C=0 Processed Results/LineROIs/',...
    '/Volumes/Paul_Paper/2024-05-13/Compiled Data/453/PMY453_1-02.tif - C=0 Processed Results/LineROIs/'};

K_E_cells = {[26 33 143 44 167], [30 140 25 149 200],...
    [15 239 53], [181 37 161 76]};

triple_PM_dirs = {'/Volumes/Paul_Paper/2024-05-02/Compiled Data/423/PMY423_1-01.tif - C=0 Processed Results/LineROIs/',...
    '/Volumes/Paul_Paper/2024-05-02/Compiled Data/423/PMY423_1-02.tif - C=0 Processed Results/LineROIs/'};

triple_PM_cells = {[14 118 123 119 89 21 80 32 54], [32 132 24 107 101]};

% Combining WT data

comp_WT = cell(size(WT_dirs));

for i = 1:length(WT_dirs)

    comp_WT{i} = readPlots(WT_dirs{i}, WT_cells{i});

end

WT_data = horzcat(comp_WT{:});
WT_heights = cellfun(@height, WT_data);
WT_solo = cellfun(@(x)[x.Value],WT_data,'UniformOutput',false);
WT_mean = cellfun(@mean, WT_solo);


% Combining LS data

comp_L_S = cell(size(L_S_dirs));

for i = 1:length(L_S_dirs)

    comp_L_S{i} = readPlots(L_S_dirs{i}, L_S_cells{i});

end

L_S_data = horzcat(comp_L_S{:});
L_S_heights = cellfun(@height, L_S_data);
L_S_solo = cellfun(@(x)[x.Value],L_S_data,'UniformOutput',false);
L_S_mean = cellfun(@mean, L_S_solo);

% Combining KE data

comp_K_E = cell(size(K_E_dirs));

for i = 1:length(K_E_dirs)

    comp_K_E{i} = readPlots(K_E_dirs{i}, K_E_cells{i});

end

K_E_data = horzcat(comp_K_E{:});
K_E_heights = cellfun(@height, K_E_data);
K_E_solo = cellfun(@(x)[x.Value],K_E_data,'UniformOutput',false);
K_E_mean = cellfun(@mean, K_E_solo);

% Combining triple PM data

comp_triple_PM = cell(size(triple_PM_dirs));

for i = 1:length(triple_PM_dirs)

    comp_triple_PM{i} = readPlots(triple_PM_dirs{i}, triple_PM_cells{i});

end

triple_PM_data = horzcat(comp_triple_PM{:});
triple_PM_heights = cellfun(@height, triple_PM_data);
triple_PM_solo = cellfun(@(x)[x.Value],triple_PM_data,'UniformOutput',false);
triple_PM_mean = cellfun(@mean, triple_PM_solo);

mic_per_pix = 0.065;

WT_avg = floor(mean(WT_heights));

WT_plot = nan(length(WT_heights),WT_avg);

for m = 1:length(WT_heights)

    temp_Data = WT_data{m};
    temp_Data = temp_Data.Value;
    WT_plot(m,:) = interp1(temp_Data, linspace(1,numel(temp_Data),WT_avg));

end

L_S_plot = nan(length(L_S_heights),WT_avg);

for n = 1:length(L_S_heights)

    temp_Data = L_S_data{n};
    temp_Data = temp_Data.Value;
    L_S_plot(n,:) = interp1(temp_Data, linspace(1,numel(temp_Data),WT_avg));

end

K_E_plot = nan(length(K_E_heights),WT_avg);

for o = 1:length(K_E_heights)

    temp_Data = K_E_data{o};
    temp_Data = temp_Data.Value;
    K_E_plot(o,:) = interp1(temp_Data, linspace(1,numel(temp_Data),WT_avg));

end

triple_PM_plot = nan(length(triple_PM_heights),WT_avg);

for p = 1:length(triple_PM_heights)

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
% ylim([30 95])
xlabel('Length (µm)', 'FontSize', 40)
ylabel('Fluorescence (AU)', 'FontSize', 40)
ax = gca;
ax.FontSize = 40;
hold off

% leg = legend('', 'WT', '','L203S','','K21E K23E','','K21E K23E L203S');
set(gcf,'units','points','position',[100, 100, 950, 800])
