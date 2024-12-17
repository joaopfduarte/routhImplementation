pkg load symbolic;
syms s;

%Estável
equation = s^3 + 6*s^2 + 11*s + 6;

%Instável
%equation = s^6 + 4*s^5 + 3*s^4 + 2*s^3 + s^2 + 4*s + 4;
coeficientes = coeffs(equation, s,'all');
display(coeficientes);

file = "coeficienteReceiver.mat";
save(file, 'coeficientes');
whos;




















