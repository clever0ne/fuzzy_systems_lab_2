function print_surface_plot(x1, x2, y, plotname, filename)
    figure('Name', plotname);
    surf(x1, x2, y);
    
    xticks(linspace(x1(1), x1(end), 5));
    yticks(linspace(x2(1), x2(end), 5));
    axis([x1(1), x1(end), x2(1), x2(end), 2, 5]);

    set(gca, 'FontName', 'Euclid', 'FontSize', 12);
    title(plotname, 'Interpreter', 'latex', 'FontSize', 12);
    xlabel('response', 'Interpreter', 'latex', 'FontSize', 12);
    ylabel('report',   'Interpreter', 'latex', 'FontSize', 12);
    zlabel('grade',    'Interpreter', 'latex', 'FontSize', 12);
    
    if (~exist('../../graphs', 'dir'))
        mkdir('../../graphs');
    end

    print(['../../graphs/', filename], '-dmeta', '-r0');
end