%% part3

clc
clear 
close all
% part2
addpath('C:\Users\mahdi\Desktop\HW4_NEURO\CN_HW04\CN_HW04\spm12')
%%
cd('C:\Users\mahdi\Desktop\HW4_NEURO\CN_HW04\CN_HW04\spmDir1')
load('SPM')
spm_spm(SPM);
clear SPM
%%
cd('C:\Users\mahdi\Desktop\HW4_NEURO\CN_HW04\CN_HW04\spmDir2')
load('SPM')
spm_spm(SPM);
clear SPM
%%
cd('C:\Users\mahdi\Desktop\HW4_NEURO\CN_HW04\CN_HW04\spmDir3')
load('SPM')
spm_spm(SPM);
clear SPM
%%
cd('C:\Users\mahdi\Desktop\HW4_NEURO\CN_HW04\CN_HW04\spmDir4')
load('SPM')
spm_spm(SPM);
clear SPM
%%
cd('C:\Users\mahdi\Desktop\HW4_NEURO\CN_HW04\CN_HW04\spmDir5')
load('SPM')
spm_spm(SPM);
clear SPM
%%
cd('C:\Users\mahdi\Desktop\HW4_NEURO\CN_HW04\CN_HW04\spmDir6')
load('SPM')
spm_spm(SPM);
clear SPM
%%
cd('C:\Users\mahdi\Desktop\HW4_NEURO\CN_HW04\CN_HW04\spmDir7')
load('SPM')
spm_spm(SPM);
clear SPM
%%
cd('C:\Users\mahdi\Desktop\HW4_NEURO')
%

cd('C:\Users\mahdi\Desktop\HW4_NEURO\CN_HW04\CN_HW04\spmDir1')
addpath('C:\Users\mahdi\Desktop\HW4_NEURO\CN_HW04\CN_HW04\nii tools')

[a1,b1]=convertnii2mat('spmT_0001.nii','untouch');
[a2,b2]=convertnii2mat('spmT_0002.nii','untouch');
[a3,b3]=convertnii2mat('spmT_0003.nii','untouch');
[a4,b4]=convertnii2mat('spmT_0004.nii','untouch');
[a5,b5]=convertnii2mat('spmT_0005.nii','untouch');

z.run1.genre1=spm_t2z(b1,140);
z.run1.genre2=spm_t2z(b2,140);
z.run1.genre3=spm_t2z(b3,140);
z.run1.genre4=spm_t2z(b4,140);
z.run1.genre5=spm_t2z(b5,140);
%%
clear a1 a2 a3 a4 a5 b1 b2 b3 b4 b5
cd('C:\Users\mahdi\Desktop\HW4_NEURO\CN_HW04\CN_HW04\spmDir2')

[a1,b1]=convertnii2mat('spmT_0001.nii','untouch');
[a2,b2]=convertnii2mat('spmT_0002.nii','untouch');
[a3,b3]=convertnii2mat('spmT_0003.nii','untouch');
[a4,b4]=convertnii2mat('spmT_0004.nii','untouch');
[a5,b5]=convertnii2mat('spmT_0005.nii','untouch');

z.run2.genre1=spm_t2z(b1,140);
z.run2.genre2=spm_t2z(b2,140);
z.run2.genre3=spm_t2z(b3,140);
z.run2.genre4=spm_t2z(b4,140);
z.run2.genre5=spm_t2z(b5,140);

%%
clear a1 a2 a3 a4 a5 b1 b2 b3 b4 b5
cd('C:\Users\mahdi\Desktop\HW4_NEURO\CN_HW04\CN_HW04\spmDir3')

[a1,b1]=convertnii2mat('spmT_0001.nii','untouch');
[a2,b2]=convertnii2mat('spmT_0002.nii','untouch');
[a3,b3]=convertnii2mat('spmT_0003.nii','untouch');
[a4,b4]=convertnii2mat('spmT_0004.nii','untouch');
[a5,b5]=convertnii2mat('spmT_0005.nii','untouch');

z.run3.genre1=spm_t2z(b1,140);
z.run3.genre2=spm_t2z(b2,140);
z.run3.genre3=spm_t2z(b3,140);
z.run3.genre4=spm_t2z(b4,140);
z.run3.genre5=spm_t2z(b5,140);

%%
clear a1 a2 a3 a4 a5 b1 b2 b3 b4 b5
cd('C:\Users\mahdi\Desktop\HW4_NEURO\CN_HW04\CN_HW04\spmDir4')

[a1,b1]=convertnii2mat('spmT_0001.nii','untouch');
[a2,b2]=convertnii2mat('spmT_0002.nii','untouch');
[a3,b3]=convertnii2mat('spmT_0003.nii','untouch');
[a4,b4]=convertnii2mat('spmT_0004.nii','untouch');
[a5,b5]=convertnii2mat('spmT_0005.nii','untouch');

z.run4.genre1=spm_t2z(b1,140);
z.run4.genre2=spm_t2z(b2,140);
z.run4.genre3=spm_t2z(b3,140);
z.run4.genre4=spm_t2z(b4,140);
z.run4.genre5=spm_t2z(b5,140);

%%
clear a1 a2 a3 a4 a5 b1 b2 b3 b4 b5
cd('C:\Users\mahdi\Desktop\HW4_NEURO\CN_HW04\CN_HW04\spmDir5')

[a1,b1]=convertnii2mat('spmT_0001.nii','untouch');
[a2,b2]=convertnii2mat('spmT_0002.nii','untouch');
[a3,b3]=convertnii2mat('spmT_0003.nii','untouch');
[a4,b4]=convertnii2mat('spmT_0004.nii','untouch');
[a5,b5]=convertnii2mat('spmT_0005.nii','untouch');

z.run5.genre1=spm_t2z(b1,140);
z.run5.genre2=spm_t2z(b2,140);
z.run5.genre3=spm_t2z(b3,140);
z.run5.genre4=spm_t2z(b4,140);
z.run5.genre5=spm_t2z(b5,140);

%%
clear a1 a2 a3 a4 a5 b1 b2 b3 b4 b5
cd('C:\Users\mahdi\Desktop\HW4_NEURO\CN_HW04\CN_HW04\spmDir6')

[a1,b1]=convertnii2mat('spmT_0001.nii','untouch');
[a2,b2]=convertnii2mat('spmT_0002.nii','untouch');
[a3,b3]=convertnii2mat('spmT_0003.nii','untouch');
[a4,b4]=convertnii2mat('spmT_0004.nii','untouch');
[a5,b5]=convertnii2mat('spmT_0005.nii','untouch');

z.run6.genre1=spm_t2z(b1,140);
z.run6.genre2=spm_t2z(b2,140);
z.run6.genre3=spm_t2z(b3,140);
z.run6.genre4=spm_t2z(b4,140);
z.run6.genre5=spm_t2z(b5,140);

%%
clear a1 a2 a3 a4 a5 b1 b2 b3 b4 b5
cd('C:\Users\mahdi\Desktop\HW4_NEURO\CN_HW04\CN_HW04\spmDir7')

[a1,b1]=convertnii2mat('spmT_0001.nii','untouch');
[a2,b2]=convertnii2mat('spmT_0002.nii','untouch');
[a3,b3]=convertnii2mat('spmT_0003.nii','untouch');
[a4,b4]=convertnii2mat('spmT_0004.nii','untouch');
[a5,b5]=convertnii2mat('spmT_0005.nii','untouch');

z.run7.genre1=spm_t2z(b1,140);
z.run7.genre2=spm_t2z(b2,140);
z.run7.genre3=spm_t2z(b3,140);
z.run7.genre4=spm_t2z(b4,140);
z.run7.genre5=spm_t2z(b5,140);

clear a1 a2 a3 a4 a5 b1 b2 b3 b4 b5
%
cd('C:\Users\mahdi\Desktop\HW4_NEURO')
save('part3_z.mat','z')

z.avg.genre1=(z.run1.genre1+z.run2.genre1+z.run3.genre1+z.run4.genre1+z.run5.genre1+z.run6.genre1+z.run7.genre1)/7;
z.avg.genre2=(z.run1.genre2+z.run2.genre2+z.run3.genre2+z.run4.genre2+z.run5.genre2+z.run6.genre2+z.run7.genre2)/7;
z.avg.genre3=(z.run1.genre3+z.run2.genre3+z.run3.genre3+z.run4.genre3+z.run5.genre3+z.run6.genre3+z.run7.genre3)/7;
z.avg.genre4=(z.run1.genre4+z.run2.genre4+z.run3.genre4+z.run4.genre4+z.run5.genre4+z.run6.genre4+z.run7.genre4)/7;
z.avg.genre5=(z.run1.genre5+z.run2.genre5+z.run3.genre5+z.run4.genre5+z.run5.genre5+z.run6.genre5+z.run7.genre5)/7;

save('part3_z.mat','z')

%% differences between metal and other genre

cd('C:\Users\mahdi\Desktop\HW4_NEURO\CN_HW04\CN_HW04\SPM\spmDir2')
addpath('C:\Users\mahdi\Desktop\HW4_NEURO\CN_HW04\CN_HW04\nii tools')

[a1,b1]=convertnii2mat('spmT_0006.nii','untouch');
[a2,b2]=convertnii2mat('spmT_0007.nii','untouch');
[a3,b3]=convertnii2mat('spmT_0008.nii','untouch');
[a4,b4]=convertnii2mat('spmT_0009.nii','untouch');


z.run2.diff31=spm_t2z(b1,140);
z.run2.diff32=spm_t2z(b2,140);
z.run2.diff34=spm_t2z(b3,140);
z.run2.diff35=spm_t2z(b4,140);

clear a1 a2 a3 a4 b1 b2 b3 b4 
cd('C:\Users\mahdi\Desktop\HW4_NEURO\CN_HW04\CN_HW04\SPM\spmDir3')

[a1,b1]=convertnii2mat('spmT_0006.nii','untouch');
[a2,b2]=convertnii2mat('spmT_0007.nii','untouch');
[a3,b3]=convertnii2mat('spmT_0008.nii','untouch');
[a4,b4]=convertnii2mat('spmT_0009.nii','untouch');


z.run3.diff31=spm_t2z(b1,140);
z.run3.diff32=spm_t2z(b2,140);
z.run3.diff34=spm_t2z(b3,140);
z.run3.diff35=spm_t2z(b4,140);

clear a1 a2 a3 a4 b1 b2 b3 b4 
cd('C:\Users\mahdi\Desktop\HW4_NEURO\CN_HW04\CN_HW04\SPM\spmDir4')

[a1,b1]=convertnii2mat('spmT_0006.nii','untouch');
[a2,b2]=convertnii2mat('spmT_0007.nii','untouch');
[a3,b3]=convertnii2mat('spmT_0008.nii','untouch');
[a4,b4]=convertnii2mat('spmT_0009.nii','untouch');


z.run4.diff31=spm_t2z(b1,140);
z.run4.diff32=spm_t2z(b2,140);
z.run4.diff34=spm_t2z(b3,140);
z.run4.diff35=spm_t2z(b4,140);

clear a1 a2 a3 a4 b1 b2 b3 b4 

z.avg.diff31=(z.run2.diff31+z.run3.diff31+z.run4.diff31)/3;
z.avg.diff32=(z.run2.diff32+z.run3.diff32+z.run4.diff32)/3;
z.avg.diff34=(z.run2.diff34+z.run3.diff34+z.run4.diff34)/3;
z.avg.diff35=(z.run2.diff35+z.run3.diff35+z.run4.diff35)/3;

cd('C:\Users\mahdi\Desktop\HW4_NEURO\data')
save('part3b_z.mat','z')
%% threshold for z value
for i=1:160
    for j=1:160
        for k=1:36
            if z.avg.diff31(i,j,k)<1.97
                z.avg.diff31(i,j,k)=0;
            end
        end
    end
end
%% convert to nii format 

nii=make_nii(z.avg.diff31);
cd('C:\Users\mahdi\Desktop\HW4_NEURO\nii')
save_nii(nii, 'diff31.nii', 1)
[a,b]=convertnii2mat('diff31.nii','untouch');
%%
%
cd('C:\Users\mahdi\Desktop\HW4_NEURO\CN_HW04\CN_HW04\spmDir11')
load('SPM')
spm_spm(SPM);
clear SPM
%%
cd('C:\Users\mahdi\Desktop\HW4_NEURO\CN_HW04\CN_HW04\spmDir12')
load('SPM')
spm_spm(SPM);
clear SPM
%%
cd('C:\Users\mahdi\Desktop\HW4_NEURO\CN_HW04\CN_HW04\spmDir13')
load('SPM')
spm_spm(SPM);
clear SPM
%%
cd('C:\Users\mahdi\Desktop\HW4_NEURO\CN_HW04\CN_HW04\spmDir14')
load('SPM')
spm_spm(SPM);
clear SPM
%%
cd('C:\Users\mahdi\Desktop\HW4_NEURO\CN_HW04\CN_HW04\spmDir15')
load('SPM')
spm_spm(SPM);
clear SPM
%%
cd('C:\Users\mahdi\Desktop\HW4_NEURO\CN_HW04\CN_HW04\spmDir16')
load('SPM')
spm_spm(SPM);
clear SPM
%%
cd('C:\Users\mahdi\Desktop\HW4_NEURO\CN_HW04\CN_HW04\spmDir17')
load('SPM')
spm_spm(SPM);
clear SPM


%% part 4


cd('C:\Users\mahdi\Desktop\HW4_NEURO')

cd('C:\Users\mahdi\Desktop\HW4_NEURO\CN_HW04\CN_HW04\spmDir11')
addpath('C:\Users\mahdi\Desktop\HW4_NEURO\CN_HW04\CN_HW04\nii tools')

[a1,b1]=convertnii2mat('spmT_0001.nii','untouch');
[a2,b2]=convertnii2mat('spmT_0002.nii','untouch');
[a3,b3]=convertnii2mat('spmT_0003.nii','untouch');
[a4,b4]=convertnii2mat('spmT_0004.nii','untouch');
[a5,b5]=convertnii2mat('spmT_0005.nii','untouch');
[a6,b6]=convertnii2mat('spmT_0006.nii','untouch');
[a7,b7]=convertnii2mat('spmT_0007.nii','untouch');
[a8,b8]=convertnii2mat('spmT_0008.nii','untouch');
[a9,b9]=convertnii2mat('spmT_0009.nii','untouch');
[a10,b10]=convertnii2mat('spmT_0010.nii','untouch');
[a11,b11]=convertnii2mat('spmT_0011.nii','untouch');
[a12,b12]=convertnii2mat('spmT_0012.nii','untouch');
[a13,b13]=convertnii2mat('spmT_0013.nii','untouch');
[a14,b14]=convertnii2mat('spmT_0014.nii','untouch');
[a15,b15]=convertnii2mat('spmT_0015.nii','untouch');
[a16,b16]=convertnii2mat('spmT_0016.nii','untouch');
[a17,b17]=convertnii2mat('spmT_0017.nii','untouch');
[a18,b18]=convertnii2mat('spmT_0018.nii','untouch');
[a19,b19]=convertnii2mat('spmT_0019.nii','untouch');
[a20,b20]=convertnii2mat('spmT_0020.nii','untouch');
[a21,b21]=convertnii2mat('spmT_0021.nii','untouch');
[a22,b22]=convertnii2mat('spmT_0022.nii','untouch');
[a23,b23]=convertnii2mat('spmT_0023.nii','untouch');
[a24,b24]=convertnii2mat('spmT_0024.nii','untouch');
[a25,b25]=convertnii2mat('spmT_0025.nii','untouch');

Z1=cell(25,1);

Z1{1}=spm_t2z(b1,120);
Z1{2}=spm_t2z(b2,120);
Z1{3}=spm_t2z(b3,120);
Z1{4}=spm_t2z(b4,120);
Z1{5}=spm_t2z(b5,120);
Z1{6}=spm_t2z(b6,120);
Z1{7}=spm_t2z(b7,120);
Z1{8}=spm_t2z(b8,120);
Z1{9}=spm_t2z(b9,120);
Z1{10}=spm_t2z(b10,120);
Z1{11}=spm_t2z(b11,120);
Z1{12}=spm_t2z(b12,120);
Z1{13}=spm_t2z(b13,120);
Z1{14}=spm_t2z(b14,120);
Z1{15}=spm_t2z(b15,120);
Z1{16}=spm_t2z(b16,120);
Z1{17}=spm_t2z(b17,120);
Z1{18}=spm_t2z(b18,120);
Z1{19}=spm_t2z(b19,120);
Z1{20}=spm_t2z(b20,120);
Z1{21}=spm_t2z(b21,120);
Z1{22}=spm_t2z(b22,120);
Z1{23}=spm_t2z(b23,120);
Z1{24}=spm_t2z(b24,120);
Z1{25}=spm_t2z(b25,120);

clear a1 a2 a3 a4 a5 a6 a7 a8 a9 a10 a11 a12 a13 a14 a15 a16 a17 a18 a19 a20 a21 a22 a23 a24 a25
clear b1 b2 b3 b4 b5 b6 b7 b8 b9 b10 b11 b12 b13 b14 b15 b16 b17 b18 b19 b20 b21 b22 b23 b24 b25

%

cd('C:\Users\mahdi\Desktop\HW4_NEURO\CN_HW04\CN_HW04\spmDir12')
addpath('C:\Users\mahdi\Desktop\HW4_NEURO\CN_HW04\CN_HW04\nii tools')

[a1,b1]=convertnii2mat('spmT_0001.nii','untouch');
[a2,b2]=convertnii2mat('spmT_0002.nii','untouch');
[a3,b3]=convertnii2mat('spmT_0003.nii','untouch');
[a4,b4]=convertnii2mat('spmT_0004.nii','untouch');
[a5,b5]=convertnii2mat('spmT_0005.nii','untouch');
[a6,b6]=convertnii2mat('spmT_0006.nii','untouch');
[a7,b7]=convertnii2mat('spmT_0007.nii','untouch');
[a8,b8]=convertnii2mat('spmT_0008.nii','untouch');
[a9,b9]=convertnii2mat('spmT_0009.nii','untouch');
[a10,b10]=convertnii2mat('spmT_0010.nii','untouch');
[a11,b11]=convertnii2mat('spmT_0011.nii','untouch');
[a12,b12]=convertnii2mat('spmT_0012.nii','untouch');
[a13,b13]=convertnii2mat('spmT_0013.nii','untouch');
[a14,b14]=convertnii2mat('spmT_0014.nii','untouch');
[a15,b15]=convertnii2mat('spmT_0015.nii','untouch');
[a16,b16]=convertnii2mat('spmT_0016.nii','untouch');
[a17,b17]=convertnii2mat('spmT_0017.nii','untouch');
[a18,b18]=convertnii2mat('spmT_0018.nii','untouch');
[a19,b19]=convertnii2mat('spmT_0019.nii','untouch');
[a20,b20]=convertnii2mat('spmT_0020.nii','untouch');
[a21,b21]=convertnii2mat('spmT_0021.nii','untouch');
[a22,b22]=convertnii2mat('spmT_0022.nii','untouch');
[a23,b23]=convertnii2mat('spmT_0023.nii','untouch');
[a24,b24]=convertnii2mat('spmT_0024.nii','untouch');
[a25,b25]=convertnii2mat('spmT_0025.nii','untouch');

Z2=cell(25,1);

Z2{1}=spm_t2z(b1,120);
Z2{2}=spm_t2z(b2,120);
Z2{3}=spm_t2z(b3,120);
Z2{4}=spm_t2z(b4,120);
Z2{5}=spm_t2z(b5,120);
Z2{6}=spm_t2z(b6,120);
Z2{7}=spm_t2z(b7,120);
Z2{8}=spm_t2z(b8,120);
Z2{9}=spm_t2z(b9,120);
Z2{10}=spm_t2z(b10,120);
Z2{11}=spm_t2z(b11,120);
Z2{12}=spm_t2z(b12,120);
Z2{13}=spm_t2z(b13,120);
Z2{14}=spm_t2z(b14,120);
Z2{15}=spm_t2z(b15,120);
Z2{16}=spm_t2z(b16,120);
Z2{17}=spm_t2z(b17,120);
Z2{18}=spm_t2z(b18,120);
Z2{19}=spm_t2z(b19,120);
Z2{20}=spm_t2z(b20,120);
Z2{21}=spm_t2z(b21,120);
Z2{22}=spm_t2z(b22,120);
Z2{23}=spm_t2z(b23,120);
Z2{24}=spm_t2z(b24,120);
Z2{25}=spm_t2z(b25,120);

clear a1 a2 a3 a4 a5 a6 a7 a8 a9 a10 a11 a12 a13 a14 a15 a16 a17 a18 a19 a20 a21 a22 a23 a24 a25
clear b1 b2 b3 b4 b5 b6 b7 b8 b9 b10 b11 b12 b13 b14 b15 b16 b17 b18 b19 b20 b21 b22 b23 b24 b25


%

cd('C:\Users\mahdi\Desktop\HW4_NEURO\CN_HW04\CN_HW04\spmDir13')
addpath('C:\Users\mahdi\Desktop\HW4_NEURO\CN_HW04\CN_HW04\nii tools')

[a1,b1]=convertnii2mat('spmT_0001.nii','untouch');
[a2,b2]=convertnii2mat('spmT_0002.nii','untouch');
[a3,b3]=convertnii2mat('spmT_0003.nii','untouch');
[a4,b4]=convertnii2mat('spmT_0004.nii','untouch');
[a5,b5]=convertnii2mat('spmT_0005.nii','untouch');
[a6,b6]=convertnii2mat('spmT_0006.nii','untouch');
[a7,b7]=convertnii2mat('spmT_0007.nii','untouch');
[a8,b8]=convertnii2mat('spmT_0008.nii','untouch');
[a9,b9]=convertnii2mat('spmT_0009.nii','untouch');
[a10,b10]=convertnii2mat('spmT_0010.nii','untouch');
[a11,b11]=convertnii2mat('spmT_0011.nii','untouch');
[a12,b12]=convertnii2mat('spmT_0012.nii','untouch');
[a13,b13]=convertnii2mat('spmT_0013.nii','untouch');
[a14,b14]=convertnii2mat('spmT_0014.nii','untouch');
[a15,b15]=convertnii2mat('spmT_0015.nii','untouch');
[a16,b16]=convertnii2mat('spmT_0016.nii','untouch');
[a17,b17]=convertnii2mat('spmT_0017.nii','untouch');
[a18,b18]=convertnii2mat('spmT_0018.nii','untouch');
[a19,b19]=convertnii2mat('spmT_0019.nii','untouch');
[a20,b20]=convertnii2mat('spmT_0020.nii','untouch');
[a21,b21]=convertnii2mat('spmT_0021.nii','untouch');
[a22,b22]=convertnii2mat('spmT_0022.nii','untouch');
[a23,b23]=convertnii2mat('spmT_0023.nii','untouch');
[a24,b24]=convertnii2mat('spmT_0024.nii','untouch');
[a25,b25]=convertnii2mat('spmT_0025.nii','untouch');

Z3=cell(25,1);

Z3{1}=spm_t2z(b1,120);
Z3{2}=spm_t2z(b2,120);
Z3{3}=spm_t2z(b3,120);
Z3{4}=spm_t2z(b4,120);
Z3{5}=spm_t2z(b5,120);
Z3{6}=spm_t2z(b6,120);
Z3{7}=spm_t2z(b7,120);
Z3{8}=spm_t2z(b8,120);
Z3{9}=spm_t2z(b9,120);
Z3{10}=spm_t2z(b10,120);
Z3{11}=spm_t2z(b11,120);
Z3{12}=spm_t2z(b12,120);
Z3{13}=spm_t2z(b13,120);
Z3{14}=spm_t2z(b14,120);
Z3{15}=spm_t2z(b15,120);
Z3{16}=spm_t2z(b16,120);
Z3{17}=spm_t2z(b17,120);
Z3{18}=spm_t2z(b18,120);
Z3{19}=spm_t2z(b19,120);
Z3{20}=spm_t2z(b20,120);
Z3{21}=spm_t2z(b21,120);
Z3{22}=spm_t2z(b22,120);
Z3{23}=spm_t2z(b23,120);
Z3{24}=spm_t2z(b24,120);
Z3{25}=spm_t2z(b25,120);

clear a1 a2 a3 a4 a5 a6 a7 a8 a9 a10 a11 a12 a13 a14 a15 a16 a17 a18 a19 a20 a21 a22 a23 a24 a25
clear b1 b2 b3 b4 b5 b6 b7 b8 b9 b10 b11 b12 b13 b14 b15 b16 b17 b18 b19 b20 b21 b22 b23 b24 b25


%

cd('C:\Users\mahdi\Desktop\HW4_NEURO\CN_HW04\CN_HW04\spmDir14')
addpath('C:\Users\mahdi\Desktop\HW4_NEURO\CN_HW04\CN_HW04\nii tools')

[a1,b1]=convertnii2mat('spmT_0001.nii','untouch');
[a2,b2]=convertnii2mat('spmT_0002.nii','untouch');
[a3,b3]=convertnii2mat('spmT_0003.nii','untouch');
[a4,b4]=convertnii2mat('spmT_0004.nii','untouch');
[a5,b5]=convertnii2mat('spmT_0005.nii','untouch');
[a6,b6]=convertnii2mat('spmT_0006.nii','untouch');
[a7,b7]=convertnii2mat('spmT_0007.nii','untouch');
[a8,b8]=convertnii2mat('spmT_0008.nii','untouch');
[a9,b9]=convertnii2mat('spmT_0009.nii','untouch');
[a10,b10]=convertnii2mat('spmT_0010.nii','untouch');
[a11,b11]=convertnii2mat('spmT_0011.nii','untouch');
[a12,b12]=convertnii2mat('spmT_0012.nii','untouch');
[a13,b13]=convertnii2mat('spmT_0013.nii','untouch');
[a14,b14]=convertnii2mat('spmT_0014.nii','untouch');
[a15,b15]=convertnii2mat('spmT_0015.nii','untouch');
[a16,b16]=convertnii2mat('spmT_0016.nii','untouch');
[a17,b17]=convertnii2mat('spmT_0017.nii','untouch');
[a18,b18]=convertnii2mat('spmT_0018.nii','untouch');
[a19,b19]=convertnii2mat('spmT_0019.nii','untouch');
[a20,b20]=convertnii2mat('spmT_0020.nii','untouch');
[a21,b21]=convertnii2mat('spmT_0021.nii','untouch');
[a22,b22]=convertnii2mat('spmT_0022.nii','untouch');
[a23,b23]=convertnii2mat('spmT_0023.nii','untouch');
[a24,b24]=convertnii2mat('spmT_0024.nii','untouch');
[a25,b25]=convertnii2mat('spmT_0025.nii','untouch');

Z4=cell(25,1);

Z4{1}=spm_t2z(b1,120);
Z4{2}=spm_t2z(b2,120);
Z4{3}=spm_t2z(b3,120);
Z4{4}=spm_t2z(b4,120);
Z4{5}=spm_t2z(b5,120);
Z4{6}=spm_t2z(b6,120);
Z4{7}=spm_t2z(b7,120);
Z4{8}=spm_t2z(b8,120);
Z4{9}=spm_t2z(b9,120);
Z4{10}=spm_t2z(b10,120);
Z4{11}=spm_t2z(b11,120);
Z4{12}=spm_t2z(b12,120);
Z4{13}=spm_t2z(b13,120);
Z4{14}=spm_t2z(b14,120);
Z4{15}=spm_t2z(b15,120);
Z4{16}=spm_t2z(b16,120);
Z4{17}=spm_t2z(b17,120);
Z4{18}=spm_t2z(b18,120);
Z4{19}=spm_t2z(b19,120);
Z4{20}=spm_t2z(b20,120);
Z4{21}=spm_t2z(b21,120);
Z4{22}=spm_t2z(b22,120);
Z4{23}=spm_t2z(b23,120);
Z4{24}=spm_t2z(b24,120);
Z4{25}=spm_t2z(b25,120);

clear a1 a2 a3 a4 a5 a6 a7 a8 a9 a10 a11 a12 a13 a14 a15 a16 a17 a18 a19 a20 a21 a22 a23 a24 a25
clear b1 b2 b3 b4 b5 b6 b7 b8 b9 b10 b11 b12 b13 b14 b15 b16 b17 b18 b19 b20 b21 b22 b23 b24 b25


%

cd('C:\Users\mahdi\Desktop\HW4_NEURO\CN_HW04\CN_HW04\spmDir15')
addpath('C:\Users\mahdi\Desktop\HW4_NEURO\CN_HW04\CN_HW04\nii tools')

[a1,b1]=convertnii2mat('spmT_0001.nii','untouch');
[a2,b2]=convertnii2mat('spmT_0002.nii','untouch');
[a3,b3]=convertnii2mat('spmT_0003.nii','untouch');
[a4,b4]=convertnii2mat('spmT_0004.nii','untouch');
[a5,b5]=convertnii2mat('spmT_0005.nii','untouch');
[a6,b6]=convertnii2mat('spmT_0006.nii','untouch');
[a7,b7]=convertnii2mat('spmT_0007.nii','untouch');
[a8,b8]=convertnii2mat('spmT_0008.nii','untouch');
[a9,b9]=convertnii2mat('spmT_0009.nii','untouch');
[a10,b10]=convertnii2mat('spmT_0010.nii','untouch');
[a11,b11]=convertnii2mat('spmT_0011.nii','untouch');
[a12,b12]=convertnii2mat('spmT_0012.nii','untouch');
[a13,b13]=convertnii2mat('spmT_0013.nii','untouch');
[a14,b14]=convertnii2mat('spmT_0014.nii','untouch');
[a15,b15]=convertnii2mat('spmT_0015.nii','untouch');
[a16,b16]=convertnii2mat('spmT_0016.nii','untouch');
[a17,b17]=convertnii2mat('spmT_0017.nii','untouch');
[a18,b18]=convertnii2mat('spmT_0018.nii','untouch');
[a19,b19]=convertnii2mat('spmT_0019.nii','untouch');
[a20,b20]=convertnii2mat('spmT_0020.nii','untouch');
[a21,b21]=convertnii2mat('spmT_0021.nii','untouch');
[a22,b22]=convertnii2mat('spmT_0022.nii','untouch');
[a23,b23]=convertnii2mat('spmT_0023.nii','untouch');
[a24,b24]=convertnii2mat('spmT_0024.nii','untouch');
[a25,b25]=convertnii2mat('spmT_0025.nii','untouch');

Z5=cell(25,1);

Z5{1}=spm_t2z(b1,120);
Z5{2}=spm_t2z(b2,120);
Z5{3}=spm_t2z(b3,120);
Z5{4}=spm_t2z(b4,120);
Z5{5}=spm_t2z(b5,120);
Z5{6}=spm_t2z(b6,120);
Z5{7}=spm_t2z(b7,120);
Z5{8}=spm_t2z(b8,120);
Z5{9}=spm_t2z(b9,120);
Z5{10}=spm_t2z(b10,120);
Z5{11}=spm_t2z(b11,120);
Z5{12}=spm_t2z(b12,120);
Z5{13}=spm_t2z(b13,120);
Z5{14}=spm_t2z(b14,120);
Z5{15}=spm_t2z(b15,120);
Z5{16}=spm_t2z(b16,120);
Z5{17}=spm_t2z(b17,120);
Z5{18}=spm_t2z(b18,120);
Z5{19}=spm_t2z(b19,120);
Z5{20}=spm_t2z(b20,120);
Z5{21}=spm_t2z(b21,120);
Z5{22}=spm_t2z(b22,120);
Z5{23}=spm_t2z(b23,120);
Z5{24}=spm_t2z(b24,120);
Z5{25}=spm_t2z(b25,120);

clear a1 a2 a3 a4 a5 a6 a7 a8 a9 a10 a11 a12 a13 a14 a15 a16 a17 a18 a19 a20 a21 a22 a23 a24 a25
clear b1 b2 b3 b4 b5 b6 b7 b8 b9 b10 b11 b12 b13 b14 b15 b16 b17 b18 b19 b20 b21 b22 b23 b24 b25


%%

cd('C:\Users\mahdi\Desktop\HW4_NEURO\CN_HW04\CN_HW04\spmDir16')
addpath('C:\Users\mahdi\Desktop\HW4_NEURO\CN_HW04\CN_HW04\nii tools')

[a1,b1]=convertnii2mat('spmT_0001.nii','untouch');
[a2,b2]=convertnii2mat('spmT_0002.nii','untouch');
[a3,b3]=convertnii2mat('spmT_0003.nii','untouch');
[a4,b4]=convertnii2mat('spmT_0004.nii','untouch');
[a5,b5]=convertnii2mat('spmT_0005.nii','untouch');
[a6,b6]=convertnii2mat('spmT_0006.nii','untouch');
[a7,b7]=convertnii2mat('spmT_0007.nii','untouch');
[a8,b8]=convertnii2mat('spmT_0008.nii','untouch');
[a9,b9]=convertnii2mat('spmT_0009.nii','untouch');
[a10,b10]=convertnii2mat('spmT_0010.nii','untouch');
[a11,b11]=convertnii2mat('spmT_0011.nii','untouch');
[a12,b12]=convertnii2mat('spmT_0012.nii','untouch');
[a13,b13]=convertnii2mat('spmT_0013.nii','untouch');
[a14,b14]=convertnii2mat('spmT_0014.nii','untouch');
[a15,b15]=convertnii2mat('spmT_0015.nii','untouch');
[a16,b16]=convertnii2mat('spmT_0016.nii','untouch');
[a17,b17]=convertnii2mat('spmT_0017.nii','untouch');
[a18,b18]=convertnii2mat('spmT_0018.nii','untouch');
[a19,b19]=convertnii2mat('spmT_0019.nii','untouch');
[a20,b20]=convertnii2mat('spmT_0020.nii','untouch');
[a21,b21]=convertnii2mat('spmT_0021.nii','untouch');
[a22,b22]=convertnii2mat('spmT_0022.nii','untouch');
[a23,b23]=convertnii2mat('spmT_0023.nii','untouch');
[a24,b24]=convertnii2mat('spmT_0024.nii','untouch');
[a25,b25]=convertnii2mat('spmT_0025.nii','untouch');

Z6=cell(25,1);

Z6{1}=spm_t2z(b1,120);
Z6{2}=spm_t2z(b2,120);
Z6{3}=spm_t2z(b3,120);
Z6{4}=spm_t2z(b4,120);
Z6{5}=spm_t2z(b5,120);
Z6{6}=spm_t2z(b6,120);
Z6{7}=spm_t2z(b7,120);
Z6{8}=spm_t2z(b8,120);
Z6{9}=spm_t2z(b9,120);
Z6{10}=spm_t2z(b10,120);
Z6{11}=spm_t2z(b11,120);
Z6{12}=spm_t2z(b12,120);
Z6{13}=spm_t2z(b13,120);
Z6{14}=spm_t2z(b14,120);
Z6{15}=spm_t2z(b15,120);
Z6{16}=spm_t2z(b16,120);
Z6{17}=spm_t2z(b17,120);
Z6{18}=spm_t2z(b18,120);
Z6{19}=spm_t2z(b19,120);
Z6{20}=spm_t2z(b20,120);
Z6{21}=spm_t2z(b21,120);
Z6{22}=spm_t2z(b22,120);
Z6{23}=spm_t2z(b23,120);
Z6{24}=spm_t2z(b24,120);
Z6{25}=spm_t2z(b25,120);

clear a1 a2 a3 a4 a5 a6 a7 a8 a9 a10 a11 a12 a13 a14 a15 a16 a17 a18 a19 a20 a21 a22 a23 a24 a25
clear b1 b2 b3 b4 b5 b6 b7 b8 b9 b10 b11 b12 b13 b14 b15 b16 b17 b18 b19 b20 b21 b22 b23 b24 b25


%

cd('C:\Users\mahdi\Desktop\HW4_NEURO\CN_HW04\CN_HW04\spmDir17')
addpath('C:\Users\mahdi\Desktop\HW4_NEURO\CN_HW04\CN_HW04\nii tools')

[a1,b1]=convertnii2mat('spmT_0001.nii','untouch');
[a2,b2]=convertnii2mat('spmT_0002.nii','untouch');
[a3,b3]=convertnii2mat('spmT_0003.nii','untouch');
[a4,b4]=convertnii2mat('spmT_0004.nii','untouch');
[a5,b5]=convertnii2mat('spmT_0005.nii','untouch');
[a6,b6]=convertnii2mat('spmT_0006.nii','untouch');
[a7,b7]=convertnii2mat('spmT_0007.nii','untouch');
[a8,b8]=convertnii2mat('spmT_0008.nii','untouch');
[a9,b9]=convertnii2mat('spmT_0009.nii','untouch');
[a10,b10]=convertnii2mat('spmT_0010.nii','untouch');
[a11,b11]=convertnii2mat('spmT_0011.nii','untouch');
[a12,b12]=convertnii2mat('spmT_0012.nii','untouch');
[a13,b13]=convertnii2mat('spmT_0013.nii','untouch');
[a14,b14]=convertnii2mat('spmT_0014.nii','untouch');
[a15,b15]=convertnii2mat('spmT_0015.nii','untouch');
[a16,b16]=convertnii2mat('spmT_0016.nii','untouch');
[a17,b17]=convertnii2mat('spmT_0017.nii','untouch');
[a18,b18]=convertnii2mat('spmT_0018.nii','untouch');
[a19,b19]=convertnii2mat('spmT_0019.nii','untouch');
[a20,b20]=convertnii2mat('spmT_0020.nii','untouch');
[a21,b21]=convertnii2mat('spmT_0021.nii','untouch');
[a22,b22]=convertnii2mat('spmT_0022.nii','untouch');
[a23,b23]=convertnii2mat('spmT_0023.nii','untouch');
[a24,b24]=convertnii2mat('spmT_0024.nii','untouch');
[a25,b25]=convertnii2mat('spmT_0025.nii','untouch');

Z7=cell(25,1);

Z7{1}=spm_t2z(b1,120);
Z7{2}=spm_t2z(b2,120);
Z7{3}=spm_t2z(b3,120);
Z7{4}=spm_t2z(b4,120);
Z7{5}=spm_t2z(b5,120);
Z7{6}=spm_t2z(b6,120);
Z7{7}=spm_t2z(b7,120);
Z7{8}=spm_t2z(b8,120);
Z7{9}=spm_t2z(b9,120);
Z7{10}=spm_t2z(b10,120);
Z7{11}=spm_t2z(b11,120);
Z7{12}=spm_t2z(b12,120);
Z7{13}=spm_t2z(b13,120);
Z7{14}=spm_t2z(b14,120);
Z7{15}=spm_t2z(b15,120);
Z7{16}=spm_t2z(b16,120);
Z7{17}=spm_t2z(b17,120);
Z7{18}=spm_t2z(b18,120);
Z7{19}=spm_t2z(b19,120);
Z7{20}=spm_t2z(b20,120);
Z7{21}=spm_t2z(b21,120);
Z7{22}=spm_t2z(b22,120);
Z7{23}=spm_t2z(b23,120);
Z7{24}=spm_t2z(b24,120);
Z7{25}=spm_t2z(b25,120);

clear a1 a2 a3 a4 a5 a6 a7 a8 a9 a10 a11 a12 a13 a14 a15 a16 a17 a18 a19 a20 a21 a22 a23 a24 a25
clear b1 b2 b3 b4 b5 b6 b7 b8 b9 b10 b11 b12 b13 b14 b15 b16 b17 b18 b19 b20 b21 b22 b23 b24 b25
%%
Z.run1=Z1;
Z.run2=Z2;
Z.run3=Z3;
Z.run4=Z4;
Z.run5=Z5;
Z.run6=Z6;
Z.run7=Z7;
%%
cd('C:\Users\mahdi\Desktop\HW4_NEURO')
save('part4_z.mat','Z')
%%

cd('C:\Users\mahdi\Desktop\HW4_NEURO')
Train=zeros(175,160*160*36);
load('part4_z.mat')
for i=1:25
    Train(i,:)=reshape(Z.run1{i},1,160*160*36);
    Train(25+i,:)=reshape(Z.run2{i},1,160*160*36);
    Train(50+i,:)=reshape(Z.run3{i},1,160*160*36);
    Train(75+i,:)=reshape(Z.run4{i},1,160*160*36);
    Train(100+i,:)=reshape(Z.run5{i},1,160*160*36);
    Train(125+i,:)=reshape(Z.run6{i},1,160*160*36);
    Train(150+i,:)=reshape(Z.run7{i},1,160*160*36);
end
%%
save('Train.mat','Train')
clear i Z
%%
vec=zeros(1,size(Train,2));
for i=1:size(Train,2)
 
    if isempty(find(Train(:,i), 1))
        vec(i)=1;
    end
    
end
%%
f=find(vec);
Train(:,f)=[];
Test(:,f)=[];
%%
% save('new_Train.mat','Train')
% save('new_Test.mat','Test')

%%
label=zeros(25,1);
label(1:5)=1;
label(6:10)=2;
label(11:15)=3;
label(16:20)=4;
label(21:25)=5;
Labels=[label;label;label;label;label;label;label];
save('Labels.mat','Labels')

%%

g1=find(Labels==1);
g2=find(Labels==2);
g3=find(Labels==3);
g4=find(Labels==4);
g5=find(Labels==5);

p=zeros(1,size(Train,2));
mat=zeros(35,5);

for i=1:size(Train,2)
    
    mat(:,1)=Train(g1,i);
    mat(:,2)=Train(g2,i);
    mat(:,3)=Train(g3,i);
    mat(:,4)=Train(g4,i);
    mat(:,5)=Train(g5,i);
    
    p(1,i)=anova1(mat,[],'off');
    
end
%%
save('p_val.mat','p')

%%


Train_final=Train(:,p<=0.01497);
Test_final=Test(:,p<=0.01497);
%% predicting

Train_final=Train_final-mean(Train_final);
Test_final=Test_final-mean(Train_final);

Train_final=Train_final./std(Train_final);
Test_final=Test_final./std(Train_final);

mdl=fitcecoc(Train_final,Labels);
Predicted_Label1=predict(mdl,Test_final);

save('Predicted_Label1.mat','Predicted_Label1');



%% since we have 7 group we use holdout validation 



m1=Train;
m1(1:25,:)=[];

l1=Labels;
l1(1:25)=[];

g1=l1==1;
g2=l1==2;
g3=l1==3;
g4=l1==4;
g5=l1==5;


p=zeros(7,size(Train,2));
mat=zeros(30,5);

for i=1:size(Train,2)
    
    mat(:,1)=m1(g1,i);
    mat(:,2)=m1(g2,i);
    mat(:,3)=m1(g3,i);
    mat(:,4)=m1(g4,i);
    mat(:,5)=m1(g5,i);
    
    p(1,i)=anova1(mat,[],'off');
    
end



clear m1 l1 


m2=Train;
m2(26:50,:)=[];

l2=Labels;
l2(26:50)=[];

g1=l2==1;
g2=l2==2;
g3=l2==3;
g4=l2==4;
g5=l2==5;

mat=zeros(30,5);

for i=1:size(Train,2)
    
    mat(:,1)=m2(g1,i);
    mat(:,2)=m2(g2,i);
    mat(:,3)=m2(g3,i);
    mat(:,4)=m2(g4,i);
    mat(:,5)=m2(g5,i);
    
    p(2,i)=anova1(mat,[],'off');
    
end


clear m2 l2



m3=Train;
m3(51:75,:)=[];

l3=Labels;
l3(51:75)=[];

g1=l3==1;
g2=l3==2;
g3=l3==3;
g4=l3==4;
g5=l3==5;

mat=zeros(30,5);

for i=1:size(Train,2)
    
    mat(:,1)=m3(g1,i);
    mat(:,2)=m3(g2,i);
    mat(:,3)=m3(g3,i);
    mat(:,4)=m3(g4,i);
    mat(:,5)=m3(g5,i);
    
    p(3,i)=anova1(mat,[],'off');
    
end


clear m3 l3


m4=Train;
m4(76:100,:)=[];

l4=Labels;
l4(76:100)=[];

g1=l4==1;
g2=l4==2;
g3=l4==3;
g4=l4==4;
g5=l4==5;

mat=zeros(30,5);

for i=1:size(Train,2)
    
    mat(:,1)=m4(g1,i);
    mat(:,2)=m4(g2,i);
    mat(:,3)=m4(g3,i);
    mat(:,4)=m4(g4,i);
    mat(:,5)=m4(g5,i);
    
    p(4,i)=anova1(mat,[],'off');
    
end


clear m4 l4



m5=Train;
m5(101:125,:)=[];

l5=Labels;
l5(101:125)=[];

g1=l5==1;
g2=l5==2;
g3=l5==3;
g4=l5==4;
g5=l5==5;

mat=zeros(30,5);

for i=1:size(Train,2)
    
    mat(:,1)=m5(g1,i);
    mat(:,2)=m5(g2,i);
    mat(:,3)=m5(g3,i);
    mat(:,4)=m5(g4,i);
    mat(:,5)=m5(g5,i);
    
    p(5,i)=anova1(mat,[],'off');
    
end


clear m5 l5



m6=Train;
m6(126:150,:)=[];

l6=Labels;
l6(126:150)=[];

g1=l6==1;
g2=l6==2;
g3=l6==3;
g4=l6==4;
g5=l6==5;

mat=zeros(30,5);

for i=1:size(Train,2)
    
    mat(:,1)=m6(g1,i);
    mat(:,2)=m6(g2,i);
    mat(:,3)=m6(g3,i);
    mat(:,4)=m6(g4,i);
    mat(:,5)=m6(g5,i);
    
    p(6,i)=anova1(mat,[],'off');
    
end


clear m6 l6



m7=Train;
m7(151:175,:)=[];

l7=Labels;
l7(151:175)=[];

g1=l7==1;
g2=l7==2;
g3=l7==3;
g4=l7==4;
g5=l7==5;

mat=zeros(30,5);

for i=1:size(Train,2)
    
    mat(:,1)=m7(g1,i);
    mat(:,2)=m7(g2,i);
    mat(:,3)=m7(g3,i);
    mat(:,4)=m7(g4,i);
    mat(:,5)=m7(g5,i);
    
    p(7,i)=anova1(mat,[],'off');
    
end


clear m7 l7

% save p matrix
cd('C:\Users\mahdi\Desktop\HW4_NEURO\data')
save('Holdout_p','p')
%% finding threshold

t_hold=linspace(0.0001,0.02,100);

accuracy=zeros(3,length(t_hold));

for i=1:length(t_hold)
    
    acc=zeros(3,7);
    
    for j=1:7
        a=sum(p(j,:)<=t_hold(i));
        if a==0
            b=min(p(j,:));
        else
            b=t_hold(i);
        end
        
        x_train=Train(:,p(j,:)<=b);
        x_test=x_train((j-1)*25+1:25*j,:);
        x_train(((j-1)*25+1):(25*j),:)=[];
        
        a=mean(x_train);
        b=std(x_train);
        
        y_train=Labels;
        y_test=y_train(((j-1)*25+1):(25*j));
        y_train(((j-1)*25+1):(25*j))=[];
        
        mdl=fitcdiscr(x_train,y_train);
        y_pred1=predict(mdl,x_test);
        acc(1,j)=sum(y_pred1==y_test)/25;
        
        tr=(x_train-a)./b;
        te1=(x_test-a)./b;
        
        
        md2=fitcecoc(tr,y_train);
        y_pred2=predict(md2,te1);
        acc(2,j)=sum(y_pred2==y_test)/25;
        
        te2=(x_test-mean(x_test))./std(x_test);
        y_pred3=predict(md2,te2);
        
        acc(3,j)=sum(y_pred3==y_test)/25;
      
    end
    
    accuracy(1,i)=mean(acc(1,:));
    accuracy(2,i)=mean(acc(2,:));
    accuracy(3,i)=mean(acc(3,:));
    
end
%% plot accuracy

plot(t_hold,accuracy(1,:),'g','LineWidth',2)
hold on
plot(t_hold,accuracy(2,:),'r','LineWidth',2)


plot(t_hold,accuracy(3,:),'b','Linewidth',2)
legend('LDA Accuracy','SVM Accuracy first view','SVM second view')


%% Logestic  Regression

pihat=zeros(25,5,7);    
for j=1:7
    
    x_train=Train(:,p(j,:)<=0.001);
    x_test=x_train((j-1)*25+1:25*j,:);
    x_train(((j-1)*25+1):(25*j),:)=[];

    y_train=Labels;
    y_test=y_train(((j-1)*25+1):(25*j));
    y_train(((j-1)*25+1):(25*j))=[];

    B=mnrfit(x_train,y_train);
    pihat(:,:,j) = mnrval(B,x);
   
end

Pred_LR=zeros(25,7);
for j=1:7
    for i=1:25
        Pred_LR(i,j)=find(pihat(i,:,j)==max(pihat(i,:,j)));
    end
end

accuracy_LR=zeros(1,7);

for j=1:7
    y_test=Labels(((j-1)*25+1):(25*j));
    accuracy_LR(j)=sum(Pred_LR(:,j)==y_test)/25;
end

%% Part 5a
% Classifying via BOLD Response
% Extracting the BOLD Responses
cd('C:\Users\mahdi\Desktop\HW4_NEURO\CN_HW04\CN_HW04\dataset')
addpath('C:\Users\mahdi\Desktop\HW4_NEURO\CN_HW04\CN_HW04\nii tools')

[run01_BOLD_hdr , run01_BOLD] = convertnii2mat ('run-01_bold.nii','untouch') ;
[run02_BOLD_hdr , run02_BOLD] = convertnii2mat ('run-02_bold.nii','untouch') ;
[run03_BOLD_hdr , run03_BOLD] = convertnii2mat ('run-03_bold.nii','untouch') ;
[run04_BOLD_hdr , run04_BOLD] = convertnii2mat ('run-04_bold.nii','untouch') ;
[run05_BOLD_hdr , run05_BOLD] = convertnii2mat ('run-05_bold.nii','untouch') ;
[run06_BOLD_hdr , run06_BOLD] = convertnii2mat ('run-06_bold.nii','untouch') ;
[run07_BOLD_hdr , run07_BOLD] = convertnii2mat ('run-07_bold.nii','untouch') ;
%%
% Cleaning the first 3 images
run01_BOLD(:,:,:,1:3) = [] ;
run02_BOLD(:,:,:,1:3) = [] ;
run03_BOLD(:,:,:,1:3) = [] ;
run04_BOLD(:,:,:,1:3) = [] ;
run05_BOLD(:,:,:,1:3) = [] ;
run06_BOLD(:,:,:,1:3) = [] ;
run07_BOLD(:,:,:,1:3) = [] ;
BOLD_Response = cat (4,run01_BOLD,run02_BOLD,run03_BOLD,run04_BOLD,run05_BOLD,run06_BOLD,run07_BOLD) ;

%% Extracting Task Information
run01_Inf = tdfread ('run-01_events.tsv') ;
run02_Inf = tdfread ('run-02_events.tsv') ;
run03_Inf = tdfread ('run-03_events.tsv') ;
run04_Inf = tdfread ('run-04_events.tsv') ;
run05_Inf = tdfread ('run-05_events.tsv') ;
run06_Inf = tdfread ('run-06_events.tsv') ;
run07_Inf = tdfread ('run-07_events.tsv') ;
run01_onset = floor(run01_Inf.onset) ;
run02_onset = floor(run02_Inf.onset) ;
run03_onset = floor(run03_Inf.onset) ;
run04_onset = floor(run04_Inf.onset) ;
run05_onset = floor(run05_Inf.onset) ;
run06_onset = floor(run06_Inf.onset) ;
run07_onset = floor(run07_Inf.onset) ;
onset = [run01_onset;run02_onset;run03_onset;run04_onset;run05_onset;run06_onset;run07_onset] ;

%% Creating TRAIN Matrix 
BOLD_Response2 = zeros (160,160,36,175) ;
for i = 1 : 7
    BOLD_temp = BOLD_Response (:,:,:,((i-1)*150+1):(i*150)) ;
    Onset_temp = onset(((i-1)*25+1):(i*25)) ;
    Onset_temp = Onset_temp/2 ;
    Onset_temp(1) = 1 ;
   for j = 1 : length (Onset_temp)
       k = Onset_temp (j) ;
       BOLD_Response2(:,:,:,25*(i-1)+j) = (BOLD_temp(:,:,:,k) + BOLD_temp(:,:,:,k+1) + BOLD_temp(:,:,:,k+2)) / 3 ;
    end
end
BOLD_train = zeros (175,160*160*36) ;
for i = 1:175
   BOLD_train(i,:) = reshape (BOLD_Response2(:,:,:,i) , 1 , []) ; 
end

%% finding label

run01_l=run01_Inf.trial_type;
run02_l=run02_Inf.trial_type;
run03_l=run03_Inf.trial_type;
run04_l=run04_Inf.trial_type;
run05_l=run05_Inf.trial_type;
run06_l=run06_Inf.trial_type;
run07_l=run07_Inf.trial_type;

names=[run01_l;run02_l;run03_l;run04_l;run05_l;run06_l;run07_l];


names=cellstr(names);

% ambient =1 , country = 2 , metal = 3 , rocknroll = 4 , symphonic = 5

Labels=zeros(175,1);

for i=1:175
    
    if (isequal('ambient',names{i}))
        Labels(i)=1;
    elseif(isequal('country',names{i}))
        Labels(i)=2;
    elseif(isequal('metal',names{i}))
        Labels(i)=3;
    elseif(isequal('rocknroll',names{i}))
        Labels(i)=4;
    else
        Labels(i)=5;
        
    end
    
end



%%

vec=zeros(1,size(BOLD_train,2));
for i=1:size(BOLD_train,2)
 
    if isempty(find(BOLD_train(:,i), 1))
        vec(i)=1;
    end
    
end

f=find(vec);
BOLD_train(:,f)=[];
BOLD_test(:,f)=[];

%% calassify

Train_final=BOLD_train(:,p<=0.004321);
Test_final=BOLD_test(:,p<=0.004321);


mdl=fitcdiscr(Train_final,Labels);
Predicted_Label2=predict(mdl,Test_final);

save('Predicted_Label2.mat','Predicted_Label2');


%%

g1=find(Labels==1);
g2=find(Labels==2);
g3=find(Labels==3);
g4=find(Labels==4);
g5=find(Labels==5);

p=zeros(1,size(BOLD_train,2));
mat=zeros(35,5);

for i=1:size(BOLD_train,2)
    
    mat(:,1)=BOLD_train(g1,i);
    mat(:,2)=BOLD_train(g2,i);
    mat(:,3)=BOLD_train(g3,i);
    mat(:,4)=BOLD_train(g4,i);
    mat(:,5)=BOLD_train(g5,i);
    
    p(1,i)=anova1(mat,[],'off');
    
end
%%
cd('C:\Users\mahdi\Desktop\HW4_NEURO')
save('p_val_part5.mat','p')

%%
BOLD_train_f=BOLD_train(:,p<=0.0001);

Train_final=[BOLD_train_f,Labels];

%% finding good threshold


t_hold=linspace(0.0001,0.02,100);

accuracy=zeros(3,length(t_hold));

for i=1:length(t_hold)
    
    acc=zeros(3,7);
    
    for j=1:7
        a=sum(p(1,:)<=t_hold(i));
        if a==0
            b=min(p(j,:));
        else
            b=t_hold(i);
        end
        
        x_train=BOLD_train(:,p(1,:)<=b);
        x_test=x_train((j-1)*25+1:25*j,:);
        x_train(((j-1)*25+1):(25*j),:)=[];
        
        a=mean(x_train);
        b=std(x_train);
        
        y_train=Labels;
        y_test=y_train(((j-1)*25+1):(25*j));
        y_train(((j-1)*25+1):(25*j))=[];
        
        mdl=fitcdiscr(x_train,y_train);
        y_pred1=predict(mdl,x_test);
        acc(1,j)=sum(y_pred1==y_test)/25;
        
        tr=(x_train-a)./b;
        te1=(x_test-a)./b;
        
        
        md2=fitcecoc(tr,y_train);
        y_pred2=predict(md2,te1);
        acc(2,j)=sum(y_pred2==y_test)/25;
        
        te2=(x_test-mean(x_test))./std(x_test);
        y_pred3=predict(md2,te2);
        
        acc(3,j)=sum(y_pred3==y_test)/25;
      
    end
    
    accuracy(1,i)=mean(acc(1,:));
    accuracy(2,i)=mean(acc(2,:));
    accuracy(3,i)=mean(acc(3,:));
    
end
%% plot accuracy


plot(t_hold,100*accuracy(1,:),'g','LineWidth',2)
hold on
plot(t_hold,100*accuracy(2,:),'r','LineWidth',2)


plot(t_hold,100*accuracy(3,:),'b','Linewidth',2)
legend('LDA Accuracy','SVM Accuracy first view','SVM second view')

xlabel('pvalue')
ylabel('accuracy')

%% Part 5b

clc
close all
clear 
%%
cd('C:\Users\mahdi\Desktop\HW4_NEURO\CN_HW04\CN_HW04\dataset')

run01_Inf = tdfread ('run-01_events.tsv') ;
run02_Inf = tdfread ('run-02_events.tsv') ;
run03_Inf = tdfread ('run-03_events.tsv') ;
run04_Inf = tdfread ('run-04_events.tsv') ;
run05_Inf = tdfread ('run-05_events.tsv') ;
run06_Inf = tdfread ('run-06_events.tsv') ;
run07_Inf = tdfread ('run-07_events.tsv') ;

stim=[run01_Inf.stim;run02_Inf.stim;run03_Inf.stim;run04_Inf.stim;run05_Inf.stim;run06_Inf.stim;run07_Inf.stim];


stim=cellstr(stim);

songs=nominal(stim);
songs=double(songs);
%%
for i=1:25
    
    song=find(songs==i);
    BOLD_song=BOLD_train(song,:);
    mat=zeros(6,25);
    
    mat(1,i)=sum((BOLD_song(1,:)-BOLD_song(2,:)).^2);
    mat(2,i)=sum((BOLD_song(1,:)-BOLD_song(3,:)).^2);
    mat(3,i)=sum((BOLD_song(1,:)-BOLD_song(4,:)).^2);
    mat(4,i)=sum((BOLD_song(1,:)-BOLD_song(5,:)).^2);
    mat(5,i)=sum((BOLD_song(1,:)-BOLD_song(6,:)).^2);
    mat(6,i)=sum((BOLD_song(1,:)-BOLD_song(7,:)).^2);
    
    mat(:,i)=mat(:,i)/max(mat(:,i));
    
    figure(i)
    stem(mat(:,i))

end









