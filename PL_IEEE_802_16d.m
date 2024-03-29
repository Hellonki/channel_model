function PL=PL_IEEE_802_16d(fc,d,type,htx,hrx,corr_fact,mod)
%IEEE 802.16d模型
%fc:载波频率(Hz)
%d:基站和移动台之间的距离
%type:可以选择'A','B','C'
%htx:发射机的高度(m)
%hrx:接收机的高度
%corr_fact:如果存在阴影,那么设置为'atnt','okumura'.否则设置为'no'
%mod:设置'mod'来得到修正的IEEE 802.16d模型
%PL:路径损耗(dB)

Mod='UNMOD';
if nargin>6
    Mod=upper(mod);      %转换成全部的大写字母
end

d0=100;     %参考距离为100m

Type=upper(type);      %参数a,b,c的模型选择

%不同的阴影衰落模型
switch upper(corr_fact)
    case 'ATNT' 
        Cf=6*log10(fc/2e9);  
        if Type=='A' || Type=='B'
            Crx=-10.8*log10(hrx/2);
        elseif Type=='C'
            Crx=-20*log10(hrx/2); 
        end
    case 'OKUMURA'
        Cf=6*log10(fc/2000);
        if hrx<=3
            Crx=-10*log10(hrx/3);
        elseif hrx>3
            Crx=-20*log10(hrx/3);
        end
    case 'NO'
        Cf=0;
        Crx=0;
end

%不同的a,b,c,参数模型
switch Type
    case 'A'
        a=4.6;b=0.0075;c=12.6;
    case 'B'
        a=4;b=0.065;c=17.1;
    case 'C'
        a=3.6;b=0.005;c=20;
end

gama=a-b*htx+c/htx;
lamda=3e8/fc;

%是否采用修正模型
if Mod(1)=='M'
    dx=d0.*10.^(-(Cf+Crx)./10/gama);
elseif Mod(1)=='U'
    dx=d0;
end

for k=1:length(d)
    if d(k)<=dx
        PL(k)=20*log10(4*pi*d(k)/lamda);
    elseif d(k)>dx
        PL(k)=20*log10(4*pi*dx/lamda) + 10*gama*log10(d(k)/d0)+Cf+Crx;
    end
end



end











