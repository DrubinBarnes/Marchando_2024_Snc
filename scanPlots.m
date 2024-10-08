function scanPlots(comp_data, comp_cells)

fig = gcf;
ax = axes('Parent', fig);

% ind = 0;

% for i = 1:length(comp_cells)

%     ind = ind + length(comp_cells{i});

% end

max_k = length(comp_cells);
k = 1;

while k <= max_k

    trace = comp_data{k};

    plot(ax, trace,"Var1","Value")

    hold(ax, 'on');

    title(ax, ['cell # ',num2str(comp_cells(k)),'']);

    hold(ax, 'off');

    was_a_key = waitforbuttonpress;
    if was_a_key && strcmp(get(fig, 'CurrentKey'), 'leftarrow')
      k = k - 1;
    else
      k = k + 1;
    end

end