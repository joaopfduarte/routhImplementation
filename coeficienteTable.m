pkg load symbolic;

load('coeficienteReceiver.mat');
qtdaS = length(coeficientes);

vetorDeLinhas = cell(1, qtdaS);
for i = 1:qtdaS
  vetorDeLinhas{i} = [];
end

for i = 1:qtdaS
  if mod(i, 2) == 1
    vetorDeLinhas{1} = [vetorDeLinhas{1}, coeficientes(i)];
  else
    vetorDeLinhas{2} = [vetorDeLinhas{2}, coeficientes(i)];
  end

  ##  if length(vetorDeLinhas{1}) > length(vetorDeLinhas{2})
  ##    vetorDeLinhas{2} = [vetorDeLinhas{2}, 0];
  ##  elseif length(vetorDeLinhas{2}) > length(vetorDeLinhas{1})
  ##    vetorDeLinhas{1} = [vetorDeLinhas{1}, 0];
  ##  end
end

if length(vetorDeLinhas{1}) > length(vetorDeLinhas{2})
  vetorDeLinhas{2}(end + 1) = 0;
end

max_length = max(cellfun(@length, vetorDeLinhas));

for i = 3:length(vetorDeLinhas)
  vetorDeLinhas{i} = zeros(1, max_length);
end

disp("Vetores preenchidos:");
for i = 1:length(vetorDeLinhas)
  disp(vetorDeLinhas{i});
end

file = "coeficienteTable.mat";
save(file, 'vetorDeLinhas', 'qtdaS');
whos;
