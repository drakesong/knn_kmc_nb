% Start plot
figure;
view(dimension);
hold on;

% Initialize values
[m, n] = size(training_data);

% Number of centroids
K = 2;

% Run kmeans
[idx, centroids] = kmeans(training_data, K);

% Correct idx to display 0s and 1s
idx_cor = idx - ones(m, 1);

% Calculate error
error_kmc = sum(abs(idx_cor - data_label));

% Turn on grid and rotate3d for better viewing
grid on;
rotate3d on;
    
% Plot the data
for j = 1:size(idx, 1)
    if idx_cor(j) == 0
        scatter3(training_data(j, 1), training_data(j, 2), ...
        training_data(j, 3), 'r.')
    else
        scatter3(training_data(j, 1), training_data(j, 2), ...
            training_data(j, 3), 'b.')
    end
end

% Plot the centroids as black x's
scatter3(centroids(:, 1), centroids(:, 2), centroids(:, 3), 'x', ...
    'MarkerEdgeColor','k', 'LineWidth', 3);

% Title
title(sprintf('K-Means Clustering 3D\nError: %d', error_kmc))

hold off;

% Start test data
fprintf('\nStarting test data...\n');
fprintf('Press enter to continue.\n\n');
pause;

% Test data evaluation
idx_test = findCentroids(testing_data, centroids);

% Initialize values
[a,b] = size(testing_data);

% Correct idx
idx_test_cor = idx_test - ones(a,1);

% Calculate error
error_kmc_test = sum(abs(idx_test_cor - test_label));

% Start plot
figure;
view(dimension);
hold on

% Turn on grid and rotate3d for better viewing
grid on;
rotate3d on;

% Set axis to match the training plot for better comparison
axis([6 14 6 14 137 143]);

% Plot test data
for j = 1:size(idx_test_cor, 1)
    if idx_test_cor(j) == 0
        scatter3(testing_data(j, 1), testing_data(j, 2), ...
            testing_data(j, 3), 'ro')
    else
        scatter3(testing_data(j, 1), testing_data(j, 2), ...
            testing_data(j, 3), 'bo')
    end
end

% Plot the centroids as black x's
scatter3(centroids(:, 1), centroids(:, 2), centroids(:, 3), 'x', ...
    'MarkerEdgeColor','k', 'LineWidth', 3);

% Plot true values
fprintf('Circle is the tested label. Plus (+) is the true label.\n\n');
for j = 1:size(test_label, 1)
    if test_label(j) == 0
        scatter3(testing_data(j, 1), testing_data(j, 2), ...
            testing_data(j, 3), 'r+')
    else
        scatter3(testing_data(j, 1), testing_data(j, 2), ...
            testing_data(j, 3), 'b+')
    end
end

% Title
title(sprintf('K-Means Clustering TEST DATA 3D\nError: %d', ...
    error_kmc_test))
