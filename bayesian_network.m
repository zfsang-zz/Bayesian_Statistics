
%% Diabetes in Pima Indians
% Isye 6420 hw1 Zhifan Sang


% random numbers to default start
s = RandStream('mt19937ar','Seed',0);
RandStream.setGlobalStream(s);
%
B=200000;
ps=[]; as=[]; os=[]; ds=[]; gs=[]; is=[]; bs=[]; %save history
%set hard evidence
it =1 ;%High 2-h serum insulin (?U/ml)
for  j=1:B
p=rand<=0.55;   %Three or more pregnancies
a=rand<=0.5;   %Older than the database median age        
o=rand<=0.5;      %Heavier than the database median weight

if(p)   if(a)  if(o) d=rand<=0.95; else d=rand<0.37; end;
            else if(o) d=rand<=0.34;else d<=0.27; end; end;
else
        if(a)  if(o) d=rand<=0.60; else d=rand<0.41; end;
            else if(o) d=rand<=0.33;else d<=0.05; end; end;
end

if(d) i=rand<=0.48; else i=rand<=0.51; end; %High 2-h serum insulin (?U/ml)

%%hard evidence filter
          if(i == it)
          ps=[ps p];  as =[as a]; os=[os o]; ds=[ds d];is=[is i];
          end;
end

os_total=sum(os) %49128
is_total=sum(is) %99008
poi= os_total/is_total %0.4962

%P(O|I)=0.4962
