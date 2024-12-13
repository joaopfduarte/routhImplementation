function [vetorDeLinhas, estabilidade] = metodoRouth(equation)

  syms s;
  coeficientes = coeffs(equation, s, 'all');


  file = "coeficienteReceiver.mat";
  save(file, 'coeficientes');


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


    if length(vetorDeLinhas{1}) > length(vetorDeLinhas{2})
      vetorDeLinhas{2} = [vetorDeLinhas{2}, 0];
    elseif length(vetorDeLinhas{2}) > length(vetorDeLinhas{1})
      vetorDeLinhas{1} = [vetorDeLinhas{1}, 0];
    end
  end


  max_length = max(cellfun(@length, vetorDeLinhas));
  for i = 3:length(vetorDeLinhas)
    vetorDeLinhas{i} = zeros(1, max_length);
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


  maxCols = max(cellfun(@length, vetorDeLinhas));
  disp("Tabela de Routh:");
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
      break;
    elseif vetorDeLinhas{i}(1) == 0
      marginalmente_estavel = true;
      break;
    end
  end


  if instavel
    estabilidade = "Sistema instável";
  elseif marginalmente_estavel
    estabilidade = "Marginalmente estável";
  else
    estabilidade = "Sistema estável";
  end

end

