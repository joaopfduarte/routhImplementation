pkg load symbolic;

load('coeficienteTable.mat');
for i = 1:length(vetorDeLinhas)
  vetorDeLinhas{i} = double(vetorDeLinhas{i});
end

for i = 3:qtdaS
  for j = 1:(qtdaS - i + 1)

    if vetorDeLinhas{i-1}(1) == 0
      vetorDeLinhas{i-1}(1) = eps;
    end

    vetorDeLinhas{i}(j) = (vetorDeLinhas{i-2}(1) * vetorDeLinhas{i-1}(j+1) - ...
    vetorDeLinhas{i-2}(j+1) * vetorDeLinhas{i-1}(1)) / ...
    vetorDeLinhas{i-1}(1);
  end
end

disp("Tabela de Routh:");

maxCols = max(cellfun(@length, vetorDeLinhas));

for i = 1:length(vetorDeLinhas)
  row = [vetorDeLinhas{i}, zeros(1, maxCols - length(vetorDeLinhas{i}))];
  formattedRow = sprintf('| %10.4f ', row);
  formattedRow = [formattedRow, '|'];
  disp(formattedRow);
end

instavel = false;
marginalmente_estavel = false;

for i = 3:length(vetorDeLinhas)
  if vetorDeLinhas{i}(1) < 0
    instavel = true;
    break;  l
  elseif vetorDeLinhas{i}(1) == 0
    marginalmente_estavel = true;
    break;
  end
end

if instavel
  display("Sistema instável");
elseif marginalmente_estavel
  display("Marginalmente estável");
else
  display("Sistema estável");
end


