clc
close all
clear
%% loading data
load('s1.mat')
N=2;
[train_target,train_nontarget,test_target,test_nontarget] = TrialExtraction(s1);

Alphabet = {'ABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789'};

%% frequency filter
h=BPF(1001,0.5,30,256);  

% test_nontarget
test_nontarget(:,2:9,:)=test_nontarget(:,2:9,:)-mean(test_nontarget(:,2:9,:));
for i=1:size(test_nontarget,3)
    test_nontarget(:,2:9,i)=FilterDFT(test_nontarget(:,2:9,i),h);
end

% test_target
test_target(:,2:9,:)=test_target(:,2:9,:)-mean(test_target(:,2:9,:));
for i=1:size(test_target,3)
    test_target(:,2:9,i)=FilterDFT(test_target(:,2:9,i),h);
end

% train_nontarget
train_nontarget(:,2:9,:)=train_nontarget(:,2:9,:)-mean(train_nontarget(:,2:9,:));
for i=1:size(train_nontarget,3)
    train_nontarget(:,2:9,i)=FilterDFT(train_nontarget(:,2:9,i),h);
end

% train_target
train_target(:,2:9,:)=train_target(:,2:9,:)-mean(train_target(:,2:9,:));
for i=1:size(train_target,3)
    train_target(:,2:9,i)=FilterDFT(train_target(:,2:9,i),h);
end


%% ERP
ERP_train_t=mean(train_target(:,2:9,:),3);
std_tr_t=std(train_target(:,2:9,:),0,3)/sqrt(size(train_target(:,2:9,:),3));

ERP_train_non=mean(train_nontarget(:,2:9,:),3);
std_tr_n=std(train_nontarget(:,2:9,:),0,3)/sqrt(size(train_nontarget(:,2:9,:),3));

ERP_test_t=mean(test_target(:,2:9,:),3);
std_t_t=std(test_target(:,2:9,:),0,3)/sqrt(size(test_target(:,2:9,:),3));

ERP_test_non=mean(test_nontarget(:,2:9,:),3);
std_t_n=std(test_nontarget(:,2:9,:),0,3)/sqrt(size(test_nontarget(:,2:9,:),3));

t=linspace(0,0.8,length(ERP_train_t(:,1)));

for i=1:8
    figure(i)
    
    plot(t,ERP_train_t(:,i),'r','LineWidth',2);
    hold on
    plot(t,ERP_train_non(:,i),'b','LineWidth',2);
    
    plot(t,ERP_train_t(:,i)+std_tr_t(:,i),'r','LineWidth',0.5);
    plot(t,ERP_train_t(:,i)-std_tr_t(:,i),'r','LineWidth',0.5);
  
    plot(t,ERP_train_non(:,i)+std_tr_n(:,i),'b','LineWidth',0.5);
    plot(t,ERP_train_non(:,i)-std_tr_n(:,i),'b','LineWidth',0.5);
    
    title(['Subject #',num2str(N),' Electrode #',num2str(i)]);
    legend('target','non-target');
    xlabel('t(s)');
    
    hold off
end

for i=9:16
    figure(i)
    
    plot(t,ERP_test_t(:,i-8),'r','LineWidth',2);
    hold on
    plot(t,ERP_test_non(:,i-8),'b','LineWidth',2);
    
    plot(t,ERP_test_t(:,i-8)+std_t_t(:,i-8),'r','LineWidth',0.5);
    plot(t,ERP_test_t(:,i-8)-std_t_t(:,i-8),'r','LineWidth',0.5);
  
    plot(t,ERP_test_non(:,i-8)+std_t_n(:,i-8),'b','LineWidth',0.5);
    plot(t,ERP_test_non(:,i-8)-std_t_n(:,i-8),'b','LineWidth',0.5);
    
    title(['Subject #',num2str(N),' Electrode #',num2str(i-8)]);
    legend('target','non-target');
    xlabel('t(s)');
    
    hold off
end

%%
fft_data1=fft(ERP_train_non(:,1));
Fs=256;
L1 =length(fft_data1);
P2 = abs(fft_data1/L1);
P1 = P2(1:floor(L1/2));
P1(2:end-1) = 2*P1(2:end-1);
bin_frequency1 = Fs*(1:(L1/2))/L1; 

fft_data2=fft(ERP_train_t(:,1));
L2 =length(fft_data2);
Q2 = abs(fft_data2/L2);
Q1 = Q2(1:floor(L2/2));
Q1(2:end-1) = 2*Q1(2:end-1);
bin_frequency2 = Fs*(1:(L2/2))/L2; 

plot(bin_frequency1,P1,'b','LineWidth',2)
hold on
plot(bin_frequency2,Q1,'r','LineWidth',2)

legend('non-target','target');

%%
clear ERP_train_t ERP_train_non ERP_test_t ERP_test_non i t ...
    std_tr_t std_tr_n std_t_t std_t_n fft_data1 Fs L1 L2 P1 P2 Q1 Q2 ...
    bin_frequency1 bin_frequency2


%% part4
% downsapling
close all
train_t=Down_Sample(train_target,256,64);
train_non=Down_Sample(train_nontarget,256,64);
test_t=Down_Sample(test_target,256,64);
test_non=Down_Sample(test_nontarget,256,64);

clear train_target train_nontarget test_target test_nontarget

%% forming X_Train & X_Test

siz=size(train_t,1);
X_Train=zeros(size(train_t,3)+size(train_non,3),siz*8);

for i=1:size(train_t,3)
   aa=cat(1,train_t(:,2,i),train_t(:,3,i),train_t(:,4,i),train_t(:,5,i),...
   train_t(:,6,i),train_t(:,7,i),train_t(:,8,i),train_t(:,9,i));
   aa=aa';
   X_Train(i,:)=aa;
end
for i=1:size(train_non,3)
   aa=cat(1,train_non(:,2,i),train_non(:,3,i),train_non(:,4,i),train_non(:,5,i),...
   train_non(:,6,i),train_non(:,7,i),train_non(:,8,i),train_non(:,9,i));
   aa=aa';
   X_Train(i+size(train_t,3),:)=aa;
end

X_Test=zeros(size(test_t,3)+size(test_non,3),siz*8);

for i=1:size(test_t,3)
   aa=cat(1,test_t(:,2,i),test_t(:,3,i),test_t(:,4,i),test_t(:,5,i),...
   test_t(:,6,i),test_t(:,7,i),test_t(:,8,i),test_t(:,9,i));
   aa=aa';
   X_Test(i,:)=aa;
end
for i=1:size(test_non,3)
   aa=cat(1,test_non(:,2,i),test_non(:,3,i),test_non(:,4,i),test_non(:,5,i),...
   test_non(:,6,i),test_non(:,7,i),test_non(:,8,i),test_non(:,9,i));
   aa=aa';
   X_Test(i+size(test_t,3),:)=aa;
end
a=size(train_t,3);
b=size(train_non,3);
clear train_t train_non test_t test_non
clear siz aa i h 

%% LDA model

% 1==>target & 0==>non_target
categories = [1 ; 0];

Label=zeros(a+b,1);
Label(1:a,1)=1;
Label(a+1:end,1)=0;

accuracy1=zeros(1,5);
accuracy2=zeros(1,5);

vecsPerCat = getVecsPerCat(X_Train, Label, categories);
foldSizes = computeFoldSizes(vecsPerCat,5);
[X_sorted, y_sorted] = randSortAndGroup(X_Train, Label, categories);


for i = 1 : 5

[X_train, y_train, X_val, y_val] = getFoldVectors(X_sorted,...
y_sorted, categories, vecsPerCat, foldSizes, i);
Linear_model1 = fitcdiscr(X_train,y_train,'DiscrimType','Linear');
pred = Linear_model1.predict(X_val);

cmat1 = confusionmat(y_val,pred);
acc1 = 100*sum(diag(cmat1))./sum(cmat1(:));

cmat2 = confusionmat(y_val(1:15),pred(1:15));
acc2 = 100*sum(diag(cmat2))./sum(cmat2(:));

accuracy1(i)=acc1;
accuracy2(i)=acc2;


end

%%

pred2=Linear_model1.predict(X_Train);
Train_Percentage=100*(1-sum(pred2~=Label)/length(Label));

% target
Train_Percentage_t=100*(sum(pred2(1:75)==Label(1:75))/length(Label(1:75)));


accuracy_mat=zeros(6,1);

accuracy_mat(1)=mean(accuracy1);
accuracy_mat(2)=mean(accuracy2);
accuracy_mat(3)=Train_Percentage;
accuracy_mat(4)=Train_Percentage_t;

%%

clear a b acc1 acc2 categories cmat1 cmat2 foldSizes vecsPerCat X_train y_train X_val y_val ...
    pred X_sorted y_sorted i clear pred2 Train_Percentage Train_Percentage_t accuracy1 accuracy2


%% LDA model on test data


Linear_model2 = fitcdiscr(X_Train,Label,'DiscrimType','Linear');
pred = predict(Linear_model2,X_Test);
cmat = confusionmat(Label,pred);
acc = 100*sum(diag(cmat))./sum(cmat(:));

Test_Percentage=100*(1-sum(pred~=Label)/length(Label));

% target
Test_Percentage_t=100*(sum(pred(1:75)==Label(1:75))/length(Label(1:75)));

accuracy_mat(5)=Test_Percentage;
accuracy_mat(6)=Test_Percentage_t;


clear Test_Percentage Test_Percentage_t

%%
Coeffs = Linear_model2.Coeffs(1,2).Linear ;
[~,Coeffs_order] = sort(abs(Coeffs)) ;

figure(1)
histogram(Coeffs_order(1:30),[1:13:416]);

 title(['Subject #',num2str(N)]);
 xlabel(' Electrode number');


%% Reconstruction 

close all

clear Coeffs Coeffs_order

[~,~,test_target,test_nontarget] = IndExtraction(s1);

indices_test=cat(1,test_target',test_nontarget');
[B,I] = sort(indices_test);

pred=pred(I);

indx=find(pred==1);
a=B(indx);
b=s1.test(10,a);


for i=1:length(b)
    pred(indx(i))=b(i);
end

reconstruct=zeros(5,15);
reconstruct_cell=cell(5,15);
% just remember

vector=[];

for i=1:5
    for j=1:15
        vec=pred(36*(j-1)+540*(i-1)+1:36*j+540*(i-1));
        c=find(vec);
        if isempty(c)
            reconstruct_cell{i,j}=0;
        elseif length(c)==1
            reconstruct_cell{i,j}=vec(c);
        else
            reconstruct_cell{i,j}=vec(c);
            ij=[i,j];
            vector=[vector;ij];
        end
    end
end

for i=1:5
    for j=1:15
        vec=pred(36*(j-1)+540*(i-1)+1:36*j+540*(i-1));
        c=sum(vec);
        reconstruct(i,j)=c;
    end
end

%%
clear b B c cmat I indices_test indx j i Label  pred ...
    train_target train_nontarget test_target test_nontarge

row=cell(5,1);

row{1}=reconstruct(1,find(reconstruct(1,:)));
row{2}=reconstruct(2,find(reconstruct(2,:)));
row{3}=reconstruct(3,find(reconstruct(3,:)));
row{4}=reconstruct(4,find(reconstruct(4,:)));
row{5}=reconstruct(5,find(reconstruct(5,:)));

mode_mat=zeros(5,1);

mode_mat(1)=mode(row{1});
mode_mat(2)=mode(row{2});
mode_mat(3)=mode(row{3});
mode_mat(4)=mode(row{4});
mode_mat(5)=mode(row{5});

a=zeros(5,1);

for i=1:5
    if sum(row{i}==mode_mat(i))==1
       a(i)=i;
    end
end

if sum(a>0)==1

    for i=1:5

        if a(i)~=0
            b=find(vector(:,1)==i);
            c=vector(b,2);
            reconstruct(i,c)=reconstruct_cell{i,c}(1);
            row{i}=reconstruct(5,find(reconstruct(i,:)));
            mode_mat(i)=mode(row{i});
            if sum(row{i}==mode_mat(i))==1
                reconstruct(i,c)=reconstruct_cell{i,c}(2);
                row{i}=reconstruct(5,find(reconstruct(i,:)));
                mode_mat(i)=mode(row{i});
                if sum(row{i}==mode_mat(i))==1
                   reconstruct(i,c)=0;
                   row{i}=reconstruct(5,find(reconstruct(i,:)));
                   mode_mat(i)=mode(row{i});
                end
            end
        end

    end
end


%%
Word=[];
for i=1:5
    Word=strcat(Word,Alphabet{1}(mode_mat(i)));
end

clear reconstruct_mat i row a

