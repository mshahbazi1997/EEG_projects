clc
clear 
close all
%% load data
load('s2.mat')
load('X_Train')
load('X_Test')
[train_target,train_nontarget,test_target,test_nontarget] = TrialExtraction(s2);

%% Regression

Label=zeros(2700,1);
Label(1:75)=1;
X = X_Train;
X =[X,Label];

Y = array2table(X);
obj = fitlm(Y);

resp = predict(obj,X_Test);

figure(1)
histogram(resp(1:75), 'Normalization', 'pdf')
hold on
histogram(resp(76:end), 'Normalization', 'pdf')

legend('target','non-target');

%%
clear X Y obj resp
%% ICA
% X=X_Train;
% X=X';
%Y = fastICA(X(:,1:75),416);
load('Y.mat')
Y=Y';

new_feature_mat=Y*X_Train';
new_feature_mat=new_feature_mat';

new_test=Y*X_Train';
new_test=new_test';

new=[new_feature_mat,Label];

R = array2table(new);
obj = fitlm(R);

resp = predict(obj,new_test);

figure(2)
histogram(resp(1:75), 'Normalization', 'pdf')
hold on
histogram(resp(76:end), 'Normalization', 'pdf')

legend('target','non-target');

%%
clear X Y obj resp new new_test new_feature_mat R 
%% PCA

[coeff,~,latent] = pca(X_Train);

figure(3)
stem(cumsum(latent)/sum(latent));

Y = X_Train;
new = Y * coeff;

pcaData = new(:,1:69);
pcaData = [pcaData, Label];
Y = array2table(pcaData);
obj = fitlm(Y);
test=X_Test*coeff;
resp = predict(obj, test(:,1:69));

figure(4)
hold on
histogram(resp(1:75), 'Normalization', 'pdf')
histogram(resp(76:end), 'Normalization', 'pdf')

legend('target','non-target');

%%
clear X Y obj resp new new_test new_feature_mat test latent pcaData coeff X_Test X_Train

%% alpha & beta frequency content

traint=zeros(3,8,75);
trainn=zeros(3,8,2625);

for i=1:75
    
    for j=2:9
        x=train_target(:,j,i);
        [Pxx,F] = periodogram(x,rectwin(length(x)),length(x),256);
         p_alpha = bandpower(Pxx,F,[8 13],'psd');
         p_beta  = bandpower(Pxx,F,[13 30],'psd');
         p_delta = bandpower(Pxx,F,[1 4],'psd');
        traint(1,j-1,i)=p_alpha;
        traint(2,j-1,i)=p_beta;
        traint(3,j-1,i)=p_delta;
    end
    
end

for i=1:2625
    
    for j=2:9
        x=train_nontarget(:,j,i);
        [Pxx,F] = periodogram(x,rectwin(length(x)),length(x),256);
         p_alpha = bandpower(Pxx,F,[8 13],'psd');
         p_beta  = bandpower(Pxx,F,[13 30],'psd');
         p_delta = bandpower(Pxx,F,[1 4],'psd');
        trainn(1,j-1,i)=p_alpha;
        trainn(2,j-1,i)=p_beta;
        trainn(3,j-1,i)=p_delta;
    end
    
end



testt=zeros(2,8,75);
testn=zeros(2,8,2625);

for i=1:75
    
    for j=2:9
        x=test_target(:,j,i);
        [Pxx,F] = periodogram(x,rectwin(length(x)),length(x),256);
         p_alpha = bandpower(Pxx,F,[8 13],'psd');
         p_beta  = bandpower(Pxx,F,[13 30],'psd');
         p_delta = bandpower(Pxx,F,[1 4],'psd');
        testt(1,j-1,i)=p_alpha;
        testt(2,j-1,i)=p_beta;
        testt(3,j-1,i)=p_delta;
    end
    
end

for i=1:2625
    
    for j=2:9
        x=test_nontarget(:,j,i);
        [Pxx,F] = periodogram(x,rectwin(length(x)),length(x),256);
         p_alpha = bandpower(Pxx,F,[8 13],'psd');
         p_beta  = bandpower(Pxx,F,[13 30],'psd');
         p_delta = bandpower(Pxx,F,[1 4],'psd');
        testn(1,j-1,i)=p_alpha;
        testn(2,j-1,i)=p_beta;
        testn(3,j-1,i)=p_delta;
    end
    
end


X_Train=zeros(2700,24);
X_Test=zeros(2700,24);

for i=1:75
    x=[traint(1,:,i),traint(2,:,i),traint(3,:,i)];
    X_Train(i,:)=x;
end
for i=76:2700
    x=[trainn(1,:,i-75),trainn(2,:,i-75),trainn(3,:,i-75)];
    X_Train(i,:)=x;
end

for i=1:75
    x=[testt(1,:,i),testt(2,:,i),testt(3,:,i)];
    X_Test(i,:)=x;
end
for i=76:2700
    x=[testn(1,:,i-75),testn(2,:,i-75),testn(3,:,i-75)];
    X_Test(i,:)=x;
end


X_Train =[X_Train,Label];

Y = array2table(X_Train);
obj = fitlm(Y);

resp = predict(obj,X_Test);

figure(5)
histogram(resp(1:75), 'Normalization', 'pdf')
hold on
histogram(resp(76:end), 'Normalization', 'pdf')

legend('target','non-target');


