function [dxdt] = odefunt(t,x,a,b,c,d)
%UNTITLED �˴���ʾ�йش˺�����ժҪ
%   �˴���ʾ��ϸ˵��
dxdt=(t+1)*x*(1-x)*((a-b-c+d)*x+(b-d));
end