function y=Down_Sample(x,Fs1,Fs2)

p=Fs1/Fs2;
a=size(x);
k=ceil(a(1)/p);

y=zeros(k,a(2),a(3));

for i=1:k
    y(i,:,:)=x((i-1)*p+1,:,:);
end

end