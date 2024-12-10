load pkg symbolic;

load('coeficienteReceiver.mat');
qtdaS = length(coeficientes);

%Criação de um vetor com todas as linhas S
vetorDeLinhas = cell(1,qtdaS)
for i =  1:qtdaS
  vetorS{i} = [];
end

%Preenchimento dos vetores S
for i < length(coeficientes)
   % Inserindo 100 na 2ª posição (índice 2)
    vetoreDeLinhas{i} = [vetorDeLinhas{i}(1:1), 100, vetorDeLinhas{i}(2:end)];  % Insere 100 na 2ª posição

    % Inserindo 200 na 3ª posição (índice 3)
    vetorDeLinhas{i} = [vetorDeLinhas{i}(1:2), 200, vetorDeLinhas{i}(3:end)];  % Insere 200 na 3ª posição
end
