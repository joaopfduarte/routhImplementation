pkg load symbolic;

syms s;

% Caso 1: Sistema estável
equationEstavel = s^4 + 5*s^3 + 10*s^2 + 10*s + 5;
disp("Caso 1: Sistema Estável");
[vetorDeLinhas, estabilidade] = metodoRouth(equationEstavel);
disp("Resultado:");
disp(estabilidade);
disp("");

% Caso 2: Sistema instável (coeficiente negativo na primeira coluna)
equationInstavel = s^4 + 3*s^3 + 3*s^2 - 2*s + 1;
disp("Caso 2: Sistema Instável");
[vetorDeLinhas, estabilidade] = metodoRouth(equationInstavel);
disp("Resultado:");
disp(estabilidade);
disp("");

% Caso 3: Sistema marginalmente estável (linha de zeros)
equationMarginal = s^4 + 3*s^3 + 3*s^2 + 0*s + 0;
disp("Caso 3: Sistema Marginalmente Estável");
[vetorDeLinhas, estabilidade] = metodoRouth(equationMarginal);
disp("Resultado:");
disp(estabilidade);
disp("");

