 syms E
 R = E - 2;
 
 er1 = 1;
 er2 = -1;
 y = -1*R;
 x = 1;
 n = 4;
 
 while 1
     m = n - 2;
     
     eig_s1 = zeros(1,m);
     eig_s2 = zeros(1,m);

     for i=1:1:m
         eig_s1(1,i) = (1+(er1/100))*(pi^2)*(((i/(n-1))^2));
         eig_s2(1,i) = (1+(er2/100))*(pi^2)*(((i/(n-1))^2));

         y1 = R*y + x;

         y21 = double(subs(y1,E,eig_s1(1,i)));
         y22 = double(subs(y1,E,eig_s2(1,i)));

         if abs(y21)>0 && abs(y21)<0.01
             break
         elseif abs(y22)>0 && abs(y22)<0.01
             break
         end
     end

     if abs(y21)>0 && abs(y21)<0.01
         break
     elseif abs(y22)>0 && abs(y22)<0.01
         break
     end
      
     x = y;
     y = -1*y1;

     n = n + 1;
     
 end

 disp(n);
 disp(i);



