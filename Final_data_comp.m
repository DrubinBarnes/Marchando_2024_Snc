WT_dirs = {'/Volumes/Paul_Paper/20240202/Compiled_Data/382.1/PMY382.1_MOVIE_022.nd2 - C=0 Processed Results/LineROIs/',...
    '/Volumes/Paul_Paper/20240507/Compiled_Data/WT/PMY383.1_MOVIE_001.nd2 - C=0 Processed Results/LineROIs/',...
    '/Volumes/Paul_Paper/20240507/Compiled_Data/WT/PMY383.1_MOVIE_002.nd2 - C=0 Processed Results/LineROIs/',...
    '/Volumes/Paul_Paper/20240507/Compiled_Data/WT/PMY383.1_MOVIE_013.nd2 - C=0 Processed Results/LineROIs/',...
    '/Volumes/Paul_Paper/20240507/Compiled_Data/WT/PMY383.1_MOVIE_014.nd2 - C=0 Processed Results/LineROIs/'};

WT_cells = {[175 166 440 516 534 585 706 639 444],[675 92 120 514 50 507 124 514],...
    [57 110 88 282 398 222 137 109 322 94 342],[149 155 54 128 299 123 14 209 342],...
    [264 208 410 392 219 12 127 78 153 142 146 326 380 378]};

L_S_dirs = {'/Volumes/Paul_Paper/20240202/Compiled_Data/374.1/PMY374.1_MOVIE_003.nd2 - C=0 Processed Results/LineROIs/',...
    '/Volumes/Paul_Paper/20240507/Compiled_Data/L203S/PMY375.1_MOVIE_004.nd2 - C=0 Processed Results/LineROIs/'...
    '/Volumes/Paul_Paper/20240507/Compiled_Data/L203S/PMY375.1_MOVIE_005.nd2 - C=0 Processed Results/LineROIs/'};

L_S_cells = {[100 87 55 225 258 402 438 390 606 607 614 647 783 727 740 857 796 867 934],...
    [221 53 97 444 111 88 29 229 227 431], [46 147 182 258 243 432 339 123 130 11 149 394]};

K_E_dirs = {'/Volumes/Paul_Paper/20240202/Compiled_Data/376.1/PMY376.1_MOVIE_006.nd2 - C=0 Processed Results/LineROIs/',...
    '/Volumes/Paul_Paper/20240507/Compiled_Data/K21E_K23E/PMY377.1_MOVIE_007.nd2 - C=0 Processed Results/LineROIs/',...
    '/Volumes/Paul_Paper/20240507/Compiled_Data/K21E_K23E/PMY377.1_MOVIE_008.nd2 - C=0 Processed Results/LineROIs/'};

K_E_cells = {[23 132 134 154 443 568 403 542 589 774 619 1026 223], [378 430 15 464 274 148],...
    [190 193 124 345 445 313 185]};

triple_PM_dirs = {'/Volumes/Paul_Paper/20240202/Compiled_Data/378.1/PMY378.1_MOVIE_009.nd2 - C=0 Processed Results/LineROIs/',...
    '/Volumes/Paul_Paper/20240507/Compiled_Data/Triple_PM/PMY379.1_MOVIE_010.nd2 - C=0 Processed Results/LineROIs/',...
    '/Volumes/Paul_Paper/20240507/Compiled_Data/Triple_PM/PMY379.1_MOVIE_011.nd2 - C=0 Processed Results/LineROIs/'};

triple_PM_cells = {[22 41 56 74 105 123 186 140 179 221 345 343 272], [336 83 108 91 45 59 154],...
    [118 213 51 85 242 136]};

comp_WT = cell(size(WT_dirs));

for i = 1:length(WT_dirs)

    comp_WT{i} = readPlots(WT_dirs{i}, WT_cells{i});

end

comp_L_S = cell(size(L_S_dirs));

for i = 1:length(L_S_dirs)

    comp_L_S{i} = readPlots(L_S_dirs{i}, L_S_cells{i});

end

comp_K_E = cell(size(K_E_dirs));

for i = 1:length(K_E_dirs)

    comp_K_E{i} = readPlots(K_E_dirs{i}, K_E_cells{i});

end

comp_triple_PM = cell(size(triple_PM_dirs));

for i = 1:length(triple_PM_dirs)

    comp_triple_PM{i} = readPlots(triple_PM_dirs{i}, triple_PM_cells{i});

end

