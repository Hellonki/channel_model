function PL=PL_IEEE_802_16d(fc,d,type,htx,hrx,corr_fact,mod)
%IEEE 802.16dģ��
%fc:�ز�Ƶ��(Hz)
%d:��վ���ƶ�̨֮��ľ���
%type:����ѡ��'A','B','C'
%htx:������ĸ߶�(m)
%hrx:���ջ��ĸ߶�
%corr_fact:���������Ӱ,��ô����Ϊ'atnt','okumura'.��������Ϊ'no'
%mod:����'mod'���õ�������IEEE 802.16dģ��
%PL:·�����(dB)

Mod='UNMOD';
if nargin>6
    Mod=upper(mod);      %ת����ȫ���Ĵ�д��ĸ
end

d0=100;     %�ο�����Ϊ100m

Type=upper(type);      %����a,b,c��ģ��ѡ��

%��ͬ����Ӱ˥��ģ��
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

%��ͬ��a,b,c,����ģ��
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

%�Ƿ��������ģ��
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










