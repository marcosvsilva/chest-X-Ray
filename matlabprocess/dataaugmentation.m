%diretorioEntrada = 'C:\Users\Marcos\Documents\Projetos\DeepLearning\TrabalhoPnumonia\DataSet\train\NORMAL\';
%diretorioEntrada = 'C:\Users\Marcos\Documents\Projetos\DeepLearning\TrabalhoPnumonia\DataSet\train\PNEUMONIA\';
diretorioEntrada = 'C:\Users\Marcos\Pictures\Beco\';
diretorioSaida = strcat(diretorioEntrada, 'new\');

imgWidth = 800;
imgLength = 1500;

gerarRotateFlips = 0;
gerarRotate20 = 0;

listaArquivos = dir(fullfile(diretorioEntrada, '*.jpg'));
quantidadeArquivo = length(listaArquivos);

for indice = 1 : quantidadeArquivo
    nomeArquivo = listaArquivos(indice).name;

    %Redimensionar imagem
    imagemOriginal = imread(strcat(diretorioEntrada, nomeArquivo));
    dadosImagem = imfinfo(strcat(diretorioEntrada, nomeArquivo));
    diferenca = dadosImagem.Width - dadosImagem.Height;
    imagemAjustada = padarray(imagemOriginal, abs(round(diferenca /2)), 0, 'both');
    imagemReescalada = imresize(imagemAjustada, [imgWidth imgLength]);
    %imagemReescalada = imresize(imagemOriginal, [imgWidth imgLength]);
    
    %original reescalada
    imwrite(imagemReescalada, strcat(diretorioSaida, 'original_', nomeArquivo));    
    
    %Espelho
    imagemEspelho = fliplr(imagemReescalada);
    imwrite(imagemEspelho, strcat(diretorioSaida, 'flip_', nomeArquivo));
end