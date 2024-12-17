pkg load symbolic;

load('coeficienteTable.mat');
for i = 1:length(vetorDeLinhas)
  vetorDeLinhas{i} = double(vetorDeLinhas{i});
end

a = length(vetorDeLinhas{1}) - 1;
for i = 3:length(vetorDeLinhas)
  for j = 1:a
    if vetorDeLinhas{i-1}(1) == 0
      vetorDeLinhas{i-1}(1) = eps;
    end

    numerator = vetorDeLinhas{i-2}(1) * vetorDeLinhas{i-1}(j+1) - vetorDeLinhas{i-1}(1) * vetorDeLinhas{i-2}(j+1);
    denominator = vetorDeLinhas{i-1}(1);

    vetorDeLinhas{i}(j) = - numerator / denominator;
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

countPos = 0;
for i = 1:length(vetorDeLinhas) - 1
  if (vetorDeLinhas{i}(1) < 0 && vetorDeLinhas{i + 1}(1) > 0) || (vetorDeLinhas{i}(1) > 0 && vetorDeLinhas{i + 1}(1) < 0)
   countPos = countPos + 1;
  endif
end

display("Pólos do lado direito:");
display(countPos);


