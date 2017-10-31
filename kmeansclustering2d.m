% Number of centroids
K = 2;

% Randomly select initial centroids
randidx = randperm(size(data, 1));
centroids = [data(randidx(1:K), column_num1), data(randidx(1:K), ...
    column_num2)];

% Set number of iterations
max_iters = 5;

% Set plot_progress
% Plot_progress is a boolean that determines if the plot is in the ...
% progress of plotting
plot_progress = true;

% Set default value for plot progress
if ~exist('plot_progress', 'var') || isempty(plot_progress)
    plot_progress = false;
end

% Start plotting data if we are plotting progress
if plot_progress
    figure;
    view(dimension);
    hold on;
end

% Initialize values
[m, n] = size(training_data);
previous_centroids = centroids;
idx = zeros(m, 1);

% Run K-Means
for i=1:max_iters
    % Keep track of number of initialization
    fprintf('K-Means iteration %d/%d...\n', i, max_iters);
    
    % For each example in X, assign it to the closest centroid
    idx = findCentroids(training_data, centroids);
    
    % Correct idx to display 0s and 1s
    idx_cor = idx - ones(m,1);
    
    % Calculate error
    error_kmc = sum(abs(idx_cor - data_label));
    
    %{
    % Decided to leave out since the graph becomes too cluttered
    if dimension == 2
        % Plot true values
        for j = 1:size(data_label, 1)
            if data_label(j) == 0
                plot(training_data(j, 1), training_data(j, 2), 'r.')
            else
                plot(training_data(j, 1), training_data(j, 2), 'b.')
            end
        end
    end
    %}

    % Plot data
    if plot_progress
        plotProgress(training_data, centroids, previous_centroids, ...
            idx, idx_cor, i, error_kmc, max_iters);
        previous_centroids = centroids;
        fprintf('Press enter to continue.\n');
        pause;
    end
        
    % Compute new centroids
    centroids = computeCentroids(training_data, idx, K);
end

% Hold off to show progress
if plot_progress
    hold off;
end

% Start test data
fprintf('\nStarting test data...\n');
fprintf('Press enter to continue.\n\n');
pause;

% Test data evaluation
idx_test = findCentroids(testing_data, centroids);

% Initial values for test data
[a,b] = size(testing_data);

% Correct idx to display 0s and 1s
idx_test_cor = idx_test - ones(a,1);

% Calculate error
error_kmc_test = sum(abs(idx_test_cor - test_label));

% Start plot
figure;
view(dimension);

% Set axis for better comparison of graphs
axis([-8 8 -15 15]);
hold on

% Plot test data
for j = 1:size(test_label, 1)
    if idx_test_cor(j) ==  0
        plot(testing_data(j, 1), testing_data(j, 2), 'ro')
    else
        plot(testing_data(j, 1), testing_data(j, 2), 'bo')
    end
end

% Plot the centroids as black x's
plot(centroids(:, 1), centroids(:, 2), 'x', 'MarkerEdgeColor','k', ...
     'MarkerSize', 10, 'LineWidth', 3);
 
% Plot true test values
fprintf('Circle is the tested label. Plus (+) is the true label.\n\n');
for j = 1:size(test_label, 1)
    if test_label(j) == 0
        plot(testing_data(j, 1), testing_data(j, 2), 'r+')
    else
        plot(testing_data(j, 1), testing_data(j, 2), 'b+')
    end
end

% Title
title(sprintf('K-Means Clustering TEST DATA 2D\nError: %d', ...
    error_kmc_test))
    


