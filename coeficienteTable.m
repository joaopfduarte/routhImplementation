pkg load symbolic;

% Simulando carregamento do vetor de coeficientes
load('coeficienteReceiver.mat');
qtdaS = length(coeficientes);

% Inicializando vetorDeLinhas
vetorDeLinhas = cell(1, qtdaS);
for i = 1:qtdaS
  vetorDeLinhas{i} = [];
end

% Preenchimento dinâmico alternado entre vetorDeLinhas{1} e vetorDeLinhas{2}
for i = 1:qtdaS
  if mod(i, 2) == 1
    % Índices ímpares vão para vetorDeLinhas{1}
    vetorDeLinhas{1} = [vetorDeLinhas{1}, coeficientes(i)];
  else
    % Índices pares vão para vetorDeLinhas{2}
    vetorDeLinhas{2} = [vetorDeLinhas{2}, coeficientes(i)];
  end

  if length(vetorDeLinhas{1}) > length(vetorDeLinhas{2})
    vetorDeLinhas{2} = [vetorDeLinhas{2}, 0];
  end
end

% Exibe o resultado
disp("Vetores preenchidos:");
for i = 1:length(vetorDeLinhas)
  disp(vetorDeLinhas{i});
end

file = "coeficienteTable.mat";
save(file, 'vetorDeLinhas');
whos;
