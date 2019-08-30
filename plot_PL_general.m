%���Ʋ�ͬ��·�����ģ��
clear
fc=1.5e9;    %�ز���Ƶ��1.5GHz
d0=100;      %�ο�����
sigma=3;     %��Ӱ˥��ı�׼��
distance=[1:2:31].^2;   %�ƶ�̨����վ֮��ľ���
Gt=[1 1 0.5];    %���͹�������
Gr=[1 0.5 0.5];    %���չ�������
Exp=[2,3,6];      %·�������ָ��

for k=1:3
   y_Free(k,:)=PL_free(fc,distance,Gt(k),Gr(k));
   y_logdist(k,:)=PL_logdist_or_norm(fc,distance,d0,Exp(k));
   y_lognorm(k,:)=PL_logdist_or_norm(fc,distance,d0,Exp(1),sigma);
end

subplot(131)
semilogx(distance,y_Free(1,:),'k-o',distance,y_Free(2,:),'k-^',distance,y_Free(3,:),'k-s')
grid on
axis([1 1000 40 110])
title(['Free Pl-loss Model,fc=',num2str(fc/1e6),'MHz'])
xlabel('Distance[m]'),ylabel('Path loss[dB]')
legend('Gt=1,Gr=1','Gt=1,Gr=0.5','Gt=0.5,Gr=0.5')

subplot(132)
semilog(distance,y_logdist(1,:),'k-o',distance,y_logdist(2,:),'k-^',distance,y_logdist(3,:),'k-s')
grid on
axis([1 1000 40 110])
title(['Log-distance Path-loss Model,fc=',num2str(fc/1e6),'MHz'])
xlabel('Distance[m]'),ylabel('Path loss[dB]')
legend('n=2','n=3','n=6')

subplot(133)
semilog(distance,y_lognorm(1,:),'k-o',distance,y_lognorm(2,:),'k-^',distance,y_lognorm(3,:),'k-s')
grid on
axis([1 1000 40 110])
title(['Log-normal Path-loss Model,fc=',num2str(fc/1e6),'MHz'])
xlabel('Distance[m]'),ylabel('Path loss[dB]')
legend('path 1','path 2','path 3')








