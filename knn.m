% Run knn
model_knn = fitcknn(training_data, data_label);
pred_label = predict(model_knn, training_data);

% Calculate error
error_knn = sum(abs(pred_label - data_label));

% Plot data
figure;
view(dimension);
hold on

% 2D plot
if dimension == 2
    for j = 1:size(pred_label, 1)
        if pred_label(j) ==  0
            plot(training_data(j, 1), training_data(j, 2), 'r.')
        else
            plot(training_data(j, 1), training_data(j, 2), 'b.')
        end
    end
    
    %{
    % Decided to leave out since the graph becomes too cluttered
    % Plot true values
    for j = 1:size(data_label, 1)
        if data_label(j) == 0
            plot(training_data(j, 1), training_data(j, 2), 'r.')
        else
            plot(training_data(j, 1), training_data(j, 2), 'b.')
        end
    end
    %}
    
    % Title
    title(sprintf('K-Nearest Neighbors 2D\nError: %d', error_knn))

% 3D plot
elseif dimension == 3
    % Turn on grid and rotate3d for better viewing
    grid on;
    rotate3d on;
    
    for j = 1:size(pred_label, 1)
        if pred_label(j) == 0
            scatter3(training_data(j, 1), training_data(j, 2), ...
                training_data(j, 3), 'r.')
        else
            scatter3(training_data(j, 1), training_data(j, 2), ...
                training_data(j, 3), 'b.')
        end
    end
    
    % Title
    title(sprintf('K-Nearest Neighbors 3D\nError: %d', error_knn))
end 

hold off

% Start test data
fprintf('\nStarting test data...\n');
fprintf('Press enter to continue.\n\n');
pause;

% Test data evaluation
pred_label_test = predict(model_knn, testing_data);

% Calculate test error
error_knn_test = sum(abs(pred_label_test - test_label));

% Start plot
figure;
view(dimension);
hold on

% Plot test data
if dimension == 2
    % Set axis to match the training plot for better comparison
    axis([-8 8 -15 15]);
    
    for j = 1:size(test_label, 1)
        if pred_label_test(j) ==  0
            plot(testing_data(j, 1), testing_data(j, 2), 'ro')
        else
            plot(testing_data(j, 1), testing_data(j, 2), 'bo')
        end
    end
    
    % Plot true values
    fprintf('Circle is the tested label. Plus (+) is the true label.\n\n');
    for j = 1:size(test_label, 1)
        if test_label(j) == 0
            plot(testing_data(j, 1), testing_data(j, 2), 'r+')
        else
            plot(testing_data(j, 1), testing_data(j, 2), 'b+')
        end
    end
    
    % Title
    title(sprintf('K-Nearest Neighbors TEST DATA 2D\nError: %d', ...
        error_knn_test))
    
elseif dimension == 3
    % Turn on grid and rotate3d for better viewing
    grid on;
    rotate3d on;
    
    % Set axis to match the training plot for better comparison
    axis([6 14 6 14 137 143]);
    
    for j = 1:size(pred_label_test, 1)
        if pred_label_test(j) == 0
            scatter3(testing_data(j, 1), testing_data(j, 2), ...
                testing_data(j, 3), 'ro')
        else
            scatter3(testing_data(j, 1), testing_data(j, 2), ...
                testing_data(j, 3), 'bo')
        end
    end
    
    % Plot true values
    fprintf('Dot is the tested label. Diamond is the true label.\n\n');
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
    title(sprintf('K-Nearest Neighbors TEST DATA 3D\nError: %d', ...
        error_knn_test))
end 
