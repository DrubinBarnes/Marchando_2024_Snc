function [output] = readPlots(direc, cells)

output = cell(size(cells));

for i = 1:length(output)

    filespec = 'profiles.txt';
    temp_dir = dir([direc 'PMY' '*c1_' sprintf('%d',cells(i)) filespec]);
    output{i} = readtable([direc temp_dir.name]);

end