function [train_target,train_nontarget,test_target,test_nontarget] = IndExtraction(s1)

% trian data
% finding all indices that a character appeared in train data
a=find(s1.train(10,:));
aa=zeros(1,length(a)/4);
k=1;
for i=1:length(a)
  if  mod(i,4)==1
      aa(1,k)=a(i);
      k=k+1;
  end
end
% finding all indices that target character appeared in test data
b=find(s1.train(11,:));
bb=zeros(1,length(b)/4);
k=1;
for i=1:length(b)
  if  mod(i,4)==1
      bb(1,k)=b(i);
      k=k+1;
  end
end
train_target=bb;
% cc is a vector that its components are one when they're equal to bb's 
% components
cc=zeros(1,length(aa));
for i=1:length(bb)
    dd=aa==bb(i);
    cc=cc|dd;
end
ee=cc==0;
ff=ee;
train_nontarget=aa(ff);

% test data
% finding all indices that a character appeared in test data
a=find(s1.test(10,:));
aa=zeros(1,length(a)/4);
k=1;
for i=1:length(a)
  if  mod(i,4)==1
      aa(1,k)=a(i);
      k=k+1;
  end
end
% finding all indices that target character appeared in test data
b=find(s1.test(11,:));
bb=zeros(1,length(b)/4);
k=1;
for i=1:length(b)
  if  mod(i,4)==1
      bb(1,k)=b(i);
      k=k+1;
  end
end
test_target=bb;
% cc is a vector that its components are one when they're equal to bb's 
% components
cc=zeros(1,length(aa));
for i=1:length(bb)
    dd=aa==bb(i);
    cc=cc|dd;
end
ee=cc==0;
ff=ee;
test_nontarget=aa(ff);

end