%绘制IEEE 802.16d的路径损耗模型
clear
fc=2e9;      %载波的频率2GHz
htx=[30 30];  %发送天线的高度固定
hrx=[2 10];    %接收天线的高度
distance=[1:1000];     %移动台到基站之间的距离
for k=1:2
   y_IEEE16d(k,:)=PL_IEEE_802_16d(fc,distance,'A',htx(k),hrx(k),'atnt');
   y_MIEEE16d(k,:)=PL_IEEE_802_16d(fc,distance,'A',htx(k),hrx(k),'atnt','mod');
end
subplot(121)
semilogx(distance,y_IEEE16d(1,:),'k:','linewidth',1.5)
hold on
semilogx(distance,y_IEEE16d(2,:),'k-','linewidth',1.5)
grid on
title(['IEEE 802.16d Path loss Models,fc=',num2str(fc/1e6),'MHz'])
axis([1 1000 10 150])
xlabel('Distance[m]'),ylabel('Pathloss[dB]')
legend('Tx=30m','Rx=2m','Tx=30m','Rx=10m')

subplot(122)
semilogx(distance,y_MIEEE16d(1,:),'k:','linewidth',1.5)
hold on
semilogx(distance,y_MIEEE16d(2,:),'k-','linewidth',1.5)
grid on
title(['Modified IEEE 802.16d Path loss Models,fc=',num2str(fc/1e6),'MHz'])
axis([1 1000 10 150])
xlabel('Distance[m]'),ylabel('Pathloss[dB]')
legend('Tx=30m','Rx=2m','Tx=30m','Rx=10m')









