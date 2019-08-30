function PL=PL_free(fc,dist,Gt,Gr)
%自由空间的路径损耗模型
%fc: 载波的频率(Hz)
%dist: 基站和移动台之间的距离(m)
%Gt:发射机天线的增益
%Gr:接收机天线的增益
%PL: 自由空间的路径损耗(dB)

if nargin==2
    Gt=1;Gr=1;
end
if nargin==3
    Gr=1;
end
lamda=3e8/fc;      %信号的波长
tmp=lamda/(4*pi*dist).*sqrt(Gt*Gr);
PL=-20*log10(tmp);

end












