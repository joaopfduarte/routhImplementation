pkg load symbolic;
syms s;

%Aqui deve ser inserida a equação de malha
equation = 2*s + 1*s^2 + 1*s^3 + 96;
coeficientes = coeffs(equation, s,'all');
display(coeficientes);

file = "coeficienteReceiver.mat";
save(file);
whos;




















