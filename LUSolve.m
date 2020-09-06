%MATLAB FUNCTION TO SOLVE THE LINEAR SYSTEM LUx=b
function x=LUSolve(A,b)
%Function to solve the equation LUx=b
%L -->Lower triangular matrix
%U -->Upperer triangular matrix
%b -->Right hand side vector

[n,m]=size(A);
L=eye(n);
U=A;
for j=1:n
    for i=j+1:n
        L(i,j)=U(i,j)/U(j,j);
        U(i,:)=U(i,:)-L(i,j)*U(j,:);
    end
end
[n,m]=size(L);
y=zeros(n,1);
x=zeros(n,1);
%First solve Ly=b using forward substitution
y(1)=b(1)/L(1,1);
for i=2:n
   y(i)=(b(i)-L(i,1:i-1)*y(1:i-1))/L(i,i);
end
x(n)=y(n)/U(n,n);
for i=n-1:-1:1
x(i)=(y(i)-U(i,i+1:n)*x(i+1:n))/U(i,i);
end
