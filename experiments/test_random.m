setup;

k = 10;

data = 100*generate_data_matrix(2000,150,k,0.01,1);
data = data';

params = [];
params.method = 'projgrad';
params.maxIters = 100;
params.initialization = 'nndsvd';
params.loss = 'sqeuclidean';
params.evalLoss = 'sqeuclidean';
params.stepType = 'steepest';
params.paramH = 0.5;
params.paramW = 0.5;
params.sparseParamH = 0.75;
params.sparseParamW = 0.75;
params.subIters = 1;
params.printIter = true;
params.orthogonalConstraint = 'w';

[W,H,D,F,FIters] = nmft(data,k,params);
FItersAll = zeros(100,4);
FItersAll(:,1) = FIters';

params = [];
params.method = 'projgrad';
params.maxIters = 100;
params.initialization = 'nndsvd';
params.loss = 'sqeuclidean';
params.evalLoss = 'sqeuclidean';
params.stepType = 'steepest';
params.paramH = 0.5;
params.paramW = 0.5;
params.sparseParamH = 0.75;
params.sparseParamW = 0.75;
params.subIters = 10;
params.printIter = true;
params.orthogonalConstraint = 'w';

[W,H,D,F,FIters] = nmft(data,k,params);
FItersAll(:,2) = FIters';

params = [];
params.method = 'projgrad2';
params.maxIters = 100;
params.initialization = 'nndsvd';
params.loss = 'sqeuclidean';
params.evalLoss = 'sqeuclidean';
params.stepType = 'steepest';
params.paramH = 0.5;
params.paramW = 0.5;
params.sparseParamH = 0.75;
params.sparseParamW = 0.75;
params.subIters = 10;
params.printIter = true;
params.orthogonalConstraint = 'w';

[W,H,D,F,FIters] = nmft(data,k,params);
FItersAll(:,3) = FIters';

params = [];
params.method = 'als';
params.maxIters = 100;
params.initialization = 'nndsvd';
params.loss = 'sqeuclidean';
params.evalLoss = 'sqeuclidean';
params.stepType = 'newton';
params.paramH = 0.5;
params.paramW = 0.5;
params.sparseParamH = 0.75;
params.sparseParamW = 0.75;
params.subIters = 1;
params.printIter = true;
params.orthogonalConstraint = 'w';

[W,H,D,F,FIters] = nmft(data,k,params);
FItersAll(:,4) = FIters';

params = [];
params.method = 'projgrad';
params.maxIters = 100;
params.initialization = 'nndsvd';
params.loss = 'sqeuclidean';
params.evalLoss = 'sqeuclidean';
params.stepType = 'bfgs';
params.paramH = 0.5;
params.paramW = 0.5;
params.sparseParamH = 0.75;
params.sparseParamW = 0.75;
params.subIters = 10;
params.printIter = true;
params.orthogonalConstraint = 'w';

[W,H,D,F,FIters] = nmft(data,k,params);
FItersAll(:,5) = FIters';

params = [];
params.method = 'mult';
params.maxIters = 100;
params.initialization = 'nndsvd';
params.loss = 'sqeuclidean';
params.evalLoss = 'sqeuclidean';
params.stepType = 'steepest';
params.paramH = 0.5;
params.paramW = 0.5;
params.sparseParamH = 0.75;
params.sparseParamW = 0.75;
params.subIters = 1;
params.printIter = true;
params.orthogonalConstraint = 'w';

[W,H,D,F,FIters] = nmft(data,k,params);
FItersAll(:,6) = FIters';

colors = {'red','green','blue','black','cyan','yellow'};

close all;
figure;
hold on;
for i = 1:1:6
    plot(FItersAll(:,i),'Color',colors{i})
end
hold off;
