function PL=PL_free(fc,dist,Gt,Gr)
%���ɿռ��·�����ģ��
%fc: �ز���Ƶ��(Hz)
%dist: ��վ���ƶ�̨֮��ľ���(m)
%Gt:��������ߵ�����
%Gr:���ջ����ߵ�����
%PL: ���ɿռ��·�����(dB)

if nargin==2
    Gt=1;Gr=1;
end
if nargin==3
    Gr=1;
end
lamda=3e8/fc;      %�źŵĲ���
tmp=lamda/(4*pi*dist).*sqrt(Gt*Gr);
PL=-20*log10(tmp);

end












