function [dxdt] = odefun2(t,x,a,b,c,d)
dxdt = zeros(2,1);
dxdt(1) = x(2);
dxdt(2)=x(1)*(1-x(1))*((a-b-c+d)*x(1)+(b-d))+(1-2*x(1))/(x(1)*(1-x(1)))*x(2)^2;
if x(1)+dxdt(1)>1%�ӽ�1�Ľ���ϵͳ
    dxdt = zeros(2,1);
    dxdt(1) = x(2);
    dxdt(2)=(1-x(1))*(a-c)-x(2)^2/(1-x(1));
elseif x(1)+dxdt(1)<0%�ӽ�0�Ľ���ϵͳ
    dxdt = zeros(2,1);
    dxdt(1) = x(2);
    dxdt(2)=x(1)*(b-d)+x(2)^2/(x(1));
end
end

