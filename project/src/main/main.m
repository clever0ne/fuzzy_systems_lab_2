clc; clear; close all;

n = 21;
xmin = 0;
xmax = 10;
x1 = linspace(xmin, xmax, n);
x2 = linspace(xmin, xmax, n);

y = 2 : 5;
x = reshape(cat(3, repmat(x1, length(x2), 1)', ...
                   repmat(x2, length(x1), 1)), [], 2, 1);

fis1 = readfis('../model/mamdani_trimf_5in_trimf_4out.fis');
y1 = reshape(evalfis(fis1, x), length(x1), length(x2))';
print_surface_plot(x1, x2, y1, 'Mamdani Triangle MF Surface', ...
                   'mamdani_trimf_5in_trimf_4out_surface.emf')

fis2 = readfis('../model/mamdani_trimf_5in_gaussmf_4out.fis');
y2 = reshape(evalfis(fis2, x), length(x1), length(x2))';
print_surface_plot(x1, x2, y2, 'Mamdani Triangle-Gauss MF Surface', ...
                   'mamdani_trimf_5in_gaussmf_4out_surface.emf')

fis3 = readfis('../model/mamdani_gaussmf_5in_trimf_4out.fis');
y3 = reshape(evalfis(fis3, x), length(x1), length(x2))';
print_surface_plot(x1, x2, y3, 'Mamdani Gauss-Triangle MF Surface', ...
                   'mamdani_gaussmf_5in_trimf_4out_surface.emf')

fis4 = readfis('../model/mamdani_gaussmf_5in_gaussmf_4out.fis');
y4 = reshape(evalfis(fis4, x), length(x1), length(x2))';
print_surface_plot(x1, x2, y4, 'Mamdani Gauss MF Surface', ...
                   'mamdani_gaussmf_5in_gaussmf_4out_surface.emf')

print_membership_functions_plot('response', x1, 5, 'trimf', ...
                                'Triangle MF', 'response_trimf_5in.emf');
print_membership_functions_plot('response', x1, 5, 'gaussmf', ...
                                'Gauss MF', 'response_gaussmf_5in.emf');

print_membership_functions_plot('report', x2, 5, 'trimf', ...
                                'Triangle MF', 'report_trimf_5in.emf');
print_membership_functions_plot('report', x2, 5, 'gaussmf', ...
                                'Gauss MF', 'report_gaussmf_5in.emf');

print_membership_functions_plot('grade', y, 4, 'trimf', ...
                                'Triangle MF', 'grade_trimf_4out.emf');
print_membership_functions_plot('grade', y, 4, 'gaussmf', ...
                                'Gauss MF', 'grade_gaussmf_4out.emf');

s1 = 0.75;
s2 = 1.25;

fis5 = fis1; fis6 = fis1;
fis7 = fis4; fis8 = fis4;

for k = 1 : 5
    p = fis1.Inputs(1).MembershipFunctions(k).Parameters;
    p1 = [p(2) - s1 * (p(2) - p(1)), p(2), p(2) + s1 * (p(3) - p(2))];
    p2 = [p(2) - s2 * (p(2) - p(1)), p(2), p(2) + s2 * (p(3) - p(2))];
    fis5.Inputs(1).MembershipFunctions(k).Parameters = p1;
    fis6.Inputs(1).MembershipFunctions(k).Parameters = p2;

    p = fis4.Inputs(1).MembershipFunctions(k).Parameters;
    p1 = [s1 * p(1), p(2)];
    p2 = [s2 * p(1), p(2)];
    fis7.Inputs(1).MembershipFunctions(k).Parameters = p1;
    fis8.Inputs(1).MembershipFunctions(k).Parameters = p2;
end

for k = 1 : 5
    p = fis1.Inputs(2).MembershipFunctions(k).Parameters;
    p1 = [p(2) - s1 * (p(2) - p(1)), p(2), p(2) + s1 * (p(3) - p(2))];
    p2 = [p(2) - s2 * (p(2) - p(1)), p(2), p(2) + s2 * (p(3) - p(2))];
    fis5.Inputs(2).MembershipFunctions(k).Parameters = p1;
    fis6.Inputs(2).MembershipFunctions(k).Parameters = p2;

    p = fis4.Inputs(2).MembershipFunctions(k).Parameters;
    p1 = [s1 * p(1), p(2)];
    p2 = [s2 * p(1), p(2)];
    fis7.Inputs(2).MembershipFunctions(k).Parameters = p1;
    fis8.Inputs(2).MembershipFunctions(k).Parameters = p2;
end

for k = 1 : 4
    p = fis1.Outputs(1).MembershipFunctions(k).Parameters;
    p1 = [p(2) - s1 * (p(2) - p(1)), p(2), p(2) + s1 * (p(3) - p(2))];
    p2 = [p(2) - s2 * (p(2) - p(1)), p(2), p(2) + s2 * (p(3) - p(2))];
    fis5.Outputs(1).MembershipFunctions(k).Parameters = p1;
    fis6.Outputs(1).MembershipFunctions(k).Parameters = p2;

    p = fis4.Outputs(1).MembershipFunctions(k).Parameters;
    p1 = [s1 * p(1), p(2)];
    p2 = [s2 * p(1), p(2)];
    fis7.Outputs(1).MembershipFunctions(k).Parameters = p1;
    fis8.Outputs(1).MembershipFunctions(k).Parameters = p2;
end

print_surface_plot(x1, x2, y1, 'Mamdani Normal Triangle MF Surface', ...
                   'mamdani_normal_trimf_5in_trimf_4out_surface.emf')
y5 = reshape(evalfis(fis5, x), length(x1), length(x2))';
print_surface_plot(x1, x2, y5, 'Mamdani Compressed Triangle MF Surface', ...
                   'mamdani_compressed_trimf_5in_trimf_4out_surface.emf')
y6 = reshape(evalfis(fis6, x), length(x1), length(x2))';
print_surface_plot(x1, x2, y6, 'Mamdani Stretched Triangle MF Surface', ...
                   'mamdani_stretched_trimf_5in_trimf_4out_surface.emf')

print_surface_plot(x1, x2, y4, 'Mamdani Normal Gauss MF Surface', ...
                   'mamdani_normal_gaussmf_5in_gaussmf_4out_surface.emf')
y7 = reshape(evalfis(fis7, x), length(x1), length(x2))';
print_surface_plot(x1, x2, y7, 'Mamdani Compressed Gauss MF Surface', ...
                   'mamdani_compressed_gaussmf_5in_gaussmf_4out_surface.emf')
y8 = reshape(evalfis(fis8, x), length(x1), length(x2))';
print_surface_plot(x1, x2, y8, 'Mamdani Stretched Gauss MF Surface', ...
                   'mamdani_stretched_gaussmf_5in_gaussmf_4out_surface.emf')

print_membership_functions_plot('response', x1, 5, 'trimf', 'Normal Triangle MF', ...
                                'response_normal_trimf_5in.emf');
print_membership_functions_plot('response', x1, 5, 'trimf', 'Compressed Triangle MF', ...
                                'response_compressed_trimf_5in.emf', s1);
print_membership_functions_plot('response', x1, 5, 'trimf', 'Stretched Triangle MF', ...
                                'response_stretched_trimf_5in.emf', s2);

print_membership_functions_plot('response', x1, 5, 'gaussmf', 'Normal Gauss MF', ...
                                'response_normal_gaussmf_5in.emf');
print_membership_functions_plot('response', x1, 5, 'gaussmf', 'Compressed Gauss MF', ...
                                'response_compressed_gaussmf_5in.emf', s1);
print_membership_functions_plot('response', x1, 5, 'gaussmf', 'Stretched Gauss MF', ...
                                'response_stretched_gaussmf_5in.emf', s2);

print_membership_functions_plot('report', x2, 5, 'trimf', 'Normal Triangle MF', ...
                                'report_normal_trimf_5in.emf');
print_membership_functions_plot('report', x2, 5, 'trimf', 'Compressed Triangle MF', ...
                                'report_compressed_trimf_5in.emf', s1);
print_membership_functions_plot('report', x2, 5, 'trimf', 'Stretched Triangle MF', ...
                                'report_stretched_trimf_5in.emf', s2);

print_membership_functions_plot('report', x2, 5, 'gaussmf', 'Normal Gauss MF', ...
                                'report_normal_gaussmf_5in.emf');
print_membership_functions_plot('report', x2, 5, 'gaussmf', 'Compressed Gauss MF', ...
                                'report_compressed_gaussmf_5in.emf', s1);
print_membership_functions_plot('report', x2, 5, 'gaussmf', 'Stretched Gauss MF', ...
                                'report_stretched_gaussmf_5in.emf', s2);

print_membership_functions_plot('grade', y, 4, 'trimf', 'Normal Triangle MF', ...
                                'grade_normal_trimf_4out.emf');
print_membership_functions_plot('grade', y, 4, 'trimf', 'Compressed Triangle MF', ...
                                'grade_compressed_trimf_4out.emf', s1);
print_membership_functions_plot('grade', y, 4, 'trimf', 'Stretched Triangle MF', ...
                                'grade_stretched_trimf_4out.emf', s2);

print_membership_functions_plot('grade', y, 4, 'gaussmf', 'Normal Gauss MF', ...
                                'grade_normal_gaussmf_4out.emf');
print_membership_functions_plot('grade', y, 4, 'gaussmf', 'Compressed Gauss MF', ...
                                'grade_compressed_gaussmf_4out.emf', s1);
print_membership_functions_plot('grade', y, 4, 'gaussmf', 'Stretched Gauss MF', ...
                                'grade_stretched_gaussmf_4out.emf', s2);

fis9 = fis4;
fis9.Rules(1).Weight = 0.1;
fis9.Rules(3).Weight = 0.1;
y9 = reshape(evalfis(fis9, x), length(x1), length(x2))';

print_surface_plot(x1, x2, y4, 'Mamdani Gauss MF Surface With Default Weights', ...
                   'mamdani_gaussmf_5in_gaussmf_4out_surface_default.emf')
print_surface_plot(x1, x2, y9, 'Mamdani Gauss MF Surface With Custom Weights', ...
                   'mamdani_gaussmf_5in_gaussmf_4out_surface_custom.emf')

print_surface_plot(x1, x2, y1, '', 'mamdani_5in_4out_surface.emf')
print_membership_functions_plot('response', x1, 5, 'trimf', '', 'response_5in.emf');
print_membership_functions_plot('report',   x2, 5, 'trimf', '', 'report_5in.emf');
print_membership_functions_plot('grade',    y,  4, 'trimf', '', 'grade_4out.emf');
