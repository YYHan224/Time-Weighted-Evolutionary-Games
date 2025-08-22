% % %%%%%decreasingly RD
a=6;d=2;
B=linspace(-2,8,1000);
X_0=linspace(-1.0,1.0,200);%偏好初值x'(0)
X0=linspace(0,1,100);%x(0)
% P4=[];Xmax4=[];Xmin4=[];Xm14=[];Xma14=[];
for k=1:1%排序
    XX=[];TT=[];
    x00 = 0.5;%X0(k);%X_0(k);%X_0(k);%二阶加速度初值
    for i=100:100%B
        %b=B(i);c=6+b;
        b=5.0;c=6+b;
        fprintf('k = %d, i = %d\n', k, i);       
        tspan=[0 500];%加速度初值-0.5，k=68没计算完
        x0=[x00;0.5];%x0=[0.2;0.];%合作初值0.8加速度0
        options = odeset('RelTol',1e-6,'AbsTol',1e-8,'MaxStep',0.1);
        [t,x]=ode23s(@(t,x)odefun2(t,x,a,b,c,d),tspan,x0,options);
%         t_start=0;t_end=200;
%         h=0.001;
%         t=t_start:h:t_end;
%         n=length(t);
%         y=zeros(n,2);y(1,:)=[0.5;0.5]';
%         for i=1:length(t)-1
%             [t_sub,y_sub]=ode23s(@(t,x)odefun2(t,x,a,b,c,d),[t(i),t(i+1)],y(i,:)',options);
%             y(i+1,:)=y_sub(end,:);
%         end
%         for j=1:50
%             tspan=[500 600];
%             x0=x(end,:);
%             if isnan(x0(1))
%                 break;
%             end
%             [t,x]=ode23s(@(t,x)odefun2(t,x,a,b,c,d),tspan,x0,options);
%         end
%         tspan=[5000 5400];
%         x0=x(end,:);
%         [t,x]=ode15s(@(t,x)odefun2(t,x,a,b,c,d),tspan,x0,options);
%         xm1=[xm1;mean(x(:,1))];xma1=[xma1;mean(x(:,2))];
% %         值超过[0,1]范围
%         if any(x(:,1)>1+1e-4)||any(x(:,1)<0-1e-4)||any(isnan(x(:,1)))
%             p=[p;NaN];xmin=[xmin;NaN];xmax=[xmax;NaN];
%         else
%             %时间序列所有值都相同
%             variance = var(x(:,1));
%             if variance <= 1e-7
%                 p=[p;0];xmin=[xmin;min(x(:,1))];xmax=[xmax;max(x(:,1))];
%             else
%             %序列是周期的，且值在[0,1]之间
%                 [acf,lags] = xcorr(x(:,1));
%                 [pks,loc] = findpeaks(acf); % 寻找自相关函数中的峰值及其位置
%                 if length(loc)<2%由于变量在很小的范围内波动，通过归一化放大
%                     y_normalized =(x(:,1)-min(x(:,1)))/(max(x(:,1))-min(x(:,1)));
%                     [acf,lags] = xcorr(y_normalized);
%                     [pks,loc] = findpeaks(acf);
%                 end
%                 p=[p;t(loc(2))-t(loc(1))];% 找到周期估计值，对应到峰值的时间t
%                 xmin=[xmin;min(x(:,1))];xmax=[xmax;max(x(:,1))];
%             end
%         end
%     end
%     film_name=[num2str(k) 'p' '.mat'];
%     save(film_name, 'p')
%     film_name=[num2str(k) 'xmax' '.mat'];
%     save(film_name, 'xmax')
%     film_name=[num2str(k) 'xmin' '.mat'];
%     save(film_name, 'xmin')
%     film_name=[num2str(k) 'xm1' '.mat'];
%     save(film_name, 'xm1')
%     film_name=[num2str(k) 'xma1' '.mat'];
%     save(film_name, 'xma1')
%     P4=[P4,p];Xmax4=[Xmax4,xmax];Xmin4=[Xmin4,xmin];
%     Xm14=[Xm14,xm1];Xma14=[Xma14,xma1];
%     film_name=['P4' '.mat'];
%     save(film_name, 'P4')
%     film_name=['Xmax4' '.mat'];
%     save(film_name, 'Xmax4')
%     film_name=['Xmin4' '.mat'];
%     save(film_name, 'Xmin4')
%     film_name=['Xm14' '.mat'];
%     save(film_name, 'Xm14')
%     film_name=['Xma14' '.mat'];
%     save(film_name, 'Xma14')
    end
end
%%%%increasinglt RD
% a=6;d=2;
% B=linspace(-2.0,8.0,1000);
% X0=linspace(0,1,100);Xm=[];
% for i=1000:1000%参数b
%     i
%     b=B(i);c=6+b;xm=[];
%     for k=1:1
%         tspan=[0 100000000];x0=0.5;%X0(k);
%         [t,x]=ode15s(@(t,x)odefunt(t,x,a,b,c,d),tspan,x0);
% %         tspan=tspan+400;x0=x(end,:);
% %         [t,x]=ode15s(@(t,x)odefunt(t,x,a,b,c,d),tspan,x0);
% %         xm=[xm;mean(x(:,1))];
% %         film_name=[num2str(i) 'x' '.mat'];
% %         save(film_name, 'x')
% %         film_name=[num2str(i) 't' '.mat'];
% %         save(film_name, 't')
%     end
% %     Xm=[Xm,xm];
% end
% film_name=['Xm' '.mat'];
% save(film_name, 'Xm');
% %%%%%equally RD
% a=6;d=2;
% B=linspace(-2,8.0,1000);
% X0=linspace(0,1,50);
% Xm=[];
% for ii=25:25%初值
%     ii
%     xm=[];
%     for i=800:800%67，69,70,71,72,74,79,80,81有问题
%         b=B(i);c=6+b;%参数b
%         tspan=[0 200];
%         x0=[X0(ii)];%x0=[0.2;0.];%合作初值0.2加速度0
%         [t,x]=ode23s(@(t,x,p)odefun1(t,x,a,b,c,d),tspan,x0);
%         for j=1:1000
%             tspan=[5000 5200];
%             x0=x(end,:);
%             [t,x,p]=ode23s(@(t,x,p)odefun1(t,x,a,b,c,d),tspan,x0);
%         end
% %     film_name=[num2str(i) 'x' '.mat'];
% %     save(film_name, 'x')
% %     film_name=[num2str(i) 't' '.mat'];
% %     save(film_name, 't')
% %         xm=[xm;mean(x(:,1))];
% %         film_name=[num2str(ii) 'xm' '.mat'];
% %         save(film_name, 'xm')
%      end
% %      Xm=[Xm,xm];
% %      film_name=['Xm' '.mat'];
% %      save(film_name, 'Xm')
% end