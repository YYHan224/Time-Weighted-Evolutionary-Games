function [dxdt] = odefun1(t,x,a,b,c,d)
%UNTITLED �˴���ʾ�йش˺�����ժҪ
%   �˴���ʾ��ϸ˵��
dxdt=x*(1-x)*((a-b-c+d)*x+(b-d));
end