pkg load symbolic;
syms s;

%Aqui deve ser inserida a equação de malha
equation = 3*s^6 + 4*s^5 + 2*s^4 + 7*s^3 + 8*s^2 + 2019;
coeficientes = coeffs(equation, s,'all');
display(coeficientes);

file = "coeficienteReceiver.mat";
save(file, 'coeficientes');
whos;




















