%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%                           Lab 07 Tester-Zipper                          % 
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% Clear out any variables
clear, clc;

% Use a compact output format for easier visual comparison with test cases
format compact; % you can switch back to default by typing "format loose"

% Lab name for labeling submission zip
lab = 'Lab07';

name1 = 'myLagrange.m';
name2 = 'compareInterpMethods.m';
name3 = 'newtonsMethod.m';
name4 = 'bisectionMethod.m';
name5 = 'myFzero.m';
name6 = 'damping.m';
name7 = 'newtons2D.m';

files = {name1,name2,name3,name4,name5,name6,name7};

%% Test Problem 1.1
fprintf('\n********** Problem 1.1 **********\n')
fprintf('          function [y_dot,p] = myLagrange(x,y,x_dot)')
fprintf('\n*******************************\n')

fprintf('********* Test case 1 *********\n\n')
fprintf('Your result:\n')
[yy,p] = myLagrange([1,2,3,4],[5,-2,3,0],[1.5,2.5])
fprintf('\nThe correct result is:\n yy = \n     -1.2500    0.2500\n')
fprintf('p = \n     -3.3333   26.0000  -61.6667   44.0000\n')

%% Test Problem 1.2
fprintf('\n********** Problem 1.2 **********\n')
fprintf('          [fig, y_dot] = compareInterpMethods(x,y,x_dot,interp_methods)')
fprintf('\n*******************************\n')

fprintf('********* Test case 1 *********\n\n')
x = 1:10;
y = [4.5, 2, 0.5, 0, 0.5, 2, 4.5, 0, 4.5, 10];
xx = 1:.1:10;
[fig,y_dot] = compareInterpMethods(x,y,xx,{'linear','lagrange','spline','pchip'});
% This case produces the figure like the figure in the pdf.

%% Test Problem 2.1
fprintf('\n********** Problem 2.1 **********\n')
fprintf('          [rt, n_iter] = newtonsMethod(f, df, x0, tol, max_iter)')
fprintf('\n*******************************\n')

fprintf('********* Test case 1 *********\n\n')
fprintf('Your result:\n')
[rt, n_iter] = newtonsMethod(@sin,@cos,pi/4,0.001,100)
fprintf('\nThe correct result is:\n rt = \n     -1.2602e-08\n')
fprintf('n_iter = \n     3\n')


%% Test Problem 2.2
fprintf('\n********** Problem 2.2 **********\n')
fprintf('          [rt, n_iter] = bisectionMethod(f, interval, tol, max_iter)')
fprintf('\n*******************************\n')

fprintf('********* Test case 1 *********\n\n')
fprintf('Your result:\n')
[rt, n_iter] = bisectionMethod(@sin,[-pi/3, pi/4],0.001,100)
fprintf('\nThe correct result is:\n rt = \n    -2.5566e-04\n')
fprintf('n_iter = \n     9\n')



%% Test Problem 2.3
fprintf('\n********** Problem 2.3 **********\n')
fprintf('          [rt, n_iter] = bisectionMethod(f, interval, tol, max_iter)')
fprintf('\n*******************************\n')

fprintf('********* Test case 1 *********\n\n')
fprintf('Your result:\n')
[poly_rts, rts_found, n_iters] = myFzero([5,-4,3,-2,-1],1,[-10 0],100)
fprintf('\nThe correct result is:\n poly_rts = \n    0.9007 + 0.0000i\n   0.0980 - 0.8597i\n   0.0980 + 0.8597i\n  -0.2966 + 0.0000i\n')
fprintf('rts_found = \n     0.9007   -0.2966    0.9007   -0.2966\n')
fprintf('n_iters = \n     10     9     5    53\n')


%% Test Problem 3
fprintf('\n********** Problem 3 **********\n')
fprintf('          [t] = damping(k1,k2,x0,interval,tol, max_iter)')
fprintf('\n*******************************\n')

fprintf('********* Test case 1 *********\n\n')
fprintf('Your result:\n')
[t] = damping(1000,0.6,5.5,[5 6],1e-6,50)
fprintf('\nThe correct result is:\n t = \n    5.5000    5.5000\n')
fprintf('********* Test case 2 *********\n\n')
fprintf('Your result:\n')
[t] = damping(1000,0.6,4.97,[4.97-0.5 4.97+0.5],1e-6,50)
fprintf('\nThe correct result is:\n t = \n    9.5000    4.5000\n')


%% Test Problem 4
fprintf('\n********** Problem 4 **********\n')
fprintf('          [rts, fig] = newtons2D(f, dfdx, dfdy, X, Y, pts, n_iter))')
fprintf('\n*******************************\n')

fprintf('********* Test case 1 *********\n\n')
fprintf('Your result:\n')
f = @(x,y) x.^2+2*y.^2-10;
dfdx = @(x,y) 2*x;
dfdy = @(x,y) 4*y;
[X,Y] = meshgrid(-5:.1:5,-5:.1:5);
pts = [5*cos(linspace(0,2*pi)'), 5*sin(linspace(0,2*pi)')];
newtons2D(f,dfdx,dfdy,X,Y,pts,0);
newtons2D(f,dfdx,dfdy,X,Y,pts,1);
pts = newtons2D(f,dfdx,dfdy,X,Y,pts,2);
% These cases produce the figures from the pdf
pts(1:3,:)
fprintf('\nThe correct result is:\n ans = \n    3.1786         0\n3.1757    0.1041\n3.1668    0.2110\n')   
    
%% Zip files

% Lab name
lab = 'Lab07';

% List of function files to zip into submission zip
% You may edit this list if you wish to include other functions
files = {'myLagrange.m','compareInterpMethods.m','newtonsMethod.m','bisectionMethod.m','myFzero.m','damping.m','newtons2D.m'};
disp('Zipping...')

% Search for lab files
found = -1*ones(1,length(files));
for n = 1:length(files)
    if ~exist(files{n},'file')
        disp(['WARNING: ',files{n},' not found!']);
    else
        found(n) = n;
    end
end
found = found(found > 0);
try
    % Zip all files that were found
    zip(lab,files(found));
    
    % Success/Warning output
    if length(found) == length(files)
        disp('Successful creation of zip with all lab functions!');
    else
        disp('WARNING: One or more files was not found and will be missing from zip!')
        disp('You will get 0 credit for any function that is missing from your most recent zip upload!');
    end
catch exception
    % Failure output
    disp(['FAILURE: ' exception.message '']);
end

%% function to get the number of data points from plots within a figure
function dispPlotDataLengths(fig)
    if ~isa(fig,'matlab.ui.Figure')
        disp('fig is not a figure handle!');
        return;
    end
    found = 0;
    axes = fig.Children;
    for i = 1:length(axes)
        if isa(axes(i),'matlab.graphics.axis.Axes')
            plots = axes(i).Children;
            for j = 1:length(plots)
                if isa(plots(j),'matlab.graphics.chart.primitive.Line')
                    found = found + 1;
                    disp(['Plot ' num2str(found) ': ' num2str(length(plots(j).XData)) ' data points']);
                end
            end
        end
    end
    
    if found == 0
        disp('No plot data was found within figure!');
    end
end