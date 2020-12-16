function [train_target,train_nontarget,test_target,test_nontarget] = TrialExtraction(s1)

[train_t,train_non,test_t,test_non] = IndExtraction(s1);

% train_target
train_target=zeros(205,9,length(train_t));
for i=1:length(train_t)
    aa=s1.train(1:9,train_t(i):(train_t(i)+204));
    aa=aa';
    train_target(:,:,i)=aa; 
end
% train_nontarget
train_nontarget=zeros(205,9,length(train_non));
for i=1:length(train_non)
    aa=s1.train(1:9,train_non(i):(train_non(i)+204));
    aa=aa';
    train_nontarget(:,:,i)=aa; 
end
% test_target
test_target=zeros(205,9,length(test_t));
for i=1:length(test_t)
    aa=s1.test(1:9,(test_t(i):test_t(i)+204));
    aa=aa';
    test_target(:,:,i)=aa; 
end
% test_nontarget
test_nontarget=zeros(205,9,length(test_non));
for i=1:length(test_non)
    aa=s1.test(1:9,test_non(i):(test_non(i)+204));
    aa=aa';
    test_nontarget(:,:,i)=aa; 
end
end

