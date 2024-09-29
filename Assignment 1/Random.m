%1_c
b = [5, 0, -3, 0, 1];  
a = 1;               
n = 0:7;

x = zeros(1, length(n));

x(n == 0) = 1;    
x(n == 1) = 3;    
x(n == 3) = -4;   

y = filter(b, a, x);






%1_d
h = [5, 0, -3, 0, 1];
n_xb = 0:7;  
x_b = zeros(1, length(n_xb));

x_b(n_xb == 0) = 1;    
x_b(n_xb == 1) = 3;    
x_b(n_xb == 3) = -4;   

y_1 = conv(h, x_b);






n_xe = 0:8;
x_e = zeros(1,length(n_xe));

x_e(n_xe == 1) = 1;
x_e(n_xe == 2) = 3;
x_e(n_xe == 4) = -4;

y_2 = filter(b,a,x_e);




%1_f
n_xf = 0:7;
x_f = ones(1,length(n_xf));
y_3 = filter(b,a,x_f);




%1_h
n_xg = 0:7;
x_g = zeros(1,length(n_xg));
x_g(n==2) = 3;
x_g(n >=1) = x_g( n>= 1) -1;

y_34 = filter(b,a,x_g);



%Q2

%2_d
B = [3, -2, 1];
A = [1, -0.75];
N = 0:20;

h_d = impz(B,A,N);


%2_e
x = [1 zeros(1,20)];
y_e = filter(B,A,x);
stem(N,y_e); %plotting Response

%2_f
B = [3, -2, 1];
A = [1, 0.75];
N = 0:20;

h_f = impz(B,A,N);
stem(N,h_f);


%2_g
B = [3, -2, 1];
A = [1, -1.2];
N = 0:20;

h_g = impz(B,A,N);
stem(N,h_g);



%2_h
B = [3, -2, 1];
A = [1, -0.75];


x_h = ones(1,length(N));

y_h = filter(B,A,x_h);


stem(N,y_h);















