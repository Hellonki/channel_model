function PL=PL_logdist_or_norm(fc,d,d0,n,sigma)
%对数距离路径损耗模型\对数正态阴影衰落模型
%fc:载波频率(Hz)
%d:基站和移动台之间的距离
%d0:参考路径(m)
%n:路径损耗指数,随不同环境而改变
%sigma:阴影衰落的方差(dB)
%PL:路径损耗(dB)

lamda=3e8/fc;
PL=-20*log10(lamda/(4*pi*d0)) + 10*n*log10(d/d0);
if nargin>4
    PL=PL+sigma*randn(size(d));
end
end









