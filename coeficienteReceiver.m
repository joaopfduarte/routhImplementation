pkg load symbolic;
syms s;

equation = s^8 + 6*s^7 + 15*s^6 + 24*s^5 + 35*s^4 + 40*s^3 + 30*s^2 + 15*s + 5;
coeficientes = coeffs(equation, s,'all');
display(coeficientes);

file = "coeficienteReceiver.mat";
save(file, 'coeficientes');
whos;




















