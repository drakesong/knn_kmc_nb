% Close and clear before running project
close;
clear;

% Begin 2D plots
fprintf('Running 2D plots...\n\n');
dimension = 2;

% Import data from data_banknote_authent
wavCurr = csvread("data_banknote_authent.csv");
wavFeats = wavCurr(:, 1:4);
wavTruth = wavCurr(:, 5);

% Create another variable to work with the data
data = wavFeats;

% Set data_label and determine the number of test data and indices
data_label = wavTruth;
n_r = round(762*0.1);
n_f = round(610*0.1);
test_r = sort(randperm(762, n_r));
test_f = sort(randperm(610, n_f)) + 762;

% Separate Test Data from Training Data
test_idx = [test_r, test_f];
test_data = data(test_idx, :);
test_label = data_label(test_idx, :);
data(test_idx, :) = [];
data_label(test_idx, :) = [];

% The column numbers of data that you want to analyze
% When plotting, column_num1 will be the X values and column_num2 ...
% will be the Y values
column_num1 = 1;
column_num2 = 2;

% Condense training data and testing data into the two specified columns
training_data = [data(:, column_num1), data(:, column_num2)];
testing_data = [test_data(:, column_num1), test_data(:, column_num2)];

% Run K-Nearest Neighbors
fprintf('Running knn.m...\n');
run('knn.m')
fprintf('K-Nearest Neighbors is done.\n\n');
fprintf('Press enter to continue.\n\n');
pause;

% Run K-Means Clustering
fprintf('Running kmeansclustering2d.m...\n');
run('kmeansclustering2d.m')
fprintf('K-Means Clustering is done.\n\n');
fprintf('Press enter to continue.\n\n');
pause;

% Run Naive Bayes
fprintf('Running naivebayes.m...\n');
run('naivebayes.m')
fprintf('Naive Bayes is done.\n\n');

% Done with 2D
fprintf('2D plots are done.\n\n');
fprintf('Press enter to continue.\n\n');
pause;

% Clear workspace
clear;




% Begin 3D plots
fprintf('Running 3D plots...\n\n');
dimension = 3;

% Import data from swiss_banknote
measFeats = importdata("swiss_banknote.csv");
measTruth_str = measFeats.textdata(2:end, 1);
measTruth_int = size(measTruth_str, 1);

% Convert 'real' and 'fake' to 0 and 1
for i = 1:size(measTruth_str, 1)
    if strcmp(measTruth_str(i), 'real')
        measTruth_int(i) = 0;
    else
        measTruth_int(i) = 1;
    end
end
measTruth_int = measTruth_int';

% Extract features from the Data Struct
measFeats = measFeats.data;

% Create another variable to work with the data
data = measFeats;

% Set data_label and determine the number of test data their indices
data_label = measTruth_int;
n_r = round(100*0.1);
n_f = round(100*0.1);
test_r = sort(randperm(100, n_r));
test_f = sort(randperm(100, n_f)) + 100;

% Separate Test Data from Training Data
test_idx = [test_r, test_f];
test_data = data(test_idx, :);
test_label = data_label(test_idx, :);
data(test_idx, :) = [];
data_label(test_idx, :) = [];

% The column numbers of data that you want to analyze
% When plotting, column_num1 will be the X values, column_num2 will ... 
% be the Y values, and column_num3 will be the Z values
column_num1 = 4;
column_num2 = 5;
column_num3 = 6;

% Condense training data into the three specified columns
training_data = [data(:, column_num1), data(:, column_num2), ...
    data(:, column_num3)];
testing_data = [test_data(:, column_num1), test_data(:, column_num2), ...
    test_data(:, column_num3)];
    
% Run K-Nearest Neighbors
fprintf('Running knn.m...\n');
run('knn.m')
fprintf('K-Nearest Neighbors is done.\n\n');
fprintf('Press enter to continue.\n\n');
pause;

% Run K-Means Clustering
fprintf('Running kmeansclustering3d.m...\n');
run('kmeansclustering3d.m')
fprintf('K-Means Clustering is done.\n\n');
fprintf('Press enter to continue.\n\n');
pause;

% Run Naive Bayes
fprintf('Running naivebayes.m...\n');
run('naivebayes.m')
fprintf('Naive Bayes is done.\n\n');

% Finish project
fprintf('Project is done\n');

% Clear workspace
clear;


