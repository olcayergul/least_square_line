function seidel(A,b,x0)
% A        coefficient matrix (n by n)
% b        right-hand side (n by 1)
% x0       initial solution (n by 1)
% tol      stop if norm of change in x < tol
% max      maximum number of iterations
% x        solution vector (n by 1)


tol=0.001;
max=20;
[n,m]=size(A);
x=x0;
C=-A;
for i=1:n
    C(i,i)=0;
end
for i=1:n
    C(i,1:n)=C(i,1:n)/A(i,i);
end
for i=1:n
    d(i,1)=b(i)/A(i,i);
end
i=1;

disp('    i                   x1                  x2                    x3 ');
disp('|------|------------------|-------------------|---------------------|');

while (i<=max)
    xold=x;
    for j=1:n
        x(j)=C(j,:)*x+d(j);
    end
    if norm(xold-x)<=tol
       disp('   ');
        disp('Gauss-seidel method converged');
        return;
     end
     
     ds_i=sprintf('%4d %20.10g %20.10g  %20.10g ',i, x) ;
     disp(ds_i);

    %disp([i    x']);
    i=i+1;
 end
 disp('    ');
disp('Gauss-seidel method did not converged');


        