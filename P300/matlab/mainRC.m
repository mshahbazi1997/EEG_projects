clc
close all
clear
%% loading data
load('s3.mat')
N=10;
[train_target,train_nontarget,test_target,test_nontarget] = TrialExtraction(s3);

Alphabet = {'ABCDEF';'GHIJKL';'MNOPQR';'STUVWX';'YZ0123';'456789'};

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

% for i=9:16
%     figure(i)
%     
%     plot(t,ERP_test_t(:,i-8),'r','LineWidth',2);
%     hold on
%     plot(t,ERP_test_non(:,i-8),'b','LineWidth',2);
%     
%     plot(t,ERP_test_t(:,i-8)+std_t_t(:,i-8),'r','LineWidth',0.5);
%     plot(t,ERP_test_t(:,i-8)-std_t_t(:,i-8),'r','LineWidth',0.5);
%   
%     plot(t,ERP_test_non(:,i-8)+std_t_n(:,i-8),'b','LineWidth',0.5);
%     plot(t,ERP_test_non(:,i-8)-std_t_n(:,i-8),'b','LineWidth',0.5);
%     
%     title(['Subject #',num2str(N),' Electrode #',num2str(i-8)]);
%     legend('target','non-target');
%     xlabel('t(s)');
%     
%     hold off
% end
% 
% clear ERP_train_t ERP_train_non ERP_test_t ERP_test_non i t ...
%     std_tr_t std_tr_n std_t_t std_t_n
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


[~,~,test_target,test_nontarget] = IndExtraction(s3);

indices_test=cat(1,test_target',test_nontarget');
[B,I] = sort(indices_test);

pred=pred(I);

indx=find(pred==1);
a=B(indx);
b=s3.test(10,a);

%%

for i=1:length(b)
    pred(indx(i))=b(i);
end
%%
reconstruct_cell=cell(5,15);
for i=1:5
    for j=1:15
        vec=pred(12*(j-1)+180*(i-1)+1:12*j+180*(i-1));
        c=find(vec);
        if isempty(c)==1
            reconstruct_cell{i,j}=0;
        elseif length(c)==1
             reconstruct_cell{i,j}=vec(c);
%             reconstruct_cell{i,j}=0;
        else
            reconstruct_cell{i,j}=vec(c);
        end
    end
end
%%
% for fisrt character

first=zeros(6);

for i=1:15
    vec=reconstruct_cell{1,i};
    if vec~=0
        if length(vec)>=2
            p=combnk(vec',2);
            for j=1:size(p,1)
                l=sort(p(j,:));
                if (l(2)>6 && l(1)<=6)
                    first(l(1),l(2)-6)=first(l(1),l(2)-6)+1;
                end
            end
        end
    end
end

for i=1:15
    vec=reconstruct_cell{1,i};
    
    if vec~=0
        if length(vec)>=2
            p=combnk(vec',2);
            for j=1:size(p,1)
                l=sort(p(j,:));
                if (l(2)>6 && l(1)>6)
                    d1=first(:,l(1)-6);
                    q1=find(d1==max(d1));
                    first(q1(1),l(1)-6)=first(q1(1),l(1)-6)+1;
                    
                    d2=first(:,l(2)-6);
                    q2=find(d2==max(d2));
                    first(q2(1),l(2)-6)=first(q2(1),l(2)-6)+1;
                    
                elseif (l(2)<=6 && l(1)<=6)
                    
                    f1=first(l(1),:);
                    p1=find(f1==max(f1));
                    first(l(1),p1(1))=first(l(1),p1(1))+1;
                    
                    f2=first(l(2),:);
                    p2=find(f2==max(f2));
                    first(l(2),p2(1))=first(l(2),p2(1))+1;
                end
                    
            end 
        else
            if vec>6
                d3=first(:,vec-6);
                q3=find(d3==max(d3));
                first(q3(1),vec-6)=first(q3(1),vec-6)+1;
            else
                f3=first(vec,:);
                p3=find(f3==max(f3));
                first(vec,p3(1))=first(vec,p3(1))+1;
            end
        end
    end
end


clear p l i j vec p1 p2 p3 d1 d2 d3 q1 q2 q3 f1 f2 f3

% for second character

second=zeros(6);

for i=1:15
    vec=reconstruct_cell{2,i};
    if vec~=0
        if length(vec)>=2
            p=combnk(vec',2);
            for j=1:size(p,1)
                l=sort(p(j,:));
                if (l(2)>6 && l(1)<=6)
                    second(l(1),l(2)-6)=second(l(1),l(2)-6)+1;
                end
            end
        end
    end
end

for i=1:15
    vec=reconstruct_cell{2,i};
    
    if vec~=0
        if length(vec)>=2
            p=combnk(vec',2);
            for j=1:size(p,1)
                l=sort(p(j,:));
                if (l(2)>6 && l(1)>6)
                    d1=second(:,l(1)-6);
                    q1=find(d1==max(d1));
                    second(q1(1),l(1)-6)=second(q1(1),l(1)-6)+1;
                    
                    d2=second(:,l(2)-6);
                    q2=find(d2==max(d2));
                    second(q2(1),l(2)-6)=second(q2(1),l(2)-6)+1;
                    
                elseif (l(2)<=6 && l(1)<=6)
                    
                    f1=second(l(1),:);
                    p1=find(f1==max(f1));
                    second(l(1),p1(1))=second(l(1),p1(1))+1;
                    
                    f2=second(l(2),:);
                    p2=find(f2==max(f2));
                    second(l(2),p2(1))=second(l(2),p2(1))+1;
                end
                    
            end 
        else
            if vec>6
                d3=second(:,vec-6);
                q3=find(d3==max(d3));
                second(q3(1),vec-6)=second(q3(1),vec-6)+1;
            else
                f3=second(vec,:);
                p3=find(f3==max(f3));
                second(vec,p3(1))=second(vec,p3(1))+1;
            end
        end
    end
end


clear p l i j vec p1 p2 p3 d1 d2 d3 q1 q2 q3 f1 f2 f3

% for third character

third=zeros(6);

for i=1:15
    vec=reconstruct_cell{3,i};
    if vec~=0
        if length(vec)>=2
            p=combnk(vec',2);
            for j=1:size(p,1)
                l=sort(p(j,:));
                if (l(2)>6 && l(1)<=6)
                    third(l(1),l(2)-6)=third(l(1),l(2)-6)+1;
                end
            end
        end
    end
end

for i=1:15
    vec=reconstruct_cell{3,i};
    
    if vec~=0
        if length(vec)>=2
            p=combnk(vec',2);
            for j=1:size(p,1)
                l=sort(p(j,:));
                if (l(2)>6 && l(1)>6)
                    d1=third(:,l(1)-6);
                    q1=find(d1==max(d1));
                    third(q1(1),l(1)-6)=third(q1(1),l(1)-6)+1;
                    
                    d2=third(:,l(2)-6);
                    q2=find(d2==max(d2));
                    third(q2(1),l(2)-6)=third(q2(1),l(2)-6)+1;
                    
                elseif (l(2)<=6 && l(1)<=6)
                    
                    f1=third(l(1),:);
                    p1=find(f1==max(f1));
                    third(l(1),p1(1))=third(l(1),p1(1))+1;
                    
                    f2=third(l(2),:);
                    p2=find(f2==max(f2));
                    third(l(2),p2(1))=third(l(2),p2(1))+1;
                end
                    
            end 
        else
            if vec>6
                d3=third(:,vec-6);
                q3=find(d3==max(d3));
                third(q3(1),vec-6)=third(q3(1),vec-6)+1;
            else
                f3=third(vec,:);
                p3=find(f3==max(f3));
                third(vec,p3(1))=third(vec,p3(1))+1;
            end
        end
    end
end


clear p l i j vec p1 p2 p3 d1 d2 d3 q1 q2 q3 f1 f2 f3

% for forth character

forth=zeros(6);

for i=1:15
    vec=reconstruct_cell{4,i};
    if vec~=0
        if length(vec)>=2
            p=combnk(vec',2);
            for j=1:size(p,1)
                l=sort(p(j,:));
                if (l(2)>6 && l(1)<=6)
                    forth(l(1),l(2)-6)=forth(l(1),l(2)-6)+1;
                end
            end
        end
    end
end

for i=1:15
    vec=reconstruct_cell{4,i};
    
    if vec~=0
        if length(vec)>=2
            p=combnk(vec',2);
            for j=1:size(p,1)
                l=sort(p(j,:));
                if (l(2)>6 && l(1)>6)
                    d1=forth(:,l(1)-6);
                    q1=find(d1==max(d1));
                    forth(q1(1),l(1)-6)=forth(q1(1),l(1)-6)+1;
                    
                    d2=forth(:,l(2)-6);
                    q2=find(d2==max(d2));
                    forth(q2(1),l(2)-6)=forth(q2(1),l(2)-6)+1;
                    
                elseif (l(2)<=6 && l(1)<=6)
                    
                    f1=forth(l(1),:);
                    p1=find(f1==max(f1));
                    forth(l(1),p1(1))=forth(l(1),p1(1))+1;
                    
                    f2=forth(l(2),:);
                    p2=find(f2==max(f2));
                    forth(l(2),p2(1))=forth(l(2),p2(1))+1;
                end
                    
            end 
        else
            if vec>6
                d3=forth(:,vec-6);
                q3=find(d3==max(d3));
                forth(q3(1),vec-6)=forth(q3(1),vec-6)+1;
            else
                f3=forth(vec,:);
                p3=find(f3==max(f3));
                forth(vec,p3(1))=forth(vec,p3(1))+1;
            end
        end
    end
end


clear p l i j vec p1 p2 p3 d1 d2 d3 q1 q2 q3 f1 f2 f3

% for fifth character

fifth=zeros(6);

for i=1:15
    vec=reconstruct_cell{5,i};
    if vec~=0
        if length(vec)>=2
            p=combnk(vec',2);
            for j=1:size(p,1)
                l=sort(p(j,:));
                if (l(2)>6 && l(1)<=6)
                    fifth(l(1),l(2)-6)=fifth(l(1),l(2)-6)+1;
                end
            end
        end
    end
end

for i=1:15
    vec=reconstruct_cell{5,i};
    
    if vec~=0
        if length(vec)>=2
            p=combnk(vec',2);
            for j=1:size(p,1)
                l=sort(p(j,:));
                if (l(2)>6 && l(1)>6)
                    d1=fifth(:,l(1)-6);
                    q1=find(d1==max(d1));
                    fifth(q1(1),l(1)-6)=fifth(q1(1),l(1)-6)+1;
                    
                    d2=fifth(:,l(2)-6);
                    q2=find(d2==max(d2));
                    fifth(q2(1),l(2)-6)=fifth(q2(1),l(2)-6)+1;
                    
                elseif (l(2)<=6 && l(1)<=6)
                    
                    f1=fifth(l(1),:);
                    p1=find(f1==max(f1));
                    fifth(l(1),p1(1))=fifth(l(1),p1(1))+1;
                    
                    f2=fifth(l(2),:);
                    p2=find(f2==max(f2));
                    fifth(l(2),p2(1))=fifth(l(2),p2(1))+1;
                end
                    
            end 
        else
            if vec>6
                d3=fifth(:,vec-6);
                q3=find(d3==max(d3));
                fifth(q3(1),vec-6)=fifth(q3(1),vec-6)+1;
            else
                f3=fifth(vec,:);
                p3=find(f3==max(f3));
                fifth(vec,p3(1))=fifth(vec,p3(1))+1;
            end
        end
    end
end


clear p l i j vec p1 p2 p3 d1 d2 d3 q1 q2 q3 f1 f2 f3
%%
clear b B c cmat I indices_test indx j i Label Linear_model pred ...
    train_target train_nontarget test_target test_nontarge

%%


first=first';
second=second';
third=third';
forth=forth';
fifth=fifth';

[~,c1]=max(max(first));
[~,r1]=max(first(:,c1));

[~,c2]=max(max(second));
[~,r2]=max(second(:,c2));

[~,c3]=max(max(third));
[~,r3]=max(third(:,c3));

[~,c4]=max(max(forth));
[~,r4]=max(forth(:,c4));

[~,c5]=max(max(fifth));
[~,r5]=max(fifth(:,c5));

r=[r1,r2,r3,r4,r5];
c=[c1,c2,c3,c4,c5];

%%
Word=[];
for i=1:5
    Word=strcat(Word,Alphabet{r(i)}(c(i)));
end

clear reconstruct_mat i row a

