function jacobi(A,b,x0)
% A        coefficient matrix (n by n)
% b        right-hand side (n by 1)
% x0       initial solution (n by 1)
% tol      stop if norm of change in x < tol
% max      maximum number of iterations
% x        solution vector (n by 1)

tol=0.001;
max=20;
[n,m]=size(A);
xold=x0;
C=-A;
for i=1:n
    C(i,i)=0;
end
for i=1:n
    C(i,:)=C(i,:)/A(i,i);
end
for i=1:n
    d(i,1)=b(i)/A(i,i);
end
i=1;
disp('    i                   x1                  x2                    x3 ');
disp('|------|------------------|-------------------|---------------------|');

while (i<=max)
    xnew=C*xold+d;
    if norm(xnew-xold)<=tol
       x=xnew;
       disp('    ');
        disp('Jacobi method converged');
        return;
    else
        xold=xnew;
     end
     ds_i=sprintf('%4d %20.10g %20.10g  %20.10g ',i, xnew) ;
     disp(ds_i);

    %disp([i    xnew']);
    i=i+1;
    
 end
 
 disp('    ');
 disp('Jacobi method did not converged');
disp('Results after maximum number of iterations');
x=xnew;

        